package au.gov.nehta.model.clinical.ds;

import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.List;

public class ClinicalInterventionsPerformedThisVisitImpl implements
    ClinicalInterventionsPerformedThisVisit {

  private List<ClinicalIntervention> clinicalInterventions;
  private StrucDocText customNarrative;

  @Override
  public List<ClinicalIntervention> getClinicalInterventions() {
    return clinicalInterventions;
  }

  @Override
  public void setClinicalInterventions(List<ClinicalIntervention> clinicalInterventions) {
    this.clinicalInterventions = clinicalInterventions;
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
