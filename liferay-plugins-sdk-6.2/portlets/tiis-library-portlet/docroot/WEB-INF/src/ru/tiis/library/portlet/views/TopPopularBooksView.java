package ru.tiis.library.portlet.views;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.portlet.PortletPreferences;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import ru.tiis.library.service.BookService;
import ru.tiis.library.service.impl.BookServiceFactory;
import ru.tiis.library.service.model.BookModel;

import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;

public class TopPopularBooksView extends View {

	private static Log log = LogFactoryUtil.getLog(TopPopularBooksView.class);

	public static final String PAGE_NAME = "popular_books";
	private static final String PAGE_PATH = "/html/library/popular_books.jsp";
	private static BookService bookService = BookServiceFactory.getService();

	@Override
	public String getPageName() {
		return PAGE_NAME;
	}

	@Override
	public String getPagePath() {
		return PAGE_PATH;
	}

	@Override
	public void render(RenderRequest request, RenderResponse response)
			throws SystemException {

		PortletPreferences portletPreferences = request.getPreferences();
		int popularBooksAmount = Integer.valueOf
				(portletPreferences.getValue("popularBooksAmount", "6"));
		
		log.info("Popular books amount is : " + popularBooksAmount);
		List<BookModel> books = new ArrayList<BookModel>();
		List<BookModel> popularBooks = new ArrayList<BookModel>();
		books = bookService.getAllBooks();
		Collections.shuffle(books);

		for (BookModel book : books) {
			while (popularBooks.size() < popularBooksAmount) {
				popularBooks.add(book);
			}
		}
		request.setAttribute("books", popularBooks);
		super.render(request, response);
	}

}
