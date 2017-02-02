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

import com.liferay.portal.kernel.cache.CacheRegistryUtil;
import com.liferay.portal.kernel.dao.orm.EntityCacheUtil;
import com.liferay.portal.kernel.dao.orm.FinderCacheUtil;
import com.liferay.portal.kernel.dao.orm.FinderPath;
import com.liferay.portal.kernel.dao.orm.Query;
import com.liferay.portal.kernel.dao.orm.QueryUtil;
import com.liferay.portal.kernel.dao.orm.Session;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.util.InstanceFactory;
import com.liferay.portal.kernel.util.OrderByComparator;
import com.liferay.portal.kernel.util.PropsKeys;
import com.liferay.portal.kernel.util.PropsUtil;
import com.liferay.portal.kernel.util.StringBundler;
import com.liferay.portal.kernel.util.StringUtil;
import com.liferay.portal.kernel.util.UnmodifiableList;
import com.liferay.portal.model.CacheModel;
import com.liferay.portal.model.ModelListener;
import com.liferay.portal.service.persistence.impl.BasePersistenceImpl;

import ru.tiis.srv.NoSuchTestAttemptException;
import ru.tiis.srv.model.TestAttempt;
import ru.tiis.srv.model.impl.TestAttemptImpl;
import ru.tiis.srv.model.impl.TestAttemptModelImpl;

import java.io.Serializable;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * The persistence implementation for the test attempt service.
 *
 * <p>
 * Caching information and settings can be found in <code>portal.properties</code>
 * </p>
 *
 * @author Michael
 * @see TestAttemptPersistence
 * @see TestAttemptUtil
 * @generated
 */
