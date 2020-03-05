package au.gov.nehta.model.clinical.ds;

import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;

public class Alerts {
  private List<Alert> alertList;
  private StrucDocText customNarrative;

  public List<Alert> getAlertList() {
    return alertList;
  }

  public void setAlertList(List<Alert> alertList) {
    this.alertList = alertList;
  }

  public StrucDocText getCustomNarrative() {
    return customNarrative;
  }

  public void setCustomNarrative(StrucDocText customNarrative) {
    this.customNarrative = customNarrative;
  }
}
