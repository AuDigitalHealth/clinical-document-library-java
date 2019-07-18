package au.gov.nehta.model.clinical.es;

import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;
import java.util.StringJoiner;

public class NewlyIdentifiedAdverseReactionsImpl implements NewlyIdentifiedAdverseReactions {

  private List<AdverseReaction> adverseReactions;
  private StrucDocText customNarrativeAdverseReaction;

  public NewlyIdentifiedAdverseReactionsImpl(
          List<AdverseReaction> adverseReactions, StrucDocText customNarrativeAdverseReaction) {
    this.adverseReactions = adverseReactions;
    this.customNarrativeAdverseReaction = customNarrativeAdverseReaction;
  }

  @Override
  public List<AdverseReaction> getAdverseReactions() {
    return adverseReactions;
  }

  @Override
  public void setAdverseReactions(List<AdverseReaction> adverseReactions) {
    this.adverseReactions = adverseReactions;
  }

  @Override
  public StrucDocText getCustomNarrativeAdverseReactions() {
    return this.customNarrativeAdverseReaction;
  }

  @Override
  public void setCustomNarrativeAdverseReactions(StrucDocText customNarrativeAdverseReactions) {
    this.customNarrativeAdverseReaction = customNarrativeAdverseReactions;
  }

  @Override
  public String toString() {
    return new StringJoiner(", ",
        NewlyIdentifiedAdverseReactionsImpl.class.getSimpleName() + "[", "]")
        .add("adverseReactions=" + adverseReactions)
        .add("customNarrativeAdverseReaction=" + customNarrativeAdverseReaction)
        .toString();
  }
}
