package au.gov.nehta.model.clinical.common;

import au.net.electronichealth.ns.cda._2_0.StrucDocText;

import java.util.List;

public class AdverseReactionsBaseImpl implements AdverseReactionsBase {

    private List<AdverseReaction> adverseReactions;
    private StrucDocText customNarrative;

    @Override
    public List<AdverseReaction> getAdverseReactions() {
        return adverseReactions;
    }

    @Override
    public void setAdverseReactions(List<AdverseReaction> adverseReactions) {
        this.adverseReactions = adverseReactions;
    }

    @Override
    public StrucDocText getCustomNarrative() {
        return customNarrative;
    }

    @Override
    public void setCustomNarrative(StrucDocText customNarrativeAdverseReactions) {
        this.customNarrative = customNarrativeAdverseReactions;
    }
}
