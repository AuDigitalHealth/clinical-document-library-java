package au.gov.nehta.model.clinical.sl;

import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;

public interface Recommendations {

    List<Recommendation> getRecommendations();

    StrucDocText getCustomNarrative();

    void setCustomNarrative(StrucDocText customNarrative);

    List<Recommendation> getRecommendationList();

    RecommendationsExclusion getRecommendationsExclusion();

    void setRecommendations(List<Recommendation> recommendations);

    void setRecommendationsExclusion(RecommendationsExclusion recommendationsExclusion);
}
