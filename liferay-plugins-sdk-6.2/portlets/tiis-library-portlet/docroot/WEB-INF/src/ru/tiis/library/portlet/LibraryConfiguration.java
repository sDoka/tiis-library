package ru.tiis.library.portlet;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletConfig;
import javax.portlet.PortletPreferences;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.portlet.DefaultConfigurationAction;
import com.liferay.portal.kernel.servlet.SessionMessages;
import com.liferay.portal.kernel.util.ParamUtil;

public class LibraryConfiguration extends DefaultConfigurationAction {
	
	@SuppressWarnings("unused")
	private static Log log = LogFactoryUtil.getLog(LibraryPortlet.class);
	
	public static final String POPULAR_BOOKS_MODE = "isPopularBooksView";
	public static final String CATALOG_MODE = "isCatalogView";
	public static final String LIBRARY_VIEW_MODE = "portletViewMode";

	@Override
	public String render(PortletConfig portletConfig,
			RenderRequest renderRequest, RenderResponse renderResponse)
					throws Exception {

		PortletPreferences portletPreferences = renderRequest.getPreferences();
		String portletViewMode = portletPreferences.getValue(LIBRARY_VIEW_MODE, CATALOG_MODE);
		
		boolean isPopularBooksView = portletViewMode.equals(POPULAR_BOOKS_MODE);
		renderRequest.setAttribute(POPULAR_BOOKS_MODE, isPopularBooksView);
		int popularBooksAmount = Integer.valueOf(portletPreferences.getValue("popularBooksAmount", "6"));
		renderRequest.setAttribute("popularBooksAmount", popularBooksAmount);
		
		boolean isCatalogView = portletViewMode.equals(CATALOG_MODE);
		renderRequest.setAttribute(CATALOG_MODE, isCatalogView);
		
		return super.render(portletConfig, renderRequest, renderResponse);
	}

	@Override
	public void processAction(PortletConfig portletConfig,
			ActionRequest actionRequest, ActionResponse actionResponse)
					throws Exception {

		PortletPreferences portletPreferences = actionRequest.getPreferences();
		
		String portletViewMode = ParamUtil.getString(actionRequest, "portletViewMode");
		portletPreferences.setValue(LIBRARY_VIEW_MODE, portletViewMode);

		int popularBooksAmount = ParamUtil.getInteger(actionRequest, "popularBooksAmount", 6);
		portletPreferences.setValue("popularBooksAmount", String.valueOf(popularBooksAmount));
		portletPreferences.store();

		SessionMessages.add(actionRequest,
				portletConfig.getPortletName() + SessionMessages.KEY_SUFFIX_REFRESH_PORTLET,
				ParamUtil.getString(actionRequest, "portletResource"));

		super.processAction(portletConfig, actionRequest, actionResponse);
	}
}
