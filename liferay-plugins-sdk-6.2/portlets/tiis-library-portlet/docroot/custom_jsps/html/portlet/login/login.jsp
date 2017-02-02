<%--
/**
 * Copyright (c) 2000-2013 Liferay, Inc. All rights reserved.
 *
 * This library is free software; you can redistribute it and/or modify it under
 * the terms of the GNU Lesser General Public License as published by the Free
 * Software Foundation; either version 2.1 of the License, or (at your option)
 * any later version.
 *
 * This library is distributed in the hope that it will be useful, but WITHOUT
 * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
 * FOR A PARTICULAR PURPOSE. See the GNU Lesser General Public License for more
 * details.
 */
--%>
<%@ include file="/html/portlet/login/init.jsp"%>

<!--TODO Remove this block after dev -->
<%@ taglib uri="http://java.sun.com/portlet_2_0" prefix="portlet" %>
<%@ taglib uri="http://liferay.com/tld/aui" prefix="aui" %>
<%@ taglib uri="http://liferay.com/tld/portlet" prefix="liferay-portlet" %>
<%@ taglib uri="http://liferay.com/tld/security" prefix="liferay-security" %>
<%@ taglib uri="http://liferay.com/tld/theme" prefix="liferay-theme" %>
<%@ taglib uri="http://liferay.com/tld/ui" prefix="liferay-ui" %>
<%@ taglib uri="http://liferay.com/tld/util" prefix="liferay-util" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!--  -->
<c:if test="<%=windowState.equals(WindowState.MAXIMIZED) %>" >
	<link href="/tiis-library-portlet/css/custom_jsps/login/login_page.css" rel="stylesheet">
</c:if>

