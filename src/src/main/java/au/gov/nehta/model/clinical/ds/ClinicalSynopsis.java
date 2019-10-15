package au.gov.nehta.model.clinical.ds;

import au.net.electronichealth.ns.cda._2_0.StrucDocText;

public class ClinicalSynopsis {

  private String clinicalSynopsisDesc;
  private StrucDocText customNarrative;

  public String getClinicalSynopsisDesc() {
    return clinicalSynopsisDesc;
  }

  public void setClinicalSynopsisDesc(String clinicalSynopsisDesc) {
    this.clinicalSynopsisDesc = clinicalSynopsisDesc;
  }

  public StrucDocText getCustomNarrative() {
    return customNarrative;
  }

  public void setCustomNarrative(StrucDocText customNarrative) {
    this.customNarrative = customNarrative;
  }
}
