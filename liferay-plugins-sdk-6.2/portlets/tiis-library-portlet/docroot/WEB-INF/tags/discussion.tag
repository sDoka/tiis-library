<%@ tag	import="java.util.ArrayList"%>
<%@ tag import="java.util.List"%>
<%@ tag import="com.liferay.portal.util.PortalUtil"%>
<%@ tag import="com.liferay.portal.kernel.json.JSONFactoryUtil"%>
<%@ tag import="com.liferay.portal.kernel.json.JSONArray"%>
<%@ tag import="com.liferay.portal.kernel.language.LanguageUtil"%>
<%@ tag import="com.liferay.portal.model.User"%>
<%@ tag import="com.liferay.portal.service.UserLocalServiceUtil"%>
<%@ tag import="com.liferay.portal.service.ServiceContext"%>
<%@ tag	import="com.liferay.portlet.messageboards.service.MBMessageLocalServiceUtil"%>
<%@ tag	import="com.liferay.portlet.messageboards.model.MBMessage"%>
<%@ tag import="ru.tiis.discussion.MessageBean"%>
<%@ tag import="ru.tiis.library.service.model.BookModel"%>

<%@ tag body-content="empty"%>
<%@ attribute name="classPK" required="true" rtexprvalue="true"
	type="java.lang.Long"%>
<%@ attribute name="className" required="true" rtexprvalue="true"
	type="java.lang.String"%>
<%@ attribute name="userId" required="true" rtexprvalue="true"
	type="java.lang.Long"%>
<%@ attribute name="themeDisplay" required="true" rtexprvalue="true"
	type="com.liferay.portal.theme.ThemeDisplay"%>
	
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui"%>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui"%>
<%@ taglib uri="http://java.sun.com/portlet" prefix="portlet"%>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet"%>

<link rel="stylesheet" href="/it-deutsch-portlet/css/discussion/discussion.css">

<script type="text/javascript" src="/it-deutsch-portlet/lib/jquery-timeago/jquery.timeago.js"></script>
<script src="//www.google.com/recaptcha/api.js?onload=loadRecaptcha&render=explicit&hl=${themeDisplay.locale.language}" 
		async defer></script>
<script src='/it-deutsch-portlet/js/comments/comments.js'></script>
<script type="text/html" id="display_template"><%@include file="/html/comments/templates/commenttemplate.html" %></script>
<script type="text/html" id="no_comments_page"><%@include file="/html/comments/templates/nocommentpage.html" %></script>

<%-- Initialize variables --%>
<c:set var="groupId" value="${themeDisplay.companyGroupId}"/>
<c:set var="threadId" value="0"/>
<c:set var="rootMessageId" value="0"/>

<% 	
	BookModel book = (BookModel) request.getAttribute("course");
	long bookId = 0;//course.getCourseId();	
	if (book != null) { 
		bookId = book.getBookId();
	};	
%>
								
<%-- Display comments form--%>

