package au.gov.nehta.model.clinical.sr;

import au.gov.nehta.model.cda.common.code.Coded;

public class OtherAlert {

  private Coded alertType;
  private Coded alertDesc;

  public OtherAlert() {
  }

  public OtherAlert(Coded alertType, Coded alertDesc) {
    this.alertType = alertType;
    this.alertDesc = alertDesc;
  }

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
