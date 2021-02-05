package au.gov.nehta.model.clinical.shs;

import java.util.List;

/**
 * The past and current medical history of the subject of care which is relevant
 * to the clinical event. This includes problem/diagnosis and medical or
 * surgical procedures performed.
 */
public interface MedicalHistory {

    /**
     * The problems and/or diagnoses that form part of the
     * current and past medical history of the subject of care.
     */
    ProblemDiagnoses getProblemDiagnosis();

    /**
     * A clinical activity carried out for therapeutic, evaluative,
     * investigative, screening or diagnostic purposes.
     */
    Procedures getProcedures();

    /**
     * A medical history entry which cannot be categorised into one of the
     * categories such as Procedure and Problem/Diagnosis.
     */
    List<UncatagorisedMedicalHistoryItem> getOtherHistoryItems();
}