public class TestAttemptPersistenceImpl extends BasePersistenceImpl<TestAttempt>
	implements TestAttemptPersistence {
	/*
	 * NOTE FOR DEVELOPERS:
	 *
	 * Never modify or reference this class directly. Always use {@link TestAttemptUtil} to access the test attempt persistence. Modify <code>service.xml</code> and rerun ServiceBuilder to regenerate this class.
	 */
	public static final String FINDER_CLASS_NAME_ENTITY = TestAttemptImpl.class.getName();
	public static final String FINDER_CLASS_NAME_LIST_WITH_PAGINATION = FINDER_CLASS_NAME_ENTITY +
		".List1";
	public static final String FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION = FINDER_CLASS_NAME_ENTITY +
		".List2";
	public static final FinderPath FINDER_PATH_WITH_PAGINATION_FIND_ALL = new FinderPath(TestAttemptModelImpl.ENTITY_CACHE_ENABLED,
			TestAttemptModelImpl.FINDER_CACHE_ENABLED, TestAttemptImpl.class,
			FINDER_CLASS_NAME_LIST_WITH_PAGINATION, "findAll", new String[0]);
	public static final FinderPath FINDER_PATH_WITHOUT_PAGINATION_FIND_ALL = new FinderPath(TestAttemptModelImpl.ENTITY_CACHE_ENABLED,
			TestAttemptModelImpl.FINDER_CACHE_ENABLED, TestAttemptImpl.class,
			FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION, "findAll", new String[0]);
	public static final FinderPath FINDER_PATH_COUNT_ALL = new FinderPath(TestAttemptModelImpl.ENTITY_CACHE_ENABLED,
			TestAttemptModelImpl.FINDER_CACHE_ENABLED, Long.class,
			FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION, "countAll", new String[0]);

	public TestAttemptPersistenceImpl() {
		setModelClass(TestAttempt.class);
	}

	/**
	 * Caches the test attempt in the entity cache if it is enabled.
	 *
	 * @param testAttempt the test attempt
	 */
	@Override
	public void cacheResult(TestAttempt testAttempt) {
		EntityCacheUtil.putResult(TestAttemptModelImpl.ENTITY_CACHE_ENABLED,
			TestAttemptImpl.class, testAttempt.getPrimaryKey(), testAttempt);

		testAttempt.resetOriginalValues();
	}

	/**
	 * Caches the test attempts in the entity cache if it is enabled.
	 *
	 * @param testAttempts the test attempts
	 */
	@Override
	public void cacheResult(List<TestAttempt> testAttempts) {
		for (TestAttempt testAttempt : testAttempts) {
			if (EntityCacheUtil.getResult(
						TestAttemptModelImpl.ENTITY_CACHE_ENABLED,
						TestAttemptImpl.class, testAttempt.getPrimaryKey()) == null) {
				cacheResult(testAttempt);
			}
			else {
				testAttempt.resetOriginalValues();
			}
		}
	}

	/**
	 * Clears the cache for all test attempts.
	 *
	 * <p>
	 * The {@link com.liferay.portal.kernel.dao.orm.EntityCache} and {@link com.liferay.portal.kernel.dao.orm.FinderCache} are both cleared by this method.
	 * </p>
	 */
	@Override
	public void clearCache() {
		if (_HIBERNATE_CACHE_USE_SECOND_LEVEL_CACHE) {
			CacheRegistryUtil.clear(TestAttemptImpl.class.getName());
		}

		EntityCacheUtil.clearCache(TestAttemptImpl.class.getName());

		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_ENTITY);
		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITH_PAGINATION);
		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION);
	}

	/**
	 * Clears the cache for the test attempt.
	 *
	 * <p>
	 * The {@link com.liferay.portal.kernel.dao.orm.EntityCache} and {@link com.liferay.portal.kernel.dao.orm.FinderCache} are both cleared by this method.
	 * </p>
	 */
	@Override
	public void clearCache(TestAttempt testAttempt) {
		EntityCacheUtil.removeResult(TestAttemptModelImpl.ENTITY_CACHE_ENABLED,
			TestAttemptImpl.class, testAttempt.getPrimaryKey());

		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITH_PAGINATION);
		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION);
	}

	@Override
	public void clearCache(List<TestAttempt> testAttempts) {
		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITH_PAGINATION);
		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION);

		for (TestAttempt testAttempt : testAttempts) {
			EntityCacheUtil.removeResult(TestAttemptModelImpl.ENTITY_CACHE_ENABLED,
				TestAttemptImpl.class, testAttempt.getPrimaryKey());
		}
	}

	/**
	 * Creates a new test attempt with the primary key. Does not add the test attempt to the database.
	 *
	 * @param testId the primary key for the new test attempt
	 * @return the new test attempt
	 */
	@Override
	public TestAttempt create(long testId) {
		TestAttempt testAttempt = new TestAttemptImpl();

		testAttempt.setNew(true);
		testAttempt.setPrimaryKey(testId);

		return testAttempt;
	}

	/**
	 * Removes the test attempt with the primary key from the database. Also notifies the appropriate model listeners.
	 *
	 * @param testId the primary key of the test attempt
	 * @return the test attempt that was removed
	 * @throws ru.tiis.srv.NoSuchTestAttemptException if a test attempt with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public TestAttempt remove(long testId)
		throws NoSuchTestAttemptException, SystemException {
		return remove((Serializable)testId);
	}

	/**
	 * Removes the test attempt with the primary key from the database. Also notifies the appropriate model listeners.
	 *
	 * @param primaryKey the primary key of the test attempt
	 * @return the test attempt that was removed
	 * @throws ru.tiis.srv.NoSuchTestAttemptException if a test attempt with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public TestAttempt remove(Serializable primaryKey)
		throws NoSuchTestAttemptException, SystemException {
		Session session = null;

		try {
			session = openSession();

			TestAttempt testAttempt = (TestAttempt)session.get(TestAttemptImpl.class,
					primaryKey);

			if (testAttempt == null) {
				if (_log.isWarnEnabled()) {
					_log.warn(_NO_SUCH_ENTITY_WITH_PRIMARY_KEY + primaryKey);
				}

				throw new NoSuchTestAttemptException(_NO_SUCH_ENTITY_WITH_PRIMARY_KEY +
					primaryKey);
			}

			return remove(testAttempt);
		}
		catch (NoSuchTestAttemptException nsee) {
			throw nsee;
		}
		catch (Exception e) {
			throw processException(e);
		}
		finally {
			closeSession(session);
		}
	}

	@Override
	protected TestAttempt removeImpl(TestAttempt testAttempt)
		throws SystemException {
		testAttempt = toUnwrappedModel(testAttempt);

		Session session = null;

		try {
			session = openSession();

			if (!session.contains(testAttempt)) {
				testAttempt = (TestAttempt)session.get(TestAttemptImpl.class,
						testAttempt.getPrimaryKeyObj());
			}

			if (testAttempt != null) {
				session.delete(testAttempt);
			}
		}
		catch (Exception e) {
			throw processException(e);
		}
		finally {
			closeSession(session);
		}

		if (testAttempt != null) {
			clearCache(testAttempt);
		}

		return testAttempt;
	}

	@Override
	public TestAttempt updateImpl(ru.tiis.srv.model.TestAttempt testAttempt)
		throws SystemException {
		testAttempt = toUnwrappedModel(testAttempt);

		boolean isNew = testAttempt.isNew();

		Session session = null;

		try {
			session = openSession();

			if (testAttempt.isNew()) {
				session.save(testAttempt);

				testAttempt.setNew(false);
			}
			else {
				session.merge(testAttempt);
			}
		}
		catch (Exception e) {
			throw processException(e);
		}
		finally {
			closeSession(session);
		}

		FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITH_PAGINATION);

		if (isNew) {
			FinderCacheUtil.clearCache(FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION);
		}

		EntityCacheUtil.putResult(TestAttemptModelImpl.ENTITY_CACHE_ENABLED,
			TestAttemptImpl.class, testAttempt.getPrimaryKey(), testAttempt);

		return testAttempt;
	}

	protected TestAttempt toUnwrappedModel(TestAttempt testAttempt) {
		if (testAttempt instanceof TestAttemptImpl) {
			return testAttempt;
		}

		TestAttemptImpl testAttemptImpl = new TestAttemptImpl();

		testAttemptImpl.setNew(testAttempt.isNew());
		testAttemptImpl.setPrimaryKey(testAttempt.getPrimaryKey());

		testAttemptImpl.setTestId(testAttempt.getTestId());
		testAttemptImpl.setUserId(testAttempt.getUserId());
		testAttemptImpl.setStartTime(testAttempt.getStartTime());
		testAttemptImpl.setFinishTime(testAttempt.getFinishTime());
		testAttemptImpl.setResult(testAttempt.getResult());

		return testAttemptImpl;
	}

	/**
	 * Returns the test attempt with the primary key or throws a {@link com.liferay.portal.NoSuchModelException} if it could not be found.
	 *
	 * @param primaryKey the primary key of the test attempt
	 * @return the test attempt
	 * @throws ru.tiis.srv.NoSuchTestAttemptException if a test attempt with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public TestAttempt findByPrimaryKey(Serializable primaryKey)
		throws NoSuchTestAttemptException, SystemException {
		TestAttempt testAttempt = fetchByPrimaryKey(primaryKey);

		if (testAttempt == null) {
			if (_log.isWarnEnabled()) {
				_log.warn(_NO_SUCH_ENTITY_WITH_PRIMARY_KEY + primaryKey);
			}

			throw new NoSuchTestAttemptException(_NO_SUCH_ENTITY_WITH_PRIMARY_KEY +
				primaryKey);
		}

		return testAttempt;
	}

	/**
	 * Returns the test attempt with the primary key or throws a {@link ru.tiis.srv.NoSuchTestAttemptException} if it could not be found.
	 *
	 * @param testId the primary key of the test attempt
	 * @return the test attempt
	 * @throws ru.tiis.srv.NoSuchTestAttemptException if a test attempt with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public TestAttempt findByPrimaryKey(long testId)
		throws NoSuchTestAttemptException, SystemException {
		return findByPrimaryKey((Serializable)testId);
	}

	/**
	 * Returns the test attempt with the primary key or returns <code>null</code> if it could not be found.
	 *
	 * @param primaryKey the primary key of the test attempt
	 * @return the test attempt, or <code>null</code> if a test attempt with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public TestAttempt fetchByPrimaryKey(Serializable primaryKey)
		throws SystemException {
		TestAttempt testAttempt = (TestAttempt)EntityCacheUtil.getResult(TestAttemptModelImpl.ENTITY_CACHE_ENABLED,
				TestAttemptImpl.class, primaryKey);

		if (testAttempt == _nullTestAttempt) {
			return null;
		}

		if (testAttempt == null) {
			Session session = null;

			try {
				session = openSession();

				testAttempt = (TestAttempt)session.get(TestAttemptImpl.class,
						primaryKey);

				if (testAttempt != null) {
					cacheResult(testAttempt);
				}
				else {
					EntityCacheUtil.putResult(TestAttemptModelImpl.ENTITY_CACHE_ENABLED,
						TestAttemptImpl.class, primaryKey, _nullTestAttempt);
				}
			}
			catch (Exception e) {
				EntityCacheUtil.removeResult(TestAttemptModelImpl.ENTITY_CACHE_ENABLED,
					TestAttemptImpl.class, primaryKey);

				throw processException(e);
			}
			finally {
				closeSession(session);
			}
		}

		return testAttempt;
	}

	/**
	 * Returns the test attempt with the primary key or returns <code>null</code> if it could not be found.
	 *
	 * @param testId the primary key of the test attempt
	 * @return the test attempt, or <code>null</code> if a test attempt with the primary key could not be found
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public TestAttempt fetchByPrimaryKey(long testId) throws SystemException {
		return fetchByPrimaryKey((Serializable)testId);
	}

	/**
	 * Returns all the test attempts.
	 *
	 * @return the test attempts
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public List<TestAttempt> findAll() throws SystemException {
		return findAll(QueryUtil.ALL_POS, QueryUtil.ALL_POS, null);
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
	public List<TestAttempt> findAll(int start, int end)
		throws SystemException {
		return findAll(start, end, null);
	}

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
	@Override
	public List<TestAttempt> findAll(int start, int end,
		OrderByComparator orderByComparator) throws SystemException {
		boolean pagination = true;
		FinderPath finderPath = null;
		Object[] finderArgs = null;

		if ((start == QueryUtil.ALL_POS) && (end == QueryUtil.ALL_POS) &&
				(orderByComparator == null)) {
			pagination = false;
			finderPath = FINDER_PATH_WITHOUT_PAGINATION_FIND_ALL;
			finderArgs = FINDER_ARGS_EMPTY;
		}
		else {
			finderPath = FINDER_PATH_WITH_PAGINATION_FIND_ALL;
			finderArgs = new Object[] { start, end, orderByComparator };
		}

		List<TestAttempt> list = (List<TestAttempt>)FinderCacheUtil.getResult(finderPath,
				finderArgs, this);

		if (list == null) {
			StringBundler query = null;
			String sql = null;

			if (orderByComparator != null) {
				query = new StringBundler(2 +
						(orderByComparator.getOrderByFields().length * 3));

				query.append(_SQL_SELECT_TESTATTEMPT);

				appendOrderByComparator(query, _ORDER_BY_ENTITY_ALIAS,
					orderByComparator);

				sql = query.toString();
			}
			else {
				sql = _SQL_SELECT_TESTATTEMPT;

				if (pagination) {
					sql = sql.concat(TestAttemptModelImpl.ORDER_BY_JPQL);
				}
			}

			Session session = null;

			try {
				session = openSession();

				Query q = session.createQuery(sql);

				if (!pagination) {
					list = (List<TestAttempt>)QueryUtil.list(q, getDialect(),
							start, end, false);

					Collections.sort(list);

					list = new UnmodifiableList<TestAttempt>(list);
				}
				else {
					list = (List<TestAttempt>)QueryUtil.list(q, getDialect(),
							start, end);
				}

				cacheResult(list);

				FinderCacheUtil.putResult(finderPath, finderArgs, list);
			}
			catch (Exception e) {
				FinderCacheUtil.removeResult(finderPath, finderArgs);

				throw processException(e);
			}
			finally {
				closeSession(session);
			}
		}

		return list;
	}

	/**
	 * Removes all the test attempts from the database.
	 *
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public void removeAll() throws SystemException {
		for (TestAttempt testAttempt : findAll()) {
			remove(testAttempt);
		}
	}

	/**
	 * Returns the number of test attempts.
	 *
	 * @return the number of test attempts
	 * @throws SystemException if a system exception occurred
	 */
	@Override
	public int countAll() throws SystemException {
		Long count = (Long)FinderCacheUtil.getResult(FINDER_PATH_COUNT_ALL,
				FINDER_ARGS_EMPTY, this);

		if (count == null) {
			Session session = null;

			try {
				session = openSession();

				Query q = session.createQuery(_SQL_COUNT_TESTATTEMPT);

				count = (Long)q.uniqueResult();

				FinderCacheUtil.putResult(FINDER_PATH_COUNT_ALL,
					FINDER_ARGS_EMPTY, count);
			}
			catch (Exception e) {
				FinderCacheUtil.removeResult(FINDER_PATH_COUNT_ALL,
					FINDER_ARGS_EMPTY);

				throw processException(e);
			}
			finally {
				closeSession(session);
			}
		}

		return count.intValue();
	}

	/**
	 * Initializes the test attempt persistence.
	 */
	public void afterPropertiesSet() {
		String[] listenerClassNames = StringUtil.split(GetterUtil.getString(
					com.liferay.util.service.ServiceProps.get(
						"value.object.listener.ru.tiis.srv.model.TestAttempt")));

		if (listenerClassNames.length > 0) {
			try {
				List<ModelListener<TestAttempt>> listenersList = new ArrayList<ModelListener<TestAttempt>>();

				for (String listenerClassName : listenerClassNames) {
					listenersList.add((ModelListener<TestAttempt>)InstanceFactory.newInstance(
							getClassLoader(), listenerClassName));
				}

				listeners = listenersList.toArray(new ModelListener[listenersList.size()]);
			}
			catch (Exception e) {
				_log.error(e);
			}
		}
	}

	public void destroy() {
		EntityCacheUtil.removeCache(TestAttemptImpl.class.getName());
		FinderCacheUtil.removeCache(FINDER_CLASS_NAME_ENTITY);
		FinderCacheUtil.removeCache(FINDER_CLASS_NAME_LIST_WITH_PAGINATION);
		FinderCacheUtil.removeCache(FINDER_CLASS_NAME_LIST_WITHOUT_PAGINATION);
	}

	private static final String _SQL_SELECT_TESTATTEMPT = "SELECT testAttempt FROM TestAttempt testAttempt";
	private static final String _SQL_COUNT_TESTATTEMPT = "SELECT COUNT(testAttempt) FROM TestAttempt testAttempt";
	private static final String _ORDER_BY_ENTITY_ALIAS = "testAttempt.";
	private static final String _NO_SUCH_ENTITY_WITH_PRIMARY_KEY = "No TestAttempt exists with the primary key ";
	private static final boolean _HIBERNATE_CACHE_USE_SECOND_LEVEL_CACHE = GetterUtil.getBoolean(PropsUtil.get(
				PropsKeys.HIBERNATE_CACHE_USE_SECOND_LEVEL_CACHE));
	private static Log _log = LogFactoryUtil.getLog(TestAttemptPersistenceImpl.class);
	private static TestAttempt _nullTestAttempt = new TestAttemptImpl() {
			@Override
			public Object clone() {
				return this;
			}

			@Override
			public CacheModel<TestAttempt> toCacheModel() {
				return _nullTestAttemptCacheModel;
			}
		};

	private static CacheModel<TestAttempt> _nullTestAttemptCacheModel = new CacheModel<TestAttempt>() {
			@Override
			public TestAttempt toEntityModel() {
				return _nullTestAttempt;
			}
		};
}