package au.gov.nehta.model.clinical.sr;

import au.gov.nehta.model.clinical.es.AdverseReaction;
import au.gov.nehta.model.clinical.shs.ExclusionStatement;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;

public class AdverseReactionsImpl implements AdverseReactions {

  private ExclusionStatement exclusionStatement;
  private List<AdverseReaction> adverseReactions;
  private StrucDocText customNarrative;

  @Override
  public ExclusionStatement getExclusionStatement() {
    return exclusionStatement;
  }

  @Override
  public void setExclusionStatement(ExclusionStatement exclusionStatement) {
    this.exclusionStatement = exclusionStatement;
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
    return customNarrative;
  }

  @Override
  public void setCustomNarrative(StrucDocText customNarrative) {
    this.customNarrative = customNarrative;
  }
}
