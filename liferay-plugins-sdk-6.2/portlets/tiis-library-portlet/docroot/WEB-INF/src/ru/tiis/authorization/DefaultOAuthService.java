package ru.tiis.authorization;

import java.io.IOException;
import java.util.LinkedList;
import java.util.List;

import org.apache.http.NameValuePair;
import org.apache.http.client.fluent.Request;
import org.apache.http.client.utils.URLEncodedUtils;
import org.apache.http.message.BasicNameValuePair;


import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.json.JSONException;
import com.liferay.portal.kernel.json.JSONFactoryUtil;
import com.liferay.portal.kernel.json.JSONObject;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.util.PropsUtil;
import com.liferay.portal.kernel.util.StringPool;
import com.liferay.portal.kernel.util.Validator;

public class DefaultOAuthService {
	private static Log log = LogFactoryUtil.getLog(DefaultOAuthService.class);
	
	private static final String VK_MODE = "vk";
	private static final String FACEBOOK_MODE = "fb";
	private static final String GOOGLE_MODE = "gp";

	private static final String VK_ACCESS_TOKEN_URL =
									"https://oauth.vk.com/access_token?";
	private static final String FB_ACCESS_TOKEN_URL =
									"https://graph.facebook.com/oauth/access_token?";
	private static final String GP_ACCESS_TOKEN_URL =
									"https://www.googleapis.com/oauth2/v4/token";
	
	private static final String VK_API_PATH = "https://api.vk.com/method";
	private static final String FB_API_PATH = "https://graph.facebook.com";
	private static final String GP_API_PATH = "https://www.googleapis.com";
	
	private static final String REDIRECT_PATH = "/c/portal/oauth";
	
	private static volatile DefaultOAuthService instance = null;
	private DefaultOAuthService() {}
	public static DefaultOAuthService getInstance() {
		if (instance == null)
            synchronized (DefaultOAuthService.class) {
                if (instance == null)
                    instance = new DefaultOAuthService();
            }
        return instance;
	}
	
	/**
	 * Gets information about user, who tries to authorize through social network.<br>
	 * @param portalUrl - current domain URL;
	 * @param oauthCode - code, received from request parameter "code"
	 * @param oauthMode - social network id, received from request parameter "state"; <br>
	 * F.e. "vk" or "fb"
	 * @return - user's information in JSON format.<br>
	 * F.e. {"uid":22276785,"screen_name":"test","last_name":"test","first_name":"test","email":"test@test.ru"}
	 * @throws PortalException
	 */
	public JSONObject getAuthorizingUserInfo(String portalUrl, String oauthCode, String oauthMode)
			throws PortalException {

		JSONObject accessTokenResponseJSON = getAccessTokenResponse(portalUrl, oauthMode, oauthCode);
		return getUserInfo(oauthMode, accessTokenResponseJSON);
	}
	
	/**
	 * Sends request to social network (vk, fb, google, etc) and returns response with token information.<br>
	 * 
	 * @param portalUrl - current domain URL;
	 * @param oauthMode - type of authorization ({@link #VK_MODE}, {@link #FACEBOOK_MODE}, {@link #GOOGLE_MODE})
	 * @param code - code, received from social network. (From request param "code")
	 * @return - info about social network user in JSON format. <br>
	 * F.e. - {"access_token":"3232fff32f23f...", "expires_in":"86396", "user_id":"56516", "email":"test@test.ru"}
	 */
	private JSONObject getAccessTokenResponse(String portalUrl, String oauthMode, String code) {
		JSONObject responseJSON = JSONFactoryUtil.createJSONObject();
		
		//log.info("Getting access token response");
		String clientId = PropsUtil.get("oauth." + oauthMode + ".client_id"),
				secret = PropsUtil.get("oauth." + oauthMode + ".secret");
		
		String accessTokenBaseUrl =
				(VK_MODE.equals(oauthMode) ? VK_ACCESS_TOKEN_URL :
				(FACEBOOK_MODE.equals(oauthMode) ? FB_ACCESS_TOKEN_URL :
				(GOOGLE_MODE.equals(oauthMode) ? GP_ACCESS_TOKEN_URL : null)));
		
		if (Validator.isNull(accessTokenBaseUrl)) {
			log.error("Unknown resource: " + oauthMode);
			return responseJSON;
		}
		
		List<NameValuePair> params = new LinkedList<NameValuePair>();
		params.add(new BasicNameValuePair("code", code));
		params.add(new BasicNameValuePair("client_id", clientId));
		params.add(new BasicNameValuePair("client_secret", secret));
		params.add(new BasicNameValuePair("redirect_uri", portalUrl + REDIRECT_PATH));
		params.add(new BasicNameValuePair("grant_type", "authorization_code"));
		
		String response = StringPool.BLANK;
		try {
			if (GOOGLE_MODE.equals(oauthMode)) {
				response = Request.Post(accessTokenBaseUrl).bodyForm(params)
						.execute().returnContent().asString();
			} else if (VK_MODE.equals(oauthMode)){
				if(!accessTokenBaseUrl.endsWith("?")) {
					accessTokenBaseUrl += "?";
				}
				
				String paramString = URLEncodedUtils.format(params, "UTF-8");
				response = Request.Get(accessTokenBaseUrl + paramString).execute().returnContent().asString();
				
			} else if (FACEBOOK_MODE.equals(oauthMode)){
				if(!accessTokenBaseUrl.endsWith("?")) {
					accessTokenBaseUrl += "?";
				}
				
				String paramString = URLEncodedUtils.format(params, "UTF-8");
				response = Request.Get(accessTokenBaseUrl + paramString).execute().returnContent().asString();
			}
			log.info("Response is : " + response);
		} catch (IOException e) {
			log.error("Failed to get response : " + e.getMessage());
		}		
		
		try {
			if (FACEBOOK_MODE.equals(oauthMode)) {
				responseJSON = parseParams(response);
			} else {
				responseJSON = JSONFactoryUtil.createJSONObject(response);
			}
		} catch (JSONException e) {
			log.error("Failed to parse response string to Json : " + e.getMessage());
		}
		return responseJSON;
	}
	
