package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.clinical.shs.ExclusionStatement;
import java.util.List;

public interface AdverseReactions {

  /**
   * Global Statement only
   * @return @{@link ExclusionStatement}
   */
  ExclusionStatement getExclusionStatement();

  List<AdverseReaction> getAdverseReactionList();

  void setExclusionStatement(ExclusionStatement exclusionStatement);

  void setAdverseReactionList(
      List<AdverseReaction> adverseReactionList);
}
