package ru.tiis.library.service.model;

import java.sql.Blob;
import java.sql.SQLException;
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
import com.liferay.portal.kernel.util.Base64;
import com.liferay.portlet.asset.model.AssetCategory;
import com.liferay.portlet.asset.service.AssetCategoryLocalServiceUtil;

public class BookModel {
	private static Log log = LogFactoryUtil.getLog(BookModel.class);
	private static final String defaultLogoImagePath = "/tiis-library-portlet/images/book_logo.jpg";

	private Book book;
	private String bookLogoUrl;
	private String bookInfoUrl;
	private List<Long> catIds = new ArrayList<Long>();
	private List<String> categoriesList = new ArrayList<String>();
	private List<String> tagsList = new ArrayList<String>();

	public BookModel(long bookId) throws PortalException, SystemException {
		this(BookLocalServiceUtil.getBook(bookId));
	}
	
	public BookModel(Book book) {
		this.book = book;
		//TODO implement logo generation
		Blob logo = book.getBookLogo();
		bookLogoUrl = defaultLogoImagePath;
		try {
			if (logo != null) {
				int logoLength = (int) logo.length();
				byte[] logoByteArray = logo.getBytes(1, logoLength);
				bookLogoUrl = "data:image/jpg;base64," + Base64.encode(logoByteArray);
			}
		} catch (SQLException e) {
			log.error("Error while retrieving logo data for book : " + book.getTitle() + ". " + e.getMessage());
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
	
	public String getLogoUrl() {
		return this.bookLogoUrl;
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
	
	@Override
	public String toString() {
		JSONObject jsonObject = JSONFactoryUtil.createJSONObject();

		jsonObject.put("bookId", book.getBookId());
		jsonObject.put("title", book.getTitle());
		jsonObject.put("description", book.getDescription());
		jsonObject.put("logoURL", bookLogoUrl);
		jsonObject.put("infoURL", getInfoURL());
		jsonObject.put("date", book.getCreateDate());
		
		try {
			JSONArray courseCategoryIds = JSONFactoryUtil.createJSONArray(catIds.toString());
			jsonObject.put("categories", courseCategoryIds);
		} catch (JSONException e) {
			log.error("Failed to initialize JSON array of course category ids. "
					+ "{courseId=" + getBookId() + ", catIds:" + catIds + "}."
					+ "\nError:" + e.getMessage());
		}
		
		//List<String> courseCategoryNames = new ArrayList<String>();
		/*for (int i = 0; i < catIds.size(); i++) {
			try {
				AssetCategory category = AssetCategoryLocalServiceUtil.getAssetCategory(catIds.get(i));
				//courseCategoryNames.add(category.getName());
			} catch (PortalException | SystemException e) {
				log.error("Failed to initialize JSON array of course categories. " + "{courseId="
						+ getBookId() + ", categories:" + catIds + "}." + "\nError:" + e.getMessage());
				continue;
			}
		}*/

		try {
			JSONArray courseCategories = JSONFactoryUtil.createJSONArray(categoriesList.toString());
			jsonObject.put("categoryNames", courseCategories);
		} catch (JSONException e) {
			log.error("Failed to initialize JSON array of course categories. " + "{bookId="
					+ getBookId() + ", categories:" + catIds + "}." + "\nError:" + e.getMessage());
		}
		
		return jsonObject.toString();
	}
	
}
