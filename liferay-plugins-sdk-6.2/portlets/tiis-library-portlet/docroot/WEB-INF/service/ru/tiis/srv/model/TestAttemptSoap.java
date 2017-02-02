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

import java.io.Serializable;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * This class is used by SOAP remote services.
 *
 * @author Michael
 * @generated
 */
public class TestAttemptSoap implements Serializable {
	public static TestAttemptSoap toSoapModel(TestAttempt model) {
		TestAttemptSoap soapModel = new TestAttemptSoap();

		soapModel.setTestId(model.getTestId());
		soapModel.setUserId(model.getUserId());
		soapModel.setStartTime(model.getStartTime());
		soapModel.setFinishTime(model.getFinishTime());
		soapModel.setResult(model.getResult());

		return soapModel;
	}

	public static TestAttemptSoap[] toSoapModels(TestAttempt[] models) {
		TestAttemptSoap[] soapModels = new TestAttemptSoap[models.length];

		for (int i = 0; i < models.length; i++) {
			soapModels[i] = toSoapModel(models[i]);
		}

		return soapModels;
	}

	public static TestAttemptSoap[][] toSoapModels(TestAttempt[][] models) {
		TestAttemptSoap[][] soapModels = null;

		if (models.length > 0) {
			soapModels = new TestAttemptSoap[models.length][models[0].length];
		}
		else {
			soapModels = new TestAttemptSoap[0][0];
		}

		for (int i = 0; i < models.length; i++) {
			soapModels[i] = toSoapModels(models[i]);
		}

		return soapModels;
	}

	public static TestAttemptSoap[] toSoapModels(List<TestAttempt> models) {
		List<TestAttemptSoap> soapModels = new ArrayList<TestAttemptSoap>(models.size());

		for (TestAttempt model : models) {
			soapModels.add(toSoapModel(model));
		}

		return soapModels.toArray(new TestAttemptSoap[soapModels.size()]);
	}

	public TestAttemptSoap() {
	}

	public long getPrimaryKey() {
		return _testId;
	}

	public void setPrimaryKey(long pk) {
		setTestId(pk);
	}

	public long getTestId() {
		return _testId;
	}

	public void setTestId(long testId) {
		_testId = testId;
	}

	public long getUserId() {
		return _userId;
	}

	public void setUserId(long userId) {
		_userId = userId;
	}

	public Date getStartTime() {
		return _startTime;
	}

	public void setStartTime(Date startTime) {
		_startTime = startTime;
	}

	public Date getFinishTime() {
		return _finishTime;
	}

	public void setFinishTime(Date finishTime) {
		_finishTime = finishTime;
	}

	public double getResult() {
		return _result;
	}

	public void setResult(double result) {
		_result = result;
	}

	private long _testId;
	private long _userId;
	private Date _startTime;
	private Date _finishTime;
	private double _result;
}