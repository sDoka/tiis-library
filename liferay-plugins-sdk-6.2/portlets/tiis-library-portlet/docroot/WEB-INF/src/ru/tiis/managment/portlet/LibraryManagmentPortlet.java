package ru.tiis.managment.portlet;

import java.io.File;
import java.io.IOException;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
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
import com.liferay.portal.kernel.upload.UploadPortletRequest;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextFactory;
import com.liferay.portal.util.PortalUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;

/**
 * Portlet implementation class LibraryManagmentPortlet
 */
public class LibraryManagmentPortlet extends MVCPortlet {
	
	//TODO This shit should create books, tests, news and docs...
	//TODO Statisctics should be in another module.
	
	private static BookService bookService = BookServiceFactory.getService();
	private static Log log = LogFactoryUtil.getLog(LibraryManagmentPortlet.class);


	@Override
	public void render(RenderRequest request, RenderResponse response)
			throws PortletException, IOException {
		
		//TODO get some param
		//if no params - render menu page
		//if - "book" - render book menu
		//if - "test" - render test menu
		// TODO Auto-generated method stub
		super.render(request, response);
	}
	
	public void createBook(ActionRequest request, ActionResponse response) {
		UploadPortletRequest uploadRequest = PortalUtil.getUploadPortletRequest(request);
		
		String title = ParamUtil.get(request, "bookTitle", "Unnamed");
		String description = ParamUtil.get(request, "bookDescription", "No description");
		File bookLogo = uploadRequest.getFile("bookLogo");
		File bookPdfFile = uploadRequest.getFile("bookPdfFile");
		
		try {
			ServiceContext serviceContext = ServiceContextFactory.getInstance(request);
			BookModel bookModel = bookService.addBook(title, description, bookLogo, bookPdfFile, serviceContext);
			
			//TODO catch NonAuthorizedUserException and open in new tab
			//https://accounts.google.com/o/oauth2/auth?client_id=1097637469091-gdshlvm5m4sub6l1m6hrtg83c07umaa4.apps.googleusercontent.com&redirect_uri=http://localhost:9001/Callback&response_type=code&scope=https://www.googleapis.com/auth/drive.file
			//or i'll make utility method for gdrive auth check -> authorize -> add book
			
		} catch (PortalException | SystemException e) {
			log.error("Can't add a book with title " + title + ": " + e.getMessage());
		}
		//TODO send AJAX Response
	}
}
