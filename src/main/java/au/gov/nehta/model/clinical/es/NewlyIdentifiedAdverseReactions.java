package au.gov.nehta.model.clinical.es;

import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;

public interface NewlyIdentifiedAdverseReactions {

  List<AdverseReaction> getAdverseReactions();

  void setAdverseReactions(List<AdverseReaction> adverseReactions);

  StrucDocText getCustomNarrative();

  void setCustomNarrative(StrucDocText customNarrativeAdverseReactions);
}
