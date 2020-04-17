package au.gov.nehta.model.cda.common.document;

import au.gov.nehta.model.cda.common.id.TemplateId;
import au.gov.nehta.model.cda.common.id.TemplateIdImpl;
import java.util.LinkedList;

/**
 * A factory to create the common clincal document objects
 */
public class ClinicalDocumentFactory {

  private static final TemplateId EPRESCRIPTION_TEMPLATE_ID =
      TemplateIdImpl.getInstance("2.1", "1.2.36.1.2001.1001.101.100.1002.74");
  private static final TemplateId NPDR_EPRESCRIPTION_TEMPLATE_ID =
      TemplateIdImpl.getInstance("1.0", "1.2.36.1.2001.1001.100.1002.170");
  private static final TemplateId DISPENSE_RECORD_TEMPLATE_ID =
      TemplateIdImpl.getInstance("2.1", "1.2.36.1.2001.1001.101.100.1002.75");
  private static final TemplateId NPDR_DISPENSE_RECORD_TEMPLATE_ID =
      TemplateIdImpl.getInstance("1.0", "1.2.36.1.2001.1001.100.1002.171");
  private static final TemplateId PRESCRIPTION_REQUEST_TEMPLATE_ID =
      TemplateIdImpl.getInstance("1.1", "1.2.36.1.2001.1001.101.100.1002.101");
  private static final TemplateId PATHOLOGY_REPORT_TEMPLATE_ID =
      TemplateIdImpl.getInstance("1.0", "1.2.36.1.2001.1001.100.1002.220");
  private static final TemplateId DIAGNOSTIC_IMAGING_TEMPLATE_ID =
      TemplateIdImpl.getInstance("1.0", "1.2.36.1.2001.1001.100.1002.222");
  private static final TemplateId E_REFERRAL =
      TemplateIdImpl.getInstance("2.2", "1.2.36.1.2001.1001.101.100.1002.2");
  public static final TemplateId SHARED_HEALTH_SUMMARY =
      TemplateIdImpl.getInstance("1.4", "1.2.36.1.2001.1001.101.100.1002.120");
  private static final TemplateId EVENT_SUMMARY =
      TemplateIdImpl.getInstance("1.3", "1.2.36.1.2001.1001.101.100.1002.136");
  private static final TemplateId SPECIALIST_LETTER =
      TemplateIdImpl.getInstance("1.3", "1.2.36.1.2001.1001.101.100.1002.132");
  private static final TemplateId DISCHARGE_SUMMARY =
      TemplateIdImpl.getInstance("3.4", "1.2.36.1.2001.1001.101.100.1002.4");
  private static final TemplateId SERVICE_REFERRAL =
      TemplateIdImpl.getInstance("1.1", "1.2.36.1.2001.1001.100.1002.231");
  private static final TemplateId E_REFERRAL_3A =
      TemplateIdImpl.getInstance("2.2", "1.2.36.1.2001.1001.101.100.1002.2");
  private static final TemplateId ADVANCE_CARE_DIRECTIVE =
      TemplateIdImpl.getInstance("1.0", "1.2.36.1.2001.1001.101.100.1002.156");
  private static final TemplateId ADVANCE_CARE_PLANNING =
      TemplateIdImpl.getInstance("1.0", "1.2.36.1.2001.1001.100.1002.226");
  private static final TemplateId GOALS_OF_CARE =
      TemplateIdImpl.getInstance("1.0", "1.2.36.1.2001.1001.100.1003.100001");
  private static final TemplateId PHARMACIST_SHARED_MEDICINES_LIST =
      TemplateIdImpl.getInstance("1.1", "1.2.36.1.2001.1001.100.1002.218");

  public static ClinicalDocument getPharmacistSharedMedicinesList() {
    ClinicalDocument clinicalDoc = new ClinicalDocumentImpl(PHARMACIST_SHARED_MEDICINES_LIST,
        "Pharmacist Shared Medicines List");
    clinicalDoc.getTemplateIds()
        .add(TemplateIdImpl.getInstance("1.0", "1.2.36.1.2001.1001.100.1002.237"));
    addTemplateIds(clinicalDoc);
    return clinicalDoc;
  }

  public static ClinicalDocument getEventSummary() {
    ClinicalDocument clinicalDoc =
        new ClinicalDocumentImpl(EVENT_SUMMARY, "Event Summary");
    addTemplateIds(clinicalDoc);
    return clinicalDoc;
  }

