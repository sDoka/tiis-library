package ru.tiis.library.service.impl;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.PersistenceException;

import ru.tiis.library.service.BookService;
import ru.tiis.library.service.model.BookModel;
import ru.tiis.srv.model.Book;
import ru.tiis.srv.service.BookLocalServiceUtil;

import com.liferay.counter.service.CounterLocalServiceUtil;
import com.liferay.portal.kernel.dao.jdbc.OutputBlob;
import com.liferay.portal.kernel.dao.orm.QueryUtil;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.service.ServiceContext;

public class BookServiceImpl implements BookService {
	private static Log log = LogFactoryUtil.getLog(BookServiceImpl.class);

	private static volatile BookService instance = null;

	private BookServiceImpl() {
	};

	protected static BookService getInstance() {
		if (instance == null)
			synchronized (BookServiceImpl.class) {
				if (instance == null)
					instance = new BookServiceImpl();
			}
		return instance;
	}

	@Override
	public BookModel addBook(String title, String description, File bookLogo,
			File bookPdf, ServiceContext serviceContext)
			throws PortalException, SystemException {

		String gdriveBookUrl = GDriveService.uploadNewBook(bookPdf);

		long bookId = CounterLocalServiceUtil.increment(Book.class.getName());
		Book book = BookLocalServiceUtil.createBook(bookId);
		book.setBookId(bookId);
		book.setTitle(title);
		book.setDescription(description);
		book.setCreateDate(new Date());
		book.setGoogleDriveLink(gdriveBookUrl);
		try {
			InputStream fis = new FileInputStream(bookLogo);
			OutputBlob bookLogoBlob = new OutputBlob(fis, bookLogo.length());
			book.setBookLogo(bookLogoBlob);
		} catch (FileNotFoundException e) {
			log.error("Failed to save image to the book " + title + " : "
					+ e.getMessage());
		}

		BookLocalServiceUtil.addBook(book, serviceContext);
		return getBook(book);
	}

	@Override
	public BookModel updateBook(BookModel book, ServiceContext serviceContext)
			throws PortalException, SystemException {
		Book bookPersistence = BookLocalServiceUtil.getBook(book.getBookId());
		if (bookPersistence == null) {
			throw new PersistenceException();
		}
		bookPersistence.setTitle(book.getTitle());
		bookPersistence.setDescription(book.getDescription());
		bookPersistence.setBookLogo(book.getLogo());
		BookLocalServiceUtil.updateBook(bookPersistence);
		return getBook(bookPersistence);
	}

	@Override
	public BookModel getBook(long bookId) throws PortalException,
			SystemException {
		return new BookModel(bookId);
	}

	private BookModel getBook(Book book) {
		return new BookModel(book);
	}

	@Override
	public BookModel deleteBook(long bookId) throws PortalException,
			SystemException {
		return deleteBook(BookLocalServiceUtil.getBook(bookId));
	}

	private BookModel deleteBook(Book book) throws PortalException,
			SystemException {
		BookModel bookToRemove = getBook(book);
		BookLocalServiceUtil.deleteBook(book);
		return bookToRemove;
	}

	@Override
	public List<BookModel> getAllBooks() {
		List<BookModel> bookModels = new ArrayList<BookModel>();
		try {
			List<Book> books = BookLocalServiceUtil.getBooks(QueryUtil.ALL_POS,
					QueryUtil.ALL_POS);
			for (Book book : books) {
				bookModels.add(getBook(book));
			}
		} catch (SystemException e) {
			log.error("Failed to get books. " + e.getMessage());
		}
		return bookModels;
	}
}
