package au.gov.nehta.model.clinical.ds;

import au.gov.nehta.model.cda.common.code.Coded;
import java.util.List;

public class AdverseReaction {

  private Coded agentDesc;
  private Coded adverseReactionType;
  private List<ReactionDetail> reactionDetail;

  public Coded getAgentDesc() {
    return agentDesc;
  }

  public void setAgentDesc(Coded agentDesc) {
    this.agentDesc = agentDesc;
  }

  public Coded getAdverseReactionType() {
    return adverseReactionType;
  }

  public void setAdverseReactionType(Coded adverseReactionType) {
    this.adverseReactionType = adverseReactionType;
  }

  public List<ReactionDetail> getReactionDetail() {
    return reactionDetail;
  }

  public void setReactionDetail(
      List<ReactionDetail> reactionDetail) {
    this.reactionDetail = reactionDetail;
  }
}
