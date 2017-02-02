package ru.tiis.managment.portlet;

import java.io.IOException;

import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import com.liferay.util.bridges.mvc.MVCPortlet;

/**
 * Portlet implementation class LibraryManagmentPortlet
 */
public class LibraryManagmentPortlet extends MVCPortlet {
	
	//TODO This shit should create books, tests, news and docs...
	//TODO Statisctics should be in another module.


	@Override
	public void render(RenderRequest request, RenderResponse response)
			throws PortletException, IOException {
		
		//TODO get some param
		//if no params - render menu page
		//if - "book" - render book menu
		//if - "test" - render test menu
		// TODO Auto-generated method stub
		super.render(request, response);
	}
}
