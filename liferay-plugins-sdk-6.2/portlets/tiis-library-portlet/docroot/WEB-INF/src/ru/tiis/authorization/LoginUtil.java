package ru.tiis.authorization;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.CookieKeys;
import com.liferay.portal.kernel.util.GetterUtil;
import com.liferay.portal.kernel.util.Http;
import com.liferay.portal.kernel.util.PropsKeys;
import com.liferay.portal.kernel.util.PropsUtil;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.kernel.util.StringUtil;
import com.liferay.portal.kernel.util.Validator;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.model.Company;
import com.liferay.portal.model.User;
import com.liferay.portal.security.auth.AuthenticatedUserUUIDStoreUtil;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.util.PortalUtil;
import com.liferay.util.Encryptor;

public class LoginUtil {
	private static Log log = LogFactoryUtil.getLog(LoginUtil.class);
	
	private static final boolean SESSION_ENABLE_PHISHING_PROTECTION =
			GetterUtil.getBoolean(PropsUtil.get(PropsKeys.SESSION_ENABLE_PHISHING_PROTECTION)),
								 SESSION_STORE_PASSWORD =
			GetterUtil.getBoolean(PropsUtil.get(PropsKeys.SESSION_STORE_PASSWORD)),
								 SESSION_DISABLED =
			GetterUtil.getBoolean(PropsUtil.get(PropsKeys.SESSION_DISABLED)),
								 COMPANY_SECURITY_AUTH_REQUIRES_HTTPS =
			GetterUtil.getBoolean(PropsUtil.get(PropsKeys.COMPANY_SECURITY_AUTH_REQUIRES_HTTPS));
	
	private static final int COMPANY_SECURITY_AUTO_LOGIN_MAX_AGE =
			GetterUtil.getInteger(PropsUtil.get(PropsKeys.COMPANY_SECURITY_AUTO_LOGIN_MAX_AGE), CookieKeys.MAX_AGE);
	
	private static final String WEB_SERVER_PROTOCOL = PropsUtil.get(PropsKeys.WEB_SERVER_PROTOCOL);
	private static final String[] SESSION_PHISHING_PROTECTED_ATTRIBUTES =
			PropsUtil.getArray(PropsKeys.SESSION_PHISHING_PROTECTED_ATTRIBUTES);

