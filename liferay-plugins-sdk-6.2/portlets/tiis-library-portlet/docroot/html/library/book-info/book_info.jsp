<%@page import="com.liferay.portal.kernel.language.LanguageUtil"%>
<%@page import="ru.tiis.constants.FriendlyUrlConstants"%>
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>

<portlet:defineObjects />

<div class="back-link">
	<a href="<%=FriendlyUrlConstants.BOOKS_CATALOG %>"><%=LanguageUtil.get(pageContext, "back-to-catalog-link") %></a>
</div>

<div class="container book-info-container">
	<div class="row-fluid book-title">
		<h1>${book.title }</h1>
	</div>
	<div class="row-fluid book-image-container">
		<div class="span4 offset4 book-image-block">
			<img class="book-image" src="${book.logoUrl}">
		</div>
	</div>
	<div class="row-fluid content-block">
		<div class="span6 book-description">
			${book.description }
		</div>
		<div class="span3 offset2 gdrive-link">
			<a target="_blank" href="${book.googleDriveLink }"><%=LanguageUtil.get(pageContext, "read-book") %></a>
		</div>
	</div>
	<div class="row-fluid book-info-comments">
		Comments
	</div>
</div>