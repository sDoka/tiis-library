<%@include file="/html/init.jsp"%>
<%@page import="ru.tiis.srv.model.Book"%>
<%@page import="com.liferay.portal.util.PortalUtil"%>
<%@page import="com.liferay.portal.kernel.language.LanguageUtil"%>
<%@page import="ru.tiis.constants.FriendlyUrlConstants"%>

<liferay-theme:defineObjects />
<portlet:defineObjects />

<div class="back-link">
	<a href="<%=FriendlyUrlConstants.BOOKS_CATALOG%>"><liferay-ui:message key="back-to-catalog-link"/></a>
</div>

<div class="container book-info-container">
	
	<div class="row-fluid book-title">
		<h1>${book.title}</h1>
	</div>
	
	<div class="row-fluid book-image-container">
		<div class="span4 offset4 book-image-block">
			<img class="book-image" src="${book.logoUrl}">
		</div>
	</div>
	
	<%-- Example categorization of a created model for testing --%>
	<div class="row-fluid book-categorization">
		<label>Categories</label>
		${ book.categoriesList }
		
		<label>Tags</label>
		${ book.tagsList }
	</div>
	
	<div class="row-fluid content-block">
		<div class="span6 book-description">
			${book.description}
		</div>
		<div class="span3 offset2 gdrive-link">
			<a target="_blank" href="${book.googleDriveLink}"><liferay-ui:message key="read-book"/></a>
		</div>
	</div>
	
	<div class="row-fluid book-info-comments">
		<liferay-ui:panel-container extended="${false}"
		    id="bookCommentsPanelContainer" persistState="${true}">
		
		    <liferay-ui:panel collapsible="${true}" extended="${true}"
		        id="bookCommentsPanel" persistState="${true}"
		        title='<%=LanguageUtil.get(pageContext, "comments")%>'>
		
				<portlet:actionURL name="addDiscussion" var="discussionURL" />
		        <liferay-ui:discussion className="<%=Book.class.getName()%>"
		            classPK="${book.bookId}"
		            formAction="<%=discussionURL%>" formName="discussionForm"
		            ratingsEnabled="${true}" redirect="<%=PortalUtil.getCurrentURL(request)%>"
		            subject="${book.title}"
		            userId="${themeDisplay.userId}" />
		
		    </liferay-ui:panel>
		</liferay-ui:panel-container>
	</div>
</div>