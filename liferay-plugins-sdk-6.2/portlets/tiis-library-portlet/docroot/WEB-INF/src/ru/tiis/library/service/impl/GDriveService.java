/*
 * Copyright (c) 2012 Google Inc.
 *
 * Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except
 * in compliance with the License. You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software distributed under the License
 * is distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express
 * or implied. See the License for the specific language governing permissions and limitations under
 * the License.
 */

package ru.tiis.library.service.impl;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.BindException;
import java.security.GeneralSecurityException;
import java.util.Collections;

import org.apache.commons.imaging.util.IoUtils;
import org.apache.http.util.EntityUtils;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.auth.oauth2.StoredCredential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver.Builder;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.googleapis.media.MediaHttpUploader;
import com.google.api.client.http.FileContent;
import com.google.api.client.http.GenericUrl;
import com.google.api.client.http.HttpResponse;
import com.google.api.client.http.HttpResponseException;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.IOUtils;
import com.google.api.client.util.store.DataStoreFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.DriveScopes;
import com.google.api.services.drive.model.File;
import com.google.api.services.drive.model.Permission;
import com.liferay.portal.kernel.json.JSONException;
import com.liferay.portal.kernel.json.JSONFactoryUtil;
import com.liferay.portal.kernel.json.JSONObject;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.StringPool;


public class GDriveService {

	// hardcode is baaad
	public static final String CLIENT_APP_ID = "1097637469091-gdshlvm5m4sub6l1m6hrtg83c07umaa4.apps.googleusercontent.com";
	public static final int CLIENT_RECEIVER_PORT = 9002;
	public static final String CLIENT_RECEIVER_CALLBACK_PATH = "/Callback"; // hardcoded into {@link LocalServerReceiver}
	
	private static Log log = LogFactoryUtil.getLog(GDriveService.class);
	/**
	 * Be sure to specify the name of your application. If the application name
	 * is {@code null} or blank, the application will log a warning. Suggested
	 * format is "MyCompany-ProductName/1.0".
	 */
	private static final String APPLICATION_NAME = "tiis-library";
	
	/** Directory to store user credentials. */
	private static final java.io.File DATA_STORE_DIR = new java.io.File(
			System.getProperty("user.home"), ".store/drive_sample");

	/**
	 * Global instance of the {@link DataStoreFactory}. The best practice is to
	 * make it a single globally shared instance across your application.
	 */
	private static FileDataStoreFactory dataStoreFactory;

	/** Global instance of the HTTP transport. */
	private static HttpTransport httpTransport;

	/** Global instance of the JSON factory. */
	private static final JsonFactory JSON_FACTORY = JacksonFactory
			.getDefaultInstance();

	/** Global Drive API client. */
	private static Drive drive;

	/** Authorizes the installed application to access user's protected data. */
	private static Credential authorize(String clientHost) throws IOException {
		
		GoogleAuthorizationCodeFlow flow = buildAuthorizationFlow();
		
		// set up local receiver that will listen on the supplied redirect uri
		// starts up virtual jetty server on specified local port when {@link LocalServerReceiver#getRedirectUri} is called
		Builder serverBuilder = new Builder();
		serverBuilder.setPort(CLIENT_RECEIVER_PORT);
		serverBuilder.setHost(clientHost);
		
		LocalServerReceiver localhostResiever = serverBuilder.build();

	      
		AuthorizationCodeInstalledApp app = new AuthorizationCodeInstalledApp(flow, localhostResiever);

		// do authorization
		// a) if credential/token is not expired, simply returns them
		// b) if credential/token is expired or missing, does authorization flow
		log.info("Authorization starting.");
		Credential credential;
		try {
			credential = app.authorize("user");
		} catch (BindException e) {
			throw new IOException(e);
		}
		log.info("Listening to authorization response...");
		
		return credential;
	}

	public static String uploadNewBook(java.io.File bookPdf, String clientHost) {

		try {
			init();
			// authorization
			log.info("http transport and data store factory initialized.");
			log.info("Authorizing application");
			Credential credential = authorize(clientHost);
			log.info("Authorization passed");
			// set up the global Drive instance
			drive = new Drive.Builder(httpTransport, JSON_FACTORY, credential)
					.setApplicationName(APPLICATION_NAME).build();
			log.info("Drive instance set");

			// run commands
			log.info("Starting Simple Media Upload");
			boolean useDirectUpload = true;
			File uploadedFile = uploadFile(useDirectUpload, bookPdf);

			log.info("Setting up permissions");
			createPermissions(uploadedFile.getId());

			String fileId = uploadedFile.getId();
			File bookFile = drive
					.files()
					.get(fileId)
					.setFields(
							"id,name,webContentLink,shared,mimeType,webViewLink")
					.execute();
			log.info("File name : " + bookFile.getName());
			log.info("File mime type : " + bookFile.getMimeType());
			log.info("File web content link : " + bookFile.getWebContentLink());
			log.info("File web view link : " + bookFile.getWebViewLink());
			log.info("File is shared : " + bookFile.getShared());

			log.info("Success!");
			return bookFile.getWebViewLink();
		} catch (IOException e) {
			log.error(e.getMessage());
		} catch (Throwable t) {
			t.printStackTrace();
		} finally {
			
		}

		return StringPool.BLANK;
	}

