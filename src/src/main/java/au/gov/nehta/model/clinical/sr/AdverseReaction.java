package au.gov.nehta.model.clinical.sr;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.es.ReactionEvent;

public interface AdverseReaction {

  Coded getSubstanceOrAgent();

  void setSubstanceOrAgent(Coded substanceOrAgent);

  ReactionEvent getReactionEvent();

  void setReactionEvent(ReactionEvent reactionEvent);

}
