package au.gov.nehta.model.clinical.ds;

import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;

public class RecordOfRecommendationsAndInfoProvidedImpl implements
    RecordOfRecommendationsAndInfoProvided {

  private List<RecommendationsProvided> recommendationsProvidedList;
  private InformationProvided informationProvided;
  private StrucDocText customNarrative;

  @Override
  public List<RecommendationsProvided> getRecommendationsProvidedList() {
    return recommendationsProvidedList;
  }

  @Override
  public InformationProvided getInformationProvided() {
    return informationProvided;
  }

  @Override
  public void setRecommendationsProvidedList(
      List<RecommendationsProvided> recommendationsProvidedList) {
    this.recommendationsProvidedList = recommendationsProvidedList;
  }

  @Override
  public void setInformationProvided(InformationProvided informationProvided) {
    this.informationProvided = informationProvided;
  }

  @Override
  public StrucDocText getCustomNarrative() {
    return customNarrative;
  }

  @Override
  public void setCustomNarrative(StrucDocText customNarrative) {
    this.customNarrative = customNarrative;
  }
}
