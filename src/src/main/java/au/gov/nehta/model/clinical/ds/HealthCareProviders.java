package au.gov.nehta.model.clinical.ds;

import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import java.util.List;

public class HealthCareProviders {
  private List<ParticipationServiceProvider> nominatedPrimaryHealthcareProviders;

  public List<ParticipationServiceProvider> getNominatedPrimaryHealthcareProviders() {
    return nominatedPrimaryHealthcareProviders;
  }

  public void setNominatedPrimaryHealthcareProviders(
      List<ParticipationServiceProvider> nominatedPrimaryHealthcareProviders) {
    this.nominatedPrimaryHealthcareProviders = nominatedPrimaryHealthcareProviders;
  }
}