	public static void login(HttpServletRequest request, HttpServletResponse response,
			String login, boolean rememberMe) throws Exception {
		CookieKeys.validateSupportCookie(request);

		HttpSession session = request.getSession();

		Company company = PortalUtil.getCompany(request);
		
		User user = UserLocalServiceUtil.getUserByScreenName(company.getCompanyId(), login);
		long userId = user.getUserId();
		String password = user.getPassword();

		if (SESSION_ENABLE_PHISHING_PROTECTION) {
			session = renewSession(request, session);
		}

		// Set cookies

		String domain = CookieKeys.getDomain(request);

		String userIdString = String.valueOf(userId);

		session.setAttribute("j_username", userIdString);

		session.setAttribute("j_password", password);
		
		session.setAttribute("j_remoteuser", userIdString);

		if (SESSION_STORE_PASSWORD) {
			session.setAttribute(WebKeys.USER_PASSWORD, password);
		}

		Cookie companyIdCookie = new Cookie(
			CookieKeys.COMPANY_ID, String.valueOf(company.getCompanyId()));

		if (Validator.isNotNull(domain)) {
			companyIdCookie.setDomain(domain);
		}

		companyIdCookie.setPath(StringPool.SLASH);

		Cookie idCookie = new Cookie(
			CookieKeys.ID,
			Encryptor.encrypt(company.getKeyObj(), userIdString));

		if (Validator.isNotNull(domain)) {
			idCookie.setDomain(domain);
		}

		idCookie.setPath(StringPool.SLASH);

		Cookie passwordCookie = new Cookie(
			CookieKeys.PASSWORD,
			Encryptor.encrypt(company.getKeyObj(), password));

		if (Validator.isNotNull(domain)) {
			passwordCookie.setDomain(domain);
		}

		passwordCookie.setPath(StringPool.SLASH);

		Cookie rememberMeCookie = new Cookie(
			CookieKeys.REMEMBER_ME, Boolean.TRUE.toString());

		if (Validator.isNotNull(domain)) {
			rememberMeCookie.setDomain(domain);
		}

		rememberMeCookie.setPath(StringPool.SLASH);

		int loginMaxAge = COMPANY_SECURITY_AUTO_LOGIN_MAX_AGE;

		String userUUID = userIdString.concat(StringPool.PERIOD).concat(
			String.valueOf(System.nanoTime()));

		Cookie userUUIDCookie = new Cookie(
			CookieKeys.USER_UUID,
			Encryptor.encrypt(company.getKeyObj(), userUUID));

		userUUIDCookie.setPath(StringPool.SLASH);

		session.setAttribute(WebKeys.USER_UUID, userUUID);

		if (SESSION_DISABLED) {
			rememberMe = true;
		}

		if (rememberMe) {
			companyIdCookie.setMaxAge(loginMaxAge);
			idCookie.setMaxAge(loginMaxAge);
			passwordCookie.setMaxAge(loginMaxAge);
			rememberMeCookie.setMaxAge(loginMaxAge);
			userUUIDCookie.setMaxAge(loginMaxAge);
		}
		else {
			companyIdCookie.setMaxAge(-1);
			idCookie.setMaxAge(-1);
			passwordCookie.setMaxAge(-1);
			rememberMeCookie.setMaxAge(0);
			userUUIDCookie.setMaxAge(-1);
		}

		Cookie loginCookie = new Cookie(CookieKeys.LOGIN, login);

		if (Validator.isNotNull(domain)) {
			loginCookie.setDomain(domain);
		}

		loginCookie.setMaxAge(loginMaxAge);
		loginCookie.setPath(StringPool.SLASH);

		Cookie screenNameCookie = new Cookie(
			CookieKeys.SCREEN_NAME,
			Encryptor.encrypt(company.getKeyObj(), user.getScreenName()));

		if (Validator.isNotNull(domain)) {
			screenNameCookie.setDomain(domain);
		}

		screenNameCookie.setMaxAge(loginMaxAge);
		screenNameCookie.setPath(StringPool.SLASH);

		boolean secure = request.isSecure();

		if (secure && !COMPANY_SECURITY_AUTH_REQUIRES_HTTPS &&
			!StringUtil.equalsIgnoreCase(
				Http.HTTPS, WEB_SERVER_PROTOCOL)) {

			Boolean httpsInitial = (Boolean)session.getAttribute("HTTPS_INITIAL");

			if ((httpsInitial == null) || !httpsInitial.booleanValue()) {
				secure = false;
			}
		}

		CookieKeys.addCookie(request, response, companyIdCookie, secure);
		CookieKeys.addCookie(request, response, idCookie, secure);
		CookieKeys.addCookie(request, response, userUUIDCookie, secure);

		if (rememberMe) {
			CookieKeys.addCookie(request, response, loginCookie, secure);
			CookieKeys.addCookie(request, response, passwordCookie, secure);
			CookieKeys.addCookie(request, response, rememberMeCookie, secure);
			CookieKeys.addCookie(request, response, screenNameCookie, secure);
		}

		AuthenticatedUserUUIDStoreUtil.register(userUUID);
	}

	public static HttpSession renewSession(HttpServletRequest request, HttpSession session)
		throws Exception
	{
		// Invalidate the previous session to prevent phishing

		String[] protectedAttributeNames = SESSION_PHISHING_PROTECTED_ATTRIBUTES;

		Map<String, Object> protectedAttributes = new HashMap<String, Object>();

		for (String protectedAttributeName : protectedAttributeNames) {
			Object protectedAttributeValue = session.getAttribute(
				protectedAttributeName);

			if (protectedAttributeValue == null) {
				continue;
			}

			protectedAttributes.put(
				protectedAttributeName, protectedAttributeValue);
		}

		try {
			session.invalidate();
		}
		catch (IllegalStateException ise) {

			// This only happens in Geronimo

			if (log.isWarnEnabled()) {
				log.warn(ise.getMessage());
			}
		}

		session = request.getSession(true);

		for (String protectedAttributeName : protectedAttributeNames) {
			Object protectedAttributeValue = protectedAttributes.get(
				protectedAttributeName);

			if (protectedAttributeValue == null) {
				continue;
			}

			session.setAttribute(
				protectedAttributeName, protectedAttributeValue);
		}

		return session;
	}
}
