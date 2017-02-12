
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet"%>
<%@ taglib prefix="aui" uri="http://alloy.liferay.com/tld/aui"%>

<portlet:defineObjects />

<script src="http://code.jquery.com/jquery-2.0.2.min.js"></script>
<script src="http://code.jquery.com/ui/1.12.0/jquery-ui.min.js"></script>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.12.0/themes/smoothness/jquery-ui.css">

<portlet:actionURL name="createBook" var="createBookUrl"></portlet:actionURL>

<!-- <button id="createBook" class = "btn btn-primary" onClick = "openModal()">Create a new book</button> -->

<div id="createBookModal">

	<form action="<%=createBookUrl%>" method="POST"
		name="<portlet:namespace />fm" enctype="multipart/form-data">

		<table class="lfr-table">
			<tr>
				<td>Name</td>
				<td><input type="text" class="form-control"
					name="<portlet:namespace/>bookTitle" value="" /></td>
			</tr>
			<tr>
				<td>Description</td>
				<td>
					<textarea type="text" class="form-control"
						name="<portlet:namespace/>bookDescription"
						rows="5"> 
						</textarea>
				</td>
			</tr>
			<tr>
				<td>Category</td>
				<td>
					<select class="selectpicker" name = "<portlet:namespace/>bookCategory">
					  <option>Category 1</option>
					  <option>Category 2</option>
					  <option>Category 3</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>Logo file</td>
				<td><label class="btn btn-default btn-file"> 
					Browse <input
						type="file" name="<portlet:namespace/>bookLogo"
						accept="image/jpeg,image/bmp,image/png" style="display: none;" />
				</label></td>
			</tr>
			<tr>
				<td>Book file</td>
				<td><label class="btn btn-default btn-file"> 
					Browse <input
						type="file" name="<portlet:namespace/>bookPdfFile"
						accept="application/pdf" style="display: none;" />
				</label></td>
			</tr>
		</table>

		<br /> 
		
		<input type="submit" class="btn btn-success" value="Upload" />

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
</script>