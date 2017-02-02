package ru.tiis.library.service;

import java.io.File;
import java.util.List;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;

import ru.tiis.library.service.model.BookModel;

public interface BookService {
	public BookModel addBook(String title, String description, File bookLogo, File bookPdfFile)
			throws PortalException, SystemException;
	public BookModel getBook(long bookId) throws PortalException, SystemException;
	public BookModel updateBook(BookModel book) throws PortalException;
	public BookModel deleteBook(long bookId) throws PortalException, SystemException;
	
	public List<BookModel> getAllBooks();
	
	
}
