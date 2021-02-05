package au.gov.nehta.model.clinical.ds;

import au.net.electronichealth.ns.cda._2_0.StrucDocText;

import java.util.List;

public interface ClinicalInterventionsPerformedThisVisit {

    List<ClinicalIntervention> getClinicalInterventions();

    void setClinicalInterventions(List<ClinicalIntervention> clinicalInterventions);

    StrucDocText getCustomNarrative();

    void setCustomNarrative(StrucDocText customNarrative);
}
