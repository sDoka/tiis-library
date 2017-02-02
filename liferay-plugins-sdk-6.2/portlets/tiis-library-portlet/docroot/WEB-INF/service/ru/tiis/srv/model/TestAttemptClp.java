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
import com.liferay.portal.util.PortalUtil;

import ru.tiis.srv.service.ClpSerializer;
import ru.tiis.srv.service.TestAttemptLocalServiceUtil;

import java.io.Serializable;

import java.lang.reflect.Method;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Michael
 */
public class TestAttemptClp extends BaseModelImpl<TestAttempt>
	implements TestAttempt {
	public TestAttemptClp() {
	}

	@Override
	public Class<?> getModelClass() {
		return TestAttempt.class;
	}

	@Override
	public String getModelClassName() {
		return TestAttempt.class.getName();
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
		attributes.put("userId", getUserId());
		attributes.put("startTime", getStartTime());
		attributes.put("finishTime", getFinishTime());
		attributes.put("result", getResult());

		return attributes;
	}

	@Override
	public void setModelAttributes(Map<String, Object> attributes) {
		Long testId = (Long)attributes.get("testId");

		if (testId != null) {
			setTestId(testId);
		}

		Long userId = (Long)attributes.get("userId");

		if (userId != null) {
			setUserId(userId);
		}

		Date startTime = (Date)attributes.get("startTime");

		if (startTime != null) {
			setStartTime(startTime);
		}

		Date finishTime = (Date)attributes.get("finishTime");

		if (finishTime != null) {
			setFinishTime(finishTime);
		}

		Double result = (Double)attributes.get("result");

		if (result != null) {
			setResult(result);
		}
	}

	@Override
	public long getTestId() {
		return _testId;
	}

	@Override
	public void setTestId(long testId) {
		_testId = testId;

		if (_testAttemptRemoteModel != null) {
			try {
				Class<?> clazz = _testAttemptRemoteModel.getClass();

				Method method = clazz.getMethod("setTestId", long.class);

				method.invoke(_testAttemptRemoteModel, testId);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public long getUserId() {
		return _userId;
	}

	@Override
	public void setUserId(long userId) {
		_userId = userId;

		if (_testAttemptRemoteModel != null) {
			try {
				Class<?> clazz = _testAttemptRemoteModel.getClass();

				Method method = clazz.getMethod("setUserId", long.class);

				method.invoke(_testAttemptRemoteModel, userId);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public String getUserUuid() throws SystemException {
		return PortalUtil.getUserValue(getUserId(), "uuid", _userUuid);
	}

	@Override
	public void setUserUuid(String userUuid) {
		_userUuid = userUuid;
	}

	@Override
	public Date getStartTime() {
		return _startTime;
	}

	@Override
	public void setStartTime(Date startTime) {
		_startTime = startTime;

		if (_testAttemptRemoteModel != null) {
			try {
				Class<?> clazz = _testAttemptRemoteModel.getClass();

				Method method = clazz.getMethod("setStartTime", Date.class);

				method.invoke(_testAttemptRemoteModel, startTime);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public Date getFinishTime() {
		return _finishTime;
	}

	@Override
	public void setFinishTime(Date finishTime) {
		_finishTime = finishTime;

		if (_testAttemptRemoteModel != null) {
			try {
				Class<?> clazz = _testAttemptRemoteModel.getClass();

				Method method = clazz.getMethod("setFinishTime", Date.class);

				method.invoke(_testAttemptRemoteModel, finishTime);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	@Override
	public double getResult() {
		return _result;
	}

	@Override
	public void setResult(double result) {
		_result = result;

		if (_testAttemptRemoteModel != null) {
			try {
				Class<?> clazz = _testAttemptRemoteModel.getClass();

				Method method = clazz.getMethod("setResult", double.class);

				method.invoke(_testAttemptRemoteModel, result);
			}
			catch (Exception e) {
				throw new UnsupportedOperationException(e);
			}
		}
	}

	public BaseModel<?> getTestAttemptRemoteModel() {
		return _testAttemptRemoteModel;
	}

	public void setTestAttemptRemoteModel(BaseModel<?> testAttemptRemoteModel) {
		_testAttemptRemoteModel = testAttemptRemoteModel;
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

		Class<?> remoteModelClass = _testAttemptRemoteModel.getClass();

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

		Object returnValue = method.invoke(_testAttemptRemoteModel,
				remoteParameterValues);

		if (returnValue != null) {
			returnValue = ClpSerializer.translateOutput(returnValue);
		}

		return returnValue;
	}

	@Override
	public void persist() throws SystemException {
		if (this.isNew()) {
			TestAttemptLocalServiceUtil.addTestAttempt(this);
		}
		else {
			TestAttemptLocalServiceUtil.updateTestAttempt(this);
		}
	}

	@Override
	public TestAttempt toEscapedModel() {
		return (TestAttempt)ProxyUtil.newProxyInstance(TestAttempt.class.getClassLoader(),
			new Class[] { TestAttempt.class }, new AutoEscapeBeanHandler(this));
	}

	@Override
	public Object clone() {
		TestAttemptClp clone = new TestAttemptClp();

		clone.setTestId(getTestId());
		clone.setUserId(getUserId());
		clone.setStartTime(getStartTime());
		clone.setFinishTime(getFinishTime());
		clone.setResult(getResult());

		return clone;
	}

	@Override
	public int compareTo(TestAttempt testAttempt) {
		long primaryKey = testAttempt.getPrimaryKey();

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

		if (!(obj instanceof TestAttemptClp)) {
			return false;
		}

		TestAttemptClp testAttempt = (TestAttemptClp)obj;

		long primaryKey = testAttempt.getPrimaryKey();

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
		StringBundler sb = new StringBundler(11);

		sb.append("{testId=");
		sb.append(getTestId());
		sb.append(", userId=");
		sb.append(getUserId());
		sb.append(", startTime=");
		sb.append(getStartTime());
		sb.append(", finishTime=");
		sb.append(getFinishTime());
		sb.append(", result=");
		sb.append(getResult());
		sb.append("}");

		return sb.toString();
	}

	@Override
	public String toXmlString() {
		StringBundler sb = new StringBundler(19);

		sb.append("<model><model-name>");
		sb.append("ru.tiis.srv.model.TestAttempt");
		sb.append("</model-name>");

		sb.append(
			"<column><column-name>testId</column-name><column-value><![CDATA[");
		sb.append(getTestId());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>userId</column-name><column-value><![CDATA[");
		sb.append(getUserId());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>startTime</column-name><column-value><![CDATA[");
		sb.append(getStartTime());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>finishTime</column-name><column-value><![CDATA[");
		sb.append(getFinishTime());
		sb.append("]]></column-value></column>");
		sb.append(
			"<column><column-name>result</column-name><column-value><![CDATA[");
		sb.append(getResult());
		sb.append("]]></column-value></column>");

		sb.append("</model>");

		return sb.toString();
	}

	private long _testId;
	private long _userId;
	private String _userUuid;
	private Date _startTime;
	private Date _finishTime;
	private double _result;
	private BaseModel<?> _testAttemptRemoteModel;
	private Class<?> _clpSerializerClass = ru.tiis.srv.service.ClpSerializer.class;
}