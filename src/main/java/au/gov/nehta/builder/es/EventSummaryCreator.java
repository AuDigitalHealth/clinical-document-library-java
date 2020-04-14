package au.gov.nehta.builder.es;

import static au.gov.nehta.builder.es.EventSummaryCodes.ADVERSE_REACTION;
import static au.gov.nehta.builder.es.EventSummaryCodes.ADVERSE_REACTIONS;
import static au.gov.nehta.builder.es.EventSummaryCodes.CHANGE_OR_RECOMMENDATION_REASON;
import static au.gov.nehta.builder.es.EventSummaryCodes.CHANGE_STATUS;
import static au.gov.nehta.builder.es.EventSummaryCodes.CHANGE_TYPE;
import static au.gov.nehta.builder.es.EventSummaryCodes.CLINICAL_INDICATION;
import static au.gov.nehta.builder.es.EventSummaryCodes.CLINICAL_INFO;
import static au.gov.nehta.builder.es.EventSummaryCodes.CLINICAL_INFORMATION_PROVIDED;
import static au.gov.nehta.builder.es.EventSummaryCodes.CLINICAL_SYNOPSIS;
import static au.gov.nehta.builder.es.EventSummaryCodes.COLLECTION_SETTINGS;
import static au.gov.nehta.builder.es.EventSummaryCodes.DATETIME_RECEIVED;
import static au.gov.nehta.builder.es.EventSummaryCodes.DIAGNOSIS_INTERPRETATION;
import static au.gov.nehta.builder.es.EventSummaryCodes.DIAGNOSTIC_INVESTIGATIONS;
import static au.gov.nehta.builder.es.EventSummaryCodes.DICOM_SERIES_IDENTIFIER;
import static au.gov.nehta.builder.es.EventSummaryCodes.DICOM_STUDY_IDENTIFIER;
import static au.gov.nehta.builder.es.EventSummaryCodes.EVENT_OVERVIEW;
import static au.gov.nehta.builder.es.EventSummaryCodes.EXAMINATION_IMAGE_DETAILS;
import static au.gov.nehta.builder.es.EventSummaryCodes.EXAMINATION_REPORT_IDENTIFIER;
import static au.gov.nehta.builder.es.EventSummaryCodes.EXAMINATION_REQUESTED_NAME;
import static au.gov.nehta.builder.es.EventSummaryCodes.EXAMINATION_REQUEST_DETAILS;
import static au.gov.nehta.builder.es.EventSummaryCodes.IMAGING_EXAMINATION_RESULT;
import static au.gov.nehta.builder.es.EventSummaryCodes.IMAGING_EXAMINATION_RESULT_DATETIME;
import static au.gov.nehta.builder.es.EventSummaryCodes.IMAGING_EXAMINATION_RESULT_FINDINGS;
import static au.gov.nehta.builder.es.EventSummaryCodes.IMAGING_EXAMINATION_RESULT_STATUS;
import static au.gov.nehta.builder.es.EventSummaryCodes.IMMUNISATIONS;
import static au.gov.nehta.builder.es.EventSummaryCodes.INDIVIDUAL_RESULT_COMMENT_CODE;
import static au.gov.nehta.builder.es.EventSummaryCodes.INDIVIDUAL_TEST_RESULT_COMMENT;
import static au.gov.nehta.builder.es.EventSummaryCodes.INDIVIDUAL_TEST_RESULT_REF_RANGE_COMMENTS;
import static au.gov.nehta.builder.es.EventSummaryCodes.INDIVIDUAL_TEST_RESULT_STATUS;
import static au.gov.nehta.builder.es.EventSummaryCodes.LAB_FINDINGS_INTERPRETATION;
import static au.gov.nehta.builder.es.EventSummaryCodes.LATERALITY;
import static au.gov.nehta.builder.es.EventSummaryCodes.MEDICALHISTORY_ITEM_COMMENT;
import static au.gov.nehta.builder.es.EventSummaryCodes.MEDICAL_HISTORY;
import static au.gov.nehta.builder.es.EventSummaryCodes.MEDICATION_ORDERS;
import static au.gov.nehta.builder.es.EventSummaryCodes.OTHER_TEST_RESULT;
import static au.gov.nehta.builder.es.EventSummaryCodes.OTHER_TEST_RESULT_REPORT_STATUS;
import static au.gov.nehta.builder.es.EventSummaryCodes.PARENT_SPECIMEN_IDENTIFIER;
import static au.gov.nehta.builder.es.EventSummaryCodes.PATHOLOGICAL_DIAGNOSIS;
import static au.gov.nehta.builder.es.EventSummaryCodes.PATHOLOGY_SERVICE;
import static au.gov.nehta.builder.es.EventSummaryCodes.PATHOLOGY_TEST_RESULT;
import static au.gov.nehta.builder.es.EventSummaryCodes.PATHOLOGY_TEST_RESULT_DATETIME;
import static au.gov.nehta.builder.es.EventSummaryCodes.PATH_TEST_COMMENT;
import static au.gov.nehta.builder.es.EventSummaryCodes.PROB_OR_DIAG_COMMENT;
import static au.gov.nehta.builder.es.EventSummaryCodes.PROCEDURE_COMMENT;
import static au.gov.nehta.builder.es.EventSummaryCodes.REACTION_EVENT;
import static au.gov.nehta.builder.es.EventSummaryCodes.REPORT_STATUS;
import static au.gov.nehta.builder.es.EventSummaryCodes.REQUESTED_SERVICE;
import static au.gov.nehta.builder.es.EventSummaryCodes.REQUESTED_SERVICE_DATETIME;
import static au.gov.nehta.builder.es.EventSummaryCodes.RESULT_GROUP_SPEC_DETAIL;
import static au.gov.nehta.builder.es.EventSummaryCodes.SAMPLING_PRECONDITIONS;
import static au.gov.nehta.builder.es.EventSummaryCodes.SPECIMEN;
import static au.gov.nehta.builder.es.EventSummaryCodes.SUBJECT_OF_CARE_INSTR_DESC;
import static au.gov.nehta.builder.es.EventSummaryCodes.SUBJECT_POSITION;
import static au.gov.nehta.builder.es.EventSummaryCodes.TEST_REQ_DETAILS;
import static au.gov.nehta.builder.es.EventSummaryCodes.TEST_REQ_NAME;
import static au.gov.nehta.builder.es.EventSummaryCodes.UNCATEGORISED_MEDICAL_HISTORY_ITEM;

