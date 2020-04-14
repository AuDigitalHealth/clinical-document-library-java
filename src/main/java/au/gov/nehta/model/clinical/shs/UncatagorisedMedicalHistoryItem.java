package au.gov.nehta.model.clinical.shs;

import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

/**
 * A medical history entry which cannot be categorised into one of the
 * categories such as Procedure and Problem/Diagnosis.
 */
public interface UncatagorisedMedicalHistoryItem {

	/**
	 * A description of the problem, diagnosis, intervention or other medical
	 * history item.
	 */
	public String getDescription();
	
	/**
	 * optional 
	 * The date range during which the item applied or occurred.
	 */
	public RestrictedTimeInterval getTimeInterval();
	
	/**
	 * optional 
	 * Free text comments providing additional information relevant to the item
	 * in question
	 */
	public String getComment();
	
	/**
	 * This is a technical identifier that is used for system purposes such as
	 * matching. If a suitable internal key is not available, a UUID may be
	 * used.
	 */
	public UniqueIdentifier getID();
	
	
}
