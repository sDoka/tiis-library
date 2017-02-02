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

package ru.tiis.srv.service.persistence;

import com.liferay.portal.service.persistence.BasePersistence;

import ru.tiis.srv.model.TestAttempt;

/**
 * The persistence interface for the test attempt service.
 *
 * <p>
 * Caching information and settings can be found in <code>portal.properties</code>
 * </p>
 *
 * @author Michael
 * @see TestAttemptPersistenceImpl
 * @see TestAttemptUtil
 * @generated
 */
public interface TestAttemptPersistence extends BasePersistence<TestAttempt> {
	/*
	 * NOTE FOR DEVELOPERS:
	 *
	 * Never modify or reference this interface directly. Always use {@link TestAttemptUtil} to access the test attempt persistence. Modify <code>service.xml</code> and rerun ServiceBuilder to regenerate this interface.
	 */

	/**
	* Caches the test attempt in the entity cache if it is enabled.
	*
	* @param testAttempt the test attempt
	*/
	public void cacheResult(ru.tiis.srv.model.TestAttempt testAttempt);

	/**
	* Caches the test attempts in the entity cache if it is enabled.
	*
	* @param testAttempts the test attempts
	*/
	public void cacheResult(
		java.util.List<ru.tiis.srv.model.TestAttempt> testAttempts);

	/**
	* Creates a new test attempt with the primary key. Does not add the test attempt to the database.
	*
	* @param testId the primary key for the new test attempt
	* @return the new test attempt
	*/
	public ru.tiis.srv.model.TestAttempt create(long testId);

	/**
	* Removes the test attempt with the primary key from the database. Also notifies the appropriate model listeners.
	*
	* @param testId the primary key of the test attempt
	* @return the test attempt that was removed
	* @throws ru.tiis.srv.NoSuchTestAttemptException if a test attempt with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public ru.tiis.srv.model.TestAttempt remove(long testId)
		throws com.liferay.portal.kernel.exception.SystemException,
			ru.tiis.srv.NoSuchTestAttemptException;

	public ru.tiis.srv.model.TestAttempt updateImpl(
		ru.tiis.srv.model.TestAttempt testAttempt)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the test attempt with the primary key or throws a {@link ru.tiis.srv.NoSuchTestAttemptException} if it could not be found.
	*
	* @param testId the primary key of the test attempt
	* @return the test attempt
	* @throws ru.tiis.srv.NoSuchTestAttemptException if a test attempt with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public ru.tiis.srv.model.TestAttempt findByPrimaryKey(long testId)
		throws com.liferay.portal.kernel.exception.SystemException,
			ru.tiis.srv.NoSuchTestAttemptException;

	/**
	* Returns the test attempt with the primary key or returns <code>null</code> if it could not be found.
	*
	* @param testId the primary key of the test attempt
	* @return the test attempt, or <code>null</code> if a test attempt with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	public ru.tiis.srv.model.TestAttempt fetchByPrimaryKey(long testId)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns all the test attempts.
	*
	* @return the test attempts
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<ru.tiis.srv.model.TestAttempt> findAll()
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns a range of all the test attempts.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link ru.tiis.srv.model.impl.TestAttemptModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param start the lower bound of the range of test attempts
	* @param end the upper bound of the range of test attempts (not inclusive)
	* @return the range of test attempts
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<ru.tiis.srv.model.TestAttempt> findAll(int start,
		int end) throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns an ordered range of all the test attempts.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link ru.tiis.srv.model.impl.TestAttemptModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param start the lower bound of the range of test attempts
	* @param end the upper bound of the range of test attempts (not inclusive)
	* @param orderByComparator the comparator to order the results by (optionally <code>null</code>)
	* @return the ordered range of test attempts
	* @throws SystemException if a system exception occurred
	*/
	public java.util.List<ru.tiis.srv.model.TestAttempt> findAll(int start,
		int end,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Removes all the test attempts from the database.
	*
	* @throws SystemException if a system exception occurred
	*/
	public void removeAll()
		throws com.liferay.portal.kernel.exception.SystemException;

	/**
	* Returns the number of test attempts.
	*
	* @return the number of test attempts
	* @throws SystemException if a system exception occurred
	*/
	public int countAll()
		throws com.liferay.portal.kernel.exception.SystemException;
}