import au.gov.nehta.builder.common.ClinicalDocumentCodes;
import au.gov.nehta.builder.common.HeaderUtil;
import au.gov.nehta.builder.common.SectionEntryCodeSet;
import au.gov.nehta.builder.common.components.AdministrativeObservationsComponent;
import au.gov.nehta.builder.common.components.AdverseReactionComponent;
import au.gov.nehta.builder.common.components.DiagnosticInvestigationComponent;
import au.gov.nehta.builder.common.components.DocumentAuthorComponent;
import au.gov.nehta.builder.common.components.MedicalHistoryComponent;
import au.gov.nehta.builder.common.components.MedicationComponent;
import au.gov.nehta.builder.util.CDATypeUtil;
import au.gov.nehta.builder.util.ClinicalDocumentCreator;
import au.gov.nehta.builder.util.Converter;
import au.gov.nehta.builder.util.CreatorUtil;
import au.gov.nehta.model.cda.es.EventSummaryCDAModel;
import au.gov.nehta.model.clinical.common.Immunisation;
import au.gov.nehta.model.clinical.es.EventDetails;
import au.gov.nehta.model.clinical.es.EventSummary;
import au.gov.nehta.model.clinical.es.Immunisations;
import au.gov.nehta.model.schematron.SchematronResource.SchematronResources;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.net.electronichealth.ns.cda._2_0.ActClass;
import au.net.electronichealth.ns.cda._2_0.ActMood;
import au.net.electronichealth.ns.cda._2_0.ActRelationshipHasComponent;
import au.net.electronichealth.ns.cda._2_0.CD;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Act;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ClinicalDocument;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component1;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component2;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component3;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Consumable;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040EncompassingEncounter;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Entry;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ManufacturedProduct;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Material;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Section;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040StructuredBody;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040SubstanceAdministration;
import au.net.electronichealth.ns.cda._2_0.XActClassDocumentEntryAct;
import au.net.electronichealth.ns.cda._2_0.XDocumentActMood;
import au.net.electronichealth.ns.cda._2_0.XDocumentSubstanceMood;
import java.util.HashMap;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import org.joda.time.DateTime;
import org.w3c.dom.Document;

