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

	<liferay-ui:panel collapsible="true" defaultState="closed"
			title="google-drive-authorization-heading">
		
		<portlet:actionURL name="updateGDConfig" var="updateGDConfigURL"></portlet:actionURL>				
		<div style="display: none;"> 
		<aui:form action="<%=updateGDConfigURL%>" method="POST"
			id="googleDriveConfiguration" 
			name="googleDriveConfiguration">
	
			<aui:row>
				<%=LanguageUtil.get(pageContext, "Redirect URI host. For example: lib.tiis.pro") %>
				<aui:input 
						type="text"
						name="googleDriveRedirectUri"
						value="${googleDriveRedirectUri}"
						label="" />
			</aui:row>
			<aui:button-row>
				<aui:button type="submit" />
			</aui:button-row>
		</aui:form>
		</div>
		
		<aui:button-row>
			<div class="alert alert-info">
			  	<%=LanguageUtil.get(pageContext, "beta-version-auth") %>
			</div>
			<button type="button" class="btn btn-success" onclick="TiisBookUploader.authorizeInGoogleDrive()">
				<%=LanguageUtil.get(pageContext, "authorize-in-google-drive")%>
			</button>
			<button type="button" class="btn btn-danger" onclick="TiisBookUploader.revokeGoogleAPIToken()">
				<%=LanguageUtil.get(pageContext, "revoke-authorization-token")%>
			</button>
		</aui:button-row>
	</liferay-ui:panel>
	
	<form action="<%=createBookUrl%>" method="POST"
		id="<portlet:namespace />fm" name="<portlet:namespace />fm"
		enctype="multipart/form-data">

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
			<input type="button" class="btn btn-success" onclick="TiisBookUploader.uploadBook()"
				value=<%=LanguageUtil.get(pageContext, "book-upload") %> />
		</aui:button-row>

	</form>
	
</div>


<portlet:actionURL name="requestGoogleAPIToken" var="requestGoogleAPITokenURL"></portlet:actionURL>
<portlet:actionURL name="revokeGoogleAPIToken" var="revokeGoogleAPITokenURL"></portlet:actionURL>
<portlet:actionURL name="getGoogleAPITokenStatus" var="getGoogleAPITokenStatusURL"></portlet:actionURL>
		
<script>

AUI().use('aui-io-request', function(A) {
	
	TiisBookUploader = function(){
		
		var isCredentialValid;
		
		getGoogleAPITokenStatus();
		
		// if current credentials are valid, use them
		function getGoogleAPITokenStatus(callback) {
			A.io.request('${getGoogleAPITokenStatusURL}', {
				method : 'GET',
				dataType : 'json',
				on : {
					success : function() {
						var responseData = this.get('responseData');
									
						var isSuccessful = responseData["isSuccessful"];
						if (isSuccessful) {
							isCredentialValid = ("boolean" === typeof responseData.isCredentialValid) 
												? responseData.isCredentialValid : false;
							if ("function" === typeof callback) {
								callback();
							}
						} else {
							console.error("Failed to get status of Google Drive authorization token.");
						}
					},
					fail : function() {
						console.error("Failed to get status of Google Drive authorization token. Server error occurred.");
					}
				}
			});
		};
		
		var requestGoogleAPIToken = function(callback) {
			window.open('${googleDriveAuthURL}', 'blank', 'width=600,height=400');
			A.io.request('${requestGoogleAPITokenURL}', {
				method : 'POST',
				dataType : 'json',
				on : {
					success : function() {
						var responseData = this.get('responseData');
						
						var isSuccessful = responseData["isSuccessful"];
						if (isSuccessful) {
							isCredentialValid = true;
							swal('<%=LanguageUtil.get(pageContext, "") %>', '<%=LanguageUtil.get(pageContext, "token-recieved") %>', 'success');
							if ("function" === typeof callback) {
								callback();
							}
						} else {
							console.error("Authorization in Google Drive failed.");
						}
					},
					fail : function() {
						console.error("Authorization in Google Drive failed. Server error occurred.");
					}
				}
			});
		}
		
		return {
			authorizeInGoogleDrive: function() {
				if (isCredentialValid) {
					swal('', '<%=LanguageUtil.get(pageContext, "token-is-stil-valid") %>', 'success');

				} else {
					requestGoogleAPIToken();
				}
			},
			revokeGoogleAPIToken: function() {
				A.io.request('${revokeGoogleAPITokenURL}', {
					method : 'POST',
					dataType : 'json',
					on : {
						success : function() {
							var responseData = this.get('responseData');
							
							var isSuccessful = responseData["isSuccessful"];
							if (isSuccessful) {
								isCredentialValid = false;
								swal('<%=LanguageUtil.get(pageContext, "") %>', '<%=LanguageUtil.get(pageContext, "token-revoked") %>', 'success');

							} else {
								console.error("Failed to revoke Google Drive authorization token.");
							}
						},
						fail : function() {
							console.error("Failed to revoke Google Drive authorization token. Server error occurred.");
						}
					}
				});
			},
			uploadBook: function() {
				if (isCredentialValid) {
					upload();
				} else {
					requestGoogleAPIToken(upload);
				}
				
				function upload() {
					document.<portlet:namespace />fm.<portlet:namespace />bookDescription.value = window.<portlet:namespace />editor.getHTML();
					A.io.request('${createBookUrl}', {
						method : 'POST',
						dataType : 'json',
						form : {
							id : '<portlet:namespace />fm',
							upload : true
						},
						on : {
							complete : function(data, textStatus, jqXHR) {
								var responseData = JSON.parse(jqXHR.responseText);
								var isSuccessful = responseData["isSuccessful"];
								if (isSuccessful) {
									swal({
										  title: '<%=LanguageUtil.get(pageContext, "done") %>',
										  text: '<%=LanguageUtil.get(pageContext, "book-was-uploaded") %>',
										  type: 'success',
										  showCancelButton: false,
										  confirmButtonColor: '#3085d6',
										  cancelButtonColor: '#d33',
										  confirmButtonText: 'Ok'
										}).then(function () {
										  window.location.reload(true);
										})
								} else {
									swal('<%=LanguageUtil.get(pageContext, "error") %>', '<%=LanguageUtil.get(pageContext, "book-was-not-uploaded") %>', 'error');
								}
								
							},
							fail : function() {
								console.error("Failed to upload the book to Google Drive. Server error occurred.");
							}
						}
					});
				}
			}
		}
	}();
});
</script>