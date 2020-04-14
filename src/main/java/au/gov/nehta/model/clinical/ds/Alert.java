package au.gov.nehta.model.clinical.ds;

import au.gov.nehta.model.cda.common.code.Coded;

public class Alert {

  private Coded alertType;
  private Coded alertDesc;

  public Coded getAlertType() {
    return alertType;
  }

  public void setAlertType(Coded alertType) {
    this.alertType = alertType;
  }

  public Coded getAlertDesc() {
    return alertDesc;
  }

  public void setAlertDesc(Coded alertDesc) {
    this.alertDesc = alertDesc;
  }
}
