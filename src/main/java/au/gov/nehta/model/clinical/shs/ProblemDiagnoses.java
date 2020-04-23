package au.gov.nehta.model.clinical.shs;

import au.gov.nehta.model.clinical.common.ProblemDiagnosis;

import java.util.List;


/**
 * The problems and/or diagnoses that form part of the current and past
 * medical history of the subject of care.
 */
public interface ProblemDiagnoses extends ExclusionStatement {
	
	List<ProblemDiagnosis> getDiagnoses();
	
}
