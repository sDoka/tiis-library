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
 * This class is a wrapper for {@link TestAttempt}.
 * </p>
 *
 * @author Michael
 * @see TestAttempt
 * @generated
 */
public class TestAttemptWrapper implements TestAttempt,
	ModelWrapper<TestAttempt> {
	public TestAttemptWrapper(TestAttempt testAttempt) {
		_testAttempt = testAttempt;
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

	/**
	* Returns the primary key of this test attempt.
	*
	* @return the primary key of this test attempt
	*/
	@Override
	public long getPrimaryKey() {
		return _testAttempt.getPrimaryKey();
	}

	/**
	* Sets the primary key of this test attempt.
	*
	* @param primaryKey the primary key of this test attempt
	*/
	@Override
	public void setPrimaryKey(long primaryKey) {
		_testAttempt.setPrimaryKey(primaryKey);
	}

	/**
	* Returns the test ID of this test attempt.
	*
	* @return the test ID of this test attempt
	*/
	@Override
	public long getTestId() {
		return _testAttempt.getTestId();
	}

	/**
	* Sets the test ID of this test attempt.
	*
	* @param testId the test ID of this test attempt
	*/
	@Override
	public void setTestId(long testId) {
		_testAttempt.setTestId(testId);
	}

	/**
	* Returns the user ID of this test attempt.
	*
	* @return the user ID of this test attempt
	*/
	@Override
	public long getUserId() {
		return _testAttempt.getUserId();
	}

	/**
	* Sets the user ID of this test attempt.
	*
	* @param userId the user ID of this test attempt
	*/
	@Override
	public void setUserId(long userId) {
		_testAttempt.setUserId(userId);
	}

	/**
	* Returns the user uuid of this test attempt.
	*
	* @return the user uuid of this test attempt
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public java.lang.String getUserUuid()
		throws com.liferay.portal.kernel.exception.SystemException {
		return _testAttempt.getUserUuid();
	}

	/**
	* Sets the user uuid of this test attempt.
	*
	* @param userUuid the user uuid of this test attempt
	*/
	@Override
	public void setUserUuid(java.lang.String userUuid) {
		_testAttempt.setUserUuid(userUuid);
	}

	/**
	* Returns the start time of this test attempt.
	*
	* @return the start time of this test attempt
	*/
	@Override
	public java.util.Date getStartTime() {
		return _testAttempt.getStartTime();
	}

	/**
	* Sets the start time of this test attempt.
	*
	* @param startTime the start time of this test attempt
	*/
	@Override
	public void setStartTime(java.util.Date startTime) {
		_testAttempt.setStartTime(startTime);
	}

	/**
	* Returns the finish time of this test attempt.
	*
	* @return the finish time of this test attempt
	*/
	@Override
	public java.util.Date getFinishTime() {
		return _testAttempt.getFinishTime();
	}

	/**
	* Sets the finish time of this test attempt.
	*
	* @param finishTime the finish time of this test attempt
	*/
	@Override
	public void setFinishTime(java.util.Date finishTime) {
		_testAttempt.setFinishTime(finishTime);
	}

	/**
	* Returns the result of this test attempt.
	*
	* @return the result of this test attempt
	*/
	@Override
	public double getResult() {
		return _testAttempt.getResult();
	}

	/**
	* Sets the result of this test attempt.
	*
	* @param result the result of this test attempt
	*/
	@Override
	public void setResult(double result) {
		_testAttempt.setResult(result);
	}

	@Override
	public boolean isNew() {
		return _testAttempt.isNew();
	}

	@Override
	public void setNew(boolean n) {
		_testAttempt.setNew(n);
	}

	@Override
	public boolean isCachedModel() {
		return _testAttempt.isCachedModel();
	}

	@Override
	public void setCachedModel(boolean cachedModel) {
		_testAttempt.setCachedModel(cachedModel);
	}

	@Override
	public boolean isEscapedModel() {
		return _testAttempt.isEscapedModel();
	}

	@Override
	public java.io.Serializable getPrimaryKeyObj() {
		return _testAttempt.getPrimaryKeyObj();
	}

	@Override
	public void setPrimaryKeyObj(java.io.Serializable primaryKeyObj) {
		_testAttempt.setPrimaryKeyObj(primaryKeyObj);
	}

	@Override
	public com.liferay.portlet.expando.model.ExpandoBridge getExpandoBridge() {
		return _testAttempt.getExpandoBridge();
	}

	@Override
	public void setExpandoBridgeAttributes(
		com.liferay.portal.model.BaseModel<?> baseModel) {
		_testAttempt.setExpandoBridgeAttributes(baseModel);
	}

	@Override
	public void setExpandoBridgeAttributes(
		com.liferay.portlet.expando.model.ExpandoBridge expandoBridge) {
		_testAttempt.setExpandoBridgeAttributes(expandoBridge);
	}

	@Override
	public void setExpandoBridgeAttributes(
		com.liferay.portal.service.ServiceContext serviceContext) {
		_testAttempt.setExpandoBridgeAttributes(serviceContext);
	}

	@Override
	public java.lang.Object clone() {
		return new TestAttemptWrapper((TestAttempt)_testAttempt.clone());
	}

	@Override
	public int compareTo(ru.tiis.srv.model.TestAttempt testAttempt) {
		return _testAttempt.compareTo(testAttempt);
	}

	@Override
	public int hashCode() {
		return _testAttempt.hashCode();
	}

	@Override
	public com.liferay.portal.model.CacheModel<ru.tiis.srv.model.TestAttempt> toCacheModel() {
		return _testAttempt.toCacheModel();
	}

	@Override
	public ru.tiis.srv.model.TestAttempt toEscapedModel() {
		return new TestAttemptWrapper(_testAttempt.toEscapedModel());
	}

	@Override
	public ru.tiis.srv.model.TestAttempt toUnescapedModel() {
		return new TestAttemptWrapper(_testAttempt.toUnescapedModel());
	}

	@Override
	public java.lang.String toString() {
		return _testAttempt.toString();
	}

	@Override
	public java.lang.String toXmlString() {
		return _testAttempt.toXmlString();
	}

	@Override
	public void persist()
		throws com.liferay.portal.kernel.exception.SystemException {
		_testAttempt.persist();
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj) {
			return true;
		}

		if (!(obj instanceof TestAttemptWrapper)) {
			return false;
		}

		TestAttemptWrapper testAttemptWrapper = (TestAttemptWrapper)obj;

		if (Validator.equals(_testAttempt, testAttemptWrapper._testAttempt)) {
			return true;
		}

		return false;
	}

	/**
	 * @deprecated As of 6.1.0, replaced by {@link #getWrappedModel}
	 */
	public TestAttempt getWrappedTestAttempt() {
		return _testAttempt;
	}

	@Override
	public TestAttempt getWrappedModel() {
		return _testAttempt;
	}

	@Override
	public void resetOriginalValues() {
		_testAttempt.resetOriginalValues();
	}

	private TestAttempt _testAttempt;
}