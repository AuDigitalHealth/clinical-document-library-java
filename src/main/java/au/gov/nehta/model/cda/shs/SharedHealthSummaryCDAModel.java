package au.gov.nehta.model.cda.shs;

import au.gov.nehta.model.cda.common.custodian.Custodian;
import au.gov.nehta.model.cda.common.document.BaseClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.id.LegalAuthenticator;
import au.gov.nehta.model.common.CDAModelImpl;
import org.joda.time.DateTime;

public class SharedHealthSummaryCDAModel extends CDAModelImpl {

  private DateTime effectiveTime;
  private ClinicalDocument clinicalDoucment;

  //   private SubjectOfCareParticipant subject;

  public SharedHealthSummaryCDAModel(
      ClinicalDocument clinicalDocument,
      LegalAuthenticator legalAuthenticator,
      Custodian custodian,
      String healthCareFacilityId,
      DateTime creationTime) {
    super(null, legalAuthenticator, custodian);
    this.clinicalDoucment = clinicalDocument;
    this.effectiveTime = creationTime;

    validate();
  }

  public SharedHealthSummaryCDAModel(
      ClinicalDocument clinicalDocument,
      Custodian custodian,
      String healthCareFacilityId,
      DateTime creationTime) {
    super(null, null, custodian);
    this.clinicalDoucment = clinicalDocument;
    this.effectiveTime = creationTime;

    validate();
  }

  private void validate() {
    if (clinicalDoucment == null) {
      throw new IllegalArgumentException("PathologyClinicalDocument missing");
    }
    if (clinicalDoucment.getCompletionCode() == null) {
      throw new IllegalArgumentException("PathologyClinicalDocument is missing completion code");
    }
    if (clinicalDoucment.getClinicalDocumentId() == null) {
      throw new IllegalArgumentException("PathologyClinicalDocument is missing DocumentID code");
    }
    if (clinicalDoucment.getTypeId() == null) {
      throw new IllegalArgumentException("PathologyClinicalDocument is missing typeID ");
    }
    if (clinicalDoucment.getTemplateIds() == null
        || clinicalDoucment.getTemplateIds().size() == 0) {
      throw new IllegalArgumentException("PathologyClinicalDocument is missing templateId ");
    }

    if (effectiveTime == null) {
      throw new IllegalArgumentException("CreationTime is missing");
    }
  }

  /**
   * @return the pathClinicalDoucment
   */
  public ClinicalDocument getCompletionClinicalDoucment() {
    return clinicalDoucment;
  }

  @Override
  public BaseClinicalDocument getBaseClinicalDocument() {
    return clinicalDoucment;
  }

  /**
   * Signifies the document creation time, when the document first came into being. Where the CDA
   * document is a transform from an original document in some other format, the Clinical-
   * Document.effectiveTime is the time the original document is created.
   */
  public DateTime getCreationTime() {
    return effectiveTime;
  }

  public void setCreationTime(DateTime authorTime) {
    this.effectiveTime = authorTime;
  }
}
