package au.gov.nehta.model.clinical.ds;

import au.gov.nehta.model.clinical.shs.ExclusionStatement;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;

public class AdverseReactionsImpl implements AdverseReactions {

  private ExclusionStatement exclusionStatement;
  private List<AdverseReaction> adverseReactionList;
  private StrucDocText customNarrative;

  @Override
  public ExclusionStatement getExclusionStatement() {
    return exclusionStatement;
  }

  @Override
  public List<AdverseReaction> getAdverseReactionList() {
    return adverseReactionList;
  }

  @Override
  public void setExclusionStatement(ExclusionStatement exclusionStatement) {
    this.exclusionStatement = exclusionStatement;
  }

  @Override
  public void setAdverseReactionList(
      List<AdverseReaction> adverseReactionList) {
    this.adverseReactionList = adverseReactionList;
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
