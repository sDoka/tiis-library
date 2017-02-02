package ru.tiis.library.portlet.views;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.portlet.PortletRequest;
import javax.portlet.PortletURL;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import ru.tiis.constants.FriendlyUrlConstants;
import ru.tiis.library.portlet.BookInfoPortlet;
import ru.tiis.library.portlet.LibraryPortlet;
import ru.tiis.library.service.BookService;
import ru.tiis.library.service.impl.BookServiceFactory;
import ru.tiis.library.service.model.BookModel;

import com.google.api.services.drive.DriveScopes;
import com.google.api.services.samples.drive.cmdline.DriveSample;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.model.GroupConstants;
import com.liferay.portal.model.Layout;
import com.liferay.portal.service.GroupLocalServiceUtil;
import com.liferay.portal.service.LayoutLocalServiceUtil;
import com.liferay.portal.util.PortalUtil;
import com.liferay.portlet.PortletURLFactoryUtil;

public class CatalogView extends View {
	private static Log log = LogFactoryUtil.getLog(CatalogView.class);
	
	public static final String PAGE_NAME = "catalog_page";
	private static final String PAGE_PATH = "/html/library/catalog.jsp";
	
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
		List<BookModel> books = new ArrayList<BookModel>();
		books = bookService.getAllBooks();
		long bookInfoPlid = 0;
		try {
			long guestGroupId = GroupLocalServiceUtil.getGroup(
					PortalUtil.getDefaultCompanyId(), GroupConstants.GUEST).getGroupId();
			Layout bookInfoPage = LayoutLocalServiceUtil.getFriendlyURLLayout(
					guestGroupId, false, FriendlyUrlConstants.BOOK_INFO);
			 bookInfoPlid = bookInfoPage.getPlid();
		} catch (PortalException e1) {
			log.error(e1.getMessage());
		}
		
		
		
		if (books.size() < 15) {
			for (int i = 0; i < 15; i++) {
				
				try {
					File testFile = new File("D:\\TIIS\\downloads\\book_logo.jpg");
					File bookPdf = new File("D:\\TIIS\\downloads\\test_pdf.pdf");
					//TODO check file size
					/*log.info("File size is: " + testFile.getTotalSpace());*/
					BookModel bookModel = bookService.addBook("bookTitle" + i, "Book description" + i, testFile, bookPdf);
					books.add(bookModel);
				} catch (PortalException e) {
					log.error("Failed to create book : bookTitle" + i + ". " + e.getMessage());
				}
				
			}
		} else {
			for (BookModel book : books) {
				PortletURL bookInfoUrl = PortletURLFactoryUtil.create(request,
						BookInfoPortlet.PORTLET_ID, bookInfoPlid, PortletRequest.RENDER_PHASE);
				bookInfoUrl.setParameter("bookId", String.valueOf(book.getBookId()));
				String url = bookInfoUrl.toString();
				//log.info("Url is : " + url);
				book.setBookInfoUrl(url);
			}
		}
		request.setAttribute("books", books);
		super.render(request, response);
	}
}

