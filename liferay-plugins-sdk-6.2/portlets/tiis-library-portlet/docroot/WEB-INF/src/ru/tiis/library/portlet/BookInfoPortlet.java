package ru.tiis.library.portlet;

import java.io.IOException;

import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import ru.tiis.library.service.BookService;
import ru.tiis.library.service.impl.BookServiceFactory;
import ru.tiis.library.service.model.BookModel;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;

/**
 * Portlet implementation class BookInfoPortlet
 */
public class BookInfoPortlet extends MVCPortlet {
	public static final String PORTLET_ID = "bookinfo_WAR_tiislibraryportlet";
	private static final String BOOK_INFO_JSP_PATH = "/html/library/book-info/book_info.jsp";
	private static Log log = LogFactoryUtil.getLog(BookInfoPortlet.class);
	private static BookService bookService = BookServiceFactory.getService();

	@Override
	public void render(RenderRequest request, RenderResponse response)
			throws PortletException, IOException {
		long bookId = ParamUtil.get(request, "bookId", 0);
		if (bookId == 0) {
			log.error("Book id attribute is not set");
			//TODO error response
			return;
		}
		
		try {
			BookModel book = bookService.getBook(bookId);
			request.setAttribute("book", book);
		} catch (PortalException e) {
			log.error("Failed to get book with id : " + bookId + ". " + e.getMessage());
		} catch (SystemException e) {
			log.error("Failed to get book with id : " + bookId + ". " + e.getMessage());
		}
		
		include(BOOK_INFO_JSP_PATH, request, response);
	}

}
