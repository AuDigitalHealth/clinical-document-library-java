package au.gov.nehta.model.clinical.shs;

import java.util.List;

import au.gov.nehta.model.clinical.common.types.AdverseReaction;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

/**
 * Information about adverse reactions and/or propensity to adverse reaction
 * of the patient (including allergies and intolerances), and any relevant
 * reaction details.
 */
public interface AdverseReactions extends ExclusionStatement {

    /**
     * Information about adverse reactions and/or propensity to adverse reaction
     * of the patient (including allergies and intolerances), and any relevant
     * reaction details.
     */
    List<? extends AdverseReaction> getAdverseReactions();

    /**
     * A globally unique identifier for each instance of an Adverse Reaction
     * evaluation.
     */
    UniqueIdentifier getID();
}