<c:choose>
	<c:when test="<%=themeDisplay.isSignedIn()%>">
		<%
		String signedInAs = HtmlUtil.escape(user.getFullName());
		if (themeDisplay.isShowMyAccountIcon()
				&& (themeDisplay.getURLMyAccount() != null)) {
			String myAccountURL = String.valueOf(themeDisplay
					.getURLMyAccount());

			if (PropsValues.DOCKBAR_ADMINISTRATIVE_LINKS_SHOW_IN_POP_UP) {
				signedInAs = "<a class=\"signed-in\" href=\"javascript:Liferay.Util"
								+ ".openWindow({dialog: {destroyOnHide: true}, title: '"
								+ HtmlUtil.escapeJS(LanguageUtil.get(pageContext, "my-account"))
								+ "', uri: '"
								+ HtmlUtil.escapeJS(myAccountURL)
								+ "'});\">" + signedInAs + "</a>";
			} else {
				myAccountURL = HttpUtil.setParameter(myAccountURL,
								"controlPanelCategory",
								PortletCategoryKeys.MY);

				signedInAs = "<a class=\"signed-in\" href=\""
								+ HtmlUtil.escape(myAccountURL) + "\">"
								+ signedInAs + "</a>";
			}
		}
		LanguageUtil.format(pageContext, "you-are-signed-in-as-x", signedInAs, false);
		%>
	</c:when>
	<c:otherwise>
		<%
		String redirect = ParamUtil.getString(request, "redirect");
		String login = LoginUtil
				.getLogin(request, "login", company);
		String password = StringPool.BLANK;
		boolean rememberMe = ParamUtil.getBoolean(request, "rememberMe");

		if (Validator.isNull(authType)) {
			authType = company.getAuthType();
		}
		
		boolean isSecure = PropsValues.COMPANY_SECURITY_AUTH_REQUIRES_HTTPS
							|| request.isSecure();
		%>

		<portlet:actionURL secure="<%=isSecure %>" var="loginURL">
			<portlet:param name="struts_action" value="/login/login" />
		</portlet:actionURL>

		<aui:form action="<%=loginURL %>"
			autocomplete='<%=PropsValues.COMPANY_SECURITY_LOGIN_FORM_AUTOCOMPLETE
								? "on"
								: "off"%>'
			cssClass="sign-in-form" method="post" name="fm">
			<aui:input name="saveLastPath" type="hidden" value="<%=false%>" />
			<aui:input name="redirect" type="hidden" value="<%=redirect%>" />
			<aui:input name="doActionAfterLogin" type="hidden"
				value="<%=portletName.equals(PortletKeys.FAST_LOGIN)
								? true
								: false%>" />

			<c:choose>
				<c:when
					test='<%=SessionMessages.contains(request, "userAdded") %>'>

					<%
						String userEmailAddress = (String) SessionMessages
													.get(request, "userAdded");
						String userPassword = (String) SessionMessages
													.get(request, "userAddedPassword");
					%>

					<div class="alert alert-success">
						<c:choose>
							<c:when test="<%=company.isStrangersVerify()
											|| Validator.isNull(userPassword)%>">
								<%=LanguageUtil.get(pageContext,
														"thank-you-for-creating-an-account")%>

								<c:if test="<%=company.isStrangersVerify()%>">
									<%=LanguageUtil.format(pageContext,
															"your-email-verification-code-has-been-sent-to-x",
															userEmailAddress)%>
									<aui:script>
										window.onload = function() {
											swal(
													Liferay.Language
															.get('success'),
													'<%= LanguageUtil.format(pageContext,
															"your-email-verification-code-has-been-sent-to-x",
															userEmailAddress) %>',
															"success");
										}
									</aui:script>
								</c:if>
							</c:when>
							<c:otherwise>
								<%=LanguageUtil.format(pageContext,
														"thank-you-for-creating-an-account.-your-password-is-x",
														userPassword, false)%>
							</c:otherwise>
						</c:choose>

						<c:if
							test="<%=PrefsPropsUtil.getBoolean(
											company.getCompanyId(),
											PropsKeys.ADMIN_EMAIL_USER_ADDED_ENABLED)%>">
							<%=LanguageUtil.format(pageContext,
											"your-password-has-been-sent-to-x",
											userEmailAddress)%>
						</c:if>
					</div>
				</c:when>
				
				<c:when test='<%=SessionMessages.contains(request, "userPending")%>'>

					<%
						String userEmailAddress = (String) SessionMessages
													.get(request, "userPending");
					%>

					<div class="alert alert-success">
						<%=LanguageUtil.format(pageContext,
												"thank-you-for-creating-an-account.-you-will-be-notified-via-email-at-x-when-your-account-has-been-approved",
												userEmailAddress)%>
					</div>
				</c:when>
			</c:choose>

			<liferay-ui:error exception="<%=AuthException.class%>"
				message="authentication-failed" />
			<liferay-ui:error exception="<%=CompanyMaxUsersException.class%>"
				message="unable-to-login-because-the-maximum-number-of-users-has-been-reached" />
			<liferay-ui:error exception="<%=CookieNotSupportedException.class%>"
				message="authentication-failed-please-enable-browser-cookies" />
			<liferay-ui:error exception="<%=NoSuchUserException.class%>"
				message="authentication-failed" />
			<liferay-ui:error exception="<%=PasswordExpiredException.class%>"
				message="your-password-has-expired" />
			<liferay-ui:error exception="<%=UserEmailAddressException.class%>"
				message="authentication-failed" />
			<liferay-ui:error exception="<%=UserLockoutException.class%>"
				message="this-account-has-been-locked" />
			<liferay-ui:error exception="<%=UserPasswordException.class%>"
				message="authentication-failed" />
			<liferay-ui:error exception="<%=UserScreenNameException.class%>"
				message="authentication-failed" />

			<aui:fieldset>

				<%
					String loginLabel = null;
					if (authType.equals(CompanyConstants.AUTH_TYPE_EA)) {
						loginLabel = "email-address";
					} else if (authType
							.equals(CompanyConstants.AUTH_TYPE_SN)) {
						loginLabel = "screen-name";
					} else if (authType
							.equals(CompanyConstants.AUTH_TYPE_ID)) {
						loginLabel = "id";
					}
				%>

				<aui:input
					autoFocus="<%=windowState.equals(LiferayWindowState.EXCLUSIVE)
										|| windowState.equals(WindowState.MAXIMIZED)%>"
					cssClass="clearable" label="<%=loginLabel%>" name="login"
					showRequiredLabel="<%=false%>" type="text" value="<%=login%>">
				</aui:input>

				<aui:input name="password" showRequiredLabel="<%=false%>"
							type="password" value="<%=password%>" />


				<span id="<portlet:namespace />passwordCapsLockSpan"
					style="display: none;"><liferay-ui:message
						key="caps-lock-is-on" /></span>

				<c:if test="<%=company.isAutoLogin()
								&& !PropsValues.SESSION_DISABLED%>">
					<aui:input checked="<%=rememberMe%>" name="rememberMe" type="checkbox" />
				</c:if>
			
			</aui:fieldset>

			<%
				String vkClientId = PropsUtil.get("oauth.vk.client_id");
				String fbClientId = PropsUtil.get("oauth.fb.client_id");
				String googleClientId = PropsUtil.get("oauth.gp.client_id");
				
				String oauthRedirectUrl = themeDisplay.getPortalURL() + "/c/portal/oauth";
				String vkOauthUrl = "https://oauth.vk.com/authorize?client_id=" + vkClientId
						+ "&display=popup&redirect_uri=" + HttpUtil.encodeURL(oauthRedirectUrl)
						+ "&scope=email&response_type=code&state=vk";
				String fbOauthUrl = "https://www.facebook.com/dialog/oauth?client_id=" + fbClientId
						+ "&redirect_uri=" + HttpUtil.encodeURL(oauthRedirectUrl) + "&scope=email&state=fb";
				String googleOauthUrl = "https://accounts.google.com/o/oauth2/v2/auth?redirect_uri="
						+ oauthRedirectUrl + "&response_type=code&client_id=" + googleClientId
						+ "&scope=https://www.googleapis.com/auth/plus.me+https://www.googleapis.com"
						+ "/auth/userinfo.email&state=gp";
			%>
			<div class="row-fluid">
				<div class="span4 offset4 sign-in-btn-container">
						<aui:button class="btn btn-success btn-sign-in" type="submit" value="sign-in" />
				</div>
			</div>
			
			<aui:button-row>
				<div id="socialLoginButtonsSet" class="row-fluid">
					
					<a class="btn btn-vk span4"
						style="background: #50739a; color: white;"
						href='<%=vkOauthUrl %>'>
  						<span class="fa fa-vk"></span>
					</a>
					<a class="btn btn-google-plus span4"
						style="background: #dd4b39; color: white;"
						href='<%=googleOauthUrl%>'>
  						<span class="fa fa-google-plus"></span>
					</a>
					<a class="btn btn-facebook span4"
						style="background: #2b4b90; color: white;"
						href='<%=fbOauthUrl %>'>
  						<span class="fa fa-facebook"></span>
					</a>
				</div>
			</aui:button-row>
		</aui:form>
		
		<liferay-util:include page="/html/portlet/login/navigation.jsp" />

		<aui:script use="aui-base">
			var password = A.one('#<portlet:namespace />password');

			if (password) {
				password.on('keypress', function(event) {
					Liferay.Util.showCapsLock(event,
							'<portlet:namespace />passwordCapsLockSpan');
				});
			}
		</aui:script>
		
		<%--  custom validator to escape onBlur validation --%>
		<%-- https://issues.liferay.com/browse/AUI-1319 for more info --%>
		<aui:script>
			AUI().use(
					'aui-form-validator',
					function(A) {
						rules = {};
						rules['<portlet:namespace />' + 'login'] = {
							required : true,
						};
						rules['<portlet:namespace />' + 'password'] = {
							required : true,

						};

						self.formValidator = new A.FormValidator({
							boundingBox : document
									.getElementById('<portlet:namespace />'
											+ 'fm'),
							rules : rules,
							validateOnBlur : false
						});
					});
			AUI().ready('aui-module', function(A){
				try {
					$('#main').css('padding-bottom', '0px');
					$('#wrapper').css('height', screen.height - 195);
				} catch (err) {}
			});
		</aui:script>
	</c:otherwise>
</c:choose>
