package au.gov.nehta.model.clinical.ds;

import au.gov.nehta.model.cda.common.code.Coded;

public class ClinicalIntervention {

  private Coded clinicalInterventionDesc;

  public Coded getClinicalInterventionDesc() {
    return clinicalInterventionDesc;
  }

  public void setClinicalInterventionDesc(
      Coded clinicalInterventionDesc) {
    this.clinicalInterventionDesc = clinicalInterventionDesc;
  }
}
