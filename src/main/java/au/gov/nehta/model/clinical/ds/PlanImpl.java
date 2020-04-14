package au.gov.nehta.model.clinical.ds;

import au.net.electronichealth.ns.cda._2_0.StrucDocText;

public class PlanImpl implements Plan {

  private ArrangedServices arrangedServices;
  private RecordOfRecommendationsAndInfoProvided recordOfRecommendationsAndInfoProvided;
  private StrucDocText customNarrative;

  @Override
  public ArrangedServices getArrangedServices() {
    return arrangedServices;
  }

  @Override
  public RecordOfRecommendationsAndInfoProvided getRecordOfRecommendationsAndInfoProvided() {
    return recordOfRecommendationsAndInfoProvided;
  }

  @Override
  public void setArrangedServices(ArrangedServices arrangedServices) {
    this.arrangedServices = arrangedServices;
  }

  @Override
  public void setRecordOfRecommendationsAndInfoProvided(
      RecordOfRecommendationsAndInfoProvided recordOfRecommendationsAndInfoProvided) {
    this.recordOfRecommendationsAndInfoProvided = recordOfRecommendationsAndInfoProvided;
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