<div id="main">
	<div class="row-fluid">						
	<%--show messages--%>		
		<div class="span12">	
			<h3 id="commentsHeader"></h3>
				<div id="comments">				
																						
				</div>
			<button class="long-button" type="button" id="showMoreComments" style="display:none;">
			<%=LanguageUtil.get(themeDisplay.getLocale(), "show-more-comments")%>
			</button>				
		</div>
	</div>

	<div class="row-fluid">	
		<%-- Add comments form --%>
		<c:choose>
			<c:when test="${!themeDisplay.permissionChecker.isSignedIn()}">
				<div class="span4 offset6 please-login-container">
					<a href="/c/portal/login"><%=LanguageUtil.get(themeDisplay.getLocale(), "login")%></a> 
					<%=LanguageUtil.get(themeDisplay.getLocale(), "to-add-comment")%>
				</div>	
			</c:when>
			<c:otherwise>	
				<div class="span12">	
					<div class="row-fluid">
							<div class="span5" style="padding:5px">
								<h3><%=LanguageUtil.get(themeDisplay.getLocale(), "add-comment")%></h3>
								<hr style="width:148px;">
								<div class="row-fluid">
									<div class="span2">
										<img class="user-portrait" src="${themeDisplay.user.getPortraitURL(themeDisplay)}" />
									</div>
									<div class="span9">
										<span class="comments-gray-text-font"><%=LanguageUtil.get(themeDisplay.getLocale(), "comment-will-be-added-as")%></span>
										<span class="comments-black-text-font">${themeDisplay.user.fullName}</span>
									</div>
								</div>
							</div>					
							<div class="span5 comments-form" id="comments-form" style="padding:5px; margin:0; background-color:#F7F7F7; width:59.82906%;">
								<input type="text" name="subject" id="subject" placeholder='<%=LanguageUtil.get(themeDisplay.getLocale(), "subject")%>' 
								class="comments-input-border comments-gray-text-font comments-input-subject"/>
								<textarea name="comment" id="comment" class="comments-input-border comments-gray-text-font comments-input-comment" 
								placeholder='<%=LanguageUtil.get(themeDisplay.getLocale(), "comment")%>'></textarea>								
								<div class="row-fluid recaptcha-container">			
									<div id="g-recaptcha" class="g-recaptcha span8" style="min-width: 295px;"
											data-sitekey="6LdVSQITAAAAADTJsWgkmQ-7OsljM0s05jlSADhh"></div>  	
									<div class="span3 comments-form-button ">																						
									<a class="btn btn-green" type="button" name="submit"
										onClick="javascript:submit(${groupId}, ${classPK}, 
										'${className}', ${userId}, ${threadId}, ${rootMessageId}, 
										grecaptcha.getResponse(), <%=bookId%>)">
										<%=LanguageUtil.get(themeDisplay.getLocale(), "submit")%></a>		
									</div>
								</div>	
							</div>								
					</div>	
				</div>			
			</c:otherwise>
		</c:choose>
	</div>
</div>

<script type="text/javascript"> 

	//variables used for rendering and adding comment entries
	var discussionParams = {};
	discussionParams.userId = <%=userId%>;
	discussionParams.classPK = "<%=classPK%>";
	discussionParams.className = "<%=className%>";
	discussionParams.userHasMessagePermissionsParam = <%=userHasMessagePermissions%>;
	discussionParams.commentsHeaderText = "<%=LanguageUtil.get(themeDisplay.getLocale(), "comments") %>";

	AUI().ready(function () {
		displayComments(discussionParams.classPK, discussionParams.className);
	});

	DiscussionController = function(){
		
		var captchaContainer = null;
		var loadRecaptcha = function() {
			captchaContainer = grecaptcha.render('g-recaptcha', {
				'sitekey' : '6LdVSQITAAAAADTJsWgkmQ-7OsljM0s05jlSADhh',
				'callback' : function(response) {}
			});
		};
		
		function submit(groupId, 
				classPK, 
				className, 
				userId, 
				threadId, 
				parentMessageId, 
				recaptchaResponse, 
				courseId) {
			AUI().ready(function () {
				var subject;
				var comment;		
					subject = document.getElementById("subject").value;
					comment = document.getElementById("comment").value;
				
				Liferay.Service(
				  '/it-deutsch-portlet.messagessection/check-re-captcha-challange-and-submit',
				  {
				    gReCaptchaResponse: recaptchaResponse,							    
				    groupId: groupId,
					className: className,
					classPK: classPK,
					permissionClassName: className,
					permissionClassPK: classPK,
					permissionOwnerId: userId,
					threadId: threadId,
					parentMessageId: parentMessageId,
					subject: subject,
					body: comment,
					courseId: courseId
				  },
				  function(obj) {
				    var checkResult = JSON.parse(obj);
	
					if (checkResult.success) {
						document.getElementById("subject").value = "";
						document.getElementById("comment").value = "";
						displayComments(<%=classPK %>, '<%=className %>');
					}
					grecaptcha.reset();
				  }
				);					
			});	
		}
	}
</script>	