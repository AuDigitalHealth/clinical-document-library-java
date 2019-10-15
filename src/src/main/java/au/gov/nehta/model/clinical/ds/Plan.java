package au.gov.nehta.model.clinical.ds;

import au.net.electronichealth.ns.cda._2_0.StrucDocText;

public interface Plan {

  ArrangedServices getArrangedServices();

  RecordOfRecommendationsAndInfoProvided getRecordOfRecommendationsAndInfoProvided();

  void setArrangedServices(ArrangedServices arrangedServices);

  void setRecordOfRecommendationsAndInfoProvided(
      RecordOfRecommendationsAndInfoProvided recordOfRecommendationsAndInfoProvided);


  StrucDocText getCustomNarrative();

  void setCustomNarrative(StrucDocText customNarrative);
}
