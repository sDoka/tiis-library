<%@include file="/html/init.jsp"%>
<%@page import="ru.tiis.srv.model.Book"%>
<%@page import="com.liferay.portal.util.PortalUtil"%>
<%@page import="com.liferay.portal.kernel.language.LanguageUtil"%>
<%@page import="ru.tiis.constants.FriendlyUrlConstants"%>

<liferay-theme:defineObjects />
<portlet:defineObjects />

<%-- <div class="back-link">
	<a href="<%=FriendlyUrlConstants.BOOKS_CATALOG%>"><liferay-ui:message key="back-to-catalog-link"/></a>
</div>
 --%>

<portlet:renderURL var = "editBookURL">
	<portlet:param name="mode" value="edit"/>
	<portlet:param name="bookId" value="${ book.bookId }"/>
</portlet:renderURL>

<div class="book-title-card">
	<div class="book-title-caption" style="background-image: url(${book.logoUrl})">
		<div class="caption book-title">
			<h3>${book.title}</h3>
		</div>
	</div>
</div>

<section>
	<div class="container">
		<div class="row book-description">
			<div class="col-md-8 annotation">
				<h2 class="annotation__title"><%=LanguageUtil.get(pageContext, "book-annotation") %></h2>
				<div class="annotation__description">
					<h3><%=LanguageUtil.get(pageContext, "book-short-description") %></h3>
					<p>${book.description}</p>
				</div>
			</div>
			<div class="col-md-4">
				<div class="author-preview">
					<div class="read-button">
						<a href = "${ book.googleDriveLink }" target = _blank>
							<button class="btn btn-success"><%=LanguageUtil.get(pageContext, "book-read") %></button>
						</a>
					</div>
					<div class="read-button">
						<a href = "${ editBookURL }" target = _blank>
							<button class="btn btn-primary"><%=LanguageUtil.get(pageContext, "book-edit") %></button>
						</a>
					</div>
				</div>
				<!-- <div class="book-index">
					<ul class="book-index__list">
						<li>CHAPTER-1</li>
						<li>CHAPTER-2</li>
						<li>CHAPTER-3</li>
						<li>CHAPTER-4</li>
					</ul>			
				</div> -->
			</div>
		</div>
		<div class="row">
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
</section>