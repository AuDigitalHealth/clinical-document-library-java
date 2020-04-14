package au.gov.nehta.model.clinical.sr;

import au.gov.nehta.model.clinical.es.NewlyIdentifiedAdverseReactions;
import au.gov.nehta.model.clinical.shs.ExclusionStatement;

public interface AdverseReactions extends NewlyIdentifiedAdverseReactions {

  ExclusionStatement getExclusionStatement();

  void setExclusionStatement(ExclusionStatement exclusionStatement);

}
