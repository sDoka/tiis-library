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

package ru.tiis.srv.service;

import com.liferay.portal.service.ServiceWrapper;

/**
 * Provides a wrapper for {@link TestAttemptLocalService}.
 *
 * @author Michael
 * @see TestAttemptLocalService
 * @generated
 */
public class TestAttemptLocalServiceWrapper implements TestAttemptLocalService,
	ServiceWrapper<TestAttemptLocalService> {
	public TestAttemptLocalServiceWrapper(
		TestAttemptLocalService testAttemptLocalService) {
		_testAttemptLocalService = testAttemptLocalService;
	}

	/**
	* Adds the test attempt to the database. Also notifies the appropriate model listeners.
	*
	* @param testAttempt the test attempt
	* @return the test attempt that was added
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public ru.tiis.srv.model.TestAttempt addTestAttempt(
		ru.tiis.srv.model.TestAttempt testAttempt)
		throws com.liferay.portal.kernel.exception.SystemException {
		return _testAttemptLocalService.addTestAttempt(testAttempt);
	}

	/**
	* Creates a new test attempt with the primary key. Does not add the test attempt to the database.
	*
	* @param testId the primary key for the new test attempt
	* @return the new test attempt
	*/
	@Override
	public ru.tiis.srv.model.TestAttempt createTestAttempt(long testId) {
		return _testAttemptLocalService.createTestAttempt(testId);
	}

	/**
	* Deletes the test attempt with the primary key from the database. Also notifies the appropriate model listeners.
	*
	* @param testId the primary key of the test attempt
	* @return the test attempt that was removed
	* @throws PortalException if a test attempt with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public ru.tiis.srv.model.TestAttempt deleteTestAttempt(long testId)
		throws com.liferay.portal.kernel.exception.PortalException,
			com.liferay.portal.kernel.exception.SystemException {
		return _testAttemptLocalService.deleteTestAttempt(testId);
	}

	/**
	* Deletes the test attempt from the database. Also notifies the appropriate model listeners.
	*
	* @param testAttempt the test attempt
	* @return the test attempt that was removed
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public ru.tiis.srv.model.TestAttempt deleteTestAttempt(
		ru.tiis.srv.model.TestAttempt testAttempt)
		throws com.liferay.portal.kernel.exception.SystemException {
		return _testAttemptLocalService.deleteTestAttempt(testAttempt);
	}

	@Override
	public com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery() {
		return _testAttemptLocalService.dynamicQuery();
	}

	/**
	* Performs a dynamic query on the database and returns the matching rows.
	*
	* @param dynamicQuery the dynamic query
	* @return the matching rows
	* @throws SystemException if a system exception occurred
	*/
	@Override
	@SuppressWarnings("rawtypes")
	public java.util.List dynamicQuery(
		com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery)
		throws com.liferay.portal.kernel.exception.SystemException {
		return _testAttemptLocalService.dynamicQuery(dynamicQuery);
	}

	/**
	* Performs a dynamic query on the database and returns a range of the matching rows.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link ru.tiis.srv.model.impl.TestAttemptModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param dynamicQuery the dynamic query
	* @param start the lower bound of the range of model instances
	* @param end the upper bound of the range of model instances (not inclusive)
	* @return the range of matching rows
	* @throws SystemException if a system exception occurred
	*/
	@Override
	@SuppressWarnings("rawtypes")
	public java.util.List dynamicQuery(
		com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery, int start,
		int end) throws com.liferay.portal.kernel.exception.SystemException {
		return _testAttemptLocalService.dynamicQuery(dynamicQuery, start, end);
	}

	/**
	* Performs a dynamic query on the database and returns an ordered range of the matching rows.
	*
	* <p>
	* Useful when paginating results. Returns a maximum of <code>end - start</code> instances. <code>start</code> and <code>end</code> are not primary keys, they are indexes in the result set. Thus, <code>0</code> refers to the first result in the set. Setting both <code>start</code> and <code>end</code> to {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS} will return the full result set. If <code>orderByComparator</code> is specified, then the query will include the given ORDER BY logic. If <code>orderByComparator</code> is absent and pagination is required (<code>start</code> and <code>end</code> are not {@link com.liferay.portal.kernel.dao.orm.QueryUtil#ALL_POS}), then the query will include the default ORDER BY logic from {@link ru.tiis.srv.model.impl.TestAttemptModelImpl}. If both <code>orderByComparator</code> and pagination are absent, for performance reasons, the query will not have an ORDER BY clause and the returned result set will be sorted on by the primary key in an ascending order.
	* </p>
	*
	* @param dynamicQuery the dynamic query
	* @param start the lower bound of the range of model instances
	* @param end the upper bound of the range of model instances (not inclusive)
	* @param orderByComparator the comparator to order the results by (optionally <code>null</code>)
	* @return the ordered range of matching rows
	* @throws SystemException if a system exception occurred
	*/
	@Override
	@SuppressWarnings("rawtypes")
	public java.util.List dynamicQuery(
		com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery, int start,
		int end,
		com.liferay.portal.kernel.util.OrderByComparator orderByComparator)
		throws com.liferay.portal.kernel.exception.SystemException {
		return _testAttemptLocalService.dynamicQuery(dynamicQuery, start, end,
			orderByComparator);
	}

	/**
	* Returns the number of rows that match the dynamic query.
	*
	* @param dynamicQuery the dynamic query
	* @return the number of rows that match the dynamic query
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public long dynamicQueryCount(
		com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery)
		throws com.liferay.portal.kernel.exception.SystemException {
		return _testAttemptLocalService.dynamicQueryCount(dynamicQuery);
	}

	/**
	* Returns the number of rows that match the dynamic query.
	*
	* @param dynamicQuery the dynamic query
	* @param projection the projection to apply to the query
	* @return the number of rows that match the dynamic query
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public long dynamicQueryCount(
		com.liferay.portal.kernel.dao.orm.DynamicQuery dynamicQuery,
		com.liferay.portal.kernel.dao.orm.Projection projection)
		throws com.liferay.portal.kernel.exception.SystemException {
		return _testAttemptLocalService.dynamicQueryCount(dynamicQuery,
			projection);
	}

	@Override
	public ru.tiis.srv.model.TestAttempt fetchTestAttempt(long testId)
		throws com.liferay.portal.kernel.exception.SystemException {
		return _testAttemptLocalService.fetchTestAttempt(testId);
	}

	/**
	* Returns the test attempt with the primary key.
	*
	* @param testId the primary key of the test attempt
	* @return the test attempt
	* @throws PortalException if a test attempt with the primary key could not be found
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public ru.tiis.srv.model.TestAttempt getTestAttempt(long testId)
		throws com.liferay.portal.kernel.exception.PortalException,
			com.liferay.portal.kernel.exception.SystemException {
		return _testAttemptLocalService.getTestAttempt(testId);
	}

	@Override
	public com.liferay.portal.model.PersistedModel getPersistedModel(
		java.io.Serializable primaryKeyObj)
		throws com.liferay.portal.kernel.exception.PortalException,
			com.liferay.portal.kernel.exception.SystemException {
		return _testAttemptLocalService.getPersistedModel(primaryKeyObj);
	}

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
	@Override
	public java.util.List<ru.tiis.srv.model.TestAttempt> getTestAttempts(
		int start, int end)
		throws com.liferay.portal.kernel.exception.SystemException {
		return _testAttemptLocalService.getTestAttempts(start, end);
	}

	/**
	* Returns the number of test attempts.
	*
	* @return the number of test attempts
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public int getTestAttemptsCount()
		throws com.liferay.portal.kernel.exception.SystemException {
		return _testAttemptLocalService.getTestAttemptsCount();
	}

	/**
	* Updates the test attempt in the database or adds it if it does not yet exist. Also notifies the appropriate model listeners.
	*
	* @param testAttempt the test attempt
	* @return the test attempt that was updated
	* @throws SystemException if a system exception occurred
	*/
	@Override
	public ru.tiis.srv.model.TestAttempt updateTestAttempt(
		ru.tiis.srv.model.TestAttempt testAttempt)
		throws com.liferay.portal.kernel.exception.SystemException {
		return _testAttemptLocalService.updateTestAttempt(testAttempt);
	}

	/**
	* Returns the Spring bean ID for this bean.
	*
	* @return the Spring bean ID for this bean
	*/
	@Override
	public java.lang.String getBeanIdentifier() {
		return _testAttemptLocalService.getBeanIdentifier();
	}

	/**
	* Sets the Spring bean ID for this bean.
	*
	* @param beanIdentifier the Spring bean ID for this bean
	*/
	@Override
	public void setBeanIdentifier(java.lang.String beanIdentifier) {
		_testAttemptLocalService.setBeanIdentifier(beanIdentifier);
	}

	@Override
	public java.lang.Object invokeMethod(java.lang.String name,
		java.lang.String[] parameterTypes, java.lang.Object[] arguments)
		throws java.lang.Throwable {
		return _testAttemptLocalService.invokeMethod(name, parameterTypes,
			arguments);
	}

	/**
	 * @deprecated As of 6.1.0, replaced by {@link #getWrappedService}
	 */
	public TestAttemptLocalService getWrappedTestAttemptLocalService() {
		return _testAttemptLocalService;
	}

	/**
	 * @deprecated As of 6.1.0, replaced by {@link #setWrappedService}
	 */
	public void setWrappedTestAttemptLocalService(
		TestAttemptLocalService testAttemptLocalService) {
		_testAttemptLocalService = testAttemptLocalService;
	}

	@Override
	public TestAttemptLocalService getWrappedService() {
		return _testAttemptLocalService;
	}

	@Override
	public void setWrappedService(
		TestAttemptLocalService testAttemptLocalService) {
		_testAttemptLocalService = testAttemptLocalService;
	}

	private TestAttemptLocalService _testAttemptLocalService;
}