	/**
	 * Sends request to current social network, depending on <code>oauthMode</code><br>
	 * Returns user's info from it.<br>
	 * @param oauthMode - type of authorization ({@link #VK_MODE}, {@link #FACEBOOK_MODE}, {@link #GOOGLE_MODE})
	 * @param accessToken - token, received from social network. 
	 * @param accessTokenResponseJSON - token info, received from social network<br>
	 *  on {@link #getAccessTokenResponse(String, String, String)}
	 * @return - user's information in JSON format.<br>
	 * F.e. {"uid":22276785,"screen_name":"test","last_name":"test","first_name":"test","email":"test@test.ru"}
	 * @throws PortalException
	 */
	private JSONObject getUserInfo(String oauthMode, JSONObject accessTokenResponseJSON)
			throws PortalException {
		String accessToken = accessTokenResponseJSON.getString("access_token");
		if (StringPool.BLANK.equals(accessToken)) {
			throw new PortalException("Access token not received: " + accessTokenResponseJSON);
		}
		
		JSONObject userInfo = JSONFactoryUtil.createJSONObject();
		try {
			userInfo = (VK_MODE.equals(oauthMode) ? getUserInfoFromVk(accessToken, accessTokenResponseJSON) :
						(FACEBOOK_MODE.equals(oauthMode) ? getUserInfoFromFacebook(accessToken) :
						(GOOGLE_MODE.equals(oauthMode) ? getUserInfoFromGoogle(accessToken) : 
							JSONFactoryUtil.createJSONObject())));
				  
		} catch (IOException | JSONException e) {
			throw new PortalException("Failed to get user's info : " + e.getMessage());
		}

		return userInfo;
	}
	
	private JSONObject getUserInfoFromVk(String accessToken, JSONObject responseJson)
			throws JSONException, IOException {
		String email = responseJson.getString("email");
		String vkUserId = responseJson.getString("user_id");
		String vkAuthorizationMethod = "/users.get?user_ids=" + vkUserId + "&fields=first_name,last_name,screen_name";
		
		JSONObject userInfoJson = JSONFactoryUtil.createJSONObject(
				Request.Get(VK_API_PATH + vkAuthorizationMethod + "&access_token=" + accessToken).execute()
				.returnContent().asString()).getJSONArray("response").getJSONObject(0);
		
		if (!StringPool.BLANK.equals(email)) {
			userInfoJson.put("email", email);
		}
		
		return userInfoJson;
	}
	
	private JSONObject getUserInfoFromFacebook(String accessToken) throws JSONException, IOException {
		
		String facebookAuthorizationMethod = "/me?fields=first_name,middle_name,last_name,email";
		JSONObject userInfoJson = JSONFactoryUtil.createJSONObject(
				Request.Get(FB_API_PATH + facebookAuthorizationMethod + "&access_token=" + accessToken).execute()
				.returnContent().asString());
		
		return userInfoJson;
	}
	
	private JSONObject getUserInfoFromGoogle(String accessToken) throws JSONException, IOException {
		
		String googleAuthoriztionMethod = "/userinfo/v2/me?";
		JSONObject userTempInfoJson = JSONFactoryUtil.createJSONObject(
				Request.Get(GP_API_PATH + googleAuthoriztionMethod + "&access_token=" + accessToken).execute()
				.returnContent().asString());
		
		JSONObject userInfoJson = JSONFactoryUtil.createJSONObject();
		boolean emailVerified = userTempInfoJson.getBoolean("verified_email");
		userInfoJson.put("email", emailVerified ? userTempInfoJson.getString("email") : "");
		userInfoJson.put("first_name", userTempInfoJson.getString("given_name"));
		userInfoJson.put("last_name", userTempInfoJson.getString("family_name"));
		
		return userInfoJson;
	}

	/**
	 * Temporarily hack for facebook-returned response string.<br>
	 * Due to unavailability to parse it to JSON.<br>
	 * Response string is "key=value&...", without leading and closing brackets - { } <br>
	 * 
	 * Also usefull for catching other unexpected responses from other social networks
	 * @param paramsStr - facebook response string
	 * @return - extracted params in <code>JSONObject<code> format
	 */
	private JSONObject parseParams(String paramsStr) {
		String[] params = paramsStr.split("&");
	    JSONObject json = JSONFactoryUtil.createJSONObject();
	    for (String param : params)
	    {
	    	String[] pair = param.split("=");
	        String name = pair[0];
	        String value = (pair.length > 1) ? pair[1] : null;
	        json.put(name, value);
	    }
	    return json;
	}
}
