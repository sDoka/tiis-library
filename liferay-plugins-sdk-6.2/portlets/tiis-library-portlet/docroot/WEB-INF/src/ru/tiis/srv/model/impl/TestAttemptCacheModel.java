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
import com.liferay.portal.model.CacheModel;

import ru.tiis.srv.model.TestAttempt;

import java.io.Externalizable;
import java.io.IOException;
import java.io.ObjectInput;
import java.io.ObjectOutput;

import java.util.Date;

/**
 * The cache model class for representing TestAttempt in entity cache.
 *
 * @author Michael
 * @see TestAttempt
 * @generated
 */
public class TestAttemptCacheModel implements CacheModel<TestAttempt>,
	Externalizable {
	@Override
	public String toString() {
		StringBundler sb = new StringBundler(11);

		sb.append("{testId=");
		sb.append(testId);
		sb.append(", userId=");
		sb.append(userId);
		sb.append(", startTime=");
		sb.append(startTime);
		sb.append(", finishTime=");
		sb.append(finishTime);
		sb.append(", result=");
		sb.append(result);
		sb.append("}");

		return sb.toString();
	}

	@Override
	public TestAttempt toEntityModel() {
		TestAttemptImpl testAttemptImpl = new TestAttemptImpl();

		testAttemptImpl.setTestId(testId);
		testAttemptImpl.setUserId(userId);

		if (startTime == Long.MIN_VALUE) {
			testAttemptImpl.setStartTime(null);
		}
		else {
			testAttemptImpl.setStartTime(new Date(startTime));
		}

		if (finishTime == Long.MIN_VALUE) {
			testAttemptImpl.setFinishTime(null);
		}
		else {
			testAttemptImpl.setFinishTime(new Date(finishTime));
		}

		testAttemptImpl.setResult(result);

		testAttemptImpl.resetOriginalValues();

		return testAttemptImpl;
	}

	@Override
	public void readExternal(ObjectInput objectInput) throws IOException {
		testId = objectInput.readLong();
		userId = objectInput.readLong();
		startTime = objectInput.readLong();
		finishTime = objectInput.readLong();
		result = objectInput.readDouble();
	}

	@Override
	public void writeExternal(ObjectOutput objectOutput)
		throws IOException {
		objectOutput.writeLong(testId);
		objectOutput.writeLong(userId);
		objectOutput.writeLong(startTime);
		objectOutput.writeLong(finishTime);
		objectOutput.writeDouble(result);
	}

	public long testId;
	public long userId;
	public long startTime;
	public long finishTime;
	public double result;
}