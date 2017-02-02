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

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * <p>
 * This class is a wrapper for {@link Test}.
 * </p>
 *
 * @author Michael
 * @see Test
 * @generated
 */
public class TestWrapper implements Test, ModelWrapper<Test> {
	public TestWrapper(Test test) {
		_test = test;
	}

	@Override
	public Class<?> getModelClass() {
		return Test.class;
	}

	@Override
	public String getModelClassName() {
		return Test.class.getName();
	}

	@Override
	public Map<String, Object> getModelAttributes() {
		Map<String, Object> attributes = new HashMap<String, Object>();

		attributes.put("testId", getTestId());
		attributes.put("createDate", getCreateDate());
		attributes.put("modifiedDate", getModifiedDate());
		attributes.put("isBookTest", getIsBookTest());
		attributes.put("bookId", getBookId());
		attributes.put("content", getContent());

		return attributes;
	}

	@Override
	public void setModelAttributes(Map<String, Object> attributes) {
		Long testId = (Long)attributes.get("testId");

		if (testId != null) {
			setTestId(testId);
		}

		Date createDate = (Date)attributes.get("createDate");

		if (createDate != null) {
			setCreateDate(createDate);
		}

		Date modifiedDate = (Date)attributes.get("modifiedDate");

		if (modifiedDate != null) {
			setModifiedDate(modifiedDate);
		}

		Boolean isBookTest = (Boolean)attributes.get("isBookTest");

		if (isBookTest != null) {
			setIsBookTest(isBookTest);
		}

		Long bookId = (Long)attributes.get("bookId");

		if (bookId != null) {
			setBookId(bookId);
		}

		String content = (String)attributes.get("content");

		if (content != null) {
			setContent(content);
		}
	}

	/**
	* Returns the primary key of this test.
	*
	* @return the primary key of this test
	*/
	@Override
	public long getPrimaryKey() {
		return _test.getPrimaryKey();
	}

	/**
	* Sets the primary key of this test.
	*
	* @param primaryKey the primary key of this test
	*/
	@Override
	public void setPrimaryKey(long primaryKey) {
		_test.setPrimaryKey(primaryKey);
	}

	/**
	* Returns the test ID of this test.
	*
	* @return the test ID of this test
	*/
	@Override
	public long getTestId() {
		return _test.getTestId();
	}

	/**
	* Sets the test ID of this test.
	*
	* @param testId the test ID of this test
	*/
	@Override
	public void setTestId(long testId) {
		_test.setTestId(testId);
	}

	/**
	* Returns the create date of this test.
	*
	* @return the create date of this test
	*/
	@Override
	public java.util.Date getCreateDate() {
		return _test.getCreateDate();
	}

	/**
	* Sets the create date of this test.
	*
	* @param createDate the create date of this test
	*/
	@Override
	public void setCreateDate(java.util.Date createDate) {
		_test.setCreateDate(createDate);
	}

	/**
	* Returns the modified date of this test.
	*
	* @return the modified date of this test
	*/
	@Override
	public java.util.Date getModifiedDate() {
		return _test.getModifiedDate();
	}

	/**
	* Sets the modified date of this test.
	*
	* @param modifiedDate the modified date of this test
	*/
	@Override
	public void setModifiedDate(java.util.Date modifiedDate) {
		_test.setModifiedDate(modifiedDate);
	}

	/**
	* Returns the is book test of this test.
	*
	* @return the is book test of this test
	*/
	@Override
	public boolean getIsBookTest() {
		return _test.getIsBookTest();
	}

	/**
	* Returns <code>true</code> if this test is is book test.
	*
	* @return <code>true</code> if this test is is book test; <code>false</code> otherwise
	*/
	@Override
	public boolean isIsBookTest() {
		return _test.isIsBookTest();
	}

	/**
	* Sets whether this test is is book test.
	*
	* @param isBookTest the is book test of this test
	*/
	@Override
	public void setIsBookTest(boolean isBookTest) {
		_test.setIsBookTest(isBookTest);
	}

