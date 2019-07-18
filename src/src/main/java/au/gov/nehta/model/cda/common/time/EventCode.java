package au.gov.nehta.model.cda.common.time;

/**
 * EventCode
 * <p>
 * Create to model the CDA Event codes for time.
 * 
 * <PRE>
	AC before meal  (from lat. ante cibus)
	ACM before breakfast   (from lat. ante cibus matutinus)
	ACD before lunch (from lat. ante cibus diurnus)
	ACV before dinner  (from lat. ante cibus vespertinus)
	HS hour of sleep  
	IC between meals  (from lat. inter cibus)
	ICM between breakfast and lunch  
	ICD between lunch and dinner  
	ICV between dinner and the hour of sleep  
	PC after meals  (from lat. post cibus)
	PCM after breakfast   (from lat. post cibus matutinus)
	PCD after lunch   (from lat. post cibus diurnus)
	PCV after dinner  (from lat. post cibus vespertinus)
 * </PRE>
 * @author NeHTA
 */
public enum EventCode {
	BEFORE_MEAL("AC"), //before meal (from lat. ante cibus)
	BEFORE_BREAKFST("ACM"), //before breakfast (from lat. ante cibus matutinus)
	BEFORE_LUNCH("ACD"), //before lunch (from lat. ante cibus diurnus)
	BEFORE_DINNER("acv"),//before dinner (from lat. ante cibus vespertinus)
	HOUR_OF_SLEEP("HS"), //at the hour of sleep.
	BETWEEN_MEAL("IC"), // between meals (from lat. inter cibus)
	BETWEEN_BREAKFAST_AND_LUNCH("ICM"),// between breakfast and lunch
	BETWEEN_LUNCH_AND_DINNER("ICD"), //between lunch and dinner
	BETWEEN_DINNER_AND_HOUR_OF_SLEEP("ICV"),//between dinner and the hour of sleep
	AFTER_MEALS("PC"), //after meal (from lat. post cibus)
	AFTER_BREAKFAST("PCM"), //after breakfast (from lat. post cibus matutinus)
	AFTER_LUNCH("PCD"), //after lunch (from lat. post cibus diurnus)
	AFTER_DINNER("PCV"); //after dinner (from lat. post cibus vespertinus)
	
	private String code;
	
	private EventCode(String code){
		this.code=code;
	}
	
	public String getCode() {
		return code;
	}

}
