package ru.tiis.library.service.impl;

import ru.tiis.library.service.BookService;

public class BookServiceFactory {

	public static BookService getService() {
		return BookServiceImpl.getInstance();
	}

}
