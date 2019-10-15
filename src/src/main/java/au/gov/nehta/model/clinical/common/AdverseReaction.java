package au.gov.nehta.model.clinical.common;

import au.gov.nehta.model.cda.common.code.Coded;

public interface AdverseReaction {

  Coded getSubstanceOrAgent();

  void setSubstanceOrAgent(Coded substanceOrAgent);

  ReactionEvent getReactionEvent();

  void setReactionEvent(ReactionEvent reactionEvent);

}
