package au.gov.nehta.model.clinical.ereferral;

import au.gov.nehta.model.clinical.common.MedicalHistory;
import au.gov.nehta.model.clinical.es.DiagnosticInvestigations;
import au.gov.nehta.model.clinical.es.Medications;
import au.gov.nehta.model.clinical.sr.AdverseReactions;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;

public interface EReferralContent {

  ReferralDetail getReferralDetail();

  void setReferralDetail(ReferralDetail referralDetail);

  MedicalHistory getMedicalHistory();

  void setMedicalHistory(MedicalHistory medicalHistory);

  Medications getMedications();

  void setMedications(Medications medications);

  AdverseReactions getAdverseReactions();

  void setAdverseReactions(AdverseReactions adverseReactions);

  DiagnosticInvestigations getDiagnosticInvestigations();

  void setDiagnosticInvestigations(DiagnosticInvestigations diagnosticInvestigations);

  StrucDocText getCustomNarrative();

  void setCustomNarrative(StrucDocText customNarrative);

  String getCustomNarrativeTitle();

  void setCustomNarrativeTitle(String customNarrativeTitle);
}
