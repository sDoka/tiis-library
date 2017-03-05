package ru.tiis.hook.registration;

import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.servlet.SessionErrors;
import com.liferay.portal.kernel.servlet.SessionMessages;
import com.liferay.portal.kernel.struts.BaseStrutsPortletAction;
import com.liferay.portal.kernel.struts.StrutsPortletAction;
import com.liferay.portal.theme.ThemeDisplay;
import com.liferay.portal.util.PortalUtil;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.kernel.util.WebKeys;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletConfig;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;
import javax.portlet.ResourceRequest;
import javax.portlet.ResourceResponse;

import ru.tiis.promo.service.PromoCodeService;
import ru.tiis.promo.service.PromoCodeServiceFactory;
import ru.tiis.srv.model.PromoCode;

public class RegistrationPortletAction extends BaseStrutsPortletAction {

	private static final PromoCodeService promoCodeService = PromoCodeServiceFactory
			.getService();
	private static Log log = LogFactoryUtil
			.getLog(RegistrationPortletAction.class);

	public void processAction(StrutsPortletAction originalStrutsPortletAction,
			PortletConfig portletConfig, ActionRequest actionRequest,
			ActionResponse actionResponse) throws Exception {
		ThemeDisplay themeDisplay = (ThemeDisplay) actionRequest
				.getAttribute(WebKeys.THEME_DISPLAY);

		Long currentuser = themeDisplay.getUserId();

		if (currentuser != null) {
			log.info("Checking promo code");

			String promoCodeContent = ParamUtil.getString(actionRequest,
					"inviteCode", "");
			PromoCode promoCode = promoCodeService
					.getPromoCodeByContent(promoCodeContent);
			if (promoCode == null) {
				log.error("Wrong promo code!");
				SessionErrors.clear(actionRequest);
				SessionErrors.add(actionRequest, "bad-promo-code");
				SessionMessages
						.add(actionRequest,
								PortalUtil.getPortletId(actionRequest)
										+ SessionMessages.KEY_SUFFIX_HIDE_DEFAULT_ERROR_MESSAGE);
				return;
			}
			if (promoCode.getIsUsed()) {
				log.error("Promo code is already used!");
				SessionErrors.clear(actionRequest);
				SessionErrors.add(actionRequest, "used-promo-code");
				SessionMessages
						.add(actionRequest,
								PortalUtil.getPortletId(actionRequest)
										+ SessionMessages.KEY_SUFFIX_HIDE_DEFAULT_ERROR_MESSAGE);
				return;
			}
			promoCodeService.activatePromoCode(promoCode.getPromoCodeId(),
					currentuser);
		}
		originalStrutsPortletAction.processAction(originalStrutsPortletAction,
				portletConfig, actionRequest, actionResponse);
	}

	public String render(StrutsPortletAction originalStrutsPortletAction,
			PortletConfig portletConfig, RenderRequest renderRequest,
			RenderResponse renderResponse) throws Exception {

		return originalStrutsPortletAction.render(null, portletConfig,
				renderRequest, renderResponse);

	}

	public void serveResource(StrutsPortletAction originalStrutsPortletAction,
			PortletConfig portletConfig, ResourceRequest resourceRequest,
			ResourceResponse resourceResponse) throws Exception {

		originalStrutsPortletAction.serveResource(originalStrutsPortletAction,
				portletConfig, resourceRequest, resourceResponse);

	}

}
