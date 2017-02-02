package ru.tiis.library.portlet.views;

import java.util.Arrays;
import java.util.List;

import javax.portlet.PortletRequest;
import javax.portlet.PortletResponse;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.servlet.SessionErrors;

public abstract class View {
	public abstract String getPageName();
	public abstract String getPagePath();
	
	public void render(RenderRequest request, RenderResponse response) throws SystemException {
	}
	
	protected void errorResponse(PortletRequest request, PortletResponse response, List<String> errors) {
		request.setAttribute("errors", errors);
		
		for (String error : errors) {
			SessionErrors.add(request, error);				
		}
	}
	
	protected void errorResponse(PortletRequest request, PortletResponse response, String error) {
		errorResponse(request, response, Arrays.asList(new String [] {error}));
	}
}
