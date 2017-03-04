package ru.tiis.promo.service.impl;

import java.util.Date;
import java.util.List;

import com.liferay.counter.service.CounterLocalServiceUtil;
import com.liferay.portal.kernel.dao.orm.QueryUtil;
import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;

import ru.tiis.promo.service.PromoCodeService;
import ru.tiis.promo.service.constants.PromoType;
import ru.tiis.srv.model.PromoCode;
import ru.tiis.srv.service.PromoCodeLocalServiceUtil;

public class PromocodeServiceImpl implements PromoCodeService {

	private static volatile PromoCodeService instance = null;
	private PromocodeServiceImpl() {};
	public static PromoCodeService getInstance() {
		if (instance == null)
			synchronized (PromocodeServiceImpl.class) {
				if (instance == null)
					instance = new PromocodeServiceImpl();
			}
		return instance;
	}
	
	@Override
	public PromoCode generateRegistrationPromoCode() throws SystemException {
		long promoCodeId = CounterLocalServiceUtil.increment(PromoCode.class.getName());
		PromoCode promoCode = PromoCodeLocalServiceUtil.createPromoCode(promoCodeId);
		promoCode.setCreateTime(new Date());
		promoCode.setIsUsed(false);
		promoCode.setPromoType(PromoType.REGISTRATION_PROMO_CODE.getPromoTypeId());
		promoCode.setPromoCodeContent(generatePromoCodeContent());
		return PromoCodeLocalServiceUtil.updatePromoCode(promoCode);		
	}

	@Override
	public PromoCode getPromoCode(long promoCodeId) throws PortalException,
			SystemException {
		PromoCode promoCode = PromoCodeLocalServiceUtil.getPromoCode(promoCodeId);
		
		
		return promoCode;
	}
	
	/* (non-Javadoc)
	 * @see ru.tiis.promo.service.PromoCodeService#getPromoCodeByContent(java.lang.String)
	 */
	@Override
	public PromoCode getPromoCodeByContent(String promoCodeContent) throws SystemException {
		return PromoCodeLocalServiceUtil.getPromoCodeByContent(promoCodeContent);
	}

	@Override
	public PromoCode activatePromoCode(long promoCodeId, long userId)
			throws PortalException, SystemException {
		PromoCode promoCode = getPromoCode(promoCodeId);
		if (promoCode.getIsUsed()) {
			throw new PortalException("Can't activate promocode " + promoCode.getPromoCodeContent() + " is already used.");
		}
		
		promoCode.setUsedTime(new Date());
		promoCode.setUserId(userId);
		promoCode.setIsUsed(true);
		
		return PromoCodeLocalServiceUtil.updatePromoCode(promoCode);
	}

	@Override
	public List<PromoCode> getAllPromoCodes() throws SystemException {

		return PromoCodeLocalServiceUtil.getPromoCodes(QueryUtil.ALL_POS, QueryUtil.ALL_POS);
	}

	private String generatePromoCodeContent() throws SystemException {
		long millis = new Date().getTime();
		String promoCodeContent = Long.toString(millis, 36);
		promoCodeContent = promoCodeContent.toUpperCase();
		if(getPromoCodeByContent(promoCodeContent) != null) {
			generatePromoCodeContent();
		}
		return promoCodeContent;
	}
}
