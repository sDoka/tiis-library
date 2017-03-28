package ru.tiis.library.portlet.views;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.portlet.PortletRequest;
import javax.portlet.PortletURL;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import ru.tiis.constants.FriendlyUrlConstants;
import ru.tiis.library.portlet.BookInfoPortlet;
import ru.tiis.library.service.BookService;
import ru.tiis.library.service.impl.BookServiceFactory;
import ru.tiis.library.service.impl.BookServiceUtil;
import ru.tiis.library.service.model.BookModel;
import ru.tiis.managment.portlet.util.LibraryManagmentUtil;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.model.GroupConstants;
import com.liferay.portal.model.Layout;
import com.liferay.portal.service.GroupLocalServiceUtil;
import com.liferay.portal.service.LayoutLocalServiceUtil;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextFactory;
import com.liferay.portal.util.PortalUtil;
import com.liferay.portlet.PortletURLFactoryUtil;
import com.liferay.portlet.asset.model.AssetCategory;
import com.liferay.portlet.asset.model.AssetEntry;
import com.liferay.portlet.asset.service.AssetEntryLocalServiceUtil;
import com.liferay.portlet.documentlibrary.model.DLFileEntry;

public class CatalogView extends View {
	private static Log log = LogFactoryUtil.getLog(CatalogView.class);

	public static final String PAGE_NAME = "catalog_page";
	private static final String PAGE_PATH = "/html/library/catalog.jsp";

	private static BookService bookService = BookServiceFactory.getService();

	@Override
	public String getPageName() {
		return PAGE_NAME;
	}

	@Override
	public String getPagePath() {
		return PAGE_PATH;
	}

	@Override
	public void render(RenderRequest request, RenderResponse response)
			throws SystemException {
		List<BookModel> books = new ArrayList<BookModel>();
		books = bookService.getAllBooks();
		long bookInfoPlid = 0;
		try {
			long guestGroupId = GroupLocalServiceUtil.getGroup(
					PortalUtil.getDefaultCompanyId(), GroupConstants.GUEST)
					.getGroupId();
			Layout bookInfoPage = LayoutLocalServiceUtil.getFriendlyURLLayout(
					guestGroupId, false, FriendlyUrlConstants.BOOK_INFO);
			bookInfoPlid = bookInfoPage.getPlid();
		} catch (PortalException e1) {
			log.error(e1.getMessage());
		}

		for (BookModel book : books) {
			PortletURL bookInfoUrl = PortletURLFactoryUtil.create(request,
					BookInfoPortlet.PORTLET_ID, bookInfoPlid,
					PortletRequest.RENDER_PHASE);
			bookInfoUrl.setParameter("bookId", String.valueOf(book.getBookId()));
			String url = bookInfoUrl.toString();
			book.setBookInfoUrl(url);
			List<AssetCategory> assetCategories = BookServiceUtil
					.getBookCategories(book.getBookId());
			List<Long> categoryIds = new ArrayList<Long>();
			for (AssetCategory assetCategory : assetCategories) {
				categoryIds.add(assetCategory.getCategoryId());
			}
			book.setCatIds(categoryIds);
		}
		// Retrieving categories
		int categoriesNumber = AssetEntryLocalServiceUtil
				.getAssetEntriesCount();
		List<AssetEntry> assetEntries = AssetEntryLocalServiceUtil
				.getAssetEntries(0, categoriesNumber);
		List<AssetCategory> assetCategories = new ArrayList<AssetCategory>();
		for (AssetEntry assetEntry : assetEntries) {
			List<AssetCategory> assetEntryCategory = assetEntry.getCategories();
			for (AssetCategory assetCategory : assetEntryCategory) {
				if (!assetCategories.contains(assetCategory)) {
					assetCategories.add(assetCategory);
				}
			}
		}

		request.setAttribute("categories", assetCategories);
		request.setAttribute("books", books);
		super.render(request, response);
	}
}
