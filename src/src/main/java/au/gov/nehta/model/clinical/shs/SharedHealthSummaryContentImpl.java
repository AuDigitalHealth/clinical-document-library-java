package au.gov.nehta.model.clinical.shs;

import au.gov.nehta.common.utils.ArgumentUtils;


/**
 * A clinical document written by the nominated provider, which contains key
 * pieces of information about an individual's health status and is useful to a
 * wide range of providers in assessing individuals and delivering care.
 *
 */
public class SharedHealthSummaryContentImpl implements SharedHealthSummaryContent {
	protected AdverseReactions reactions;
	protected Medications medications; 
	protected MedicalHistory history;
	protected Immunisations immunisations;
	
	/**
	 * A clinical document written by the nominated provider, which contains key
 * pieces of information about an individual's health status and is useful to a
 * wide range of providers in assessing individuals and delivering care.
	 * 
	 * <p>
	 * <strong>No argument may be null.</strong>
	 * Use exclusions statements where no argument is available. 
	 * 
	 * 
	 * @param reactions
	 *            Information about adverse reactions and/or propensity to
	 *            adverse reaction of the patient (including allergies and
	 *            intolerances), and any relevant reaction details.
	 * 
	 * @param medications
	 *            Medicines which the subject of care is using, this includes
	 *            self-prescribed, clinician prescribed and nonprescription
	 *            medicines.
	 * 
	 * @param history
	 * 
	 *            The past and current medical history of the subject of care
	 *            which is relevant to the clinical event, this includes
	 *            problem/diagnosis and medical or surgical procedures performed
	 * 
	 * @param immunisations
	 *            Information about the immunisation history of the subject of
	 *            care.
	 *            
	 *            
	 *            
	 */
	public SharedHealthSummaryContentImpl(AdverseReactions reactions, Medications medications, MedicalHistory history, Immunisations immunisations) {
		ArgumentUtils.checkNotNull(reactions, "reactions");
		ArgumentUtils.checkNotNull(medications, "medications");
		ArgumentUtils.checkNotNull(history, "history");
		ArgumentUtils.checkNotNull(immunisations, "immunisations");
		
		this.reactions = reactions;
		this.medications = medications;
		this.history = history;
		this.immunisations = immunisations;
	}

	/**
	 * Information about adverse reactions and/or propensity to adverse reaction
	 * of the patient (including allergies and intolerances), and any relevant
	 * reaction details.
	 */
	@Override
	public AdverseReactions getAdverseReactions() {
		return reactions;
	}

	
	/*
	 * Medicines which the subject of care is using, this includes
	 * self-prescribed, clinician prescribed and nonprescription medicines.
	 */
	@Override
	public Medications getMedications() {
		return medications;
	}

	/**
	 * The past and current medical history of the subject of care which is relevant
	 * to the clinical event, this includes problem/diagnosis and medical or
	 * surgical procedures performed
	 */
	@Override
	public MedicalHistory getMedicalHistory() {
		return history;
	}

	
	/**
	 * Information about the immunisation history of the subject of care.
	 */
	@Override
	public Immunisations getImmunisations() {
		return immunisations;
	}

}
