package au.gov.nehta.model.clinical.ds;

import au.gov.nehta.model.cda.common.code.Coded;

public class ChangeDetail {

  private Coded changesMade;
  private String reasonForChange;

  public Coded getChangesMade() {
    return changesMade;
  }

  public void setChangesMade(Coded changesMade) {
    this.changesMade = changesMade;
  }

  public String getReasonForChange() {
    return reasonForChange;
  }

  public void setReasonForChange(String reasonForChange) {
    this.reasonForChange = reasonForChange;
  }
}
