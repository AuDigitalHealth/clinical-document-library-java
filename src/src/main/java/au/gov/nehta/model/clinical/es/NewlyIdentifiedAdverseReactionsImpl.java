package au.gov.nehta.model.clinical.es;

import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;
import java.util.StringJoiner;

public class NewlyIdentifiedAdverseReactionsImpl implements NewlyIdentifiedAdverseReactions {

  private List<AdverseReaction> adverseReactions;
  private StrucDocText customNarrative;

  /**
   * @param adverseReactions
   * @param customNarrativeAdverseReaction @{@link StrucDocText} - custom narrative for format 2 & 3
   */
  public NewlyIdentifiedAdverseReactionsImpl(
          List<AdverseReaction> adverseReactions, StrucDocText customNarrativeAdverseReaction) {
    this.adverseReactions = adverseReactions;
    this.customNarrative = customNarrativeAdverseReaction;
  }

  public NewlyIdentifiedAdverseReactionsImpl() {
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
  public StrucDocText getCustomNarrative() {
    return this.customNarrative;
  }

  @Override
  public void setCustomNarrative(StrucDocText customNarrativeAdverseReactions) {
    this.customNarrative = customNarrativeAdverseReactions;
  }

  @Override
  public String toString() {
    return new StringJoiner(", ",
        NewlyIdentifiedAdverseReactionsImpl.class.getSimpleName() + "[", "]")
        .add("adverseReactions=" + adverseReactions)
        .add("customNarrativeAdverseReaction=" + customNarrative)
        .toString();
  }
}