public class EventSummaryCreator extends ClinicalDocumentCreator {

  private EventSummaryCDAModel cdaModel;
  private EventSummary clinicalModel;
  private static ObjectFactory objectFactory = new ObjectFactory();
  private static Map<String, CD> eventSummaryCodeMap;

  static {
    eventSummaryCodeMap = new HashMap<String, CD>() {{
      put(ClinicalDocumentCodes.DIAGNOSTIC_INVESTIGATIONS, DIAGNOSTIC_INVESTIGATIONS);
      put(ClinicalDocumentCodes.SPECIMEN, SPECIMEN);
      put(ClinicalDocumentCodes.PATHOLOGY_TEST_RESULT, PATHOLOGY_TEST_RESULT);
      put(ClinicalDocumentCodes.DATETIME_RECEIVED, DATETIME_RECEIVED);
      put(ClinicalDocumentCodes.PARENT_SPECIMEN_IDENTIFIER, PARENT_SPECIMEN_IDENTIFIER);
      put(ClinicalDocumentCodes.CLINICAL_INFO, CLINICAL_INFO);
      put(ClinicalDocumentCodes.REPORT_STATUS, REPORT_STATUS);
      put(ClinicalDocumentCodes.PATHOLOGY_SERVICE, PATHOLOGY_SERVICE);
      put(ClinicalDocumentCodes.MEDICATION_ORDERS, MEDICATION_ORDERS);
      put(ClinicalDocumentCodes.CHANGE_TYPE, CHANGE_TYPE);
      put(ClinicalDocumentCodes.CHANGE_STATUS, CHANGE_STATUS);
      put(ClinicalDocumentCodes.CHANGE_OR_RECOMMENDATION_REASON,
          CHANGE_OR_RECOMMENDATION_REASON);
      put(ClinicalDocumentCodes.CLINICAL_INDICATION, CLINICAL_INDICATION);
      put(ClinicalDocumentCodes.MEDICAL_HISTORY, MEDICAL_HISTORY);
      put(ClinicalDocumentCodes.UNCATEGORISED_MEDICAL_HISTORY_ITEM,
          UNCATEGORISED_MEDICAL_HISTORY_ITEM);
      put(ClinicalDocumentCodes.MEDICALHISTORY_ITEM_COMMENT, MEDICALHISTORY_ITEM_COMMENT);
      put(ClinicalDocumentCodes.PROCEDURE_COMMENT, PROCEDURE_COMMENT);
      put(ClinicalDocumentCodes.PROB_OR_DIAG_COMMENT, PROB_OR_DIAG_COMMENT);
      put(ClinicalDocumentCodes.DIAGNOSIS_INTERPRETATION, DIAGNOSIS_INTERPRETATION);
      put(ClinicalDocumentCodes.IMMUNISATIONS, IMMUNISATIONS);
      put(ClinicalDocumentCodes.ADVERSE_REACTIONS, ADVERSE_REACTIONS);
      put(ClinicalDocumentCodes.ADVERSE_REACTION, ADVERSE_REACTION);
      put(ClinicalDocumentCodes.EVENT_OVERVIEW, EVENT_OVERVIEW);
      put(ClinicalDocumentCodes.INDIVIDUAL_TEST_RESULT_COMMENT,
          INDIVIDUAL_TEST_RESULT_COMMENT);
      put(ClinicalDocumentCodes.INDIVIDUAL_TEST_RESULT_REF_RANGE_COMMENTS,
          INDIVIDUAL_TEST_RESULT_REF_RANGE_COMMENTS);
      put(ClinicalDocumentCodes.INDIVIDUAL_TEST_RESULT_STATUS,
          INDIVIDUAL_TEST_RESULT_STATUS);
      put(ClinicalDocumentCodes.CLINICAL_INFORMATION_PROVIDED,
          CLINICAL_INFORMATION_PROVIDED);
      put(ClinicalDocumentCodes.IMAGING_EXMINATION_RESULT_STATUS,
          IMAGING_EXAMINATION_RESULT_STATUS);
      put(ClinicalDocumentCodes.IMAGING_EXAMINATION_RESULT_FINDINGS,
          IMAGING_EXAMINATION_RESULT_FINDINGS);
      put(ClinicalDocumentCodes.COLLECTION_SETTINGS, COLLECTION_SETTINGS);
      put(ClinicalDocumentCodes.IMAGING_EXAMINATION_RESULT, IMAGING_EXAMINATION_RESULT);
      put(ClinicalDocumentCodes.REQUESTED_SERVICE, REQUESTED_SERVICE);
      put(ClinicalDocumentCodes.SUBJECT_OF_CARE_INSTR_DESC, SUBJECT_OF_CARE_INSTR_DESC);
      put(ClinicalDocumentCodes.REQUESTED_SERVICE_DATETIME, REQUESTED_SERVICE_DATETIME);
      put(ClinicalDocumentCodes.CLINICAL_SYNOPSIS, CLINICAL_SYNOPSIS);
      put(ClinicalDocumentCodes.REACTION_EVENT, REACTION_EVENT);
      put(ClinicalDocumentCodes.PATHOLOGICAL_DIAGNOSIS, PATHOLOGICAL_DIAGNOSIS);
      put(ClinicalDocumentCodes.LAB_FINDINGS_INTERPRETATION, LAB_FINDINGS_INTERPRETATION);
      put(ClinicalDocumentCodes.PATH_TEST_COMMENT, PATH_TEST_COMMENT);
      put(ClinicalDocumentCodes.TEST_REQ_DETAILS, TEST_REQ_DETAILS);
      put(ClinicalDocumentCodes.TEST_REQ_NAME, TEST_REQ_NAME);
      put(ClinicalDocumentCodes.PATHOLOGY_TEST_RESULT_DATETIME,
          PATHOLOGY_TEST_RESULT_DATETIME);
      put(ClinicalDocumentCodes.INDIVIDIUAL_RESULT_COMMENT_CODE,
          INDIVIDUAL_RESULT_COMMENT_CODE);
      put(ClinicalDocumentCodes.EXAMINATION_REQUESTED_NAME, EXAMINATION_REQUESTED_NAME);
      put(ClinicalDocumentCodes.DICOM_STUDY_IDENTIFIER, DICOM_STUDY_IDENTIFIER);
      put(ClinicalDocumentCodes.DICOM_SERIES_IDENTIFIER, DICOM_SERIES_IDENTIFIER);
      put(ClinicalDocumentCodes.EXAMINATION_REQUEST_DETAILS, EXAMINATION_REQUEST_DETAILS);
      put(ClinicalDocumentCodes.EXMANATION_IMAGE_DETAILS, EXAMINATION_IMAGE_DETAILS);
      put(ClinicalDocumentCodes.EXAMINATION_REPORT_IDENTIFIER,
          EXAMINATION_REPORT_IDENTIFIER);
      put(ClinicalDocumentCodes.SUBJECT_POSITION, SUBJECT_POSITION);
      put(ClinicalDocumentCodes.IMAGING_EXAMINATION_RESULT_DATETIME,
          IMAGING_EXAMINATION_RESULT_DATETIME);
      put(ClinicalDocumentCodes.OTHER_TEST_RESULT, OTHER_TEST_RESULT);
      put(ClinicalDocumentCodes.OTHER_TEST_RESULT_REPORT_STATUS,
          OTHER_TEST_RESULT_REPORT_STATUS);
      put(ClinicalDocumentCodes.RESULT_GROUP_SPEC_DETAIL, RESULT_GROUP_SPEC_DETAIL);
      put(ClinicalDocumentCodes.SAMPLING_PRECONDITIONS, SAMPLING_PRECONDITIONS);
      put(ClinicalDocumentCodes.LATERALITY, LATERALITY);
    }};
  }

