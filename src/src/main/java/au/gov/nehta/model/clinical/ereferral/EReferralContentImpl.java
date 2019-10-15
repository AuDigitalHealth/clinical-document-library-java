package au.gov.nehta.model.clinical.ereferral;

import au.gov.nehta.model.clinical.common.MedicalHistory;
import au.gov.nehta.model.clinical.es.DiagnosticInvestigations;
import au.gov.nehta.model.clinical.es.Medications;
import au.gov.nehta.model.clinical.sr.AdverseReactions;

public class EReferralContentImpl implements EReferralContent {

  private ReferralDetail referralDetail;
  private MedicalHistory medicalHistory;
  private Medications medications;
  private AdverseReactions adverseReactions;
  private DiagnosticInvestigations diagnosticInvestigations;

  @Override
  public ReferralDetail getReferralDetail() {
    return referralDetail;
  }

  @Override
  public void setReferralDetail(ReferralDetail referralDetail) {
    this.referralDetail = referralDetail;
  }

  @Override
  public MedicalHistory getMedicalHistory() {
    return medicalHistory;
  }

  @Override
  public void setMedicalHistory(MedicalHistory medicalHistory) {
    this.medicalHistory = medicalHistory;
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
  public AdverseReactions getAdverseReactions() {
    return adverseReactions;
  }

  @Override
  public void setAdverseReactions(AdverseReactions adverseReactions) {
    this.adverseReactions = adverseReactions;
  }

  @Override
  public DiagnosticInvestigations getDiagnosticInvestigations() {
    return diagnosticInvestigations;
  }

  @Override
  public void setDiagnosticInvestigations(DiagnosticInvestigations diagnosticInvestigations) {
    this.diagnosticInvestigations = diagnosticInvestigations;
  }
}
