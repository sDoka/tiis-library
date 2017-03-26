<%@page import="com.liferay.portal.kernel.language.LanguageUtil"%>
<%@page contentType="text/html; charset=utf-8" session="false"
	pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@page import="ru.tiis.srv.model.Book"%>
<%@include file="/html/init.jsp"%>

<liferay-theme:defineObjects />
<portlet:defineObjects />

<portlet:actionURL name="updateBookInfo" var="updateBookInfoURL">
</portlet:actionURL>

<!-- <button id="createBook" class = "btn btn-primary" onClick = "openModal()">Create a new book</button> -->

<%-- quick visual hack to space form controls --%>
<style>
#createBookModal form .row-fluid {
 	margin-bottom: 10px;
 }
 </style>

<div id="editBookModal">

	<form action="<%=updateBookInfoURL%>" method="POST"
		id="<portlet:namespace />fm" name="<portlet:namespace />fm"
		enctype="multipart/form-data">

		<aui:row>
			<aui:col span="2">
				<%=LanguageUtil.get(pageContext, "book-title") %>
			</aui:col>
			<aui:col span="4">
				<input type="text" class="form-control"
					name="<portlet:namespace/>bookTitle" value="${ book.title }" />
			</aui:col>
		</aui:row>

		<aui:row>
			<aui:col span="2">
				<%=LanguageUtil.get(pageContext, "book-description") %>
			</aui:col>
			<aui:col span="6">
				<liferay-ui:input-editor width="100%" />
                <aui:input name="bookDescription" type="hidden" value = "${book.description }"/>
			</aui:col>
		</aui:row>

		<aui:row>
			<aui:col span="2">
				<%=LanguageUtil.get(pageContext, "book-categories") %>
			</aui:col>
			<aui:col span="4">
				<liferay-ui:asset-categories-error />
				<liferay-ui:asset-tags-error />
				<liferay-ui:panel id="bookCategorizationPanel" defaultState="closed"
					extended="${false}" persistState="${true}" title="">
					<aui:fieldset>
						<liferay-ui:asset-categories-selector
							className="<%=Book.class.getName()%>" classPK="${book.bookId}" />
						<liferay-ui:asset-tags-selector
							className="<%=Book.class.getName()%>" classPK="${book.bookId}" />
					</aui:fieldset>
				</liferay-ui:panel>
			</aui:col>
		</aui:row>

		<aui:row>
			<aui:col span="2">
				<%=LanguageUtil.get(pageContext, "book-image") %>
			</aui:col>
			<aui:col span="4">
				<label class="btn btn-default btn-file"> <%=LanguageUtil.get(pageContext, "book-image-browse") %> <input
					type="file" name="<portlet:namespace/>bookLogo"
					accept="image/jpeg,image/bmp,image/png" style="display: none;" />
				</label>
			</aui:col>
		</aui:row>

		<br />
		
		<input type = "text" name = "<portlet:namespace/>bookId" value = "${ book.bookId }" hidden = "true"/>
		
		<aui:button-row>
			<input type="button" class="btn btn-success" value="Update" onclick = "updateBook()"/>
		</aui:button-row>

	</form>
	
</div>

<script>
	/*
	 $("#createBookModal").dialog({
	 modal : true,
	 title : "Create a new book",
	 width : 400,
	 height : 250,
	 autoOpen : false
	 });

	 function openModal() {
	 $("#createBookModal").dialog("open");
	 }

	 function closeModal() {
	 $("#createBookModal").dialog("close");
	 }
	 */
	function <portlet:namespace />initEditor() {
		return document.<portlet:namespace />fm.<portlet:namespace />bookDescription.value;
	}

	function updateBook() {
		 document.<portlet:namespace />fm.<portlet:namespace />bookDescription.value = window.<portlet:namespace />editor.getHTML();
		AUI().use('aui-io-request', function(A) {
			A.io.request('${updateBookInfoURL}', {
				method : 'POST',
				dataType : 'json',
				form : {
					id : '<portlet:namespace />fm',
					upload : true
				},
				on : {
					success : function() {
						//alert(this.get('responseData'));
					}
				}
			});
		});
	}
</script>