<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="itd" %>
<%@page import="com.liferay.portal.model.Layout"%>
  
<portlet:defineObjects />
<liferay-theme:defineObjects />
<itd:discussion classPK="<%=layout.getPlid()%>" userId="${ user.getUserId()}" className="<%=Layout.class.getName()%>" themeDisplay="<%=themeDisplay %>"/>