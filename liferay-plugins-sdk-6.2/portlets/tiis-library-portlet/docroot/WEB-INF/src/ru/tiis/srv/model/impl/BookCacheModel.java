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

package ru.tiis.srv.model.impl;

import com.liferay.portal.kernel.util.StringBundler;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.model.CacheModel;

import ru.tiis.srv.model.Book;

import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

import java.util.Date;

/**
 * The cache model class for representing Book in entity cache.
 *
 * @author Michael
 * @see Book
 * @generated
 */
public class BookCacheModel implements CacheModel<Book>, Externalizable {
	@Override
	public String toString() {
		StringBundler sb = new StringBundler(15);

		sb.append("{bookId=");
		sb.append(bookId);
		sb.append(", createDate=");
		sb.append(createDate);
		sb.append(", modifiedDate=");
		sb.append(modifiedDate);
		sb.append(", gDriveId=");
		sb.append(gDriveId);
		sb.append(", title=");
		sb.append(title);
		sb.append(", description=");
		sb.append(description);
		sb.append(", googleDriveLink=");
		sb.append(googleDriveLink);

		return sb.toString();
	}

	@Override
	public Book toEntityModel() {
		BookImpl bookImpl = new BookImpl();

		bookImpl.setBookId(bookId);

		if (createDate == Long.MIN_VALUE) {
			bookImpl.setCreateDate(null);
		}
		else {
			bookImpl.setCreateDate(new Date(createDate));
		}

		if (modifiedDate == Long.MIN_VALUE) {
			bookImpl.setModifiedDate(null);
		}
		else {
			bookImpl.setModifiedDate(new Date(modifiedDate));
		}

		if (gDriveId == null) {
			bookImpl.setGDriveId(StringPool.BLANK);
		}
		else {
			bookImpl.setGDriveId(gDriveId);
		}

		if (title == null) {
			bookImpl.setTitle(StringPool.BLANK);
		}
		else {
			bookImpl.setTitle(title);
		}

		if (description == null) {
			bookImpl.setDescription(StringPool.BLANK);
		}
		else {
			bookImpl.setDescription(description);
		}

		if (googleDriveLink == null) {
			bookImpl.setGoogleDriveLink(StringPool.BLANK);
		}
		else {
			bookImpl.setGoogleDriveLink(googleDriveLink);
		}

		bookImpl.resetOriginalValues();

		return bookImpl;
	}

	@Override
	public void readExternal(ObjectInput objectInput) throws IOException {
		bookId = objectInput.readLong();
		createDate = objectInput.readLong();
		modifiedDate = objectInput.readLong();
		gDriveId = objectInput.readUTF();
		title = objectInput.readUTF();
		description = objectInput.readUTF();
		googleDriveLink = objectInput.readUTF();
	}

	@Override
	public void writeExternal(ObjectOutput objectOutput)
		throws IOException {
		objectOutput.writeLong(bookId);
		objectOutput.writeLong(createDate);
		objectOutput.writeLong(modifiedDate);

		if (gDriveId == null) {
			objectOutput.writeUTF(StringPool.BLANK);
		}
		else {
			objectOutput.writeUTF(gDriveId);
		}

		if (title == null) {
			objectOutput.writeUTF(StringPool.BLANK);
		}
		else {
			objectOutput.writeUTF(title);
		}

		if (description == null) {
			objectOutput.writeUTF(StringPool.BLANK);
		}
		else {
			objectOutput.writeUTF(description);
		}

		if (googleDriveLink == null) {
			objectOutput.writeUTF(StringPool.BLANK);
		}
		else {
			objectOutput.writeUTF(googleDriveLink);
		}
	}

	public long bookId;
	public long createDate;
	public long modifiedDate;
	public String gDriveId;
	public String title;
	public String description;
	public String googleDriveLink;
}