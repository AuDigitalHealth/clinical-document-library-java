package au.gov.nehta.model.clinical.shs;

import au.gov.nehta.common.utils.ArgumentUtils;

import java.util.List;


/**
 * The past and current medical history of the subject of care which is relevant
 * to the clinical event, this includes problem/diagnosis and medical or
 * surgical procedures performed
 *
 */
public class MedicalHistoryImpl implements MedicalHistory {

	
	
	private ProblemDiagnoses problemDiagnosis;
	private Procedures procedures;
	private List<UncatagorisedMedicalHistoryItem> otherMedicalHistory;
	


	/**
	 * MedicalHistoryImpl <br>
	 * 
	 * The past and current medical history of the subject of care which is
	 * relevant to the clinical event, this includes problem/diagnosis and
	 * medical or surgical procedures performed
	 * 
	 * <p>
	 * ProblemDiagnoses and procedures require exlusion statements if no
	 * information is available.
	 * <p>
	 * 
	 * @param problemDiagnoses
	 *            The problems and/or diagnoses that form part of the current
	 *            and past medical history of the subject of care.
	 * @param procedures
	 *            A clinical activity carried out for therapeutic, evaluative,
	 *            investigative, screening or diagnostic purposes.
	 * 
	 * @param otherMedicalHistory MEDICAL HISTORY ITEM
	 *            A medical history entry which cannot be categorised into one
	 *            of the categories such as Procedure and Problem/Diagnosis.
	 */
	public MedicalHistoryImpl(ProblemDiagnoses problemDiagnoses, Procedures procedures, List<UncatagorisedMedicalHistoryItem> otherMedicalHistory) {
		ArgumentUtils.checkNotNull(problemDiagnoses, "problemDiagnoses");
		ArgumentUtils.checkNotNull(procedures, "procedures");
		
		this.problemDiagnosis = problemDiagnoses;
		this.procedures = procedures;
		this.otherMedicalHistory = otherMedicalHistory;
	}

	/**
	 * The problems and/or diagnoses that form part of the 
	 * current and past medical history of the subject of care.
	 */
	@Override
	public ProblemDiagnoses getProblemDiagnosis() {
		return problemDiagnosis;
	}

	/**
	 * A clinical activity carried out for therapeutic, evaluative,
	 * investigative, screening or diagnostic purposes.
	 */
	@Override
	public Procedures getProcedures() {
		return procedures;
	}

	
	/**
	 * A medical history entry which cannot be categorised into one of the
	 * categories such as Procedure and Problem/Diagnosis.
	 */
	@Override
	public List<UncatagorisedMedicalHistoryItem> getOtherHistoryItems() {
		return otherMedicalHistory;
	}

}
