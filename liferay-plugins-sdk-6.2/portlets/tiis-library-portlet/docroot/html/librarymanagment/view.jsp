<%@page contentType="text/html; charset=utf-8" session="false" pageEncoding="utf-8" trimDirectiveWhitespaces="true" %>
<%@page import="ru.tiis.srv.model.Book"%>
<%@include file="/html/init.jsp"%>

<liferay-theme:defineObjects />
<portlet:defineObjects />

<portlet:actionURL name="createBook" var="createBookUrl"></portlet:actionURL>

<!-- <button id="createBook" class = "btn btn-primary" onClick = "openModal()">Create a new book</button> -->

<div id="createBookModal">

	<form action="<%=createBookUrl%>" method="POST"
		id="<portlet:namespace />fm" name="<portlet:namespace />fm"
		enctype="multipart/form-data">


		<aui:row>
			<aui:col span="2">
				Name
			</aui:col >
			<aui:col span="4">
				<input type="text" class="form-control"
					name="<portlet:namespace/>bookTitle" value="" />
			</aui:col>
		</aui:row>

		<aui:row>
			<aui:col span="2">
				Description
			</aui:col>
			<aui:col span="4">
				<textarea class="form-control" name="<portlet:namespace/>bookDescription" rows="5"></textarea>
			</aui:col>
		</aui:row>

		<aui:row>
			<aui:col span="2">
				Categorization
			</aui:col>
			<aui:col span="4">
				<liferay-ui:asset-categories-error />
				<liferay-ui:asset-tags-error />
				<liferay-ui:panel 
						id="bookCategorizationPanel"
						defaultState="closed" 
						extended="${false}" 
						persistState="${true}"
						title="">
				    <aui:fieldset>
					    <liferay-ui:asset-categories-selector 
					    	className="<%=Book.class.getName()%>"
			            	classPK="${book.bookId}"
			            />
			            <liferay-ui:asset-tags-selector 
					    	className="<%=Book.class.getName()%>"
			            	classPK="${book.bookId}"
			            />
				     </aui:fieldset>
				</liferay-ui:panel>
			</aui:col>
		</aui:row>
		
		<aui:row>
			<aui:col span="2">
				Logo file
			</aui:col>
			<aui:col span="4">
				<label class="btn btn-default btn-file"> Browse <input
					type="file" name="<portlet:namespace/>bookLogo"
					accept="image/jpeg,image/bmp,image/png" style="display: none;" />
				</label>
			</aui:col>
		</aui:row>

		<aui:row>
			<aui:col span="2">
				Book file
			</aui:col>
			<aui:col span="4">
				<label class="btn btn-default btn-file"> Browse <input
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

	function uploadBook() {
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