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

import com.liferay.portal.kernel.util.Validator;
import com.liferay.portal.model.ModelWrapper;

import java.sql.Blob;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * This class is a wrapper for {@link Book}.
 * </p>
 *
 * @author Michael
 * @see Book
 * @generated
 */
public class BookWrapper implements Book, ModelWrapper<Book> {
	public BookWrapper(Book book) {
		_book = book;
	}

	@Override
	public Class<?> getModelClass() {
		return Book.class;
	}

	@Override
	public String getModelClassName() {
		return Book.class.getName();
	}

	@Override
	public Map<String, Object> getModelAttributes() {
		Map<String, Object> attributes = new HashMap<String, Object>();

		attributes.put("bookId", getBookId());
		attributes.put("createDate", getCreateDate());
		attributes.put("modifiedDate", getModifiedDate());
		attributes.put("gDriveId", getGDriveId());
		attributes.put("title", getTitle());
		attributes.put("description", getDescription());
		attributes.put("googleDriveLink", getGoogleDriveLink());
		attributes.put("bookLogo", getBookLogo());

		return attributes;
	}

	@Override
	public void setModelAttributes(Map<String, Object> attributes) {
		Long bookId = (Long)attributes.get("bookId");

		if (bookId != null) {
			setBookId(bookId);
		}

		Date createDate = (Date)attributes.get("createDate");

		if (createDate != null) {
			setCreateDate(createDate);
		}

		Date modifiedDate = (Date)attributes.get("modifiedDate");

		if (modifiedDate != null) {
			setModifiedDate(modifiedDate);
		}

		String gDriveId = (String)attributes.get("gDriveId");

		if (gDriveId != null) {
			setGDriveId(gDriveId);
		}

		String title = (String)attributes.get("title");

		if (title != null) {
			setTitle(title);
		}

		String description = (String)attributes.get("description");

		if (description != null) {
			setDescription(description);
		}

		String googleDriveLink = (String)attributes.get("googleDriveLink");

		if (googleDriveLink != null) {
			setGoogleDriveLink(googleDriveLink);
		}

		Blob bookLogo = (Blob)attributes.get("bookLogo");

		if (bookLogo != null) {
			setBookLogo(bookLogo);
		}
	}

	/**
	* Returns the primary key of this book.
	*
	* @return the primary key of this book
	*/
	@Override
	public long getPrimaryKey() {
		return _book.getPrimaryKey();
	}

	/**
	* Sets the primary key of this book.
	*
	* @param primaryKey the primary key of this book
	*/
	@Override
	public void setPrimaryKey(long primaryKey) {
		_book.setPrimaryKey(primaryKey);
	}

	/**
	* Returns the book ID of this book.
	*
	* @return the book ID of this book
	*/
	@Override
	public long getBookId() {
		return _book.getBookId();
	}

	/**
	* Sets the book ID of this book.
	*
	* @param bookId the book ID of this book
	*/
	@Override
	public void setBookId(long bookId) {
		_book.setBookId(bookId);
	}

	/**
	* Returns the create date of this book.
	*
	* @return the create date of this book
	*/
	@Override
	public java.util.Date getCreateDate() {
		return _book.getCreateDate();
	}

	/**
	* Sets the create date of this book.
	*
	* @param createDate the create date of this book
	*/
	@Override
	public void setCreateDate(java.util.Date createDate) {
		_book.setCreateDate(createDate);
	}

	/**
	* Returns the modified date of this book.
	*
	* @return the modified date of this book
	*/
	@Override
	public java.util.Date getModifiedDate() {
		return _book.getModifiedDate();
	}

	/**
	* Sets the modified date of this book.
	*
	* @param modifiedDate the modified date of this book
	*/
	@Override
	public void setModifiedDate(java.util.Date modifiedDate) {
		_book.setModifiedDate(modifiedDate);
	}

	/**
	* Returns the g drive ID of this book.
	*
	* @return the g drive ID of this book
	*/
	@Override
	public java.lang.String getGDriveId() {
		return _book.getGDriveId();
	}

	/**
	* Sets the g drive ID of this book.
	*
	* @param gDriveId the g drive ID of this book
	*/
	@Override
	public void setGDriveId(java.lang.String gDriveId) {
		_book.setGDriveId(gDriveId);
	}

	/**
	* Returns the title of this book.
	*
	* @return the title of this book
	*/
	@Override
	public java.lang.String getTitle() {
		return _book.getTitle();
	}