  public static ClinicalDocument getSpecialistLetter() {
    ClinicalDocument clinicalDoc =
        new ClinicalDocumentImpl(SPECIALIST_LETTER, "Specialist Letter");
    addTemplateIds(clinicalDoc);
    return clinicalDoc;
  }

  public static ClinicalDocument getDischargeSummary() {
    ClinicalDocument clinicalDoc =
        new ClinicalDocumentImpl(DISCHARGE_SUMMARY, "Discharge Summary");
    addTemplateIds(clinicalDoc);
    return clinicalDoc;
  }

  public static ClinicalDocument getServiceReferral() {
    ClinicalDocument clinicalDoc =
        new ClinicalDocumentImpl(SERVICE_REFERRAL, "Service Referral");
    addTemplateIds(clinicalDoc);
    return clinicalDoc;
  }

  public static ClinicalDocument getEReferral3A() {
    ClinicalDocument clinicalDoc =
        new ClinicalDocumentImpl(E_REFERRAL_3A, "Service Referral");
    addTemplateIds(clinicalDoc);
    return clinicalDoc;
  }

  public static ClinicalDocument getAdvanceCarePlanning() {
    ClinicalDocument clinicalDoc =
        new ClinicalDocumentImpl(ADVANCE_CARE_PLANNING, "Advance Care Planning");
    addTemplateIds(clinicalDoc);
    return clinicalDoc;
  }

  private static void addTemplateIds(ClinicalDocument clinicalDoc) {
    clinicalDoc.getTemplateIds().addAll(new LinkedList<TemplateId>() {{
      offerFirst(TemplateIdImpl.getInstance("1.0", "1.2.36.1.2001.1001.100.149"));
      //add(TemplateIdImpl.getInstance("1.0", "1.2.36.1.2001.1001.100.1002.237"));
    }});
  }

  public static ClinicalDocument getSharedHealthSummary() {
    return new ClinicalDocumentImpl(SHARED_HEALTH_SUMMARY, "Shared Health Summary");
  }

  public static ClinicalDocument getEReferral() {
    ClinicalDocument clinicalDoc = new ClinicalDocumentImpl(E_REFERRAL, "e-Referral");
    addTemplateIds(clinicalDoc);
    return clinicalDoc;
  }

  public static ClinicalDocument getDiagnosticImagingReport() {
    return new ClinicalDocumentImpl(
        DIAGNOSTIC_IMAGING_TEMPLATE_ID, "Diagnostic Imaging Result Report");
  }

  public static ClinicalDocument getPathologyReport() {
    return new ClinicalDocumentImpl(PATHOLOGY_REPORT_TEMPLATE_ID, "Pathology Result Report");
  }

  public static BaseClinicalDocument getEPrescription() {
    return new BaseClinicalDocumentImpl(EPRESCRIPTION_TEMPLATE_ID, "Prescripition Document");
  }

  public static BaseClinicalDocument getNPDREPrescription() {
    return new BaseClinicalDocumentImpl(NPDR_EPRESCRIPTION_TEMPLATE_ID, "Prescripition Document");
  }

  public static BaseClinicalDocument getDispenseRecord() {
    return new BaseClinicalDocumentImpl(DISPENSE_RECORD_TEMPLATE_ID, "Dispense Document");
  }

  public static BaseClinicalDocument getNPDRDispenseRecord() {
    return new BaseClinicalDocumentImpl(NPDR_DISPENSE_RECORD_TEMPLATE_ID, "Dispense Document");
  }

  public static BaseClinicalDocument getPrescriptionRequest() {
    return new BaseClinicalDocumentImpl(PRESCRIPTION_REQUEST_TEMPLATE_ID, "Prescription Request");
  }

  public static ClinicalDocument getAdvanceCareDirective() {
    ClinicalDocument clinicalDoc =
        new ClinicalDocumentImpl(ADVANCE_CARE_DIRECTIVE, "Advance Care Directive");
    addTemplateIds(clinicalDoc);
    return clinicalDoc;
  }

  public static ClinicalDocument getGoalsOfCare() {
    ClinicalDocument clinicalDoc =
        new ClinicalDocumentImpl(ADVANCE_CARE_PLANNING, "Goals of Care");
    clinicalDoc.getTemplateIds()
        .add(TemplateIdImpl.getInstance("1.0", "1.2.36.1.2001.1001.100.149"));
    clinicalDoc.getTemplateIds().add(GOALS_OF_CARE);
    return clinicalDoc;
  }
}
