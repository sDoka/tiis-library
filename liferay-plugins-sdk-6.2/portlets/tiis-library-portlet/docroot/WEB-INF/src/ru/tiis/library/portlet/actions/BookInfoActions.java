package ru.tiis.library.portlet.actions;

import java.io.File;
import java.io.IOException;
import java.util.Map;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.PortletRequest;
import javax.portlet.PortletResponse;
import javax.servlet.http.HttpServletResponse;

import ru.tiis.library.service.BookService;
import ru.tiis.library.service.impl.BookServiceFactory;
import ru.tiis.library.service.model.BookModel;
import ru.tiis.managment.portlet.util.LibraryManagmentUtil;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.json.JSONFactoryUtil;
import com.liferay.portal.kernel.json.JSONObject;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.servlet.ServletResponseUtil;
import com.liferay.portal.kernel.upload.FileItem;
import com.liferay.portal.kernel.upload.UploadPortletRequest;
import com.liferay.portal.kernel.util.ContentTypes;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextFactory;
import com.liferay.portal.util.PortalUtil;
import com.liferay.portlet.documentlibrary.model.DLFileEntry;
import com.liferay.portlet.documentlibrary.service.DLFileEntryLocalServiceUtil;

public class BookInfoActions {
	private static Log log = LogFactoryUtil.getLog(BookInfoActions.class);
	private static BookService bookService = BookServiceFactory.getService();

	public static void updateBookTitle(ActionRequest actionRequest, ActionResponse actionResponse) throws IOException,
			PortletException {
		long bookId = ParamUtil.get(actionRequest, "bookId", 0);
		if (bookId == 0) {
			log.error("Failed to get bookId parameter from request");
			return;
		}

		String title = ParamUtil.get(actionRequest, "bookTitle", StringPool.BLANK);
		if (title.equals(StringPool.BLANK)) {
			log.error("Failed to get valid book title param. Title can't be empty");
			return;
		}

		try {
			ServiceContext serviceContext = ServiceContextFactory.getInstance(actionRequest);
			BookModel book = bookService.getBook(bookId);
			book.setTitle(title);
			bookService.updateBook(book, serviceContext);
		} catch (PortalException | SystemException e) {
			log.error(e.getMessage());
			return;
		}
	}

	public static void updateBookLogo(ActionRequest request, ActionResponse response)
			throws IOException, PortletException {
		long bookId = ParamUtil.get(request, "bookId", 0);
		if (bookId == 0) {
			log.error("Failed to get bookId parameter from request");
			return;
		}

		UploadPortletRequest uploadRequest = PortalUtil.getUploadPortletRequest(request);
		Map<String, FileItem[]> files = uploadRequest.getMultipartParameterMap();
		FileItem[] bookLogoInputFiles = files.get("bookLogo");

		if (bookLogoInputFiles == null) {
			File logoFile = uploadRequest.getFile("bookLogo");
			if (logoFile != null) {
				log.info("Logo file found in a single request.");
			}
			String errMessage = "No files contained in request parameter map.";
			log.error(errMessage);
			errorJsonResponse(request, response, errMessage, "");
			return;
		}

		FileItem bookLogo = bookLogoInputFiles[0];
		try {
			ServiceContext serviceContext = ServiceContextFactory.getInstance(request);
			BookModel book = bookService.getBook(bookId);
			if (book.getBookLogo() != null) {
				DLFileEntryLocalServiceUtil.deleteDLFileEntry(book.getBookLogo());
			}
			DLFileEntry bookLogoDl = LibraryManagmentUtil.storeBookImageToDocumentLibrary(request, bookLogo);
			book.setBookLogo(bookLogoDl);
			bookService.updateBook(book, serviceContext);
			successJsonResponse(request, response, book.getLogoUrl(), "");
		} catch (PortalException | SystemException e) {
			log.error(e.getMessage());
			return;
		}
	}

	public static void updateBookDescription(ActionRequest actionRequest, ActionResponse actionResponse)
			throws IOException, PortletException {
		long bookId = ParamUtil.get(actionRequest, "bookId", 0);
		if (bookId == 0) {
			log.error("Failed to get bookId parameter from request");
			return;
		}

		String description = ParamUtil.getString(actionRequest, "bookDescription", StringPool.BLANK);
		if (description.equals(StringPool.BLANK)) {
			log.error("Failed to get valid book description param. Description can't be empty");
			return;
		}

		try {
			ServiceContext serviceContext = ServiceContextFactory.getInstance(actionRequest);
			BookModel book = bookService.getBook(bookId);
			book.setDescription(description);
			bookService.updateBook(book, serviceContext);
		} catch (PortalException | SystemException e) {
			log.error(e.getMessage());
			return;
		}
	}

	public static void updateBookCategories(ActionRequest actionRequest, ActionResponse actionResponse)
			throws IOException, PortletException {
		long bookId = ParamUtil.get(actionRequest, "bookId", 0);
		if (bookId == 0) {
			String errorMessage = "Failed to get bookId parameter from request";
			log.error(errorMessage);
			errorJsonResponse(actionRequest, actionResponse, errorMessage, "");
			return;
		}
		try {
			ServiceContext serviceContext = ServiceContextFactory.getInstance(actionRequest);
			BookModel book = bookService.getBook(bookId);
			bookService.updateBook(book, serviceContext);
		} catch (PortalException | SystemException e) {
			log.error(e.getMessage());
			errorJsonResponse(actionRequest, actionResponse, e.getMessage(), "");
			return;
		}
		successJsonResponse(actionRequest, actionResponse, "success", "");
	}

	// Responses
	private static void successJsonResponse(PortletRequest request, PortletResponse response, String message, String url)
			throws IOException {
		jsonResponse(request, response, STATUS_OK, message, url);
	}

	private static void errorJsonResponse(PortletRequest request, PortletResponse response, String message, String url)
			throws IOException {
		jsonResponse(request, response, STATUS_FAIL, message, url);
	}

	private static final String STATUS_OK = "ok";
	private static final String STATUS_FAIL = "fail";

	private static void jsonResponse(PortletRequest request, PortletResponse response, String status, String message,
			String url) throws IOException {
		JSONObject jsonObject = JSONFactoryUtil.createJSONObject();
		jsonObject.put("status", status);
		jsonObject.put("message", message);
		jsonObject.put("nextPageUrl", url);

		HttpServletResponse httpServletResponse = PortalUtil.getHttpServletResponse(response);
		httpServletResponse.setContentType(ContentTypes.APPLICATION_JSON);
		ServletResponseUtil.write(httpServletResponse, jsonObject.toString());
		httpServletResponse.flushBuffer();
	}
}
