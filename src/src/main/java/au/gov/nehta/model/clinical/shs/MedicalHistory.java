package au.gov.nehta.model.clinical.shs;

import java.util.List;


/**
 * The past and current medical history of the subject of care which is relevant
 * to the clinical event, this includes problem/diagnosis and medical or
 * surgical procedures performed
 *
 */
public interface MedicalHistory {
	
	/**
	 * The problems and/or diagnoses that form part of the 
	 * current and past medical history of the subject of care.
	 */
	public ProblemDiagnoses getProblemDiagnosis();

	/**
	 * A clinical activity carried out for therapeutic, evaluative,
	 * investigative, screening or diagnostic purposes.
	 */
	public Procedures getProcedures();
	
	
	
	/**
	 * A medical history entry which cannot be categorised into one of the
	 * categories such as Procedure and Problem/Diagnosis.
	 */
	public List<UncatagorisedMedicalHistoryItem> getOtherHistoryItems();
	
}
