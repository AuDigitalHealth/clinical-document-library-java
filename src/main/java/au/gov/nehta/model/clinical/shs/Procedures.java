package au.gov.nehta.model.clinical.shs;

import au.gov.nehta.model.clinical.common.Procedure;

import java.util.List;


/**
 * Statements to positively assert that a certain procedure has not been
 * performed on the patient.
 */
public interface Procedures extends ExclusionStatement {
	
	/**
	 * A clinical activity carried out for therapeutic, evaluative,
	 * investigative, screening or diagnostic purposes.
	 */
	List<Procedure> getProcedures();
}
