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

import com.liferay.portal.kernel.bean.AutoEscapeBeanHandler;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.util.ProxyUtil;
import com.liferay.portal.kernel.util.StringBundler;
import com.liferay.portal.model.BaseModel;
import com.liferay.portal.model.impl.BaseModelImpl;

import ru.tiis.srv.service.ClpSerializer;
import ru.tiis.srv.service.TestLocalServiceUtil;

import java.io.Serializable;

import java.lang.reflect.Method;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Michael
 */
public class TestClp extends BaseModelImpl<Test> implements Test {
	public TestClp() {
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
	public long getPrimaryKey() {
		return _testId;
	}

	@Override
	public void setPrimaryKey(long primaryKey) {
		setTestId(primaryKey);
	}

	@Override
	public Serializable getPrimaryKeyObj() {
		return _testId;
	}

	@Override
	public void setPrimaryKeyObj(Serializable primaryKeyObj) {
		setPrimaryKey(((Long)primaryKeyObj).longValue());
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

	@Override
	public long getTestId() {
		return _testId;
	}

	@Override
	public void setTestId(long testId) {
		_testId = testId;

		if (_testRemoteModel != null) {
			try {
				Class<?> clazz = _testRemoteModel.getClass();

				Method method = clazz.getMethod("setTestId", long.class);

				method.invoke(_testRemoteModel, testId);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public Date getCreateDate() {
		return _createDate;
	}

	@Override
	public void setCreateDate(Date createDate) {
		_createDate = createDate;

		if (_testRemoteModel != null) {
			try {
				Class<?> clazz = _testRemoteModel.getClass();

				Method method = clazz.getMethod("setCreateDate", Date.class);

				method.invoke(_testRemoteModel, createDate);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public Date getModifiedDate() {
		return _modifiedDate;
	}

	@Override
	public void setModifiedDate(Date modifiedDate) {
		_modifiedDate = modifiedDate;

		if (_testRemoteModel != null) {
			try {
				Class<?> clazz = _testRemoteModel.getClass();

				Method method = clazz.getMethod("setModifiedDate", Date.class);

				method.invoke(_testRemoteModel, modifiedDate);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public boolean getIsBookTest() {
		return _isBookTest;
	}

	@Override
	public boolean isIsBookTest() {
		return _isBookTest;
	}

	@Override
	public void setIsBookTest(boolean isBookTest) {
		_isBookTest = isBookTest;

		if (_testRemoteModel != null) {
			try {
				Class<?> clazz = _testRemoteModel.getClass();

				Method method = clazz.getMethod("setIsBookTest", boolean.class);

				method.invoke(_testRemoteModel, isBookTest);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public long getBookId() {
		return _bookId;
	}

	@Override
	public void setBookId(long bookId) {
		_bookId = bookId;

		if (_testRemoteModel != null) {
			try {
				Class<?> clazz = _testRemoteModel.getClass();

				Method method = clazz.getMethod("setBookId", long.class);

				method.invoke(_testRemoteModel, bookId);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public String getContent() {
		return _content;
	}

	@Override
	public void setContent(String content) {
		_content = content;

		if (_testRemoteModel != null) {
			try {
				Class<?> clazz = _testRemoteModel.getClass();

				Method method = clazz.getMethod("setContent", String.class);

				method.invoke(_testRemoteModel, content);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	public BaseModel<?> getTestRemoteModel() {
		return _testRemoteModel;
	}

	public void setTestRemoteModel(BaseModel<?> testRemoteModel) {
		_testRemoteModel = testRemoteModel;
	}

	public Object invokeOnRemoteModel(String methodName,
		Class<?>[] parameterTypes, Object[] parameterValues)
		throws Exception {
		Object[] remoteParameterValues = new Object[parameterValues.length];

		for (int i = 0; i < parameterValues.length; i++) {
			if (parameterValues[i] != null) {
				remoteParameterValues[i] = ClpSerializer.translateInput(parameterValues[i]);
			}
		}

		Class<?> remoteModelClass = _testRemoteModel.getClass();

		ClassLoader remoteModelClassLoader = remoteModelClass.getClassLoader();

		Class<?>[] remoteParameterTypes = new Class[parameterTypes.length];

		for (int i = 0; i < parameterTypes.length; i++) {
			if (parameterTypes[i].isPrimitive()) {
				remoteParameterTypes[i] = parameterTypes[i];
			}
			else {
				String parameterTypeName = parameterTypes[i].getName();

				remoteParameterTypes[i] = remoteModelClassLoader.loadClass(parameterTypeName);
			}
		}

		Method method = remoteModelClass.getMethod(methodName,
				remoteParameterTypes);

		Object returnValue = method.invoke(_testRemoteModel,
				remoteParameterValues);

		if (returnValue != null) {
			returnValue = ClpSerializer.translateOutput(returnValue);
		}

		return returnValue;
	}

	@Override
	public void persist() throws SystemException {
		if (this.isNew()) {
			TestLocalServiceUtil.addTest(this);
		}
		else {
			TestLocalServiceUtil.updateTest(this);
		}
	}

	@Override
	public Test toEscapedModel() {
		return (Test)ProxyUtil.newProxyInstance(Test.class.getClassLoader(),
			new Class[] { Test.class }, new AutoEscapeBeanHandler(this));
	}

	@Override
	public Object clone() {
		TestClp clone = new TestClp();

		clone.setTestId(getTestId());
		clone.setCreateDate(getCreateDate());
		clone.setModifiedDate(getModifiedDate());
		clone.setIsBookTest(getIsBookTest());
		clone.setBookId(getBookId());
		clone.setContent(getContent());

		return clone;
	}

	@Override
	public int compareTo(Test test) {
		long primaryKey = test.getPrimaryKey();

		if (getPrimaryKey() < primaryKey) {
			return -1;
		}
		else if (getPrimaryKey() > primaryKey) {
			return 1;
		}
		else {
			return 0;
		}
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}

		if (!(obj instanceof TestClp)) {
			return false;
		}

		TestClp test = (TestClp)obj;

		long primaryKey = test.getPrimaryKey();

		if (getPrimaryKey() == primaryKey) {
			return true;
		}
		else {
			return false;
		}
	}

	public Class<?> getClpSerializerClass() {
		return _clpSerializerClass;
	}

	@Override
	public int hashCode() {
		return (int)getPrimaryKey();
	}

	@Override
	public String toString() {
		StringBundler sb = new StringBundler(13);

		sb.append("{testId=");
		sb.append(getTestId());
		sb.append(", createDate=");
		sb.append(getCreateDate());
		sb.append(", modifiedDate=");
		sb.append(getModifiedDate());
		sb.append(", isBookTest=");
		sb.append(getIsBookTest());
		sb.append(", bookId=");
		sb.append(getBookId());
		sb.append(", content=");
		sb.append(getContent());
		sb.append("}");

		return sb.toString();
	}

	@Override
	public String toXmlString() {
		StringBundler sb = new StringBundler(22);

		sb.append("<model><model-name>");
		sb.append("ru.tiis.srv.model.Test");
		sb.append("</model-name>");

		sb.append(
			"<column><column-name>testId</column-name><column-value><![CDATA[");
		sb.append(getTestId());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>createDate</column-name><column-value><![CDATA[");
		sb.append(getCreateDate());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>modifiedDate</column-name><column-value><![CDATA[");
		sb.append(getModifiedDate());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>isBookTest</column-name><column-value><![CDATA[");
		sb.append(getIsBookTest());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>bookId</column-name><column-value><![CDATA[");
		sb.append(getBookId());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>content</column-name><column-value><![CDATA[");
		sb.append(getContent());
		sb.append("]]></column-value></column>");

		sb.append("</model>");

		return sb.toString();
	}

	private long _testId;
	private Date _createDate;
	private Date _modifiedDate;
	private boolean _isBookTest;
	private long _bookId;
	private String _content;
	private BaseModel<?> _testRemoteModel;
	private Class<?> _clpSerializerClass = ru.tiis.srv.service.ClpSerializer.class;
}