  public EventSummaryCreator(EventSummaryCDAModel cdaModel, EventSummary clinicalModel) {
    this.cdaModel = cdaModel;
    this.clinicalModel = clinicalModel;

    // for schematron checking
    this.resource = SchematronResources.EVENT_SUMMARY_3A.resource();
  }

  /**
   * add the NeHTA Generic Stylesheet as an xml processing instruction
   */
  public void addStyleSheet(Document doc) {
    addStylesheet("DH_Generic_CDA_Stylesheet-1.6.0.xsl", doc);
  }

  /**
   * Create the Clinical Document
   */
  public Document create()
      throws ParserConfigurationException, JAXBException, SchematronValidationException {

    // Construct clinical document with headers
    POCDMT000040ClinicalDocument clinicalDocument =
        HeaderUtil.createClinicalDocument(cdaModel.getBaseClinicalDocument(), new DateTime());
    clinicalDocument.setCode(SectionEntryCodeSet.EVENT_SUMMARY);
    clinicalDocument.setCompletionCode(
        Converter.convertToCECode(cdaModel.getCompletionClinicalDoucment().getCompletionCode()));
    POCDMT000040Component1 componentOf = objectFactory.createPOCDMT000040Component1();

    //Encompassing Encounter
    POCDMT000040EncompassingEncounter encompassingEncounter =
        objectFactory.createPOCDMT000040EncompassingEncounter();
    encompassingEncounter
        .setEffectiveTime(Converter.convert(clinicalModel.getContext().getEncounterPeriod()));
    componentOf.setEncompassingEncounter(encompassingEncounter);

    clinicalDocument.setComponentOf(componentOf);

    // Construct Legal Authenticator
    if (cdaModel.getLegalAuthenticator() != null) {
      clinicalDocument.setLegalAuthenticator(
          HeaderUtil.createLegalAuthenticator(cdaModel.getLegalAuthenticator()));
    }

    // Construct Custodian
    if (cdaModel.getCustodian() != null) {
      clinicalDocument.setCustodian(
          HeaderUtil.createCustodian(cdaModel.getCustodian().getAssignedCustodian()
              .getRepresentedCustodianOrganization()));
    }

    // Construct Author (Prescriber)
    clinicalDocument.getAuthor().add(new DocumentAuthorComponent().getAuthor(clinicalModel
        .getContext().getDocumentAuthor(), cdaModel.getLegalAuthenticator()));
    // Construct Record Target
    clinicalDocument.getRecordTarget()
        .add(HeaderUtil.createRecordTarget(clinicalModel.getContext().getSubjectOfCare()));

    clinicalDocument.setComponent(getCDABody());
    Document doc = getDocumentFilteredOfNull(
        CreatorUtil.convertClinicalDocumentToDomDocument(clinicalDocument));
    // If strict checking is enabled, check this document.
    if (isStrict()) {
      check(doc);
    }
    return doc;
  }

