package ru.tiis.promo.service;

import java.util.List;

import com.liferay.portal.kernel.exception.PortalException;
import com.liferay.portal.kernel.exception.SystemException;

import ru.tiis.srv.model.PromoCode;

public interface PromoCodeService {
	PromoCode generateRegistrationPromoCode() throws SystemException;

	PromoCode getPromoCode(long promoCodeId) throws PortalException,
			SystemException;

	/**
	 * 
	 * Returns PromoCode with specified content.<br>
	 * Returns {@code null}, if no promo code exists with such content
	 * @param promoCodeContent
	 * @return
	 * @throws SystemException
	 * @throws PortalException
	 */
	PromoCode getPromoCodeByContent(String promoCodeContent)
			throws SystemException, PortalException;

	List<PromoCode> getAllPromoCodes() throws SystemException;

	/**
	 * Simply update status of this promoCode to used and sets userId.<br>
	 * Indicating, that this promocode was used by this user.<br>
	 * If it is a registration promo - first register user, so he has walid Id.
	 * @param promoCodeId
	 * @param userId
	 * @return
	 * @throws PortalException
	 * @throws SystemException
	 */
	PromoCode activatePromoCode(long promoCodeId, long userId)
			throws PortalException, SystemException;
}
