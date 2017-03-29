<%@page import="com.liferay.portal.kernel.language.LanguageUtil"%>
<%@page contentType="text/html; charset=utf-8" session="false"
	pageEncoding="utf-8" trimDirectiveWhitespaces="true"%>
<%@page import="ru.tiis.srv.model.Book"%>
<%@include file="/html/init.jsp"%>

<liferay-theme:defineObjects />
<portlet:defineObjects />

<portlet:actionURL name="createBook" var="createBookUrl"></portlet:actionURL>

<!-- <button id="createBook" class = "btn btn-primary" onClick = "openModal()">Create a new book</button> -->

<%-- quick visual hack to space form controls --%>
<style>
#createBookModal form .row-fluid {
 	margin-bottom: 10px;
 }
 </style>

<div id="createBookModal">

	<form action="<%=createBookUrl%>" method="POST"
		id="<portlet:namespace />fm" name="<portlet:namespace />fm"
		enctype="multipart/form-data">
		
	<aui:button-row>
		<div class="alert alert-info">
		  	<%=LanguageUtil.get(pageContext, "beta-version-auth") %>
		</div>
		<a href="https://accounts.google.com/o/oauth2/auth?client_id=1097637469091-gdshlvm5m4sub6l1m6hrtg83c07umaa4.apps.googleusercontent.com&redirect_uri=http://localhost:9002/Callback&response_type=code&scope=https://www.googleapis.com/auth/drive.file"
			target = "blank">
			<input type="button" class="btn btn-success" onclick="uploadBook()"
				value=<%=LanguageUtil.get(pageContext, "authorize-in-google-drive") %> />
		</a>
		
	</aui:button-row>

		<aui:row>
			<aui:col span="2">
				<%=LanguageUtil.get(pageContext, "book-title") %>
			</aui:col>
			<aui:col span="4">
				<input type="text" class="form-control"
					name="<portlet:namespace/>bookTitle" value="" />
			</aui:col>
		</aui:row>

		<aui:row>
			<aui:col span="2">
				<%=LanguageUtil.get(pageContext, "book-description") %>
			</aui:col>
			<aui:col span="6">
				<liferay-ui:input-editor width="100%" />
                <aui:input name="bookDescription" type="hidden" />
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

		<aui:row>
			<aui:col span="2">
				<%=LanguageUtil.get(pageContext, "book-file") %>
			</aui:col>
			<aui:col span="4">
				<label class="btn btn-default btn-file"> <%=LanguageUtil.get(pageContext, "book-file-browse") %> <input
					type="file" name="<portlet:namespace/>bookPdfFile"
					accept="application/pdf" style="display: none;" />
				</label>
			</aui:col>
		</aui:row>

		<br />

		<aui:button-row>
			<input type="button" class="btn btn-success" onclick="uploadBook()"
				value="Upload" />
		</aui:button-row>

	</form>
	
</div>

<script>
	function uploadBook() {
		document.<portlet:namespace />fm.<portlet:namespace />bookDescription.value = window.<portlet:namespace />editor.getHTML();
		AUI().use('aui-io-request', function(A) {
			A.io.request('${createBookUrl}', {
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