/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */

package ru.tiis.srv.model;

import java.sql.Blob;

/**
 * The Blob model class for lazy loading the bookLogo column in Book.
 *
 * @author Michael
 * @see Book
 * @generated
 */
public class BookBookLogoBlobModel {
	public BookBookLogoBlobModel() {
	}

	public BookBookLogoBlobModel(long bookId) {
		_bookId = bookId;
	}

	public BookBookLogoBlobModel(long bookId, Blob bookLogoBlob) {
		_bookId = bookId;
		_bookLogoBlob = bookLogoBlob;
	}

	public long getBookId() {
		return _bookId;
	}

	public void setBookId(long bookId) {
		_bookId = bookId;
	}

	public Blob getBookLogoBlob() {
		return _bookLogoBlob;
	}

	public void setBookLogoBlob(Blob bookLogoBlob) {
		_bookLogoBlob = bookLogoBlob;
	}

	private long _bookId;
	private Blob _bookLogoBlob;
}