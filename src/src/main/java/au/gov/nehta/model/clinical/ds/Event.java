package au.gov.nehta.model.clinical.ds;

import au.gov.nehta.model.clinical.es.DiagnosticInvestigations;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;

public interface Event {

  Encounter getEncounter();

  ProblemDiagnosesThisVisit getProblemDiagnosesThisVisit();

  ClinicalInterventionsPerformedThisVisit getClinicalInterventionsPerformedThisVisit();

  ClinicalSynopsis getClinicalSynopsis();

  DiagnosticInvestigations getDiagnosticInvestigations();

  void setEncounter(Encounter encounter);

  void setProblemDiagnosesThisVisit(
      ProblemDiagnosesThisVisit problemDiagnosesThisVisit);

  void setClinicalInterventionsPerformedThisVisit(
      ClinicalInterventionsPerformedThisVisit clinicalInterventionsPerformedThisVisit);

  void setClinicalSynopsis(ClinicalSynopsis clinicalSynopsis);

  void setDiagnosticInvestigations(
      DiagnosticInvestigations diagnosticInvestigations);


  StrucDocText getCustomNarrative();

  void setCustomNarrative(StrucDocText customNarrative);
}
