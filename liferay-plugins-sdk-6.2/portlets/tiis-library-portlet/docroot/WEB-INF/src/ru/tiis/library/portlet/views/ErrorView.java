package ru.tiis.library.portlet.views;

public class ErrorView extends View {
	
	public static final String PAGE_NAME = "error_library_page";
	private static final String PAGE_PATH = "/html/library/error_library_view.jsp";

	@Override
	public String getPageName() {
		return PAGE_NAME;
	}

	@Override
	public String getPagePath() {
		return PAGE_PATH;
	}

}
