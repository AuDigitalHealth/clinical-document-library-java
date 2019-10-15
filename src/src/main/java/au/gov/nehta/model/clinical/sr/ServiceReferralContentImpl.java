package au.gov.nehta.model.clinical.sr;

import au.gov.nehta.model.clinical.common.MedicalHistory;
import au.gov.nehta.model.clinical.es.DiagnosticInvestigations;
import au.gov.nehta.model.clinical.es.Medications;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;

public class ServiceReferralContentImpl implements ServiceReferralContent {

  private ServiceReferralDetail serviceReferralDetail;
  private CurrentServices currentServices;
  private AdverseReactions adverseReactions;
  private Medications medications;
  //private PastAndCurrentMedicalHistory pastAndCurrentMedicalHistory;
  private MedicalHistory medicalHistory;
  private DiagnosticInvestigations diagnosticInvestigations;
  private AttachedMedia reportFile;
  private StrucDocText customNarrativeText;
  private String customNarrativeTitle;

  public ServiceReferralContentImpl(AttachedMedia reportFile) {
    this.reportFile = reportFile;
  }

  public ServiceReferralContentImpl(String customNarrativeTitle, StrucDocText customNarrativeText) {
    this.customNarrativeTitle = customNarrativeTitle;
    this.customNarrativeText = customNarrativeText;
  }

  @Override
  public ServiceReferralDetail getServiceReferralDetail() {
    return serviceReferralDetail;
  }

  @Override
  public void setServiceReferralDetail(ServiceReferralDetail serviceReferralDetail) {
    this.serviceReferralDetail = serviceReferralDetail;
  }

  @Override
  public CurrentServices getCurrentServices() {
    return currentServices;
  }

  @Override
  public void setCurrentServices(CurrentServices currentServices) {
    this.currentServices = currentServices;
  }

  @Override
  public AdverseReactions getAdverseReactions() {
    return adverseReactions;
  }

  @Override
  public void setAdverseReactions(AdverseReactions adverseReactions) {
    this.adverseReactions = adverseReactions;
  }

  @Override
  public Medications getMedications() {
    return medications;
  }

  @Override
  public void setMedications(Medications medications) {
    this.medications = medications;
  }

  @Override
  public MedicalHistory getPastAndCurrentMedicalHistory() {
    return medicalHistory;
  }

  @Override
  public void setPastAndCurrentMedicalHistory(MedicalHistory pastAndCurrentMedicalHistory) {
    this.medicalHistory = pastAndCurrentMedicalHistory;
  }

/*  @Override
  public PastAndCurrentMedicalHistory getPastAndCurrentMedicalHistory() {
    return pastAndCurrentMedicalHistory;
  }

  @Override
  public void setPastAndCurrentMedicalHistory(
      PastAndCurrentMedicalHistory pastAndCurrentMedicalHistory) {
    this.pastAndCurrentMedicalHistory = pastAndCurrentMedicalHistory;
  }*/

  @Override
  public DiagnosticInvestigations getDiagnosticInvestigations() {
    return diagnosticInvestigations;
  }

  @Override
  public void setDiagnosticInvestigations(DiagnosticInvestigations diagnosticInvestigations) {
    this.diagnosticInvestigations = diagnosticInvestigations;
  }

  @Override
  public void setReportFile(AttachedMedia reportFile) {
    this.reportFile = reportFile;
  }

  @Override
  public AttachedMedia getReportFile() {
    return reportFile;
  }

  @Override
  public void setCustomNarrativeText(StrucDocText customNarrativeText) {
    this.customNarrativeText = customNarrativeText;
  }

  @Override
  public StrucDocText getCustomNarrativeText() {
    return customNarrativeText;
  }

  @Override
  public void setCustomNarrativeTitle(String customNarrativeTitle) {
    this.customNarrativeTitle = customNarrativeTitle;
  }

  @Override
  public String getCustomNarrativeTitle() {
    return customNarrativeTitle;
  }
}
