package ru.tiis.library.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.PersistenceException;

import org.apache.commons.lang.StringUtils;

import ru.tiis.library.service.BookService;
import ru.tiis.library.service.model.BookModel;
import ru.tiis.srv.model.Book;
import ru.tiis.srv.service.BookLocalServiceUtil;

import com.liferay.counter.service.CounterLocalServiceUtil;
import com.liferay.portal.kernel.dao.orm.QueryUtil;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portlet.documentlibrary.service.DLFileEntryLocalServiceUtil;

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
	public BookModel addBook(String title, String description, long bookLogoFileEntryId,
			File bookPdf, ServiceContext serviceContext, String clientHost)
			throws PortalException, SystemException {

		String gdriveBookUrl = GDriveService.uploadNewBook(bookPdf, clientHost);

		long bookId = CounterLocalServiceUtil.increment(Book.class.getName());
		Book book = BookLocalServiceUtil.createBook(bookId);
		book.setBookId(bookId);
		book.setTitle(title);
		book.setDescription(description);
		book.setCreateDate(new Date());
		book.setGoogleDriveLink(gdriveBookUrl);
		book.setBookLogoDlId(bookLogoFileEntryId);

		BookLocalServiceUtil.addBook(book, serviceContext);
		return getBook(book);
	}

	@Override
	public BookModel updateBook(BookModel book, ServiceContext serviceContext)
			throws PortalException, SystemException {
		Book persistedBook = BookLocalServiceUtil.getBook(book.getBookId());
		if (persistedBook == null) {
			throw new PersistenceException();
		}
		if (StringUtils.isEmpty(book.getTitle())) {
			throw new PortalException("Book title can't be empty");
		}
		persistedBook.setTitle(book.getTitle());
		
		if (StringUtils.isEmpty(book.getDescription())) {
			throw new PortalException("Book description can't be empty");
		}
		persistedBook.setDescription(book.getDescription());
		//TODO alter table and remove blob column
		persistedBook.setBookLogo(null);
		if (book.getBookLogo() != null) {
			persistedBook.setBookLogoDlId(book.getBookLogo().getFileEntryId());
		}
		
		BookLocalServiceUtil.updateBook(persistedBook, serviceContext);
		return getBook(persistedBook);
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
		if(bookToRemove.getBookLogo() != null) {
			try {
				DLFileEntryLocalServiceUtil.deleteDLFileEntry(bookToRemove.getBookLogo());
			} catch (SystemException e) {
				log.warn(e.getMessage());
			}
			
		}
		BookLocalServiceUtil.deleteBook(book.getBookId());
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
