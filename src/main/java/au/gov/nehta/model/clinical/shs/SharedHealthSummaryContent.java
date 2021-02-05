package au.gov.nehta.model.clinical.shs;

/**
 * A clinical document written by the nominated provider, which contains key
 * pieces of information about an individual's health status and is useful to a
 * wide range of providers in assessing individuals and delivering care.
 */
public interface SharedHealthSummaryContent {

    /**
     * Information about adverse reactions and/or propensity to adverse reaction
     * of the patient (including allergies and intolerances), and any relevant
     * reaction details.
     */
    AdverseReactions getAdverseReactions();

    /*
     * Medicines which the subject of care is using, this includes
     * self-prescribed, clinician prescribed and non-prescription medicines.
     */
    Medications getMedications();

    /**
     * The past and current medical history of the subject of care which is relevant
     * to the clinical event, this includes problem/diagnosis and medical or
     * surgical procedures performed.
     */
    MedicalHistory getMedicalHistory();

    /**
     * Information about the immunisation history of the subject of care.
     */
    Immunisations getImmunisations();
}
