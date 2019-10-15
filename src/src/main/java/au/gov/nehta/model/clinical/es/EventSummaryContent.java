package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.clinical.common.MedicalHistory;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;

public interface EventSummaryContent {

  StrucDocText getCustomNarrativeAdministrativeObservations();

  AttachedMedia getStructuredBodyFiles();

  Medications getMedications();

  StrucDocText getCustomNarrativeMedications();

  EventDetails getEventDetails();

  NewlyIdentifiedAdverseReactions getNewlyIdentifiedAdverseReactions();  //TODO Check : called Adverse Reactions in .Net of type (IAdverseReactionsWithoutExclusions) (Is there a difference?)

  MedicalHistory getMedicalHistory();

  Immunisations getImmunisations();

  DiagnosticInvestigations getDiagnosticInvestigations();

  void setCustomNarrativeAdministrativeObservations(
      StrucDocText customNarrativeAdministrativeObservations);

  void setStructuredBodyFiles(AttachedMedia attachedMedia);

  void setMedications(Medications medications);

  void setCustomNarrativeMedications(StrucDocText customNarrativeMedications);

  void setEventDetails(EventDetails eventDetails);

  void setNewlyIdentifiedAdverseReactions(
      NewlyIdentifiedAdverseReactions newlyIdentifiedAdverseReactions);

  void setMedicalHistory(MedicalHistory medicalHistory);

  void setImmunisations(Immunisations immunisations);

  void setDiagnosticInvestigations(DiagnosticInvestigations diagnosticInvestigations);

}