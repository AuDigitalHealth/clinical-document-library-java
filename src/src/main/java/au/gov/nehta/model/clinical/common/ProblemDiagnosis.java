package au.gov.nehta.model.clinical.common;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

/**
 * The problems and/or diagnoses that form part of the current and past medical
 * history of the subject of care.
 *
 */
public interface ProblemDiagnosis {
	
	/**
	 * Identification of the problem or diagnosis.
	 * Should be a snomed ct-au code
	 */
    Coded getIdentification();
	
	/**
	 * optional
	 * 
	 * Estimated or actual date the Problem/Diagnosis began, in the opinion of
	 * the clinician.
	 */
    PreciseDate getDateOfOnset();
	
	/**
	 * optional
	 * 
	 * The date or estimated date that the problem/diagnos is resolved or went
	 * into remission, as indicated/identified by the clinician.
	 */
    PreciseDate getDateOfRemission();
	
	/**
	 * Additional narrative about the problem or diagnosis not captured in other fields.
	 */
    String getComment();
	
	/**
	 * This is a technical identifier that is used for system purposes such as
	 * matching. If a suitable internal key is not available, a UUID may be
	 * used.
	 */
    UniqueIdentifier getID();
}
