package au.gov.nehta.model.clinical.ds;

import au.gov.nehta.model.clinical.es.DiagnosticInvestigations;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;

public class EventImpl implements Event {

  private Encounter encounter;
  private ProblemDiagnosesThisVisit problemDiagnosesThisVisit;
  private ClinicalInterventionsPerformedThisVisit clinicalInterventionsPerformedThisVisit;
  private ClinicalSynopsis clinicalSynopsis;
  private DiagnosticInvestigations diagnosticInvestigations;
  private StrucDocText customNarrative;

  public EventImpl() {
  }

  public EventImpl(Encounter encounter, ProblemDiagnosesThisVisit problemDiagnosesThisVisit,
      ClinicalInterventionsPerformedThisVisit clinicalInterventionsPerformedThisVisit,
      ClinicalSynopsis clinicalSynopsis, DiagnosticInvestigations diagnosticInvestigations) {
    this.encounter = encounter;
    this.problemDiagnosesThisVisit = problemDiagnosesThisVisit;
    this.clinicalInterventionsPerformedThisVisit = clinicalInterventionsPerformedThisVisit;
    this.clinicalSynopsis = clinicalSynopsis;
    this.diagnosticInvestigations = diagnosticInvestigations;
  }

  @Override
  public Encounter getEncounter() {
    return encounter;
  }

  @Override
  public ProblemDiagnosesThisVisit getProblemDiagnosesThisVisit() {
    return problemDiagnosesThisVisit;
  }

  @Override
  public ClinicalInterventionsPerformedThisVisit getClinicalInterventionsPerformedThisVisit() {
    return clinicalInterventionsPerformedThisVisit;
  }

  @Override
  public ClinicalSynopsis getClinicalSynopsis() {
    return clinicalSynopsis;
  }

  @Override
  public DiagnosticInvestigations getDiagnosticInvestigations() {
    return diagnosticInvestigations;
  }

  @Override
  public void setEncounter(Encounter encounter) {
    this.encounter = encounter;
  }

  @Override
  public void setProblemDiagnosesThisVisit(
      ProblemDiagnosesThisVisit problemDiagnosesThisVisit) {
    this.problemDiagnosesThisVisit = problemDiagnosesThisVisit;
  }

  @Override
  public void setClinicalInterventionsPerformedThisVisit(
      ClinicalInterventionsPerformedThisVisit clinicalInterventionsPerformedThisVisit) {
    this.clinicalInterventionsPerformedThisVisit = clinicalInterventionsPerformedThisVisit;
  }

  @Override
  public void setClinicalSynopsis(ClinicalSynopsis clinicalSynopsis) {
    this.clinicalSynopsis = clinicalSynopsis;
  }

  @Override
  public void setDiagnosticInvestigations(
      DiagnosticInvestigations diagnosticInvestigations) {
    this.diagnosticInvestigations = diagnosticInvestigations;
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
