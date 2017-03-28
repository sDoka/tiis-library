package ru.tiis.library.portlet;

import java.io.IOException;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.ProcessAction;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import ru.tiis.library.portlet.actions.BookInfoActions;
import ru.tiis.library.service.BookService;
import ru.tiis.library.service.impl.BookServiceFactory;
import ru.tiis.library.service.impl.BookServiceUtil;
import ru.tiis.library.service.model.BookModel;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.struts.PortletActionInvoker;
import com.liferay.portal.kernel.util.ParamUtil;
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
	public void render(RenderRequest request, RenderResponse response) throws PortletException, IOException {
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
			log.error("Failed to get book with id : " + bookId + ". " + e.getMessage());
		} catch (SystemException e) {
			log.error("Failed to get book with id : " + bookId + ". " + e.getMessage());
		}

		String mode = request.getParameter("mode");
		if (mode == null || mode.isEmpty())
			mode = "upload";

		if (mode.equals("edit"))
			include(BOOK_EDIT_JSP_PATH, request, response);
		else
			include(BOOK_INFO_JSP_PATH, request, response);
	}

	@ProcessAction(name = "addDiscussion")
	public void addDiscussion(ActionRequest actionRequest, ActionResponse actionResponse) {
		try {
			PortletActionInvoker.processAction("com.liferay.portlet.messageboards.action.EditDiscussionAction", null,
					actionRequest, actionResponse);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			log.error(e.getMessage());
		}
	}

	public void updateBookTitle(ActionRequest actionRequest, ActionResponse actionResponse) throws IOException,
			PortletException {
		BookInfoActions.updateBookTitle(actionRequest, actionResponse);
	}

	public void updateBookLogo(ActionRequest request, ActionResponse response) throws IOException,
			PortletException {
		BookInfoActions.updateBookLogo(request, response);
	}

	public void updateBookDescription(ActionRequest actionRequest, ActionResponse actionResponse) throws IOException,
			PortletException {
		BookInfoActions.updateBookDescription(actionRequest, actionResponse);
	}

	public void updateBookCategories(ActionRequest actionRequest, ActionResponse actionResponse) throws IOException,
			PortletException {
		BookInfoActions.updateBookCategories(actionRequest, actionResponse);
	}
}
