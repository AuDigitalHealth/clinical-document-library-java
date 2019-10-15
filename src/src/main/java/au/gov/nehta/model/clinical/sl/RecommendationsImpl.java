package au.gov.nehta.model.clinical.sl;

import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;

public class RecommendationsImpl implements Recommendations {

  private List<Recommendation> recommendations;
  private RecommendationsExclusion recommendationsExclusion;
  private StrucDocText customNarrative;

  @Override
  public List<Recommendation> getRecommendations() {
    return recommendations;
  }

  @Override
  public StrucDocText getCustomNarrative() {
    return customNarrative;
  }

  @Override
  public void setCustomNarrative(StrucDocText customNarrative) {
    this.customNarrative = customNarrative;
  }

  @Override
  public List<Recommendation> getRecommendationList() {
    return recommendations;
  }

  @Override
  public RecommendationsExclusion getRecommendationsExclusion() {
    return recommendationsExclusion;
  }

  @Override
  public void setRecommendations(
      List<Recommendation> recommendations) {
    this.recommendations = recommendations;
  }

  @Override
  public void setRecommendationsExclusion(
      RecommendationsExclusion recommendationsExclusion) {
    this.recommendationsExclusion = recommendationsExclusion;
  }
}
