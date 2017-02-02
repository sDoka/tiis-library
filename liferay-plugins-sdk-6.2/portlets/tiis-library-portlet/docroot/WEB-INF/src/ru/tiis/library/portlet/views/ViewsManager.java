package ru.tiis.library.portlet.views;

import ru.tiis.library.portlet.LibraryConfiguration;


public class ViewsManager {

	public View getViewByPortletMode(String portletMode) {

		if (portletMode.equals(LibraryConfiguration.POPULAR_BOOKS_MODE)) {
			return new TopPopularBooksView();
		}
		
		if (portletMode.equals(LibraryConfiguration.CATALOG_MODE)) {
			return new CatalogView();
		}
		
		return new TopPopularBooksView();
	}
}
