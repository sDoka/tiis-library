package ru.tiis.promo.service;

import ru.tiis.promo.service.impl.PromocodeServiceImpl;

public class PromoCodeServiceFactory {

	public static PromoCodeService getService() {
		return PromocodeServiceImpl.getInstance();
	}
}
