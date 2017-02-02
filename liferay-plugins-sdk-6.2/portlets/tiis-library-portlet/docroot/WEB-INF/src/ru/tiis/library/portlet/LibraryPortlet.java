package ru.tiis.library.portlet;

import java.io.IOException;

import javax.portlet.PortletException;
import javax.portlet.PortletPreferences;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import ru.tiis.library.portlet.views.View;
import ru.tiis.library.portlet.views.ViewsManager;

import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;

/**
 * Portlet implementation class LibraryPortlet
 */
public class LibraryPortlet extends MVCPortlet {
	public static final String PORTLET_ID = "library_WAR_tiislibraryportlet";
	
	private static Log log = LogFactoryUtil.getLog(LibraryPortlet.class);
	private static ViewsManager viewsManager = new ViewsManager();
	
	
	@Override
	public void render(RenderRequest request, RenderResponse response)
			throws PortletException, IOException {
		
		View view;
		PortletPreferences portletPreferences = request.getPreferences();
		String portletMode = portletPreferences.getValue(
				LibraryConfiguration.LIBRARY_VIEW_MODE, LibraryConfiguration.POPULAR_BOOKS_MODE);
		view = viewsManager.getViewByPortletMode(portletMode);
		
		try {
			view.render(request, response);
		} catch (SystemException e) {
			log.error(e.getMessage());
			return;
		}
		
		String path = view.getPagePath();
		include(path, request, response);
	}
}
