package ru.tiis.managment.portlet;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.PortletPreferences;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import org.apache.commons.lang.StringUtils;

import ru.tiis.library.service.BookService;
import ru.tiis.library.service.impl.BookServiceFactory;
import ru.tiis.library.service.impl.GDriveService;
import ru.tiis.managment.portlet.util.LibraryManagmentUtil;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.json.JSONFactoryUtil;
import com.liferay.portal.kernel.json.JSONObject;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.upload.FileItem;
import com.liferay.portal.kernel.upload.UploadPortletRequest;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextFactory;
import com.liferay.portal.util.PortalUtil;
import com.liferay.portlet.documentlibrary.model.DLFileEntry;
import com.liferay.util.bridges.mvc.MVCPortlet;

/**
 * Portlet implementation class LibraryManagmentPortlet
 */
public class LibraryManagmentPortlet extends MVCPortlet {

	// TODO This shit should create books, tests, news and docs...
	// TODO Statistics should be in another module.

	private static BookService bookService = BookServiceFactory.getService();
	private final static Log log = LogFactoryUtil.getLog(LibraryManagmentPortlet.class);
	private final static String UPLOAD_NEW_BOOK_JSP_PATH = "/html/librarymanagment/create.jsp";

	private final static String GOOGLE_DRIVE_REDIRECT_URI_NAME = "googleDriveRedirectUri";
	private final static String GOOGLE_DRIVE_REDIRECT_URI_DEFAULT_VALUE = "http://localhost";
	private final static String GOOGLE_DRIVE_AUTH_URL_NAME = "googleDriveAuthURL";
	
	@Override
	public void render(RenderRequest request, RenderResponse response) throws PortletException, IOException {
		
		PortletPreferences portletPreferences = request.getPreferences();
		String gdRedirectUriHost = portletPreferences.getValue(
				GOOGLE_DRIVE_REDIRECT_URI_NAME, 
				GOOGLE_DRIVE_REDIRECT_URI_DEFAULT_VALUE);
		request.setAttribute(GOOGLE_DRIVE_REDIRECT_URI_NAME, gdRedirectUriHost);
		
		String gdAuthUrl = "https://accounts.google.com/o/oauth2/auth"
				+ "?client_id=" + GDriveService.CLIENT_APP_ID
				+ "&redirect_uri=" + "http://" + gdRedirectUriHost + ":" + GDriveService.CLIENT_RECEIVER_PORT + GDriveService.CLIENT_RECEIVER_CALLBACK_PATH
				+ "&response_type=code"
				+ "&scope=https://www.googleapis.com/auth/drive.file";
		request.setAttribute(GOOGLE_DRIVE_AUTH_URL_NAME, gdAuthUrl);
		
		include(UPLOAD_NEW_BOOK_JSP_PATH, request, response);
	}

	public void createBook(ActionRequest request, ActionResponse response) throws PortalException {
		UploadPortletRequest uploadRequest = PortalUtil.getUploadPortletRequest(request);

		String title = ParamUtil.get(request, "bookTitle", StringPool.BLANK);
		String description = ParamUtil.get(request, "bookDescription", StringPool.BLANK);
		File bookPdfFile = uploadRequest.getFile("bookPdfFile");
		// TODO validate
		Map<String, FileItem[]> files = uploadRequest.getMultipartParameterMap();
		FileItem bookLogo = files.get("bookLogo")[0];
		if (bookLogo == null) {
			throw new PortalException("Can't get book logo from request.");
		}
		
		PortletPreferences portletPreferences = request.getPreferences();
		String clientHost = portletPreferences.getValue(
				GOOGLE_DRIVE_REDIRECT_URI_NAME, 
				GOOGLE_DRIVE_REDIRECT_URI_DEFAULT_VALUE);
		
		try {
			DLFileEntry logoDlFile = LibraryManagmentUtil.storeBookImageToDocumentLibrary(request, bookLogo);

			ServiceContext serviceContext = ServiceContextFactory.getInstance(request);
			bookService.addBook(title, description, logoDlFile.getFileEntryId(), bookPdfFile, serviceContext, clientHost);

			// TODO catch NonAuthorizedUserException and open in new tab
			// https://accounts.google.com/o/oauth2/auth?client_id=1097637469091-gdshlvm5m4sub6l1m6hrtg83c07umaa4.apps.googleusercontent.com&redirect_uri=http://localhost:9001/Callback&response_type=code&scope=https://www.googleapis.com/auth/drive.file
			// or i'll make utility method for gdrive auth check ->
			// authorize -> add book

		} catch (PortalException | SystemException | IOException e) {
			log.error("Can't add a book with title " + title + ": " + e.getMessage());
		}

	}

	public void getGoogleAPITokenStatus(ActionRequest request, ActionResponse response) throws PortletException, IOException {
		PortletPreferences portletPreferences = request.getPreferences();
		String gdRedirectUriHost = portletPreferences.getValue(
				GOOGLE_DRIVE_REDIRECT_URI_NAME, 
				GOOGLE_DRIVE_REDIRECT_URI_DEFAULT_VALUE);
		
		boolean isCredentialValid = GDriveService.isCredentialValid(gdRedirectUriHost);
		JSONObject responseJSON = JSONFactoryUtil.createJSONObject();
		responseJSON.put("isCredentialValid", isCredentialValid);
		responseJSON.put("isSuccessful", true);
		writeJSON(request, response, responseJSON);
	}

	public void requestGoogleAPIToken(ActionRequest request, ActionResponse response) throws PortletException, IOException {
		PortletPreferences portletPreferences = request.getPreferences();
		String gdRedirectUriHost = portletPreferences.getValue(
				GOOGLE_DRIVE_REDIRECT_URI_NAME, 
				GOOGLE_DRIVE_REDIRECT_URI_DEFAULT_VALUE);
		
		boolean isSuccessful = GDriveService.requestToken(gdRedirectUriHost);
		JSONObject responseJSON = JSONFactoryUtil.createJSONObject();
		responseJSON.put("isSuccessful", isSuccessful);
		writeJSON(request, response, responseJSON);
	}
	
	public void revokeGoogleAPIToken(ActionRequest request, ActionResponse response) throws PortletException, IOException {
		PortletPreferences portletPreferences = request.getPreferences();
		String gdRedirectUriHost = portletPreferences.getValue(
				GOOGLE_DRIVE_REDIRECT_URI_NAME, 
				GOOGLE_DRIVE_REDIRECT_URI_DEFAULT_VALUE);
		
		boolean isSuccessful = GDriveService.revokeToken(gdRedirectUriHost);
		JSONObject responseJSON = JSONFactoryUtil.createJSONObject();
		responseJSON.put("isSuccessful", isSuccessful);
		writeJSON(request, response, responseJSON);
	}
	
	public void updateGDConfig(ActionRequest request, ActionResponse response) throws PortletException, IOException {
		PortletPreferences portletPreferences = request.getPreferences();

		String gdRedirectUri = ParamUtil.getString(request, GOOGLE_DRIVE_REDIRECT_URI_NAME, StringUtils.EMPTY);
		portletPreferences.setValue(GOOGLE_DRIVE_REDIRECT_URI_NAME, gdRedirectUri);
		
		portletPreferences.store();
	}
}