	/**
	* Returns the book ID of this test.
	*
	* @return the book ID of this test
	*/
	@Override
	public long getBookId() {
		return _test.getBookId();
	}

	/**
	* Sets the book ID of this test.
	*
	* @param bookId the book ID of this test
	*/
	@Override
	public void setBookId(long bookId) {
		_test.setBookId(bookId);
	}

	/**
	* Returns the content of this test.
	*
	* @return the content of this test
	*/
	@Override
	public java.lang.String getContent() {
		return _test.getContent();
	}

	/**
	* Sets the content of this test.
	*
	* @param content the content of this test
	*/
	@Override
	public void setContent(java.lang.String content) {
		_test.setContent(content);
	}

	@Override
	public boolean isNew() {
		return _test.isNew();
	}

	@Override
	public void setNew(boolean n) {
		_test.setNew(n);
	}

	@Override
	public boolean isCachedModel() {
		return _test.isCachedModel();
	}

	@Override
	public void setCachedModel(boolean cachedModel) {
		_test.setCachedModel(cachedModel);
	}

	@Override
	public boolean isEscapedModel() {
		return _test.isEscapedModel();
	}

	@Override
	public java.io.Serializable getPrimaryKeyObj() {
		return _test.getPrimaryKeyObj();
	}

	@Override
	public void setPrimaryKeyObj(java.io.Serializable primaryKeyObj) {
		_test.setPrimaryKeyObj(primaryKeyObj);
	}

	@Override
	public com.liferay.portlet.expando.model.ExpandoBridge getExpandoBridge() {
		return _test.getExpandoBridge();
	}

	@Override
	public void setExpandoBridgeAttributes(
		com.liferay.portal.model.BaseModel<?> baseModel) {
		_test.setExpandoBridgeAttributes(baseModel);
	}

	@Override
	public void setExpandoBridgeAttributes(
		com.liferay.portlet.expando.model.ExpandoBridge expandoBridge) {
		_test.setExpandoBridgeAttributes(expandoBridge);
	}

	@Override
	public void setExpandoBridgeAttributes(
		com.liferay.portal.service.ServiceContext serviceContext) {
		_test.setExpandoBridgeAttributes(serviceContext);
	}

	@Override
	public java.lang.Object clone() {
		return new TestWrapper((Test)_test.clone());
	}

	@Override
	public int compareTo(ru.tiis.srv.model.Test test) {
		return _test.compareTo(test);
	}

	@Override
	public int hashCode() {
		return _test.hashCode();
	}

	@Override
	public com.liferay.portal.model.CacheModel<ru.tiis.srv.model.Test> toCacheModel() {
		return _test.toCacheModel();
	}

	@Override
	public ru.tiis.srv.model.Test toEscapedModel() {
		return new TestWrapper(_test.toEscapedModel());
	}

	@Override
	public ru.tiis.srv.model.Test toUnescapedModel() {
		return new TestWrapper(_test.toUnescapedModel());
	}

	@Override
	public java.lang.String toString() {
		return _test.toString();
	}

	@Override
	public java.lang.String toXmlString() {
		return _test.toXmlString();
	}

	@Override
	public void persist()
		throws com.liferay.portal.kernel.exception.SystemException {
		_test.persist();
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}

		if (!(obj instanceof TestWrapper)) {
			return false;
		}

		TestWrapper testWrapper = (TestWrapper)obj;

		if (Validator.equals(_test, testWrapper._test)) {
			return true;
		}

		return false;
	}

	/**
	 * @deprecated As of 6.1.0, replaced by {@link #getWrappedModel}
	 */
	public Test getWrappedTest() {
		return _test;
	}

	@Override
	public Test getWrappedModel() {
		return _test;
	}

	@Override
	public void resetOriginalValues() {
		_test.resetOriginalValues();
	}

	private Test _test;
}