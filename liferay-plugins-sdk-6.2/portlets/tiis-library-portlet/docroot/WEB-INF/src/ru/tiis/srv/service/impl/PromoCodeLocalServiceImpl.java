/**
 * Copyright (c) 2000-present Liferay, Inc. All rights reserved.
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

package ru.tiis.srv.service.impl;

import com.liferay.portal.kernel.exception.SystemException;

import ru.tiis.srv.NoSuchPromoCodeException;
import ru.tiis.srv.model.PromoCode;
import ru.tiis.srv.service.base.PromoCodeLocalServiceBaseImpl;

/**
 * The implementation of the promo code local service.
 *
 * <p>
 * All custom service methods should be put in this class. Whenever methods are added, rerun ServiceBuilder to copy their definitions into the {@link ru.tiis.srv.service.PromoCodeLocalService} interface.
 *
 * <p>
 * This is a local service. Methods of this service will not have security checks based on the propagated JAAS credentials because this service can only be accessed from within the same VM.
 * </p>
 *
 * @author Michael
 * @see ru.tiis.srv.service.base.PromoCodeLocalServiceBaseImpl
 * @see ru.tiis.srv.service.PromoCodeLocalServiceUtil
 */
public class PromoCodeLocalServiceImpl extends PromoCodeLocalServiceBaseImpl {
	/*
	 * NOTE FOR DEVELOPERS:
	 *
	 * Never reference this interface directly. Always use {@link ru.tiis.srv.service.PromoCodeLocalServiceUtil} to access the promo code local service.
	 */
	/**
	 * Returns PromoCode with specified content.<br>
	 * May return {@code null}, if no promo code exists with such content
	 * @param content
	 * @return
	 * @throws SystemException
	 */
	public PromoCode getPromoCodeByContent(String content) throws SystemException {
		try {
			return promoCodePersistence.findByContent(content);
		} catch (NoSuchPromoCodeException e) {
			return null;
		}
	}
}