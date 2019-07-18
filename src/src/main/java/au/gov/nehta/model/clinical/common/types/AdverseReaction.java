package au.gov.nehta.model.clinical.common.types;

import java.util.List;

import au.gov.nehta.model.cda.common.code.Coded;

/**
 * Information about adverse reactions and/or propensity to adverse reaction of
 * the patient (including allergies and intolerances), and any relevant reaction
 * details.
 *
 */
public interface AdverseReaction {

	/**
	 * Identification of a substance, agent, or a class of substance, that is
	 * considered to be responsible for the adverse reaction.
	 */
	public Coded getSubstanceAgent();

	/**
	 * 
	 *
	 * Details about each adverse reaction event.
	 *
	 * Clinical manifestation of the adverse reaction expressed as a single
	 * word, phrase or brief description
	 * 
	 * These should be SNOMED CT-AU Clinical Manifestation Values
	 */
	public List<? extends Manifestation> getManifestations();
	
	/**
	 * This is a technical identifier that is used for system purposes such as
	 * matching. If a suitable internal key is not available, a UUID may be
	 * used.
	 */
	public UniqueIdentifier getID();
	
	
}
