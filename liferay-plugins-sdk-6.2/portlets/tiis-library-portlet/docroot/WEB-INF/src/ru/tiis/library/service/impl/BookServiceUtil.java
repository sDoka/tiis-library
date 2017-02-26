package ru.tiis.library.service.impl;

import java.util.ArrayList;
import java.util.List;

import ru.tiis.srv.model.Book;
import ru.tiis.srv.service.BookLocalServiceUtil;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portlet.asset.model.AssetCategory;
import com.liferay.portlet.asset.model.AssetEntry;
import com.liferay.portlet.asset.model.AssetTag;
import com.liferay.portlet.asset.service.AssetEntryLocalServiceUtil;

public class BookServiceUtil {
	private static Log log = LogFactoryUtil.getLog(BookServiceUtil.class);

	/**
	 * Retrieves all book category names by bookId
	 * 
	 * @param bookId
	 *            - id of a book to retrieve category names for
	 * @return List<String> - list of category names
	 */
	public static AssetEntry getBookAssetEntry(Long bookId) {
		try {
			Book bookEntity = BookLocalServiceUtil.getBook(bookId);
			AssetEntry asset = AssetEntryLocalServiceUtil.fetchEntry(
					Book.class.getName(), bookEntity.getBookId());
			if (null == asset) {
				log.error("Could not get book asset entry.");
				return null;
			}
			return asset;
		} catch (SystemException | PortalException e) {
			log.error("Could not get book asset entry." + e.getMessage());
			return null;
		}
	}

	/**
	 * Retrieves all book category names by bookId
	 * 
	 * @param bookId
	 *            - id of a book to retrieve category names for
	 * @return List<String> - list of category names
	 */
	public static List<String> getBookCategoryNames(Long bookId) {
		List<AssetCategory> assetCategories = getBookCategories(bookId);
		List<String> categoryNames = new ArrayList<String>();
		for (AssetCategory assetCategory : assetCategories) {
			categoryNames.add(assetCategory.getName());
		}
		return categoryNames;
	}
	
	/**
	 * Retrieves all book asset categories by bookId
	 * 
	 * @param bookId
	 *            - id of a book to retrieve asset categories for
	 * @return List<AssetCategory> - list of asset categories
	 */
	public static List<AssetCategory> getBookCategories(Long bookId) {
		try {
			Book bookEntity = BookLocalServiceUtil.getBook(bookId);
			AssetEntry asset = AssetEntryLocalServiceUtil.fetchEntry(
					Book.class.getName(), bookEntity.getBookId());
			if (null == asset) {
				// Return empty array if there is no categories
				log.error("Could not get book category names. "
						+ "Setting empty category list. ");
				return new ArrayList<AssetCategory>();
			}

			List<AssetCategory> assetCategories = asset.getCategories();
			return assetCategories;
		} catch (SystemException | PortalException e) {
			log.error("Could not get book category names. "
					+ "Setting empty category list. " + e.getMessage());
			return new ArrayList<AssetCategory>();
		}
	}

	/**
	 * Retrieves all book tags by bookId
	 * 
	 * @param bookId
	 *            - id of a book to retrieve tags for
	 * @return List<String> - list of tags
	 */
	public static List<String> getBookTags(Long bookId) {
		try {
			Book bookEntity = BookLocalServiceUtil.getBook(bookId);
			AssetEntry asset = AssetEntryLocalServiceUtil.fetchEntry(
					Book.class.getName(), bookEntity.getBookId());
			if (null == asset) {
				// Return empty array if there is no categories
				log.error("Could not get book tags. "
						+ "Setting empty category list. ");
				return new ArrayList<String>();
			}

			List<AssetTag> assetTags = asset.getTags();
			List<String> tags = new ArrayList<String>();
			for (AssetTag assetTag : assetTags) {
				tags.add(assetTag.getName());
			}

			return tags;
		} catch (SystemException | PortalException e) {
			log.error("Could not get book tags. "
					+ "Setting empty category list. " + e.getMessage());
			return new ArrayList<String>();
		}
	}
}
