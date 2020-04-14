package au.gov.nehta.model.clinical.shs;

import java.util.List;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.code.NCTISGlobalStatement;
import au.gov.nehta.model.clinical.common.types.AdverseReaction;


/**
 * Information about adverse reactions and/or propensity to adverse reaction
 * of the patient (including allergies and intolerances), and any relevant
 * reaction details.
 */
public class AdverseReactionsImpl extends ExclusionStatementImpl implements AdverseReactions {

	private List<? extends AdverseReaction> reactions;

	/**
	 * The constructor to use when there is no adverse reactions
	 */
	public AdverseReactionsImpl(Coded exclusionStatement) {
		super(exclusionStatement);
	}
	
	/**
	 * A convenience method to construct the most likely case -
	 * no reactions with an exclusion statement of none known
	 */
	public static AdverseReactions noneKnown(){
		return new AdverseReactionsImpl(NCTISGlobalStatement.NONE_KNOWN);
	}
	
	
	/**
	 * The constructor to use when there are AdverseReactions
	 */
	public AdverseReactionsImpl(List<? extends AdverseReaction>  reactions) {
		super(null);
		this.reactions=reactions;
	}

	@Override
	public List<? extends AdverseReaction> getAdverseReactions() {
		return reactions;
	}

}
