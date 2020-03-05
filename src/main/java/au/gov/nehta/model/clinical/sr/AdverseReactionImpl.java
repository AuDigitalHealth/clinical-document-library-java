package au.gov.nehta.model.clinical.sr;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.es.ReactionEvent;

public class AdverseReactionImpl implements AdverseReaction {

  private Coded substanceOrAgent;
  private ReactionEvent reactionEvent;

  @Override
  public Coded getSubstanceOrAgent() {
    return substanceOrAgent;
  }

  @Override
  public void setSubstanceOrAgent(Coded substanceOrAgent) {
    this.substanceOrAgent = substanceOrAgent;
  }

  @Override
  public ReactionEvent getReactionEvent() {
    return reactionEvent;
  }

  @Override
  public void setReactionEvent(ReactionEvent reactionEvent) {
    this.reactionEvent = reactionEvent;
  }
}
