<%@include file="/html/init.jsp"%>
<%@page import="ru.tiis.srv.model.Book"%>
<%@page import="com.liferay.portal.util.PortalUtil"%>
<%@page import="com.liferay.portal.kernel.language.LanguageUtil"%>
<%@page import="ru.tiis.constants.FriendlyUrlConstants"%>

<liferay-theme:defineObjects />
<portlet:defineObjects />

<c:if test="<%=permissionChecker.isOmniadmin()%>">
	<liferay-portlet:actionURL name="updateBookDescription"
		var="updateBookDescriptionURL">
		<liferay-portlet:param name="bookId" value="${book.bookId }" />
	</liferay-portlet:actionURL>

	<liferay-portlet:actionURL name="updateBookTitle"
		var="updateBookTitleURL">
		<liferay-portlet:param name="bookId" value="${book.bookId }" />
	</liferay-portlet:actionURL>

	<liferay-portlet:actionURL name="updateBookLogo"
		var="updateBookLogoURL">
		<liferay-portlet:param name="bookId" value="${book.bookId }" />
	</liferay-portlet:actionURL>

	<liferay-portlet:actionURL name="updateBookCategories"
		var="updateBookCategoriesURL">
		<liferay-portlet:param name="bookId" value="${book.bookId }" />
	</liferay-portlet:actionURL>
</c:if>

<div class="book-title-card">
	<div class="book-title-caption" id="logo-placeholder"
		style="background-image: url(${book.logoUrl})">
		<div class="caption book-title">
			<h3 id="book-title-content">${book.title}</h3>
		</div>
	</div>
</div>

<section>
	<div class="container">
		<div class="row book-description">
			<div class="col-md-8 annotation">
				<div class="row">
					<div class="col-md-8">
						<h2 class="annotation__title"><%=LanguageUtil.get(pageContext, "book-annotation")%></h2>
					</div>
				</div>


				<div id="bookDescription" class="annotation__description">
					${book.description}</div>
				<c:if test="<%=permissionChecker.isOmniadmin()%>">
					<div id="book-description-edit-block">
						<liferay-ui:input-editor name="book-description-editor"
							initMethod="initDescriptionEditor">
						</liferay-ui:input-editor>
						<div class="button-row">
							<button id="update-description-btn" class="btn btn-success"><%=LanguageUtil.get(pageContext, "save")%></button>
							<button id="cancel-update-description-btn" class="btn btn-danger"><%=LanguageUtil.get(pageContext, "cancel")%></button>
						</div>
					</div>


				</c:if>

			</div>
			<div class="col-md-4">
				<div class="author-preview">
					<div class="read-button">
						<a href="${ book.googleDriveLink }" target=_blank>
							<button class="btn btn-success"><%=LanguageUtil.get(pageContext, "book-read")%></button>
						</a>
						<c:if test="<%=permissionChecker.isOmniadmin()%>">
							<button id="edit-description-btn" class="btn btn-primary"><%=LanguageUtil.get(pageContext, "edit-description")%></button>
							<button id="edit-title-btn" class="btn btn-primary"><%=LanguageUtil.get(pageContext, "edit-title")%></button>
							<button id="edit-logo-btn" class="btn btn-primary"><%=LanguageUtil.get(pageContext, "edit-book-logo")%></button>
						</c:if>
					</div>
				</div>

				<!-- Will be used for e-pub books 
				<div class="book-index">
					<ul class="book-index__list">
						<li>CHAPTER-1</li>
						<li>CHAPTER-2</li>
						<li>CHAPTER-3</li>
						<li>CHAPTER-4</li>
					</ul>			
				</div> -->
			</div>
		</div>

		<c:if test="<%=permissionChecker.isOmniadmin()%>">
			<div class="row">

				<aui:form name="categoriesForm" action="${updateBookCategoriesURL }">
					<aui:row>
						<aui:col span="12">
							<liferay-ui:asset-categories-error />
							<liferay-ui:asset-tags-error />
							<liferay-ui:panel id="bookCategorizationPanel"
								defaultState="collapsed" extended="${false}"
								persistState="${true}"
								title='<%=LanguageUtil.get(pageContext, "book-categories")%>'>
								<aui:fieldset>
									<liferay-ui:asset-categories-selector
										className="<%=Book.class.getName()%>" classPK="${book.bookId}" />
									<liferay-ui:asset-tags-selector
										className="<%=Book.class.getName()%>" classPK="${book.bookId}" />
								</aui:fieldset>
								<button type="button" id="save-categories-btn"
									class="btn btn-primary"><%=LanguageUtil.get(pageContext, "update")%></button>
							</liferay-ui:panel>
						</aui:col>
					</aui:row>
				</aui:form>
			</div>

		</c:if>
		<div class="row">
			<liferay-ui:panel-container extended="${false}"
				id="bookCommentsPanelContainer" persistState="${true}">

				<liferay-ui:panel collapsible="${true}" extended="${true}"
					id="bookCommentsPanel" persistState="${true}"
					title='<%=LanguageUtil.get(pageContext, "comments")%>'>

					<portlet:actionURL name="addDiscussion" var="discussionURL" />
					<liferay-ui:discussion className="<%=Book.class.getName()%>"
						classPK="${book.bookId}" formAction="<%=discussionURL%>"
						formName="discussionForm" ratingsEnabled="${true}"
						redirect="<%=PortalUtil.getCurrentURL(request)%>"
						subject="${book.title}" userId="${themeDisplay.userId}" />

				</liferay-ui:panel>
			</liferay-ui:panel-container>
		</div>
	</div>
</section>

<aui:script>
	function <portlet:namespace/>initDescriptionEditor() {
		return $('#bookDescription').html();
	}
	var bookInfo = new initBookInfo('<portlet:namespace/>',
			'${updateBookTitleURL}', '${updateBookDescriptionURL}',
			'${updateBookLogoURL }', '${updateBookCategoriesURL}');

	
</aui:script>