package au.gov.nehta.model.clinical.ds;

import au.gov.nehta.model.clinical.shs.ExclusionStatement;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;

public interface AdverseReactions {

  /**
   * Global Statement only
   * @return @{@link ExclusionStatement}
   */
  ExclusionStatement getExclusionStatement();

  void setExclusionStatement(ExclusionStatement exclusionStatement);

  List<AdverseReaction> getAdverseReactionList();

  void setAdverseReactionList(
      List<AdverseReaction> adverseReactionList);

  StrucDocText getCustomNarrative();

  void setCustomNarrative(StrucDocText customNarrative);
}
