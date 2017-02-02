package ru.tiis.hook.login;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.NameValuePair;
import org.apache.http.client.utils.URLEncodedUtils;
import org.apache.http.message.BasicNameValuePair;




import ru.tiis.authorization.DefaultOAuthService;
import ru.tiis.authorization.LoginUtil;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.json.JSONFactoryUtil;
import com.liferay.portal.kernel.json.JSONObject;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.struts.BaseStrutsAction;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.kernel.util.Validator;
import com.liferay.portal.kernel.util.WebKeys;
import com.liferay.portal.model.User;
import com.liferay.portal.service.UserLocalServiceUtil;
import com.liferay.portal.theme.ThemeDisplay;

public class OAuthAction extends BaseStrutsAction {
	private static Log log = LogFactoryUtil.getLog(OAuthAction.class);
	
	private static final String LOGIN_URL =
			"/home?p_p_id=58&p_p_state=maximized&_58_struts_action=/login/login";
	private static final String CREATE_ACCOUNT_URL =
			"/home?p_p_id=58&p_p_state=maximized&_58_struts_action=/login/create_account&";
	
	private static DefaultOAuthService oauthService = DefaultOAuthService.getInstance();
	
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws IOException {
		ThemeDisplay themeDisplay = (ThemeDisplay)request.getAttribute(WebKeys.THEME_DISPLAY);
		
		if(themeDisplay.getPermissionChecker().isSignedIn()) {
			//TODO ask bisuness team, where to redirect, if user is already signed in
			response.sendRedirect(StringPool.FORWARD_SLASH);
			return StringPool.BLANK;
		}
		
		String oauthCode = ParamUtil.get(request, "code", StringPool.BLANK);
		String oauthState = ParamUtil.get(request, "state", StringPool.BLANK);

		
		if (StringPool.BLANK.equals(oauthCode)
			 ||	StringPool.BLANK.equals(oauthState)) {
			
			log.info("Oauth code or oauth state is undefined. Redirecting to login page.");
			response.sendRedirect(LOGIN_URL);
			return StringPool.BLANK;
		}
		
		JSONObject userInfoJson = JSONFactoryUtil.createJSONObject();
		try {
			userInfoJson = oauthService.getAuthorizingUserInfo(
					themeDisplay.getPortalURL(), oauthCode, oauthState);
		} catch (PortalException e) {
			log.error(e.getMessage());
		}
		
		if (userInfoJson.length() > 0) {
			
			String email = userInfoJson.getString("email", StringPool.BLANK);
			User user = null;
			
			if (!StringPool.BLANK.equals(email)) {
				try {
					user = UserLocalServiceUtil.fetchUserByEmailAddress(
							themeDisplay.getCompanyId(), email);
				} catch (SystemException e) {
					log.error("Failed to fetch user by email : " + email + ". " + e.getMessage());
				}
			}
			
			if (Validator.isNull(user)) {					
				String firstName = userInfoJson.getString("first_name", StringPool.BLANK);
				String middleName = userInfoJson.getString("middle_name", StringPool.BLANK);
				String lastName = userInfoJson.getString("last_name", StringPool.BLANK);
				String screenName = userInfoJson.getString("screen_name", StringPool.BLANK);
				
				if (StringPool.BLANK.equals(screenName) ||
						screenName.equals("id" + userInfoJson.getString("uid"))
						&& !StringPool.BLANK.equals(email)) {
					screenName = email.split("@")[0];
				}
				
				List<NameValuePair> redirectParams = new LinkedList<NameValuePair>();
				redirectParams.add(new BasicNameValuePair("_58_email", email));
				redirectParams.add(new BasicNameValuePair("_58_first_name", firstName));
				redirectParams.add(new BasicNameValuePair("_58_middle_name", middleName));
				redirectParams.add(new BasicNameValuePair("_58_last_name", lastName));
				redirectParams.add(new BasicNameValuePair("_58_screen_name", screenName));
				
				String redirectParamsString = URLEncodedUtils.format(redirectParams, "UTF-8");
				String redirectUrl = CREATE_ACCOUNT_URL + redirectParamsString;
				response.sendRedirect(redirectUrl);
				
				return StringPool.BLANK;
			}

			String login = user.getScreenName();
			boolean rememberMe = true;
			try {
				LoginUtil.login(request, response, login, rememberMe);
			} catch (Exception e) {
				log.error("Failed to sign in user with sceen name : " + login + ". " + e.getMessage());
			}
			
			response.sendRedirect(StringPool.FORWARD_SLASH);
		} else {
			response.sendRedirect(CREATE_ACCOUNT_URL);
		}

		return StringPool.BLANK;
	}
}
