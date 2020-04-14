package au.gov.nehta.model.clinical.sl;

import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;

public class Recommendation {

  private ParticipationServiceProvider addressee;

  private RestrictedTimeInterval timeFrame;

  private String recommendationNarrative;

  public ParticipationServiceProvider getAddressee() {
    return addressee;
  }

  public void setAddressee(ParticipationServiceProvider addressee) {
    this.addressee = addressee;
  }

  public RestrictedTimeInterval getTimeFrame() {
    return timeFrame;
  }

  public void setTimeFrame(RestrictedTimeInterval timeFrame) {
    this.timeFrame = timeFrame;
  }

  public String getRecommendationNarrative() {
    return recommendationNarrative;
  }

  public void setRecommendationNarrative(String recommendationNarrative) {
    this.recommendationNarrative = recommendationNarrative;
  }
}
