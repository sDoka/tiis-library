package ru.tiis.promo.portlet;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.portlet.ActionRequest;
import javax.portlet.ActionResponse;
import javax.portlet.PortletException;
import javax.portlet.RenderRequest;
import javax.portlet.RenderResponse;

import ru.tiis.library.service.BookService;
import ru.tiis.library.service.impl.BookServiceFactory;
import ru.tiis.library.service.model.BookModel;
import ru.tiis.promo.service.PromoCodeService;
import ru.tiis.promo.service.PromoCodeServiceFactory;
import ru.tiis.srv.model.PromoCode;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;
import com.liferay.portal.kernel.log.Log;
import com.liferay.portal.kernel.log.LogFactoryUtil;
import com.liferay.portal.kernel.upload.UploadPortletRequest;
import com.liferay.portal.kernel.util.ParamUtil;
import com.liferay.portal.service.ServiceContext;
import com.liferay.portal.service.ServiceContextFactory;
import com.liferay.portal.util.PortalUtil;
import com.liferay.util.bridges.mvc.MVCPortlet;

/**
 * Portlet implementation class PromoGenerationPortlet
 * This class generates promo codes
 */
public class PromoCodeGenerationPortlet extends MVCPortlet {
	
	private static PromoCodeService promoCodeService = PromoCodeServiceFactory.getService();
	private static Log log = LogFactoryUtil.getLog(PromoCodeGenerationPortlet.class);


	@Override
	public void render(RenderRequest request, RenderResponse response)
			throws PortletException, IOException {
		
		List<PromoCode> promoCodes = new ArrayList<PromoCode>();
		try {
			promoCodes = promoCodeService.getAllPromoCodes();
		} catch (SystemException e) {
			log.error("Can't get promo codes from database: " + e.getMessage());
		}

		request.setAttribute("promoCodes", promoCodes);
		
		super.render(request, response);
	}
	
	public void generatePromoCodes(ActionRequest request, ActionResponse response) {
		int promoCodesNumber = ParamUtil.getInteger(request, "promoCodesNumber", 0);
		
		for (int i = 0; i < promoCodesNumber; i++) {
			try {
				promoCodeService.generateRegistrationPromoCode();
			} catch (SystemException e) {
				log.error("Can't generate a promo code: " + e.getMessage());
			}
		}
		
	}
}