  private POCDMT000040Component2 getCDABody() {
    MedicalHistoryComponent medicalHistoryComponent =
        new MedicalHistoryComponent(eventSummaryCodeMap);
    AdverseReactionComponent adverseReactionComponent =
        new AdverseReactionComponent(eventSummaryCodeMap);
    DiagnosticInvestigationComponent diagnosticInvestigationComponent =
        new DiagnosticInvestigationComponent(eventSummaryCodeMap);
    MedicationComponent medicationComponent = new MedicationComponent(eventSummaryCodeMap);
    POCDMT000040Component2 component = objectFactory.createPOCDMT000040Component2();
    POCDMT000040StructuredBody structuredBody = objectFactory.createPOCDMT000040StructuredBody();
    structuredBody.getComponent().add(getEventDetails());
    structuredBody.getComponent().add(adverseReactionComponent.getAdverseReactions(
        clinicalModel.getContent().getNewlyIdentifiedAdverseReactions()));
    structuredBody.getComponent()
        .add(medicationComponent.getMedications(clinicalModel.getContent().getMedications()));
    structuredBody.getComponent().add(medicalHistoryComponent
        .getMedicalHistory(clinicalModel.getContent().getMedicalHistory(),
            "Diagnoses/Interventions"));
    structuredBody.getComponent().add(getImmunisations());
    structuredBody.getComponent().add(diagnosticInvestigationComponent
            .getDiagnosticInvestigations(clinicalModel.getContent().getDiagnosticInvestigations()));
    structuredBody.getComponent().add(new AdministrativeObservationsComponent()
        .getComponent(clinicalModel.getContext().getSubjectOfCare(),
            clinicalModel.getContext().getDocumentAuthor()));
    component.setStructuredBody(structuredBody);
    return component;
  }


