<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@page import="com.liferay.portal.util.PortalUtil"%>
<%@page import="com.liferay.portal.service.LayoutLocalServiceUtil"%>
<%@page import="com.liferay.portal.model.GroupConstants"%>
<%@page import="com.liferay.portal.service.GroupLocalServiceUtil"%>
<%@page import="com.liferay.portal.kernel.language.LanguageUtil"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme"%>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %>
<%@ taglib uri="http://alloy.liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>

<portlet:defineObjects />
<liferay-theme:defineObjects />

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/library/catalog.css">
<script type="text/javascript" src="<%=request.getContextPath()%>/js/library/popular_books.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/lib/js/jquery-3.1.1.min.js"></script>

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/library/templates/book_grid_item.css">
<script type="text/html" id="tpl_books_grid">
	<%@include file="templates/book_grid_item.html" %>
</script>

<script type="text/javascript">
	AUI().ready(function () {
		var books = ${books};
		new PopularBooks('<portlet:namespace />', books,
				'#<portlet:namespace />books');
	});
	
</script>

<div class="courses-list">
		<h2>
			<%=LanguageUtil.get(pageContext, "popular-book") %> 
			<a style="font-size: 21px;" href="/catalog">
				<%=LanguageUtil.get(pageContext, "view-all-books") %>
			</a>
		</h2>
	<div class="row-fluid" id="<portlet:namespace />courses"></div>
</div>
<div class="books-list">
	<div class="row-fluid" id="<portlet:namespace />books"></div>
</div>
