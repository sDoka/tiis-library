package ru.tiis.promo.service.constants;

public enum PromoStatus {

	NOT_ACTIVATED(0, "not-activated"),
	ACTIVATED(1, "activated");
	
	private int promoStatusId;
	private String localizationKey;
	
	private PromoStatus(int promoStatusId, String localizationKey) {
		this.promoStatusId = promoStatusId;
		this.localizationKey = localizationKey;
	}
	
	public int getPromoStatusId() {
		return promoStatusId;
	}
	
	public String getLocalizationKey() {
		return localizationKey;
	}
	
}
