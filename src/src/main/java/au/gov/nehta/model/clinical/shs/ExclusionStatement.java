package au.gov.nehta.model.clinical.shs;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

/**
 * Statements that positively assert that the patient does not have the
 * problem or diagnosis.
 */
public interface ExclusionStatement {

	/* 
	 * The statement about the absence or exclusion of a data item
	 * Usual an NCTISGlobalStatement code
	 */
	public Coded getExclusionStatement();
	
	/*
	 * UUID This is a technical identifier that is used for system purposes such
	 * as matching. If a suitable internal key is not available, a UUID may be
	 * used.
	 */
	public UniqueIdentifier getID();
}
