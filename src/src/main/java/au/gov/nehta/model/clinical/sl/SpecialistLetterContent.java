package au.gov.nehta.model.clinical.sl;

import au.gov.nehta.model.clinical.es.DiagnosticInvestigations;
import au.gov.nehta.model.clinical.es.Medications;
import au.gov.nehta.model.clinical.es.NewlyIdentifiedAdverseReactions;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;

public interface SpecialistLetterContent {

  /* Response Details */
  ResponseDetails getResponseDetails();

  /* Recommendations */
  Recommendations getRecommendations();

  /* Medications */
  Medications getMedications();

  void setMedications(Medications medications);

  StrucDocText getCustomNarrativeMedications();

  void setCustomNarrativeMedications(StrucDocText customNarrativeMedications);

  /* Adverse Reactions */
  NewlyIdentifiedAdverseReactions getNewlyIdentifiedAdverseReactions();

  /* Diagnostic Investigations */
  DiagnosticInvestigations getDiagnosticInvestigations();

  void setResponseDetails(ResponseDetails responseDetails);

  void setRecommendations(Recommendations recommendations);

  void setNewlyIdentifiedAdverseReactions(
      NewlyIdentifiedAdverseReactions newlyIdentifiedAdverseReactions);

  void setDiagnosticInvestigations(
      DiagnosticInvestigations diagnosticInvestigations);

  /**
   * Attribute only to be initialized while opting for Format 1A of Specialist Letter
   * @return @{@link AttachedMedia}
   */
  AttachedMedia getReportFile();

  /**
   * Attribute only to be initialized while opting for Format 1A of Specialist Letter
   * @param reportFile @{@link AttachedMedia}
   */
  void setReportFile(AttachedMedia reportFile);

  StrucDocText getCustomNarrativeText();

  void setCustomNarrativeText(StrucDocText customNarrativeText);

  String getCustomNarrativeTitle();

  void setCustomNarrativeTitle(String customNarrativeTitle);
}
