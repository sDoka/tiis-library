
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib prefix="aui" uri="http://alloy.liferay.com/tld/aui"%>

<portlet:defineObjects />

<portlet:actionURL name="createBook" var="createBookUrl"></portlet:actionURL>

<!-- <button id="createBook" class = "btn btn-primary" onClick = "openModal()">Create a new book</button> -->

<div id="createBookModal">

	<form action="<%=createBookUrl%>" method="POST"
		id="<portlet:namespace />fm" name="<portlet:namespace />fm"
		enctype="multipart/form-data">


		<aui:col>
			<aui:row cssClass="col col-sm-2">
				Name
			</aui:row>
			<aui:row cssClass="col col-sm-2">
				<input type="text" class="form-control"
					name="<portlet:namespace/>bookTitle" value="" />
			</aui:row>
		</aui:col>

		<aui:col>
			<aui:row cssClass="col col-sm-2">
				Description
			</aui:row>
			<aui:row cssClass="col col-sm-2">
				<textarea class="form-control" name="<portlet:namespace/>bookDescription" rows="5"></textarea>
			</aui:row>
		</aui:col>

		<aui:col>
			<aui:row cssClass="col col-sm-2">
				Category
			</aui:row>
			<aui:row cssClass="col col-sm-2">
				<select class="selectpicker" name="<portlet:namespace/>bookCategory">
					<option>Category 1</option>
					<option>Category 2</option>
					<option>Category 3</option>
				</select>
			</aui:row>
		</aui:col>

		<aui:col>
			<aui:row cssClass="col col-sm-2">
				Logo file
			</aui:row>
			<aui:row cssClass="col col-sm-2">
				<label class="btn btn-default btn-file"> Browse <input
					type="file" name="<portlet:namespace/>bookLogo"
					accept="image/jpeg,image/bmp,image/png" style="display: none;" />
				</label>
			</aui:row>
		</aui:col>

		<aui:col>
			<aui:row cssClass="col col-sm-2">
				Book file
			</aui:row>
			<aui:row cssClass="col col-sm-2">
				<label class="btn btn-default btn-file"> Browse <input
					type="file" name="<portlet:namespace/>bookPdfFile"
					accept="application/pdf" style="display: none;" />
				</label>
			</aui:row>
		</aui:col>

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