package ru.tiis.promo.service.constants;

public enum PromoType {
	REGISTRATION_PROMO_CODE(1, "registration-promo-code");

	private int promoTypeId;
	private String languageKey;

	PromoType(int promoTypeId, String languageKey) {
		this.promoTypeId = promoTypeId;
		this.languageKey = languageKey;
	}
		
	public int getPromoTypeId() {
		return promoTypeId;
	}
	public String getLocalizationKey() {
		return languageKey;
	}
	
}
