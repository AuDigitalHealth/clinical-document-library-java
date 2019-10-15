package au.gov.nehta.model.clinical.ds;

import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;

public interface RecordOfRecommendationsAndInfoProvided {
  List<RecommendationsProvided> getRecommendationsProvidedList();

  InformationProvided getInformationProvided();

  void setRecommendationsProvidedList(
      List<RecommendationsProvided> recommendationsProvidedList);

  void setInformationProvided(
      InformationProvided informationProvided);

  StrucDocText getCustomNarrative();

  void setCustomNarrative(StrucDocText customNarrative);
}
