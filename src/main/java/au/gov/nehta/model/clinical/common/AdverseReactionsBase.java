package au.gov.nehta.model.clinical.common;


import au.net.electronichealth.ns.cda._2_0.StrucDocText;

import java.util.List;

public interface AdverseReactionsBase {

    List<AdverseReaction> getAdverseReactions();

    void setAdverseReactions(List<AdverseReaction> adverseReactions);

    StrucDocText getCustomNarrative();

    void setCustomNarrative(StrucDocText customNarrativeAdverseReactions);
}
