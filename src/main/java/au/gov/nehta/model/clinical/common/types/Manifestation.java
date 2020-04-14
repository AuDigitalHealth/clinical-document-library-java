package au.gov.nehta.model.clinical.common.types;

import au.gov.nehta.model.cda.common.code.Coded;

/**
 * A Manifestation is a Coded value paired with a Unique Identifier for the
 * purposes of describing an Adverse Reaction
 * 
 * @see AdverseReaction
 * 
 * From the IG:
 * 
 *      Presentation or exhibition of signs and symptoms of the adverse reaction
 *      expressed as a single word, phrase or brief description.
 * 
 */
public interface Manifestation {
	
	public Coded getCode();
	public UniqueIdentifier getID();
}
