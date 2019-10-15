package au.gov.nehta.model.clinical.ds;

import au.net.electronichealth.ns.cda._2_0.StrucDocText;

public class HealthProfileImpl implements HealthProfile {

  private HealthCareProviders healthCareProviders;
  private AdverseReactions adverseReactions;
  private Alerts alerts;
  private StrucDocText customNarrative;

  @Override
  public HealthCareProviders getHealthCareProviders() {
    return healthCareProviders;
  }

  @Override
  public AdverseReactions getAdverseReactions() {
    return adverseReactions;
  }

  @Override
  public Alerts getAlerts() {
    return alerts;
  }

  @Override
  public void setHealthCareProviders(
      HealthCareProviders healthCareProviders) {
    this.healthCareProviders = healthCareProviders;
  }

  @Override
  public void setAdverseReactions(AdverseReactions adverseReactions) {
    this.adverseReactions = adverseReactions;
  }

  @Override
  public void setAlerts(Alerts alerts) {
    this.alerts = alerts;
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
