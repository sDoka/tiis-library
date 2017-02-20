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

package ru.tiis.srv.service.impl;

import org.apache.commons.lang.StringUtils;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.search.Indexable;
import com.liferay.portal.kernel.search.IndexableType;
import com.liferay.portal.kernel.search.Indexer;
import com.liferay.portal.kernel.search.IndexerRegistryUtil;
import com.liferay.portal.kernel.util.ContentTypes;
import com.liferay.portal.model.ResourceConstants;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portlet.asset.model.AssetEntry;
import com.liferay.portlet.asset.model.AssetLinkConstants;

import ru.tiis.srv.model.Book;
import ru.tiis.srv.service.base.BookLocalServiceBaseImpl;

/**
 * The implementation of the book local service.
 *
 * <p>
 * All custom service methods should be put in this class. Whenever methods are added, rerun ServiceBuilder to copy their definitions into the {@link ru.tiis.srv.service.BookLocalService} interface.
 *
 * <p>
 * This is a local service. Methods of this service will not have security checks based on the propagated JAAS credentials because this service can only be accessed from within the same VM.
 * </p>
 *
 * @author Michael
 * @see ru.tiis.srv.service.base.BookLocalServiceBaseImpl
 * @see ru.tiis.srv.service.BookLocalServiceUtil
 */
public class BookLocalServiceImpl extends BookLocalServiceBaseImpl {
	
	/*
	 * NOTE FOR DEVELOPERS:
	 * Never reference this interface directly. Always use {@link ru.tiis.srv.service.BookLocalServiceUtil} to access the book local service.
	 */

	Log logger = LogFactoryUtil.getLog(this.getClass());
	
	/**
	 * Adds the book to the database. Also notifies the appropriate model listeners.
	 *
	 * @param book the book
	 * @return the book that was added
	 * @throws SystemException if a system exception occurred
	 */
	@Indexable(type = IndexableType.REINDEX)
	@Override
	public Book addBook(Book book) throws SystemException {
		
		Book newBook = super.addBook(book);
		
		try {
			resourceLocalService.addResources(book.getCompanyId(), book.getGroupId(), book.getUserId(),
				       Book.class.getName(), book.getBookId(), false, true, true);
		} catch (PortalException e) {
			logger.error("Failed to add permissions resource for the book entry: " + book);
		}
		
		try {
			ServiceContext serviceContext = new ServiceContext(); //TODO inject as method parameter
			AssetEntry assetEntry = assetEntryLocalService.updateEntry(
				    book.getUserId(), book.getGroupId(), book.getCreateDate(),
				    book.getModifiedDate(), Book.class.getName(),
				    book.getBookId(), book.getUuid(), 0,
				    serviceContext.getAssetCategoryIds(),
				    serviceContext.getAssetTagNames(), true, 
				    null, null, null, ContentTypes.TEXT_HTML, 
				    book.getTitle(), book.getDescription(), StringUtils.EMPTY,
				    null, null, 0, 0, null, false);

	        assetLinkLocalService.updateLinks(book.getUserId(),
                    assetEntry.getEntryId(), serviceContext.getAssetLinkEntryIds(),
                    AssetLinkConstants.TYPE_RELATED);
	        
		} catch (PortalException e) {
			logger.error("Failed to add asset entry of the book entry: " + book);
		}
		
		try {
			Indexer indexer = IndexerRegistryUtil.nullSafeGetIndexer(
	                Book.class);
			indexer.reindex(newBook);
		} catch (PortalException e) {
			logger.error("Failed to reindex Lucene document for the book entry: " + book);
		}
	
		return newBook;
	}
	
	/**
	 * Updates the book in the database or adds it if it does not yet exist. Also notifies the appropriate model listeners.
	 *
	 * @param book the book
	 * @return the book that was updated
	 * @throws SystemException if a system exception occurred
	 */
	@Indexable(type = IndexableType.REINDEX)
	@Override
	public Book updateBook(Book book) throws SystemException {
		
		Book updatedBook = super.updateBook(book);
		
		// unsure use case for updating permission resources, since currently there 
		// are no plans to change permissions via UI
		
		try {
			ServiceContext serviceContext = new ServiceContext(); //TODO inject as method parameter
			AssetEntry assetEntry = assetEntryLocalService.updateEntry(
				    book.getUserId(), book.getGroupId(), book.getCreateDate(),
				    book.getModifiedDate(), Book.class.getName(),
				    book.getBookId(), book.getUuid(), 0,
				    serviceContext.getAssetCategoryIds(),
				    serviceContext.getAssetTagNames(), true, 
				    null, null, null, ContentTypes.TEXT_HTML, 
				    book.getTitle(), book.getDescription(), StringUtils.EMPTY,
				    null, null, 0, 0, null, false);
			
	        assetLinkLocalService.updateLinks(book.getUserId(),
                    assetEntry.getEntryId(), serviceContext.getAssetLinkEntryIds(),
                    AssetLinkConstants.TYPE_RELATED);
	        
		} catch (PortalException e) {
			logger.error("Failed to update asset entry of the book entry: " + book);
		}
		
		try {
			Indexer indexer = IndexerRegistryUtil.nullSafeGetIndexer(
	                Book.class);
			indexer.reindex(updatedBook);
		} catch (PortalException e) {
			logger.error("Failed to reindex Lucene document for the book entry: " + book);
		}
		
		return updatedBook;
	}
	
	/**
	 * Deletes the book from the database. Also notifies the appropriate model listeners.
	 *
	 * @param book the book
	 * @return the book that was removed
	 * @throws SystemException if a system exception occurred
	 */
	@Indexable(type = IndexableType.DELETE)
	@Override
	public Book deleteBook(Book book) throws SystemException {
		
		try {
			resourceLocalService.deleteResource(book.getCompanyId(), Book.class.getName(), 
					ResourceConstants.SCOPE_INDIVIDUAL, book.getBookId());
		} catch (PortalException e) {
			logger.error("Failed to delete permissions resource for the book entry: " + book);
		}
		
		try {
			AssetEntry assetEntry = assetEntryLocalService.fetchEntry(
					Book.class.getName(), book.getBookId());
			assetLinkLocalService.deleteLinks(assetEntry.getEntryId());
			assetEntryLocalService.deleteEntry(assetEntry);
		} catch (PortalException e) {
			logger.error("Failed to delete asset entry of the book entry: " + book);
		}

		try {
			Indexer indexer = IndexerRegistryUtil.nullSafeGetIndexer(
	                Book.class);
			indexer.delete(book);
		} catch (PortalException e) {
			logger.error("Failed to delete Lucene document of the book entry: " + book);
		}
		
		Book deletedBook = super.deleteBook(book);
		
		return deletedBook;
	}
	
}