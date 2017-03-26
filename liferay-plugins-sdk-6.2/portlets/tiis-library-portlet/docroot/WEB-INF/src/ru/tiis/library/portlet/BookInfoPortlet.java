package ru.tiis.library.portlet;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.ProcessAction;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import ru.tiis.library.service.BookService;
import ru.tiis.library.service.impl.BookServiceFactory;
import ru.tiis.library.service.impl.BookServiceUtil;
import ru.tiis.library.service.model.BookModel;

import com.liferay.portal.kernel.dao.jdbc.OutputBlob;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.struts.PortletActionInvoker;
import com.liferay.portal.kernel.upload.UploadPortletRequest;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextFactory;
import com.liferay.portal.util.PortalUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;

/**
 * Portlet implementation class BookInfoPortlet
 */
public class BookInfoPortlet extends MVCPortlet {
	public static final String PORTLET_ID = "bookinfo_WAR_tiislibraryportlet";
	private static final String BOOK_INFO_JSP_PATH = "/html/library/book-info/book_info.jsp";
	private static final String BOOK_EDIT_JSP_PATH = "/html/librarymanagment/edit.jsp";
	private static Log log = LogFactoryUtil.getLog(BookInfoPortlet.class);
	private static BookService bookService = BookServiceFactory.getService();

	@Override
	public void render(RenderRequest request, RenderResponse response)
			throws PortletException, IOException {
		long bookId = ParamUtil.get(request, "bookId", 0);
		if (bookId == 0) {
			Object bookAttribute = request.getAttribute("bookId");
			if (bookAttribute == null) {
				log.error("Book id attribute is not set");
				// TODO error response
				return;
			}
			bookId = (long) bookAttribute;
		}

		try {
			BookModel book = bookService.getBook(bookId);
			book.setCategoriesList(BookServiceUtil.getBookCategoryNames(bookId));
			book.setTagsList(BookServiceUtil.getBookTags(bookId));
			request.setAttribute("book", book);
		} catch (PortalException e) {
			log.error("Failed to get book with id : " + bookId + ". "
					+ e.getMessage());
		} catch (SystemException e) {
			log.error("Failed to get book with id : " + bookId + ". "
					+ e.getMessage());
		}

		String mode = request.getParameter("mode");
		if ( mode == null || mode.isEmpty()) mode = "upload";
		
		if (mode.equals("edit")) include(BOOK_EDIT_JSP_PATH, request, response);
		else
		include(BOOK_INFO_JSP_PATH, request, response);
	}

	

	@ProcessAction(name = "addDiscussion")
	public void addDiscussion(ActionRequest actionRequest,
			ActionResponse actionResponse) {
		try {
			PortletActionInvoker
					.processAction(
							"com.liferay.portlet.messageboards.action.EditDiscussionAction",
							null, actionRequest, actionResponse);
		} catch (Exception e) {
			// TODO Auto-generated catch block
		}
	}
	
	public void updateBookInfo(ActionRequest actionRequest, ActionResponse actionResponse) {
		long bookId = ParamUtil.getLong(actionRequest, "bookId", 0);
		
		if (bookId == 0) return;
		
		try {
			ServiceContext serviceContext = ServiceContextFactory.getInstance(actionRequest);
			
			UploadPortletRequest uploadRequest = PortalUtil.getUploadPortletRequest(actionRequest);
			
			String title = ParamUtil.get(actionRequest, "bookTitle", "Unnamed");
			String description = ParamUtil.get(actionRequest, "bookDescription", "No description");
			File bookLogo = uploadRequest.getFile("bookLogo");
			
			BookModel book = bookService.getBook(bookId);
			book.setTitle(title);
			book.setDescription(description);
			
			try {
				InputStream fis = new FileInputStream(bookLogo);
				OutputBlob bookLogoBlob = new OutputBlob(fis, bookLogo.length());
				book.setLogo(bookLogoBlob);
			} catch (FileNotFoundException e) {
				log.error("Failed to save image to the book " + title + " : " + e.getMessage());
			}
			
			bookService.updateBook(book, serviceContext);
			actionRequest.setAttribute("bookId", bookId);
		} catch (PortalException | SystemException e) {
			log.error("Couldn't update book width id: " + bookId + ". " + e.getMessage());
		}
	}
	
	public void updateBookTitle(ActionRequest actionRequest,
			ActionResponse actionResponse) throws IOException, PortletException {
		// TODO Auto-generated method stub
		super.processAction(actionRequest, actionResponse);
	}
	
	public void updateBookLogo(ActionRequest actionRequest,
			ActionResponse actionResponse) throws IOException, PortletException {
		// TODO Auto-generated method stub
		super.processAction(actionRequest, actionResponse);
	}
	
	public void updateBookFile(ActionRequest actionRequest,
			ActionResponse actionResponse) throws IOException, PortletException {
		// TODO Auto-generated method stub
		super.processAction(actionRequest, actionResponse);
	}
	
	public void updateBookDescription(ActionRequest actionRequest,
			ActionResponse actionResponse) throws IOException, PortletException {
		// TODO Auto-generated method stub
		super.processAction(actionRequest, actionResponse);
	}
	
	public void updateBookCategories(ActionRequest actionRequest,
			ActionResponse actionResponse) throws IOException, PortletException {
		// TODO Auto-generated method stub
		super.processAction(actionRequest, actionResponse);
	}
}
