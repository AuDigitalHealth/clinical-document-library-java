package au.gov.nehta.model.clinical.ds;


import au.net.electronichealth.ns.cda._2_0.StrucDocText;

public interface HealthProfile {

  HealthCareProviders getHealthCareProviders();

  AdverseReactions getAdverseReactions();

  Alerts getAlerts();

  void setHealthCareProviders(HealthCareProviders healthCareProviders);

  void setAdverseReactions(AdverseReactions adverseReactions);

  void setAlerts(Alerts alerts);

  StrucDocText getCustomNarrative();

  void setCustomNarrative(StrucDocText customNarrative);
}
