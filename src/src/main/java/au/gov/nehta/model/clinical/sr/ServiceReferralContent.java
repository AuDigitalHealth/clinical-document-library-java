package au.gov.nehta.model.clinical.sr;


import au.gov.nehta.model.clinical.common.MedicalHistory;
import au.gov.nehta.model.clinical.es.DiagnosticInvestigations;
import au.gov.nehta.model.clinical.es.Medications;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;

public interface ServiceReferralContent {

  ServiceReferralDetail getServiceReferralDetail();

  void setServiceReferralDetail(ServiceReferralDetail serviceReferralDetail);

  CurrentServices getCurrentServices();

  void setCurrentServices(CurrentServices currentServices);

  AdverseReactions getAdverseReactions();

  void setAdverseReactions(AdverseReactions adverseReactions);

  Medications getMedications();

  void setMedications(Medications medications);

  MedicalHistory getPastAndCurrentMedicalHistory();

  void setPastAndCurrentMedicalHistory(MedicalHistory pastAndCurrentMedicalHistory);

  DiagnosticInvestigations getDiagnosticInvestigations();

  void setDiagnosticInvestigations(DiagnosticInvestigations diagnosticInvestigations);

  void setReportFile(AttachedMedia reportFile);

  AttachedMedia getReportFile();

  void setCustomNarrativeText(StrucDocText customNarrativeText);

  StrucDocText getCustomNarrativeText();

  void setCustomNarrativeTitle(String customNarrativeTitle);

  String getCustomNarrativeTitle();
}
