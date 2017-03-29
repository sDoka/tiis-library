package ru.tiis.library.service.model;

import java.util.ArrayList;
import java.util.List;

import ru.tiis.srv.model.Book;
import ru.tiis.srv.service.BookLocalServiceUtil;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.json.JSONArray;
import com.liferay.portal.kernel.json.JSONException;
import com.liferay.portal.kernel.json.JSONFactoryUtil;
import com.liferay.portal.kernel.json.JSONObject;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portlet.documentlibrary.model.DLFileEntry;
import com.liferay.portlet.documentlibrary.service.DLFileEntryLocalServiceUtil;

public class BookModel {
	private static Log log = LogFactoryUtil.getLog(BookModel.class);
	private static final String defaultLogoImagePath = "/tiis-library-portlet/images/book_logo.jpg";
	private static final String loaderGifPath = "/tiis-library-portlet/images/loader.gif";

	private Book book;
	private DLFileEntry bookLogo;
	private String bookInfoUrl;
	private List<Long> catIds = new ArrayList<Long>();
	private List<String> categoriesList = new ArrayList<String>();
	private List<String> tagsList = new ArrayList<String>();

	public BookModel(long bookId) throws PortalException, SystemException {
		this(BookLocalServiceUtil.getBook(bookId));
	}

	public BookModel(Book book) {
		this.book = book;
		try {
			this.bookLogo = DLFileEntryLocalServiceUtil.getDLFileEntry(book.getBookLogoDlId());
		} catch (PortalException | SystemException e) {
			//log.error(e.getMessage());
			bookLogo = null;
		}
	}

	public long getBookId() {
		return book.getBookId();
	}

	public String getTitle() {
		return book.getTitle();
	}

	public String getDescription() {
		return book.getDescription();
	}
	
	public DLFileEntry getBookLogo() {
		return bookLogo;
	}	

	public String getGoogleDriveLink() {
		return book.getGoogleDriveLink();
	}

	public String getInfoURL() {
		return bookInfoUrl;
	}

	public void setBookInfoUrl(String url) {
		this.bookInfoUrl = url;
	}

	public String getStubLogoUrl() {
		return defaultLogoImagePath;
	}

	public List<Long> getCatIds() {
		return catIds;
	}

	public void setCatIds(List<Long> catIds) {
		this.catIds = catIds;
	}

	public List<String> getCategoriesList() {
		return categoriesList;
	}

	public void setCategoriesList(List<String> categoriesList) {
		this.categoriesList = categoriesList;
	}

	public List<String> getTagsList() {
		return tagsList;
	}

	public void setTagsList(List<String> tagsList) {
		this.tagsList = tagsList;
	}
	
	public void setTitle(String title) {
		this.book.setTitle(title);
	}

	public void setDescription(String description) {
		this.book.setDescription(description);
	}
	

	public void setBookLogo(DLFileEntry logoDlFileEntry) {
		this.book.setBookLogoDlId(logoDlFileEntry.getFileEntryId());
		this.bookLogo = logoDlFileEntry;
		
	}
	
	public String getLogoUrl() {
		if (bookLogo != null) {
			return "/documents/" + bookLogo.getGroupId()
					+ StringPool.FORWARD_SLASH + bookLogo.getFolderId()
					+ StringPool.FORWARD_SLASH + bookLogo.getTitle()
					+ StringPool.FORWARD_SLASH + bookLogo.getUuid();
		} else {			return defaultLogoImagePath;
		}
	}

	@Override
	public String toString() {
		JSONObject jsonObject = JSONFactoryUtil.createJSONObject();

		jsonObject.put("bookId", book.getBookId());
		jsonObject.put("title", book.getTitle());
		jsonObject.put("description", book.getDescription());
		jsonObject.put("logoURL",getLogoUrl());
		jsonObject.put("infoURL", getInfoURL());
		jsonObject.put("stubLogoUrl", getStubLogoUrl());
		jsonObject.put("date", book.getCreateDate());
		jsonObject.put("loaderUrl", loaderGifPath);

		try {
			JSONArray courseCategoryIds = JSONFactoryUtil
					.createJSONArray(catIds.toString());
			jsonObject.put("categories", courseCategoryIds);
		} catch (JSONException e) {
			log.error("Failed to initialize JSON array of course category ids. "
					+ "{courseId="
					+ getBookId()
					+ ", catIds:"
					+ catIds
					+ "}."
					+ "\nError:" + e.getMessage());
		}

		try {
			JSONArray bookCategories = JSONFactoryUtil
					.createJSONArray(categoriesList.toString());
			jsonObject.put("categoryNames", bookCategories);
		} catch (JSONException e) {
			log.error("Failed to initialize JSON array of course categories. "
					+ "{bookId=" + getBookId() + ", categories:" + catIds
					+ "}." + "\nError:" + e.getMessage());
		}

		return jsonObject.toString();
	
	}


}
