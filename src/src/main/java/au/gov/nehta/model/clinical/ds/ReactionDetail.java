package au.gov.nehta.model.clinical.ds;

import au.gov.nehta.model.cda.common.code.Coded;

public class ReactionDetail {
  private Coded reactionDesc;

  public Coded getReactionDesc() {
    return reactionDesc;
  }

  public void setReactionDesc(Coded reactionDesc) {
    this.reactionDesc = reactionDesc;
  }
}
