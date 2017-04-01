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
import java.io.InputStreamReader;
import java.util.Collections;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver.Builder;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.googleapis.media.MediaHttpUploader;
import com.google.api.client.http.FileContent;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.util.store.DataStoreFactory;
import com.google.api.client.util.store.FileDataStoreFactory;
import com.google.api.services.drive.Drive;
import com.google.api.services.drive.DriveScopes;
import com.google.api.services.drive.model.File;
import com.google.api.services.drive.model.Permission;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.StringPool;


class GDriveService {

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
	private static Credential authorize() throws Exception {
		// load client secrets
		//FIXME make it work
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
		
		// set up authorization code flow
		log.info("Building authorization code flow");
		GoogleAuthorizationCodeFlow.Builder flowBuilder = new GoogleAuthorizationCodeFlow.Builder(
				httpTransport, JSON_FACTORY, clientSecrets,
				Collections.singleton(DriveScopes.DRIVE_FILE))		
				.setDataStoreFactory(dataStoreFactory);
		GoogleAuthorizationCodeFlow flow = flowBuilder.build();
		log.info("Building authorization code flow - done");
		
		// authorize
		Builder serverBuilder = new Builder();
		serverBuilder.setPort(9002);
		LocalServerReceiver localhostResiever = serverBuilder.build();
		
		AuthorizationCodeInstalledApp app = new AuthorizationCodeInstalledApp(flow, localhostResiever);
		
		Credential credential = app.authorize("user");
		
		return credential;
	}

	public static String uploadNewBook(java.io.File bookPdf) {

		try {
			httpTransport = GoogleNetHttpTransport.newTrustedTransport();
			dataStoreFactory = new FileDataStoreFactory(DATA_STORE_DIR);
			// authorization
			log.info("http transport and data store factory initialized.");
			log.info("Authorizing application");
			Credential credential = authorize();
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
}