	/** Uploads a file using either resumable or direct media upload. */
	private static File uploadFile(boolean useDirectUpload, java.io.File bookPdf)
			throws IOException {
		File fileMetadata = new File();
		fileMetadata.setName(bookPdf.getName());
		fileMetadata.setViewersCanCopyContent(false);
		FileContent mediaContent = new FileContent(null, bookPdf);

		Drive.Files.Create create = drive.files().create(fileMetadata,
				mediaContent);
		MediaHttpUploader uploader = create.getMediaHttpUploader();
		uploader.setDirectUploadEnabled(useDirectUpload);
		return create.execute();
	}

	private static Permission createPermissions(String fileId) throws Exception {
		Permission newPermission = new Permission();
		newPermission.setType("anyone");
		newPermission.setRole("reader");
		return drive.permissions().create(fileId, newPermission).execute();
	}

	public static boolean isCredentialValid(String gdRedirectUriHost) throws IOException {
		init();
		
		GoogleAuthorizationCodeFlow flow = buildAuthorizationFlow();
		Credential currentCredential = flow.loadCredential("user");
		if (null == currentCredential) {
			return false;
		}
		
		boolean isCredentialValid = false;
		String tokenInfoURL = String.format(
	            "https://www.googleapis.com/oauth2/v1/tokeninfo?access_token=%s",
	            currentCredential.getAccessToken());
		HttpResponse response = httpTransport.createRequestFactory()
	    		    .buildGetRequest(new GenericUrl(tokenInfoURL)).execute(); 
		System.out.println("Token info response: status=" + response.getStatusCode() + ", " + response.getStatusMessage() 
							+ ";\n content=" + response.getContent());
		
		// example response:
		//{
		//	 "issued_to": "<client-app-id>",
		//	 "audience": "<client-app-id>",
		//	 "scope": "https://www.googleapis.com/auth/drive.file",
		//	 "expires_in": 3433,
		//	 "access_type": "online"
		//}
		
		if (response.isSuccessStatusCode()) {
			try {
				String responseContentString = new String(IoUtils.getInputStreamBytes(response.getContent()));
			     
				JSONObject responseJson = JSONFactoryUtil.createJSONObject(responseContentString);
				String refreshToken = responseJson.getString("refresh_token");
				int expiresIn = responseJson.getInt("expires_in");
				
				if (refreshToken != null || expiresIn > 60) {
					isCredentialValid = true;
				}
			} catch (JSONException e) {
				log.error(e);
			}
		}
		
		return isCredentialValid;
	}

	public static boolean requestToken(String clientHost) throws IOException {
		init();
		authorize(clientHost);
		return true;
	}

	public static boolean revokeToken(String gdRedirectUriHost) throws IOException {

		init();
		
		GoogleAuthorizationCodeFlow flow = buildAuthorizationFlow();
		
		// if there are no credentials, nothing to revoke
		Credential currentCredential = flow.loadCredential("user");
		if (null == currentCredential) {
			return true;
		}
			
		boolean isSuccessful;
		try {
			String revokeTokenURL = String.format(
		            "https://accounts.google.com/o/oauth2/revoke?token=%s",
		            currentCredential.getAccessToken());
			HttpResponse revokeResponse = httpTransport.createRequestFactory()
		    		    .buildGetRequest(new GenericUrl(revokeTokenURL)).execute(); 
			System.out.println("Revoke token response: status=" + revokeResponse.getStatusCode() + ", " + revokeResponse.getStatusMessage() 
								+ ";\n content=" + revokeResponse.getContent());
			isSuccessful = revokeResponse.isSuccessStatusCode();
		} catch (HttpResponseException e) {
			//400 Bad Request__{_  "error" : "invalid_token",_  "error_description" : "Token expired or revoked"_}
			log.error(e);
			isSuccessful = true;
		} finally {
			StoredCredential.getDefaultDataStore(dataStoreFactory).clear();
		}
		return  isSuccessful;
	}
	
	private static GoogleAuthorizationCodeFlow buildAuthorizationFlow() throws IOException {
		
		// load client secrets
		java.io.File credentials = new java.io.File(GDriveService.class.getResource("upload-service-credentials.json").getFile());
		log.info("Data store dir : " + DATA_STORE_DIR);
		FileInputStream fis = new FileInputStream(credentials);
		GoogleClientSecrets clientSecrets = GoogleClientSecrets.load(
				JSON_FACTORY, new InputStreamReader(fis));
		if (clientSecrets.getDetails().getClientId().startsWith("Enter")
				|| clientSecrets.getDetails().getClientSecret()
						.startsWith("Enter ")) {
			
			log.warn("Enter Client ID and Secret from https://code.google.com/apis/console/?api=drive "
					+ "into drive-cmdline-sample/src/main/resources/client_secrets.json");
			return null;
		}
		log.info("Google client secrets loaded");
		
		
		// set up authorization flow configuration
		log.info("Building authorization code flow...");
		GoogleAuthorizationCodeFlow.Builder flowBuilder = new GoogleAuthorizationCodeFlow.Builder(
				httpTransport, JSON_FACTORY, clientSecrets, Collections.singleton(DriveScopes.DRIVE_FILE))
						.setDataStoreFactory(dataStoreFactory)
						.setAccessType("offline")
						.setApprovalPrompt("force");
		GoogleAuthorizationCodeFlow flow = flowBuilder.build();
		log.info("Building authorization code flow - done");
		
		return flow;
	}
	
	// more baaad code
	// no exception handling
	// well whatever
	private static void init() {
		try {
			if (null == httpTransport) {
					httpTransport = GoogleNetHttpTransport.newTrustedTransport();
			}
			if (null == dataStoreFactory) {
				dataStoreFactory = new FileDataStoreFactory(DATA_STORE_DIR);
			}
		} catch (GeneralSecurityException | IOException e) {
			log.error(e);
		}
	}
}