	/**
	* Sets the title of this book.
	*
	* @param title the title of this book
	*/
	@Override
	public void setTitle(java.lang.String title) {
		_book.setTitle(title);
	}

	/**
	* Returns the description of this book.
	*
	* @return the description of this book
	*/
	@Override
	public java.lang.String getDescription() {
		return _book.getDescription();
	}

	/**
	* Sets the description of this book.
	*
	* @param description the description of this book
	*/
	@Override
	public void setDescription(java.lang.String description) {
		_book.setDescription(description);
	}

	/**
	* Returns the google drive link of this book.
	*
	* @return the google drive link of this book
	*/
	@Override
	public java.lang.String getGoogleDriveLink() {
		return _book.getGoogleDriveLink();
	}

	/**
	* Sets the google drive link of this book.
	*
	* @param googleDriveLink the google drive link of this book
	*/
	@Override
	public void setGoogleDriveLink(java.lang.String googleDriveLink) {
		_book.setGoogleDriveLink(googleDriveLink);
	}

	/**
	* Returns the book logo of this book.
	*
	* @return the book logo of this book
	*/
	@Override
	public java.sql.Blob getBookLogo() {
		return _book.getBookLogo();
	}

	/**
	* Sets the book logo of this book.
	*
	* @param bookLogo the book logo of this book
	*/
	@Override
	public void setBookLogo(java.sql.Blob bookLogo) {
		_book.setBookLogo(bookLogo);
	}

	@Override
	public boolean isNew() {
		return _book.isNew();
	}

	@Override
	public void setNew(boolean n) {
		_book.setNew(n);
	}

	@Override
	public boolean isCachedModel() {
		return _book.isCachedModel();
	}

	@Override
	public void setCachedModel(boolean cachedModel) {
		_book.setCachedModel(cachedModel);
	}

	@Override
	public boolean isEscapedModel() {
		return _book.isEscapedModel();
	}

	@Override
	public java.io.Serializable getPrimaryKeyObj() {
		return _book.getPrimaryKeyObj();
	}

	@Override
	public void setPrimaryKeyObj(java.io.Serializable primaryKeyObj) {
		_book.setPrimaryKeyObj(primaryKeyObj);
	}

	@Override
	public com.liferay.portlet.expando.model.ExpandoBridge getExpandoBridge() {
		return _book.getExpandoBridge();
	}

	@Override
	public void setExpandoBridgeAttributes(
		com.liferay.portal.model.BaseModel<?> baseModel) {
		_book.setExpandoBridgeAttributes(baseModel);
	}

	@Override
	public void setExpandoBridgeAttributes(
		com.liferay.portlet.expando.model.ExpandoBridge expandoBridge) {
		_book.setExpandoBridgeAttributes(expandoBridge);
	}

	@Override
	public void setExpandoBridgeAttributes(
		com.liferay.portal.service.ServiceContext serviceContext) {
		_book.setExpandoBridgeAttributes(serviceContext);
	}

	@Override
	public java.lang.Object clone() {
		return new BookWrapper((Book)_book.clone());
	}

	@Override
	public int compareTo(ru.tiis.srv.model.Book book) {
		return _book.compareTo(book);
	}

	@Override
	public int hashCode() {
		return _book.hashCode();
	}

	@Override
	public com.liferay.portal.model.CacheModel<ru.tiis.srv.model.Book> toCacheModel() {
		return _book.toCacheModel();
	}

	@Override
	public ru.tiis.srv.model.Book toEscapedModel() {
		return new BookWrapper(_book.toEscapedModel());
	}

	@Override
	public ru.tiis.srv.model.Book toUnescapedModel() {
		return new BookWrapper(_book.toUnescapedModel());
	}

	@Override
	public java.lang.String toString() {
		return _book.toString();
	}

	@Override
	public java.lang.String toXmlString() {
		return _book.toXmlString();
	}

	@Override
	public void persist()
		throws com.liferay.portal.kernel.exception.SystemException {
		_book.persist();
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}

		if (!(obj instanceof BookWrapper)) {
			return false;
		}

		BookWrapper bookWrapper = (BookWrapper)obj;

		if (Validator.equals(_book, bookWrapper._book)) {
			return true;
		}

		return false;
	}

	/**
	 * @deprecated As of 6.1.0, replaced by {@link #getWrappedModel}
	 */
	public Book getWrappedBook() {
		return _book;
	}

	@Override
	public Book getWrappedModel() {
		return _book;
	}

	@Override
	public void resetOriginalValues() {
		_book.resetOriginalValues();
	}

	private Book _book;
}