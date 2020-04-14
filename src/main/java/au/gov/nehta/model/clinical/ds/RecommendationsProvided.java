package au.gov.nehta.model.clinical.ds;

import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;

public class RecommendationsProvided {

  private ParticipationServiceProvider recommendationRecipient;
  private String recommendationNote;

  public ParticipationServiceProvider getRecommendationRecipient() {
    return recommendationRecipient;
  }

  public void setRecommendationRecipient(
      ParticipationServiceProvider recommendationRecipient) {
    this.recommendationRecipient = recommendationRecipient;
  }

  public String getRecommendationNote() {
    return recommendationNote;
  }

  public void setRecommendationNote(String recommendationNote) {
    this.recommendationNote = recommendationNote;
  }
}