  private POCDMT000040Component3 getImmunisations() {
    Immunisations immunisations = clinicalModel.getContent().getImmunisations();
    if (immunisations == null) {
      return null;
    }

    POCDMT000040Component3 immunisationsComponent = objectFactory.createPOCDMT000040Component3();
    POCDMT000040Section immunisationsSection = objectFactory.createPOCDMT000040Section();
    immunisationsSection.setId(CDATypeUtil.getII(UUID.randomUUID().toString()));
    immunisationsSection.setClassCode(ActClass.DOCSECT);
    immunisationsSection.setMoodCode(ActMood.EVN);
    immunisationsSection.setCode(EventSummaryCodes.IMMUNISATIONS);
    immunisationsSection.setTitle(CDATypeUtil.getST("Immunisations"));
    immunisationsSection.setText(NarrativeUtil.getImmunisations(immunisations));
    if (null != immunisations.getImmunisations() && !immunisations.getImmunisations().isEmpty()) {
      immunisations.getImmunisations().stream().filter(Objects::nonNull).forEach(
          immunisation -> immunisationsSection.getEntry().add(getImmunisationEntry(immunisation)));
    }
    immunisationsComponent.setSection(immunisationsSection);
    return immunisationsComponent;
  }

  private POCDMT000040Entry getImmunisationEntry(Immunisation immunisation) {
    POCDMT000040Entry immunisationEntry = objectFactory.createPOCDMT000040Entry();
    POCDMT000040SubstanceAdministration substanceAdministration =
        objectFactory.createPOCDMT000040SubstanceAdministration();
    substanceAdministration.setClassCode(ActClass.SBADM);
    substanceAdministration.setMoodCode(XDocumentSubstanceMood.EVN);
    substanceAdministration.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    substanceAdministration.getEffectiveTime().add(Converter.convertToSxcmts(
        immunisation.getMedicationActionDateTime()));
    POCDMT000040Consumable consumable = objectFactory.createPOCDMT000040Consumable();
    POCDMT000040ManufacturedProduct manufacturedProduct = objectFactory
        .createPOCDMT000040ManufacturedProduct();
    POCDMT000040Material manufacturedMaterial = objectFactory.createPOCDMT000040Material();
    manufacturedMaterial.setCode(Converter.convertToCECode(immunisation.getTheraputicGood()));
    manufacturedProduct.setManufacturedMaterial(manufacturedMaterial);
    consumable.setManufacturedProduct(manufacturedProduct);
    substanceAdministration.setConsumable(consumable);
    immunisationEntry.setSubstanceAdministration(substanceAdministration);
    return immunisationEntry;
  }

  private POCDMT000040Component3 getEventDetails() {
    EventDetails eventDetails = clinicalModel.getContent().getEventDetails();
    if (eventDetails == null) {
      return null;
    }

    POCDMT000040Component3 eventDetailsComponent = objectFactory.createPOCDMT000040Component3();
    eventDetailsComponent.setTypeCode(ActRelationshipHasComponent.COMP);
    POCDMT000040Section eventDetailsSection = objectFactory.createPOCDMT000040Section();
    eventDetailsSection.setId(CDATypeUtil.getII(UUID.randomUUID().toString()));
    eventDetailsSection.setCode(EventSummaryCodes.EVENT_OVERVIEW);
    eventDetailsSection.setTitle(CDATypeUtil.getST("Event Details"));
    eventDetailsSection.setText(NarrativeUtil.getEventDetails(eventDetails));
    POCDMT000040Entry clinicalSynopsisEntry = objectFactory.createPOCDMT000040Entry();
    clinicalSynopsisEntry.setAct(getClinicalSynopsisActForEventDetailsActEntry(eventDetails));
    eventDetailsSection.setClassCode(ActClass.DOCSECT);
    eventDetailsSection.setMoodCode(ActMood.EVN);
    eventDetailsSection.getEntry().add(clinicalSynopsisEntry);
    eventDetailsComponent.setSection(eventDetailsSection);
    return eventDetailsComponent;
  }

  private POCDMT000040Act getClinicalSynopsisActForEventDetailsActEntry(EventDetails eventDetails) {
    POCDMT000040Act clinicalSynopsisAct = objectFactory.createPOCDMT000040Act();
    clinicalSynopsisAct.setClassCode(XActClassDocumentEntryAct.ACT);
    clinicalSynopsisAct.setMoodCode(XDocumentActMood.EVN);
    clinicalSynopsisAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    clinicalSynopsisAct.setCode(EventSummaryCodes.CLINICAL_SYNOPSIS);
    clinicalSynopsisAct.setText(CDATypeUtil.getST(eventDetails.getClinicalSynopsisDesc()));
    return clinicalSynopsisAct;
  }
}