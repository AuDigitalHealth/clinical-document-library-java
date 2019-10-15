package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.clinical.shs.ExclusionStatement;
import java.util.List;

public class AdverseReactionsImpl implements AdverseReactions {

  private ExclusionStatement exclusionStatement;
  private List<AdverseReaction> adverseReactionList;

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
}
