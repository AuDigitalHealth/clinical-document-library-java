package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.clinical.common.MedicalHistory;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;

public class EventSummaryContentImpl implements EventSummaryContent {

  private StrucDocText customNarrativeAdministrativeObservations;
  private AttachedMedia structuredBodyFiles;
  private Medications medications;
  private StrucDocText customNarrativeMedications;
  private EventDetails eventDetails;
  private NewlyIdentifiedAdverseReactions newlyIdentifiedAdverseReactions;
  private MedicalHistory medicalHistory;
  private Immunisations immunisations;
  private DiagnosticInvestigations diagnosticInvestigations;

  public EventSummaryContentImpl() {
  }

  @Override
  public StrucDocText getCustomNarrativeAdministrativeObservations() {
    return customNarrativeAdministrativeObservations;
  }

  @Override
  public AttachedMedia getStructuredBodyFiles() {
    return structuredBodyFiles;
  }

  @Override
  public Medications getMedications() {
    return medications;
  }

  @Override
  public StrucDocText getCustomNarrativeMedications() {
    return customNarrativeMedications;
  }

  @Override
  public EventDetails getEventDetails() {
    return eventDetails;
  }

  @Override
  public NewlyIdentifiedAdverseReactions getNewlyIdentifiedAdverseReactions() {
    return newlyIdentifiedAdverseReactions;
  }

  @Override
  public MedicalHistory getMedicalHistory() {
    return medicalHistory;
  }

  @Override
  public Immunisations getImmunisations() {
    return immunisations;
  }

  @Override
  public DiagnosticInvestigations getDiagnosticInvestigations() {
    return diagnosticInvestigations;
  }

  @Override
  public void setCustomNarrativeAdministrativeObservations(
      StrucDocText customNarrativeAdministrativeObservations) {
    this.customNarrativeAdministrativeObservations = customNarrativeAdministrativeObservations;
  }

  @Override
  public void setStructuredBodyFiles(AttachedMedia structuredBodyFiles) {
    this.structuredBodyFiles = structuredBodyFiles;
  }

  @Override
  public void setMedications(Medications medications) {
    this.medications = medications;
  }

  @Override
  public void setCustomNarrativeMedications(StrucDocText customNarrativeMedications) {
    this.customNarrativeMedications = customNarrativeMedications;
  }

  @Override
  public void setEventDetails(EventDetails eventDetails) {
    this.eventDetails = eventDetails;
  }

  @Override
  public void setNewlyIdentifiedAdverseReactions(
      NewlyIdentifiedAdverseReactions newlyIdentifiedAdverseReactions) {
    this.newlyIdentifiedAdverseReactions = newlyIdentifiedAdverseReactions;
  }

  @Override
  public void setMedicalHistory(MedicalHistory medicalHistory) {
    this.medicalHistory = medicalHistory;
  }

  @Override
  public void setImmunisations(Immunisations immunisations) {
    this.immunisations = immunisations;
  }

  public void setDiagnosticInvestigations(DiagnosticInvestigations diagnosticInvestigations) {
    this.diagnosticInvestigations = diagnosticInvestigations;
  }

}
