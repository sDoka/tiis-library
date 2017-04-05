package ru.tiis.library.service;

import java.io.File;
import java.util.List;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.service.ServiceContext;

import ru.tiis.library.service.model.BookModel;

public interface BookService {

	/**
	 * Adds file to the database and uploads it to the google drive of current user.
	 * @param title
	 * @param description
	 * @param logoDlFileEntryId
	 * @param bookPdfFile
	 * @param serviceContext
	 * @return
	 * @throws PortalException
	 * @throws SystemException
	 */
	public BookModel addBook(String title, String description, long logoDlFileEntryId, File bookPdfFile, 
			ServiceContext serviceContext, String clientHost) throws PortalException, SystemException;
	
	public BookModel updateBook(BookModel book, ServiceContext serviceContext) throws PortalException, SystemException;

	public BookModel getBook(long bookId) throws PortalException, SystemException;
	
	public BookModel deleteBook(long bookId) throws PortalException, SystemException;
	
	public List<BookModel> getAllBooks();
		
}
