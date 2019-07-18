package au.gov.nehta.builder.es;


import au.gov.nehta.builder.common.ClinicalModelConverter;
import au.gov.nehta.builder.common.EntitlementTypeCodeSet;
import au.gov.nehta.builder.common.EntryCreator;
import au.gov.nehta.builder.common.HeaderUtil;
import au.gov.nehta.builder.common.SectionEntryCodeSet;
import au.gov.nehta.builder.common.StructuredBodyUtil;
import au.gov.nehta.builder.util.AddressConverter;
import au.gov.nehta.builder.util.CDATypeUtil;
import au.gov.nehta.builder.util.ClinicalDocumentCreator;
import au.gov.nehta.builder.util.Converter;
import au.gov.nehta.builder.util.CreatorUtil;
import au.gov.nehta.model.cda.common.ElectronicCommunicationDetail;
import au.gov.nehta.model.cda.common.code.CodeImpl;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.cda.es.EventSummaryCDAModel;
import au.gov.nehta.model.clinical.common.EventTypes;
import au.gov.nehta.model.clinical.common.ExtendedDemographicData;
import au.gov.nehta.model.clinical.common.Immunisation;
import au.gov.nehta.model.clinical.common.ProblemDiagnosis;
import au.gov.nehta.model.clinical.common.SubjectOfCareDemographicData;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;
import au.gov.nehta.model.clinical.common.UncatagorisedMedicalHistoryItem;
import au.gov.nehta.model.clinical.common.address.Address;
import au.gov.nehta.model.clinical.common.participation.DateAccuracy;
import au.gov.nehta.model.clinical.common.participation.DateOfDeath;
import au.gov.nehta.model.clinical.diagnostic.pathology.ExtendedEmploymentOrganisation;
import au.gov.nehta.model.clinical.es.AdverseReaction;
import au.gov.nehta.model.clinical.es.AnatomicalSite;
import au.gov.nehta.model.clinical.es.DiagnosesInterventions;
import au.gov.nehta.model.clinical.es.DiagnosticInvestigations;
import au.gov.nehta.model.clinical.es.EventDetails;
import au.gov.nehta.model.clinical.es.EventSummary;
import au.gov.nehta.model.clinical.es.EventSummaryAuthor;
import au.gov.nehta.model.clinical.es.ExaminationRequestDetails;
import au.gov.nehta.model.clinical.es.ImageDetails;
import au.gov.nehta.model.clinical.es.ImagingExaminationResult;
import au.gov.nehta.model.clinical.es.ImagingExaminationResultGroup;
import au.gov.nehta.model.clinical.es.ImagingResult;
import au.gov.nehta.model.clinical.es.Immunisations;
import au.gov.nehta.model.clinical.es.KnownMedication;
import au.gov.nehta.model.clinical.es.NewlyIdentifiedAdverseReactions;
import au.gov.nehta.model.clinical.es.PathologyTestResult;
import au.gov.nehta.model.clinical.es.PhysicalDetails;
import au.gov.nehta.model.clinical.es.Procedure;
import au.gov.nehta.model.clinical.es.RequestedService;
import au.gov.nehta.model.clinical.es.Result;
import au.gov.nehta.model.clinical.es.ResultGroup;
import au.gov.nehta.model.clinical.es.TestSpecimenDetail;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.gov.nehta.model.clinical.etp.common.participation.AddressContext;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.gov.nehta.model.clinical.etp.common.participation.ServiceProvider;
import au.gov.nehta.model.schematron.SchematronResource.SchematronResources;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.net.electronichealth.ns.cda._2_0.ActClass;
import au.net.electronichealth.ns.cda._2_0.ActClassObservation;
import au.net.electronichealth.ns.cda._2_0.ActMood;
import au.net.electronichealth.ns.cda._2_0.ActRelationshipHasComponent;
import au.net.electronichealth.ns.cda._2_0.ActRelationshipType;
import au.net.electronichealth.ns.cda._2_0.CD;
import au.net.electronichealth.ns.cda._2_0.CE;
import au.net.electronichealth.ns.cda._2_0.CR;
import au.net.electronichealth.ns.cda._2_0.ED;
import au.net.electronichealth.ns.cda._2_0.EntityClass;
import au.net.electronichealth.ns.cda._2_0.II;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Act;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040AssignedAuthor;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040AssignedEntity;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Author;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ClinicalDocument;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component1;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component2;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component3;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component4;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component5;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Consumable;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040EncompassingEncounter;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Entry;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040EntryRelationship;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ManufacturedProduct;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Material;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Observation;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ObservationMedia;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ObservationRange;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Organization;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040OrganizationPartOf;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Organizer;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Participant2;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ParticipantRole;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Performer2;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Person;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040PlayingEntity;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Procedure;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ReferenceRange;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Section;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Specimen;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040SpecimenRole;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040StructuredBody;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040SubstanceAdministration;
import au.net.electronichealth.ns.cda._2_0.PQ;
import au.net.electronichealth.ns.cda._2_0.ParticipationPhysicalPerformer;
import au.net.electronichealth.ns.cda._2_0.ParticipationType;
import au.net.electronichealth.ns.cda._2_0.RoleClass;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import au.net.electronichealth.ns.cda._2_0.TEL;
import au.net.electronichealth.ns.cda._2_0.XActClassDocumentEntryAct;
import au.net.electronichealth.ns.cda._2_0.XActClassDocumentEntryOrganizer;
import au.net.electronichealth.ns.cda._2_0.XActMoodDocumentObservation;
import au.net.electronichealth.ns.cda._2_0.XActRelationshipEntryRelationship;
import au.net.electronichealth.ns.cda._2_0.XDocumentActMood;
import au.net.electronichealth.ns.cda._2_0.XDocumentProcedureMood;
import au.net.electronichealth.ns.cda._2_0.XDocumentSubstanceMood;
import au.net.electronichealth.ns.ci.cda.extensions._3.Container;
import au.net.electronichealth.ns.ci.cda.extensions._3.Coverage2;
import au.net.electronichealth.ns.ci.cda.extensions._3.Employment;
import au.net.electronichealth.ns.ci.cda.extensions._3.Entitlement;
import au.net.electronichealth.ns.ci.cda.extensions._3.Participant;
import au.net.electronichealth.ns.ci.cda.extensions._3.ParticipantRole;
import au.net.electronichealth.ns.ci.cda.extensions._3.Qualifications;
import au.net.electronichealth.ns.ci.cda.extensions._3.SpecimenInContainer;
import org.joda.time.DateTime;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import javax.xml.bind.JAXBElement;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Objects;
import java.util.UUID;

import static au.gov.nehta.builder.common.SectionEntryCodeSet.ADDITIONAL_COMMENTS;

public class EventSummaryCreator extends ClinicalDocumentCreator {

  private static final String ADMINISTRATIVE_OBSERVATIONS_SECTION_TITLE =
      "Administrative Observations";

  private static final CD RESULT_GROUP_SPEC_DETAIL =
      Converter.convertToCDCode(
          new CodeImpl(
              "102.16156.136.2.2", "1.2.36.1.2001.1001.101", "NCTIS Data Components", "Specimen"));
  private static final CD SAMPLING_PRECONDITIONS =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.16171",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "Sampling Preconditions"));
  private static final CD SPECIMEN =
      Converter.convertToCDCode(
          new CodeImpl(
              "102.16156.136.2.1", "1.2.36.1.2001.1001.101", "NCTIS Data Components", "Specimen"));
  private static final CE PATHOLOGY_TEST_RESULT =
      Converter.convertToCECode(
          new CodeImpl(
              "102.16144",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "Pathology Test Result"));
  private static final CD DATETIME_RECEIVED =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.11014", "1.2.36.1.2001.1001.101", "NCTIS Data Components", "DateTime Received"));
  private static final CD PARENT_SPECIMEN_IDENTIFIER =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.16187",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "Parent Specimen Identifier"));
  private static final CD CLINICAL_INFO =
      Converter.convertToCDCode(
          new CodeImpl("55752-0", "2.16.840.1.113883.6.1", "LOINC", "Clinical information"));
  private static final CD REPORT_STATUS =
      Converter.convertToCDCode(
          new CodeImpl("308552006", "2.16.840.1.113883.6.96", "SNOMED CT", "report status"));
  private static final CD PATHOLOGY_SERVICE =
      Converter.convertToCDCode(
          new CodeImpl("310074003", "2.16.840.1.113883.6.96", "SNOMED CT", "pathology service"));
  private static final CE MEDICATION_ORDERS =
      Converter.convertToCECode(
          new CodeImpl(
              "101.16146", "1.2.36.1.2001.1001.101", "NCTIS Data Components", "Medication Orders"));
  private static final CD CHANGE_TYPE =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.16593", "1.2.36.1.2001.1001.101", "NCTIS Data Components", "Change Type"));
  private static final CD CHANGE_STATUS =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.16595", "1.2.36.1.2001.1001.101", "NCTIS Data Components", "Change Status"));
  private static final CD CHANGE_OR_RECOMMENDATION_REASON =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.10177",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "Change or Recommendation Reason"));
  private static final CD CLINICAL_INDICATION =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.10141",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "Clinical Indication"));
  private static final CE MEDICAL_HISTORY =
      Converter.convertToCECode(
          new CodeImpl(
              "101.16117", "1.2.36.1.2001.1001.101", "NCTIS Data Components", "Medical History"));
  private static final CD UNCATEGORISED_MEDICAL_HISTORY_ITEM =
      Converter.convertToCDCode(
          new CodeImpl(
              "102.16627",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "Uncategorised Medical History Item"));
  private static final CD MEDICALHISTORY_ITEM_COMMENT =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.16630",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "Medical History Item Comment"));
  private static final CD PROCEDURE_COMMENT =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.15595", "1.2.36.1.2001.1001.101", "NCTIS Data Components", "Procedure Comment"));
  private static final CD PROB_OR_DIAG_COMMENT =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.16545",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "Problem/Diagnosis Comment"));
  private static final CD DIAGNOSIS_INTERPRETATION =
      Converter.convertToCDCode(
          new CodeImpl(
              "282291009", "2.16.840.1.113883.6.96", "SNOMED CT", "Diagnosis interpretation"));
  private static final CE IMMUNISATIONS =
      Converter.convertToCECode(
          new CodeImpl(
              "101.16638", "1.2.36.1.2001.1001.101", "NCTIS Data Components", "Immunisations"));
  private static final CE ADVERSE_REACTIONS =
      Converter.convertToCECode(
          new CodeImpl(
              "101.20113", "1.2.36.1.2001.1001.101", "NCTIS Data Components", "Adverse Reactions"));
  private static final CD ADVERSE_REACTION =
      Converter.convertToCDCode(
          new CodeImpl(
              "102.15517", "1.2.36.1.2001.1001.101", "NCTIS Data Components", "Adverse Reaction"));
  private static final CE EVENT_OVERVIEW =
      Converter.convertToCECode(
          new CodeImpl(
              "101.16672", "1.2.36.1.2001.1001.101", "NCTIS Data Components", "Event Overview"));
  private static final CD INDIVIDUAL_TEST_RESULT_COMMENT =
      Converter.convertToCDCode(
          new CodeImpl("281296001", "2.16.840.1.113883.6.96", "SNOMED CT", "result comments"));
  private static final CD INDIVIDUAL_TEST_RESULT_REF_RANGE_COMMENTS =
      Converter.convertToCDCode(
          new CodeImpl(
              "281298000", "2.16.840.1.113883.6.96", "SNOMED CT", "reference range comments"));
  private static final CD INDIVIDUAL_TEST_RESULT_STATUS =
      Converter.convertToCDCode(
          new CodeImpl("308552006", "2.16.840.1.113883.6.96", "SNOMED CT", "report status"));
  private static final CD CLINICAL_INFORMATION_PROVIDED =
      Converter.convertToCDCode(
          new CodeImpl("55752-0", "2.16.840.1.113883.6.1", "LOINC", "Clinical information"));
  private static final CD IMAGING_EXMINATION_RESULT_STATUS =
      Converter.convertToCECode(
          new CodeImpl("308552006", "2.16.840.1.113883.6.96", "SNOMED CT",
              "report status"));
  private static final CD IMAGING_EXAMINATION_RESULT_FINDINGS =
      Converter.convertToCECode(
          new CodeImpl("103.16503", "1.2.36.1.2001.1001.101", "NCTIS Data Components", "Findings"));

  private static final CD COLLECTION_SETTINGS =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.16529",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "Collection Setting"));
  private static final CE IMAGING_EXAMINATION_RESULT =
      Converter.convertToCECode(
          new CodeImpl(
              "102.16145",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "Imaging Examination Result"));
  private static final CE REQUESTED_SERVICE =
      Converter.convertToCECode(
          new CodeImpl(
              "102.20158", "1.2.36.1.2001.1001.101", "NCTIS Data Components", "Requested Service"));
  private static final CD SUBJECT_OF_CARE_INSTR_DESC =
      Converter.convertToCECode(
          new CodeImpl(
              "103.10146",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "Subject of Care Instruction Description"));
  private static final CD REQUESTED_SERVICE_DATETIME =
      Converter.convertToCECode(
          new CodeImpl(
              "103.16635",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "Requested Service DateTime"));
  private static final CD CLINICAL_SYNOPSIS =
      Converter.convertToCDCode(
          new CodeImpl(
              "102.15513", "1.2.36.1.2001.1001.101", "NCTIS Data Components", "Clinical Synopsis"));
  private static final CD REACTION_EVENT =
      Converter.convertToCDCode(
          new CodeImpl(
              "102.16474", "1.2.36.1.2001.1001.101", "NCTIS Data Components", "Reaction Event"));
  private static final CE DIAGNOSTIC_INVESTIGATIONS =
      Converter.convertToCECode(
          new CodeImpl(
              "101.20117",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "Diagnostic Investigations"));
  private static final CD PATHOLOGICAL_DIAGNOSIS =
      Converter.convertToCDCode(
          new CodeImpl("88101002", "2.16.840.1.113883.6.96", "SNOMED CT", "pathology diagnosis"));
  private static final CD LAB_FINDINGS_INTERPRETATION =
      Converter.convertToCDCode(
          new CodeImpl(
              "386344002",
              "2.16.840.1.113883.6.96",
              "SNOMED CT",
              "laboratory findings data interpretation"));
  private static final CD PATH_TEST_COMMENT =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.16468", "1.2.36.1.2001.1001.101", "NCTIS Data Components", "Test Comment"));
  private static final CD TEST_REQ_DETAILS =
      Converter.convertToCDCode(
          new CodeImpl(
              "102.16160",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "Test Request Details"));
  private static final CD TEST_REQ_NAME =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.16404",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "Test Requested Name"));
  private static final CD PATHOLOGY_TEST_RESULT_DATETIME =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.16605",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "Pathology Test Result DateTime"));
  private static final CD INDIVIDIUAL_RESULT_COMMENT_CODE =
      Converter.convertToCDCode(
          new CodeImpl("281296001", "2.16.840.1.113883.6.96", "SNOMED CT", "result comments"));
  private static final CD EXAMINATION_REQUESTED_NAME =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.16512",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "Examination Requested Name"));
  private static final CD DICOM_STUDY_IDENTIFIER =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.16513",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "DICOM Study Identifier"));

  private static final CD DICOM_SERIES_IDENTIFIER =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.16517",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "DICOM Series Identifier"));
  private static final CD EXAMINATION_REQUEST_DETAILS =
      Converter.convertToCDCode(
          new CodeImpl(
              "102.16511",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "Examination Request Details"));
  private static final CD EXMANATION_IMAGE_DETAILS =
      Converter.convertToCDCode(
          new CodeImpl(
              "102.16515", "1.2.36.1.2001.1001.101", "NCTIS Data Components", "Image Details"));
  private static final CD EXAMINATION_REPORT_IDENTIFIER =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.16514", "1.2.36.1.2001.1001.101", "NCTIS Data Components", "Report Identifier"));
  /*private static final CD DICOM_SERIES_IDENTIFIER =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.16517",
              "1.2.36.1.2001.1001.101",
              "NCTIS Data Components",
              "DICOM Series Identifier"));*/
  private static final CD SUBJECT_POSITION =
      Converter.convertToCDCode(
          new CodeImpl(
              "103.16519", "1.2.36.1.2001.1001.101", "NCTIS Data Components", "Subject Position"));
  private static final CD IMAGING_EXAMINATION_RESULT_DATETIME = Converter.convertToCECode(
      new CodeImpl(
          "103.16589",
          "1.2.36.1.2001.1001.101",
          "NCTIS Data Components",
          "Imaging Examination Result DateTime"));
  private static final CE OTHER_TEST_RESULT = Converter.convertToCECode(
      new CodeImpl("102.16029", "1.2.36.1.2001.1001.101", "NCTIS Data Components",
          "Diagnostic Investigation"));
  private static final CD OTHER_TEST_RESULT_REPORT_STATUS = Converter
      .convertToCDCode(
          new CodeImpl("308552006", "2.16.840.1.113883.6.96", "SNOMED CT-AU", "report status") {{
            setCodeSystemVersion("20110531");
          }});

  private ObjectFactory objectFactory = new ObjectFactory();
  private EventSummaryCDAModel cdaModel;
  private EventSummary clinicalModel;

  public EventSummaryCreator(EventSummaryCDAModel cdaModel, EventSummary clinicalModel) {
    this.cdaModel = cdaModel;
    this.clinicalModel = clinicalModel;

    // for schematron checking
    this.resource = SchematronResources.PATHOLOGY_REPORT_3B.resource();
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
    POCDMT000040Component1 componentOf = new POCDMT000040Component1();
    POCDMT000040EncompassingEncounter encompassingEncounter =
        new POCDMT000040EncompassingEncounter();
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
    clinicalDocument.getAuthor().add(getDocumentAuthor());
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

  private Document getDocumentFilteredOfNull(Document doc) {//Need to optimise this method
    NodeList nodeList = doc.getElementsByTagNameNS("*", "*");
    for (int i = 0; i < nodeList.getLength(); i++) {
      Node node = nodeList.item(i);
      if (null != node.getAttributes().getNamedItem("xsi:nil")) {
        //System.out.println("Removing: " + node.getNamespaceURI());
        node.getParentNode().removeChild(node);
      }
    }
    return doc;
  }

  private POCDMT000040Component2 getCDABody() {
    POCDMT000040Component2 component = new POCDMT000040Component2();
    POCDMT000040StructuredBody structuredBody = new POCDMT000040StructuredBody();
    structuredBody.getComponent().add(getEventDetails());
    structuredBody.getComponent().add(getNewlyIdentifiedAdverseReactions());
    structuredBody.getComponent().add(getMedications());
    structuredBody.getComponent().add(getDiagnosesInterventions());
    structuredBody.getComponent().add(getImmunisations());
    structuredBody.getComponent().add(getDiagnosticInvestigations());
    structuredBody.getComponent().add(getAdministrativeObservationsSection());
    component.setStructuredBody(structuredBody);
    return component;
  }

  private POCDMT000040Component3 getDiagnosticInvestigations() {
    DiagnosticInvestigations diagnosticInvestigations =
        clinicalModel.getContent().getDiagnosticInvestigations();
    if (null == diagnosticInvestigations) {
      return null;
    }
    POCDMT000040Component3 diagnosticInvestigationsComponent = new POCDMT000040Component3();
    diagnosticInvestigationsComponent.setTypeCode(ActRelationshipHasComponent.COMP);
    POCDMT000040Section diagnosticInvestigationsSection = new POCDMT000040Section();
    diagnosticInvestigationsSection.setClassCode(ActClass.DOCSECT);
    diagnosticInvestigationsSection.setMoodCode(ActMood.EVN);
    diagnosticInvestigationsSection.setId(CDATypeUtil.getII(UUID.randomUUID().toString()));
    diagnosticInvestigationsSection.setCode(DIAGNOSTIC_INVESTIGATIONS);
    diagnosticInvestigationsSection.setTitle(CDATypeUtil.getST("Diagnostic Investigations"));
    diagnosticInvestigationsSection.setText(NarrativeUtil.DIAGNOSTIC_INVESTIGATIONS_SECTION_TEXT);

    //TODO : Other Test Results + Narrative (Diagnostic Investigation) (Undifferentiated Pathology) - Left out for now

    // Request Service List
    createRequestedServices(diagnosticInvestigations, diagnosticInvestigationsSection);

    // Pathology Test Results List
    createPathologyTestResults(diagnosticInvestigations, diagnosticInvestigationsSection);

    // Imaging Examination Results List
    createImagingExaminationResults(diagnosticInvestigations, diagnosticInvestigationsSection);

    // Other Test Results - Undifferentiated Pathology & Radiology report(s)
    createOtherTestResults(diagnosticInvestigations, diagnosticInvestigationsSection);

    diagnosticInvestigationsComponent.setSection(diagnosticInvestigationsSection);
    return diagnosticInvestigationsComponent;
  }

  private void createOtherTestResults(DiagnosticInvestigations diagnosticInvestigations,
      POCDMT000040Section diagnosticInvestigationsSection) {
    if (null != diagnosticInvestigations && null != diagnosticInvestigations.getOtherTestResults()
        && !diagnosticInvestigations.getOtherTestResults().isEmpty()) {
      diagnosticInvestigations.getOtherTestResults().stream().filter(Objects::nonNull).forEach(
          otherTestResult -> {
            POCDMT000040Component5 otherTestResultComp = new POCDMT000040Component5();
            POCDMT000040Section otherTestResultSection = new POCDMT000040Section();
            otherTestResultSection.setId(CDATypeUtil.getII(UUID.randomUUID().toString()));
            otherTestResultSection.setCode(OTHER_TEST_RESULT);
            otherTestResultSection.setTitle(CDATypeUtil.getST("Diagnostic Investigation"));

            POCDMT000040Entry otherTestResultEntry = new POCDMT000040Entry();
            POCDMT000040Observation otherTestResultObs = new POCDMT000040Observation();
            otherTestResultObs.setClassCode(ActClassObservation.OBS);
            otherTestResultObs.setMoodCode(XActMoodDocumentObservation.EVN);
            otherTestResultObs.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
            otherTestResultObs.setCode(Converter.convertToCDCode(otherTestResult.getReportName()));
            if (null != otherTestResult.getReportDate()) { // Report Date - if available
              otherTestResultObs
                  .setEffectiveTime(Converter.convert(otherTestResult.getReportDate()));
            }
            if (null != otherTestResult.getReportFile()) { // Report attached file
              otherTestResultObs.getValue()
                  .add(getEDFromAttachedMedia(otherTestResult.getReportFile()));
              // Add Entry Relationship for PDF report file
              POCDMT000040EntryRelationship reportFileEntryRelationship = new POCDMT000040EntryRelationship();
              reportFileEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
              POCDMT000040ObservationMedia reportFileObservationMedia = new POCDMT000040ObservationMedia();
              reportFileObservationMedia.setClassCode(ActClassObservation.OBS);
              reportFileObservationMedia.setMoodCode(ActMood.EVN);
              reportFileObservationMedia.setIDAttribute(getUUID());
              otherTestResult.getReportFile()
                  .setObservationMediaReference(reportFileObservationMedia);
              reportFileObservationMedia
                  .setValue(getEDFromAttachedMedia(otherTestResult.getReportFile()));
              reportFileEntryRelationship.setObservationMedia(reportFileObservationMedia);
              otherTestResultObs.getEntryRelationship().add(reportFileEntryRelationship);
            } else { //Report in Text Format
              otherTestResultObs.getValue()
                  .add(CDATypeUtil.getED(otherTestResult.getReportContent()));
            } // Both report formats are mutually exclusive
            if (null != otherTestResult.getReportStatus()) { // Report status - if available
              POCDMT000040EntryRelationship reportStatusEntryRelationship = new POCDMT000040EntryRelationship();
              reportStatusEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
              POCDMT000040Observation reportStatusObs = new POCDMT000040Observation();
              reportStatusObs.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
              reportStatusObs.setClassCode(ActClassObservation.OBS);
              reportStatusObs.setMoodCode(XActMoodDocumentObservation.EVN);
              reportStatusObs.setCode(OTHER_TEST_RESULT_REPORT_STATUS);
              reportStatusObs.getValue().add(CDATypeUtil.getCD(otherTestResult.getReportStatus()));
              reportStatusEntryRelationship.setObservation(reportStatusObs);
              otherTestResultObs.getEntryRelationship().add(reportStatusEntryRelationship);
            }
            otherTestResultSection.setText(NarrativeUtil.getOtherTestResult(otherTestResult));
            otherTestResultEntry.setObservation(otherTestResultObs);
            otherTestResultSection.getEntry().add(otherTestResultEntry);
            otherTestResultComp.setSection(otherTestResultSection);
            diagnosticInvestigationsSection.getComponent().add(otherTestResultComp);
          });
    }
  }

  private void createRequestedServices(DiagnosticInvestigations diagnosticInvestigations,
      POCDMT000040Section diagnosticInvestigationsSection) {
    if (null != diagnosticInvestigations.getRequestedServices()
        && !diagnosticInvestigations.getRequestedServices().isEmpty()) {
      diagnosticInvestigations.getRequestedServices().stream().filter(Objects::nonNull)
          .forEach(requestedService -> {
                POCDMT000040Component5 requestedServicedComp = new POCDMT000040Component5();
                POCDMT000040Section requestedServiceSection = new POCDMT000040Section();
                requestedServiceSection.setTitle(CDATypeUtil.getST("Requested Service"));
                requestedServiceSection.setId(CDATypeUtil.getII(UUID.randomUUID().toString()));
                requestedServiceSection.setCode(REQUESTED_SERVICE);
                requestedServiceSection.getEntry().add(getRequestedServiceEntry(requestedService));
                String performerAssignedEntityId = requestedServiceSection.getEntry().get(0).getAct()
                    .getPerformer().get(0).getAssignedEntity().getId().get(0).getRoot();
                // Entitlement Coverage

              if (null != requestedService.getParticipant().getParticipant().getHealthCareProvider()) {
                  requestedService.getParticipant().getParticipant().getHealthCareProvider()
                          .getEntitlements().stream().filter(Objects::nonNull)
                          .forEach(entitlement -> requestedServiceSection.getCoverage2()
                                  .add(getEntitlementCoverage(entitlement, performerAssignedEntityId)));
              }

                requestedServiceSection
                    .setText(NarrativeUtil.getRequestedServiceNarrative(requestedService));
                requestedServicedComp.setSection(requestedServiceSection);
                diagnosticInvestigationsSection.getComponent().add(requestedServicedComp);
              }
          );
    }
  }

  private void createImagingExaminationResults(DiagnosticInvestigations diagnosticInvestigations,
      POCDMT000040Section diagnosticInvestigationsSection) {
    if (null != diagnosticInvestigations.getImagingExaminationResults()
        && !diagnosticInvestigations.getImagingExaminationResults().isEmpty()) {
      diagnosticInvestigations.getImagingExaminationResults().stream()
          .filter(Objects::nonNull).forEach(imagingExaminationResult -> {
            POCDMT000040Component5 imagingExaminationResultComp = new POCDMT000040Component5();
            POCDMT000040Section imagingExaminationResultSection = new POCDMT000040Section();
            imagingExaminationResultSection
                .setTitle(CDATypeUtil.getST("Imaging Examination Result"));
            imagingExaminationResultSection
                .setId(CDATypeUtil.getII(UUID.randomUUID().toString()));
            imagingExaminationResultSection.setCode(IMAGING_EXAMINATION_RESULT);
            imagingExaminationResultSection.getEntry()
                .add(getImagingExaminationResultEntry(imagingExaminationResult));
            imagingExaminationResultSection.setText(NarrativeUtil
                .getCustomNarrativeImagingExaminationResult(imagingExaminationResult));
            imagingExaminationResultComp.setSection(imagingExaminationResultSection);
            diagnosticInvestigationsSection.getComponent().add(imagingExaminationResultComp);
          }
      );
    }
  }

  private void createPathologyTestResults(DiagnosticInvestigations diagnosticInvestigations,
      POCDMT000040Section diagnosticInvestigationsSection) {
    if (null != diagnosticInvestigations.getPathologyTestResults()
        && !diagnosticInvestigations.getPathologyTestResults().isEmpty()) {
      diagnosticInvestigations.getPathologyTestResults().stream()
          .filter(Objects::nonNull)
          .forEach(pathologyTestResult -> {
            POCDMT000040Component5 pathologyTestResultComp = new POCDMT000040Component5();
            POCDMT000040Section pathologyTestResultSection = new POCDMT000040Section();
            pathologyTestResultSection.setId(CDATypeUtil.getII(UUID.randomUUID().toString()));
            pathologyTestResultSection.setCode(PATHOLOGY_TEST_RESULT);
            pathologyTestResultSection.setTitle(CDATypeUtil.getST("Pathology Test Result"));
            //Observation Entry
            pathologyTestResultSection.getEntry()
                .add(getPathologyTestResultEntry(pathologyTestResult));
            //Observation Media Entry
            if (null != pathologyTestResult.getTestResultRepresentation()) {
              pathologyTestResultSection.getEntry()
                  .add(getPathologyTestResultMediaEntry(pathologyTestResult));
            }
            //Narrative
            pathologyTestResultSection
                .setText(
                    NarrativeUtil.getCustomNarrativePathologyTestResults(pathologyTestResult));
            pathologyTestResultComp.setSection(pathologyTestResultSection);
            diagnosticInvestigationsSection.getComponent().add(pathologyTestResultComp);
          }); // PathologyTestResult Ends
    }
  }

  private Coverage2 getEntitlementCoverage(
      au.gov.nehta.model.clinical.etp.common.participation.Entitlement entitlement,
      String performerAssignedEntityId) {

    Coverage2 coverage = new Coverage2();
    coverage.setTypeCode("COVBY");
    Entitlement entitlementCda = new Entitlement();
    entitlementCda.setClassCode(EntityClass.COV);
    entitlementCda.setMoodCode(ActMood.EVN);

    entitlementCda.setId(CDATypeUtil.getII(entitlement.getEntitlementNumber().getRoot(),
        entitlement.getEntitlementNumber().getExtension()));

    entitlementCda.setCode(EntitlementTypeCodeSet.convert(entitlement.getEntitlementType()));
    entitlementCda
        .setEffectiveTime(Converter.convert(entitlement.getEntitlementValidityDuration()));
    // Participant start
    Participant participantCda = new Participant();
    participantCda.setTypeCode(ParticipationType.HLD);
    ParticipantRole participantRoleCda = new ParticipantRole();
    participantRoleCda.setClassCode(RoleClass.ASSIGNED);
    // This SHALL hold the same value as performer/assignedEntity/id
    participantRoleCda.setId(CDATypeUtil.getII(performerAssignedEntityId));

    participantCda.setParticipantRole(participantRoleCda);
    entitlementCda.getParticipant().add(participantCda);
    coverage.setEntitlement(entitlementCda);

    return coverage;
  }


  private POCDMT000040Entry getRequestedServiceEntry(RequestedService requestedService) {

    POCDMT000040Entry requestedServiceEntry = new POCDMT000040Entry();

    // Requested Service Description
    POCDMT000040Act requestedServiceEntryAct = new POCDMT000040Act();
    requestedServiceEntryAct.setClassCode(XActClassDocumentEntryAct.ACT);
    requestedServiceEntryAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    requestedServiceEntryAct.setCode(Converter.convertToCECode(new CodeImpl(
        requestedService.getRequestedServiceDescription().getCode(),
        requestedService.getRequestedServiceDescription().getCodeSystem(),
        requestedService.getRequestedServiceDescription().getCodeSystemName(),
        requestedService.getRequestedServiceDescription().getDisplayName())));

      // DateTime Service Scheduled and Mood Code TODO : Commencement window and status
    if (requestedService.getServiceBookingStatus() == EventTypes.EVENT) {
      requestedServiceEntryAct.setEffectiveTime(
          Converter.convert(requestedService.getRequestedServiceDateTime()));
      requestedServiceEntryAct.setMoodCode(XDocumentActMood.EVN);
    } else if (requestedService.getServiceBookingStatus() == EventTypes.INTENT) {
      requestedServiceEntryAct.setEffectiveTime(
          Converter.convert(requestedService.getServiceCommencementWindow()));
      requestedServiceEntryAct.setMoodCode(XDocumentActMood.INT);
    }

    requestedServiceEntry.setAct(requestedServiceEntryAct);

    // Subject of Care Instruction Description Begin (part of requestedServiceAct)
    POCDMT000040EntryRelationship subjectOfCareEntryRelationship =
        new POCDMT000040EntryRelationship();
    subjectOfCareEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Act subjectOfCareAct = new POCDMT000040Act();
    subjectOfCareAct.setClassCode(XActClassDocumentEntryAct.INFRM);
    subjectOfCareAct.setMoodCode(XDocumentActMood.EVN);
    subjectOfCareAct.setCode(SUBJECT_OF_CARE_INSTR_DESC);
    subjectOfCareAct.setText(CDATypeUtil.getED(requestedService.getSubjectOfCareInstructionDesc()));
    subjectOfCareEntryRelationship.setAct(subjectOfCareAct);
    requestedServiceEntryAct.getEntryRelationship().add(subjectOfCareEntryRelationship);

    // Service Provider
    if (null != requestedService.getParticipant()) {
      requestedServiceEntryAct.getPerformer().add(getServiceProviderPerformer(requestedService));
    }

    // Requested Service DateTime Begin
    POCDMT000040EntryRelationship requestedServiceDateTimeEntryRelationship = new POCDMT000040EntryRelationship();
    requestedServiceDateTimeEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Act requestedServiceDateTimeAct = new POCDMT000040Act();
    requestedServiceDateTimeAct.setClassCode(XActClassDocumentEntryAct.ACT);
    requestedServiceDateTimeAct.setMoodCode(XDocumentActMood.EVN);
    requestedServiceDateTimeAct.setCode(REQUESTED_SERVICE_DATETIME);
    requestedServiceDateTimeAct.setEffectiveTime(
        Converter.convert(requestedService.getRequestedServiceDateTime()));
    requestedServiceDateTimeEntryRelationship.setAct(requestedServiceDateTimeAct);
    requestedServiceEntryAct.getEntryRelationship().add(requestedServiceDateTimeEntryRelationship);

    return requestedServiceEntry;
  }

  private POCDMT000040Performer2 getServiceProviderPerformer(RequestedService requestedService) {
    //Service Provider Start
    POCDMT000040Performer2 performer = null;
    ParticipationServiceProvider participationServiceProvider = requestedService.getParticipant();

      // Mutually Exclusive (Healthcare Person or Organisation) -stop user initializing both (throw exception)
    if (null != participationServiceProvider.getParticipant().getHealthCareProvider()) {
      performer = getHealthcarePersonPerformer(participationServiceProvider);

    } else if (null != participationServiceProvider.getParticipant().getOrganisation()) {
        performer = getOrganizationPerformer(participationServiceProvider);
    }

    return performer;
  }

  private POCDMT000040Performer2 getHealthcarePersonPerformer(
      ParticipationServiceProvider participationServiceProvider) {

    ServiceProvider serviceProvider = participationServiceProvider.getParticipant();
    POCDMT000040Performer2 performer = new POCDMT000040Performer2();
    POCDMT000040AssignedEntity assignedEntity = new POCDMT000040AssignedEntity();
    performer.setTypeCode(ParticipationPhysicalPerformer.PRF);
    assignedEntity.setCode(Converter.convertToCECode(participationServiceProvider.getRole()));

    II assignedEntityEntitlementUUID = CDATypeUtil.getII(UUID.randomUUID().toString());
    assignedEntity.getId().add(assignedEntityEntitlementUUID);

    //Assigned Person
    POCDMT000040Person assignedPerson = new POCDMT000040Person();

    if (null != serviceProvider.getEntityIdentifiers()) {
      serviceProvider.getEntityIdentifiers().stream().filter(Objects::nonNull)
          .forEach(asEntityIdentifier -> assignedPerson.getAsEntityIdentifier()
              .add(Converter.convert(asEntityIdentifier)));
    }
    //Assigned Person Name
    serviceProvider.getHealthCareProvider().getPersonNames().stream()
        .filter(Objects::nonNull).forEach(personName ->
        assignedPerson.getName().add(Converter.getPersonName(personName)));

    // TODO employer organisation should be a list ? See below. Also P288 cda
    //extension :  Employer Organisation for assigned Person
    Employment assignedPersonEmployment = new Employment();
    assignedPersonEmployment.setClassCode(EntityClass.EMP);
    assignedPersonEmployment
        .setJobClassCode(Converter.convertToCECode(serviceProvider.getHealthCareProvider()
            .getEmploymentOrganisation().getEmploymentType()));
    assignedPersonEmployment
        .setJobCode(Converter.convertToCECode(serviceProvider.getHealthCareProvider()
            .getEmploymentOrganisation().getOccupation())); //TODO Should be a list?
    assignedPersonEmployment.setCode(Converter.convertToCECode(
        serviceProvider.getHealthCareProvider().getEmploymentOrganisation()
            .getPositionInOrganization()));
    POCDMT000040Organization employerOrganisation = new POCDMT000040Organization();
    employerOrganisation.getName().add(Converter.getOrganizationNameAndUse(
        serviceProvider.getHealthCareProvider().getEmploymentOrganisation().getDepartment()));
    POCDMT000040OrganizationPartOf asOrganisationPartOf = new POCDMT000040OrganizationPartOf();
    POCDMT000040Organization wholeOrganisation = new POCDMT000040Organization();

    wholeOrganisation.getName()
        .add(Converter.getOrganizationNameAndUse(serviceProvider.getHealthCareProvider()
            .getEmploymentOrganisation().getName()));

    List<AsEntityIdentifier> woIdentifiers = serviceProvider.getHealthCareProvider()
        .getEmploymentOrganisation().getIdentifiers();

    woIdentifiers.stream().filter(Objects::nonNull).forEach(
        asEntityIdentifier -> wholeOrganisation.getAsEntityIdentifier()
            .add(Converter.convert(asEntityIdentifier)));

    asOrganisationPartOf.setWholeOrganization(wholeOrganisation);
    employerOrganisation.setAsOrganizationPartOf(asOrganisationPartOf);
    assignedPersonEmployment.setEmployerOrganization(employerOrganisation);
    assignedPerson.setAsEmployment(assignedPersonEmployment);

    //Address Detail
    List<Address> addresses = serviceProvider.getAddresses();
    assignedEntity.getAddr().addAll(AddressConverter.convertAustralianAddress(addresses));

    //Communication Detail
    List<ElectronicCommunicationDetail> electronicCommunicationDetails =
        serviceProvider.getElectronicCommunicationDetails();
    assignedEntity.getTelecom()
        .addAll(Converter.convertElectronicCommunicationDetail(electronicCommunicationDetails));

    // Qualifications
    Qualifications qualifications = new Qualifications();
    qualifications.setClassCode(EntityClass.QUAL);
    CE qualificationsCode = new CE();
    qualificationsCode.setOriginalText(CDATypeUtil.getED(serviceProvider
        .getHealthCareProvider().getQualifications()));
    qualifications.setCode(qualificationsCode);
    assignedPerson.setAsQualifications(qualifications);

    assignedEntity.setAssignedPerson(assignedPerson);
    performer.setAssignedEntity(assignedEntity);
    return performer;
  }


  private POCDMT000040Performer2 getOrganizationPerformer(
      ParticipationServiceProvider participationServiceProvider) {

    ServiceProvider serviceProvider = participationServiceProvider.getParticipant();
    POCDMT000040Performer2 performer = new POCDMT000040Performer2();
    performer.setTypeCode(ParticipationPhysicalPerformer.PRF);
    performer.setTime(Converter.convert(participationServiceProvider.getParticipationPeriod()));
    POCDMT000040AssignedEntity assignedEntity = new POCDMT000040AssignedEntity();
    assignedEntity.setCode(Converter.convertToCECode(participationServiceProvider.getRole()));
    assignedEntity.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));

    //Represented Organisation
    POCDMT000040Organization representedOrginization = new POCDMT000040Organization();
    POCDMT000040OrganizationPartOf asOrganisationPartOf = new POCDMT000040OrganizationPartOf();
    POCDMT000040Organization wholeOrganisation = new POCDMT000040Organization();
    //List of Entity Identifiers for whole organisation
    if (null != serviceProvider.getEntityIdentifiers()) {
      serviceProvider.getEntityIdentifiers().stream().filter(Objects::nonNull)
          .forEach(asEntityIdentifier -> wholeOrganisation.getAsEntityIdentifier()
              .add(Converter.convert(asEntityIdentifier)));
    }
    //Whole Organisation Name
    wholeOrganisation.getName().add(Converter.getOrganizationNameAndUse(serviceProvider
        .getOrganisation().getOrganisationName()));
    asOrganisationPartOf.setWholeOrganization(wholeOrganisation);
    representedOrginization.setAsOrganizationPartOf(asOrganisationPartOf);

    //Address Detail
    List<Address> addresses = serviceProvider.getAddresses();
    assignedEntity.getAddr().addAll(AddressConverter.convertAustralianAddress(addresses));

    //Communication Detail
    List<ElectronicCommunicationDetail> electronicCommunicationDetails =
        serviceProvider.getElectronicCommunicationDetails();
    assignedEntity.getTelecom()
        .addAll(Converter.convertElectronicCommunicationDetail(electronicCommunicationDetails));

    performer.setAssignedEntity(assignedEntity);
    return performer;
  }

  private POCDMT000040Entry getImagingExaminationResultEntry(
      ImagingExaminationResult imagingExaminationResult) {
    POCDMT000040Entry imagingExaminationResultEntry = new POCDMT000040Entry();
    POCDMT000040Observation imagingExaminationResultObservation = new POCDMT000040Observation();
    imagingExaminationResultObservation.setClassCode(ActClassObservation.OBS);
    imagingExaminationResultObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    imagingExaminationResultObservation.getId()
        .add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    imagingExaminationResultObservation.setCode(Converter.convertToCDCode(imagingExaminationResult
        .getImagingExaminationResultName()));
    imagingExaminationResultObservation.getValue().add(Converter.convert(imagingExaminationResult
        .getExaminationResultRepresentation()));
    imagingExaminationResultObservation.getMethodCode()
        .add(Converter.convertToCECode(imagingExaminationResult
            .getImagingModality()));
    // Anatomical Site list
    if (null != imagingExaminationResult.getAnatomicalSites()
        && !imagingExaminationResult.getAnatomicalSites().isEmpty()) {
      imagingExaminationResult.getAnatomicalSites().stream().filter(Objects::nonNull)
          .forEach(anatomicalSite -> processAnatomicalSite(imagingExaminationResultObservation,
              anatomicalSite, XActRelationshipEntryRelationship.REFR));
    }
    // Imaging Examination Result Status
    imagingExaminationResultObservation.getEntryRelationship()
        .add(getResultStatusRelForImgExamResult(imagingExaminationResult));
    // Clinical Information Provided
    imagingExaminationResultObservation.getEntryRelationship()
        .add(getClinicalInfoProvidedForImgExamResult(imagingExaminationResult));
    // Findings
    imagingExaminationResultObservation.getEntryRelationship()
        .add(getFindingsForImgExamResult(imagingExaminationResult));

    // Imaging Examination Result Group
    if (null != imagingExaminationResult.getResultGroups()
        && !imagingExaminationResult.getResultGroups().isEmpty()) {
      imagingExaminationResultObservation.getEntryRelationship()
          .addAll(processImagingExaminationResultGroupEntryRelationships(
              imagingExaminationResult.getResultGroups()));
    }

    // Examination Result Presentation
    imagingExaminationResultObservation
        .setText(CDATypeUtil.getED(imagingExaminationResult.getExaminationResultRepresentation()));

    //Examination Request Details
    imagingExaminationResult.getExaminationRequestDetails().stream()
        .filter(Objects::nonNull).forEach(
        examinationRequestDetails -> imagingExaminationResultObservation.getEntryRelationship()
            .add(getExaminationRequestDetails(examinationRequestDetails)));

    // Observation DateTime
    POCDMT000040EntryRelationship odtEntryRelationShip =
        new POCDMT000040EntryRelationship();
    odtEntryRelationShip.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Observation odtObservation = new POCDMT000040Observation();
    odtObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    odtObservation.setClassCode(ActClassObservation.OBS);
    odtObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    odtObservation.setCode(IMAGING_EXAMINATION_RESULT_DATETIME);
    odtObservation.setEffectiveTime(
        Converter.convert(imagingExaminationResult.getObservationDateTime()));
    odtEntryRelationShip.setObservation(odtObservation);
    imagingExaminationResultObservation.getEntryRelationship().add(odtEntryRelationShip);

    imagingExaminationResultEntry.setObservation(imagingExaminationResultObservation);

    return imagingExaminationResultEntry;
  }

  private POCDMT000040EntryRelationship getFindingsForImgExamResult(
      ImagingExaminationResult imagingExaminationResult) {
    POCDMT000040EntryRelationship fEntryRelationship =
        new POCDMT000040EntryRelationship();
    fEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.REFR);
    POCDMT000040Observation fObservation = new POCDMT000040Observation();
    fObservation.setClassCode(ActClassObservation.OBS);
    fObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    fObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    fObservation.setCode(IMAGING_EXAMINATION_RESULT_FINDINGS);
    fObservation.setText(CDATypeUtil.getST(imagingExaminationResult.getFindings()));
    fEntryRelationship.setObservation(fObservation);
    return fEntryRelationship;
  }

  private POCDMT000040EntryRelationship getClinicalInfoProvidedForImgExamResult(
      ImagingExaminationResult imagingExaminationResult) {
    POCDMT000040EntryRelationship cipEntryRelationship =
        new POCDMT000040EntryRelationship();
    cipEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Act cipAct = new POCDMT000040Act();
    cipAct.setClassCode(XActClassDocumentEntryAct.INFRM);
    cipAct.setMoodCode(XDocumentActMood.EVN);
    cipAct.setCode(CLINICAL_INFORMATION_PROVIDED);
    cipAct.setText(CDATypeUtil.getST(imagingExaminationResult.getClinicalInformationProvided()));
    cipEntryRelationship.setAct(cipAct);
    return cipEntryRelationship;
  }

  private POCDMT000040EntryRelationship getResultStatusRelForImgExamResult(
      ImagingExaminationResult imagingExaminationResult) {
    POCDMT000040EntryRelationship ierEntryRelationship =
        new POCDMT000040EntryRelationship();
    ierEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Observation ierObservation = new POCDMT000040Observation();
    ierObservation.setClassCode(ActClassObservation.OBS);
    ierObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    ierObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    ierObservation.setCode(IMAGING_EXMINATION_RESULT_STATUS);
    ierObservation.getValue().add(Converter.convertToCDCode(imagingExaminationResult
        .getImagingExaminationResultStatus()));
    ierEntryRelationship.setObservation(ierObservation);
    return ierEntryRelationship;
  }


  private POCDMT000040EntryRelationship getExaminationRequestDetails(
      ExaminationRequestDetails examinationRequestDetails) {
    // Examination Request Details Begin
    POCDMT000040EntryRelationship examReqDetailsEntryRelationship = new POCDMT000040EntryRelationship();
    examReqDetailsEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.SUBJ);
    examReqDetailsEntryRelationship.setInversionInd(true);
    POCDMT000040Act examReqDetailsAct = new POCDMT000040Act();
    examReqDetailsAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    examReqDetailsAct.setClassCode(XActClassDocumentEntryAct.ACT);
    examReqDetailsAct.setMoodCode(XDocumentActMood.EVN);
    examReqDetailsAct.setCode(EXAMINATION_REQUEST_DETAILS);
    examReqDetailsEntryRelationship.setAct(examReqDetailsAct);

    //Examination Request Details -> Examination Request Name (List)
    examinationRequestDetails.getExaminationRequestedNames().forEach(requestedName -> {
      POCDMT000040EntryRelationship examReqNameEntryRelationship = new POCDMT000040EntryRelationship();
      examReqNameEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.REFR);
      POCDMT000040Observation examReqNameObservation = new POCDMT000040Observation();
      examReqNameObservation.setClassCode(ActClassObservation.OBS);
      examReqNameObservation.setMoodCode(XActMoodDocumentObservation.EVN);
      examReqNameObservation.setCode(EXAMINATION_REQUESTED_NAME);
      examReqNameEntryRelationship.setObservation(examReqNameObservation);
      examReqNameObservation.getValue().add(CDATypeUtil.getST(requestedName));
      examReqNameObservation.setText(CDATypeUtil.getED(requestedName));
      examReqDetailsEntryRelationship.getAct().getEntryRelationship()
          .add(examReqNameEntryRelationship);
    });

    // Examination Request Details -> Report Identifier Begin
    POCDMT000040EntryRelationship reportIdentifierRelationship = new POCDMT000040EntryRelationship();
    reportIdentifierRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Observation reportIdentifierObservation = new POCDMT000040Observation();
    reportIdentifierRelationship.setObservation(reportIdentifierObservation);
    reportIdentifierObservation.setClassCode(ActClassObservation.OBS);
    reportIdentifierObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    reportIdentifierObservation.getId()
        .add(CDATypeUtil.getII(examinationRequestDetails.getReportIdentifier().getRoot()));
    reportIdentifierObservation.setCode(EXAMINATION_REPORT_IDENTIFIER);
    examReqDetailsAct.getEntryRelationship().add(reportIdentifierRelationship);

    //  DICOM Study Identifier Begin (examination performed)
    POCDMT000040EntryRelationship examinationPerformedEntryRelationship = new POCDMT000040EntryRelationship();
    examinationPerformedEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.SUBJ);
    examinationPerformedEntryRelationship.setInversionInd(true);
    POCDMT000040Act dsiAct = new POCDMT000040Act();
    dsiAct.setClassCode(XActClassDocumentEntryAct.ACT);
    dsiAct.setMoodCode(XDocumentActMood.EVN);
    dsiAct.setCode(DICOM_STUDY_IDENTIFIER);
    dsiAct.getId()
        .add(CDATypeUtil.getII(examinationRequestDetails.getSeriesIdentifier().getRoot(),
            examinationRequestDetails.getSeriesIdentifier().getExtension()));
    examinationPerformedEntryRelationship.setAct(dsiAct);
    examReqDetailsAct.getEntryRelationship().add(examinationPerformedEntryRelationship);

    // Image Details Begin
    examinationRequestDetails.getImageDetails().stream().filter(Objects::nonNull)
        .forEach(imageDetail -> dsiAct.getEntryRelationship()
            .add(createImageDetailEntryRelationship(imageDetail)));

    return examReqDetailsEntryRelationship;
  }

  private POCDMT000040EntryRelationship createImageDetailEntryRelationship(
      ImageDetails imageDetail) {
    POCDMT000040EntryRelationship imageDetailEntryRelationship = new POCDMT000040EntryRelationship();
    imageDetailEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    imageDetailEntryRelationship.setInversionInd(true);
    POCDMT000040Observation imageDetailObservation = new POCDMT000040Observation();
    imageDetailObservation.setClassCode(ActClassObservation.OBS);
    imageDetailObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    imageDetailObservation.setCode(EXMANATION_IMAGE_DETAILS);
    imageDetailObservation.getId().add(CDATypeUtil.getII(imageDetail.getImageIdentifier().getRoot(),
        imageDetail.getImageIdentifier().getExtension()));
    imageDetailObservation.getValue()
        .add(Converter.convertToCDCode(imageDetail.getImageViewName()));

    //DICOM Identifier
    POCDMT000040EntryRelationship dcomEntryRelationship = new POCDMT000040EntryRelationship();
    dcomEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.REFR);
    POCDMT000040Act dcomAct = new POCDMT000040Act();
    dcomAct.setClassCode(XActClassDocumentEntryAct.ACT);
    dcomAct.setMoodCode(XDocumentActMood.EVN);
    dcomAct.getId().add(CDATypeUtil.getII(imageDetail.getSeriesIdentifier().getRoot(),
        imageDetail.getSeriesIdentifier().getExtension()));
    dcomAct.setCode(DICOM_SERIES_IDENTIFIER);
    dcomEntryRelationship.setAct(dcomAct);
    imageDetailObservation.getEntryRelationship().add(dcomEntryRelationship);

    // Subject Position Begin
    POCDMT000040EntryRelationship spEntryRelationship = new POCDMT000040EntryRelationship();
    spEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.REFR);
    POCDMT000040Observation spObservation = new POCDMT000040Observation();
    spObservation.setClassCode(ActClassObservation.OBS);
    spObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    spObservation.setCode(SUBJECT_POSITION);
    spObservation.getValue().add(CDATypeUtil.getST(imageDetail.getSubjectPosition()));
    spEntryRelationship.setObservation(spObservation);

    imageDetailObservation.getEntryRelationship().add(spEntryRelationship);
    imageDetailObservation.setEffectiveTime(Converter.convert(imageDetail.getImageDateTime()));
    //Image Observation Media
    if (null != imageDetail.getImage()) {
      POCDMT000040EntryRelationship imageEntryRelationship = new POCDMT000040EntryRelationship();
      imageEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.SPRT);
      POCDMT000040ObservationMedia imageObservationMedia = new POCDMT000040ObservationMedia();
      imageObservationMedia.setClassCode(ActClassObservation.OBS);
      imageObservationMedia.setMoodCode(ActMood.EVN);
      imageObservationMedia.setIDAttribute(getUUID());
      imageObservationMedia.setValue(getEDFromAttachedMedia(imageDetail.getImage()));
      imageObservationMedia.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
      imageDetail.getImage().setObservationMediaReference(imageObservationMedia);
      imageEntryRelationship.setObservationMedia(imageObservationMedia);
      imageDetailObservation.getEntryRelationship().add(imageEntryRelationship);
    }

    imageDetailEntryRelationship.setObservation(imageDetailObservation);
    return imageDetailEntryRelationship;
  }

/*  private List<POCDMT000040EntryRelationship> getExamReqNameRelationships(
      ExaminationRequestDetails examinationRequestDetails) {
    List<POCDMT000040EntryRelationship> examReqNameRelationships = new LinkedList<>();
    examinationRequestDetails.getExaminationRequestedNames().stream()
        .filter(Objects::nonNull).forEach(examinationReqName -> {
      POCDMT000040EntryRelationship examReqNameEntryRelationship =
          new POCDMT000040EntryRelationship();
      examReqNameEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.REFR);
      POCDMT000040Observation examReqNameObservation = new POCDMT000040Observation();
      examReqNameObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
      examReqNameObservation.setClassCode(ActClassObservation.OBS);
      examReqNameObservation.setMoodCode(XActMoodDocumentObservation.EVN);
      examReqNameObservation.setCode(EXAMINATION_REQUESTED_NAME);
      examReqNameObservation.setText(CDATypeUtil.getST(examinationReqName));
      examReqNameEntryRelationship.setObservation(examReqNameObservation);
      examReqNameRelationships.add(examReqNameEntryRelationship);
    });
    return examReqNameRelationships;
  }*/


  private POCDMT000040Entry getPathologyTestResultEntry(PathologyTestResult pathologyTestResult) {
    POCDMT000040Entry pathologyTestResultEntry = new POCDMT000040Entry();
    POCDMT000040Observation pathologyTestResultObservation = new POCDMT000040Observation();
    pathologyTestResultObservation.setClassCode(ActClassObservation.OBS);
    pathologyTestResultObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    String narrativeID = getUUID();
    pathologyTestResultObservation.getId().add(CDATypeUtil.getII(narrativeID));
    pathologyTestResultObservation.setCode(
        Converter.convertToCDCode(pathologyTestResult.getTestResultName()));
    if (null != pathologyTestResult.getTestResultRepresentation()) {
      pathologyTestResultObservation.getValue()
          .add(getEDFromAttachedMedia(pathologyTestResult.getTestResultRepresentation()));
      pathologyTestResult.getTestResultRepresentation()
          .setObservationReference(pathologyTestResultObservation);
    }
    pathologyTestResultObservation.getEntryRelationship()
        .addAll(getRelationshipsForPathologyTestResult(pathologyTestResult));
    // Test Specimen Details list
    if (null != pathologyTestResult.getResultGroups()
        && !pathologyTestResult.getResultGroups().isEmpty()) {
      pathologyTestResultObservation.getEntryRelationship()
          .addAll(processResultGroups(pathologyTestResult.getResultGroups()));
    }
    if (null != pathologyTestResult.getTestSpecimenDetails()
        && !pathologyTestResult.getTestSpecimenDetails().isEmpty()) {
      pathologyTestResult.getTestSpecimenDetails().stream().filter(Objects::nonNull)
          .forEach(testSpecimenDetail -> pathologyTestResultObservation.getEntryRelationship()
              .add(getSpecimenDetailEntryRelationship(
                  testSpecimenDetail))); // TestSpecimenDetail Ends
    }
    pathologyTestResultEntry.setObservation(pathologyTestResultObservation);
    return pathologyTestResultEntry;
  }

  private POCDMT000040Entry getPathologyTestResultMediaEntry(
      PathologyTestResult pathologyTestResult) {
    POCDMT000040Entry pathologyTestResultMediaEntry = new POCDMT000040Entry();
    POCDMT000040ObservationMedia pathologyTestResultObservationMedia =
        new POCDMT000040ObservationMedia();
    pathologyTestResultObservationMedia.setClassCode(ActClassObservation.OBS);
    pathologyTestResultObservationMedia.setMoodCode(ActMood.EVN);
    pathologyTestResultObservationMedia.setIDAttribute(getUUID());
    pathologyTestResultObservationMedia
        .getId()
        .add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    pathologyTestResultObservationMedia.setValue(
        getEDFromAttachedMedia(pathologyTestResult.getTestResultRepresentation()));
    pathologyTestResult
        .getTestResultRepresentation()
        .setObservationMediaReference(pathologyTestResultObservationMedia);
    pathologyTestResultMediaEntry.setObservationMedia(pathologyTestResultObservationMedia);
    return pathologyTestResultMediaEntry;
  }


  private List<POCDMT000040EntryRelationship>
  getRelationshipsForPathologyTestResult(PathologyTestResult pathologyTestResult) {
    List<POCDMT000040EntryRelationship> pathologyTestResultEntryRels = new LinkedList<>();
    // Diagnostic Service Relationship
    pathologyTestResultEntryRels.add(getDiagnosticServiceEntryRelationship(pathologyTestResult));
    // Overall Pathology Test Result Status
    pathologyTestResultEntryRels.add(
        addOverallPathologyTestResultStatusRelationship(pathologyTestResult));
    // Clinical Information Provided Relationship
    pathologyTestResultEntryRels.add(addClinicalInfoProvidedRelationship(pathologyTestResult));
    // Pathological Diagnosis
    if (null != pathologyTestResult.getPathologicalDiagnoses()
        && !pathologyTestResult.getPathologicalDiagnoses().isEmpty()) {
      pathologyTestResultEntryRels.add(addPathologicalDiagnosisRelationship(pathologyTestResult));
    }
    // Pathological Test Conclusion
    pathologyTestResultEntryRels.add(
        addPathologicalTestConclusionRelationship(pathologyTestResult));
    // Test Comment
    pathologyTestResultEntryRels.add(addPathologicalTestComment(pathologyTestResult));
    // Test Request Details
    pathologyTestResultEntryRels.add(addPathologicalTestRequestDetails(pathologyTestResult));
    // Observation DateTime
    pathologyTestResultEntryRels.add(
        addPathologyTestResultObservationDateTime(pathologyTestResult));
    return pathologyTestResultEntryRels;
  }

  private POCDMT000040EntryRelationship getSpecimenDetailEntryRelationship(
      TestSpecimenDetail testSpecimenDetail) {
    POCDMT000040EntryRelationship testSpecimenDetailEntryRelationship =
        new POCDMT000040EntryRelationship();
    testSpecimenDetailEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.SUBJ);
    POCDMT000040Observation testSpecimenDetailObservation = new POCDMT000040Observation();
    testSpecimenDetailObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    testSpecimenDetailObservation.setClassCode(ActClassObservation.OBS);
    testSpecimenDetailObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    testSpecimenDetailObservation.setCode(SPECIMEN);
    testSpecimenDetailObservation.setEffectiveTime(
        Converter.convert(testSpecimenDetail.getHandlingAndProcessing().getCollectionDateTime()));
    if (null != testSpecimenDetail.getCollectionProcedure()) {
      testSpecimenDetailObservation.getMethodCode()
          .add(Converter.convertToCECode(testSpecimenDetail.getCollectionProcedure()));
    }
    // Anatomical Site list
    if (null != testSpecimenDetail.getAnatomicalSites()
        && !testSpecimenDetail.getAnatomicalSites().isEmpty()) {
      processAnatomicalSites(
          testSpecimenDetail.getAnatomicalSites(), testSpecimenDetailObservation);
    }
    POCDMT000040Specimen specimen = new POCDMT000040Specimen();
    POCDMT000040SpecimenRole specimenRole = new POCDMT000040SpecimenRole();
    if (null != testSpecimenDetail.getIdentifiers()) {
      specimenRole.getId().add(CDATypeUtil.getII(
          testSpecimenDetail.getIdentifiers().getSpecimenIdentifier().getRoot(),
          testSpecimenDetail.getIdentifiers().getSpecimenIdentifier().getExtension()));
    }
    POCDMT000040PlayingEntity specimenPlayingEntity = new POCDMT000040PlayingEntity();
    specimenPlayingEntity.setCode(Converter.convertToCECode(
        testSpecimenDetail.getSpecimenTissueType()));
    // Physical Details
    if (null != testSpecimenDetail.getPhysicalDetails()
        && !testSpecimenDetail.getPhysicalDetails().isEmpty()) {
      processPhysicalDetailsList(
          testSpecimenDetail, testSpecimenDetailObservation, specimenPlayingEntity);
    }
    testSpecimenDetailObservation.getEntryRelationship()
        .addAll(getRelationshipsForSpecimenDetail(testSpecimenDetail));
    specimenRole.setSpecimenPlayingEntity(specimenPlayingEntity);
    specimen.setSpecimenRole(specimenRole);
    testSpecimenDetailObservation.getSpecimen().add(specimen);
    testSpecimenDetailEntryRelationship.setObservation(testSpecimenDetailObservation);
    return testSpecimenDetailEntryRelationship;
  }

  private List<POCDMT000040EntryRelationship> getRelationshipsForSpecimenDetail(
      TestSpecimenDetail testSpecimenDetail) {
    List<POCDMT000040EntryRelationship> testSpecimenDetailRels = new LinkedList<>();
    // Collection Handling -> Sampling Preconditions - Relationship
    if (null != testSpecimenDetail.getCollectionAndHandling()
        && null != testSpecimenDetail.getCollectionAndHandling().getSamplingPreconditions()) {
      testSpecimenDetailRels.add(getSamplingPreconditionsRelationship(testSpecimenDetail));
    }
    // Handling and Processing -> Collection Setting - Relationship
    if (null != testSpecimenDetail.getHandlingAndProcessing()) {
      if (null != testSpecimenDetail.getHandlingAndProcessing().getCollectionSetting()) {
        testSpecimenDetailRels.add(getCollectionSettingRelationship(testSpecimenDetail));
      }
      // Handling and Processing -> Receipt Date & Time - Relationship
      if (null != testSpecimenDetail.getHandlingAndProcessing().getReceiptDateTime()) {
        testSpecimenDetailRels.add(getReceiptDateTimeRelationship(testSpecimenDetail));
      }
    }
    // Parent Specimen Identifier - Relationship
    if (null != testSpecimenDetail.getIdentifiers()
        && null != testSpecimenDetail.getIdentifiers().getParentSpecimenIdentifier()) {
      testSpecimenDetailRels.add(getParentSpecimenIdentifierRelationship(testSpecimenDetail));
    }
    return testSpecimenDetailRels;
  }

  private POCDMT000040EntryRelationship addPathologyTestResultObservationDateTime(
      PathologyTestResult pathologyTestResult) {
    POCDMT000040EntryRelationship pathTestResObservationDateTimeRelationship =
        new POCDMT000040EntryRelationship();
    pathTestResObservationDateTimeRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Observation pathTestResObservationDateTimeObs = new POCDMT000040Observation();
    pathTestResObservationDateTimeObs.setClassCode(ActClassObservation.OBS);
    pathTestResObservationDateTimeObs.setMoodCode(XActMoodDocumentObservation.EVN);
    pathTestResObservationDateTimeObs.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    pathTestResObservationDateTimeObs.setCode(PATHOLOGY_TEST_RESULT_DATETIME);
    pathTestResObservationDateTimeObs.setEffectiveTime(
        Converter.convert(pathologyTestResult.getObservationDateTime()));
    pathTestResObservationDateTimeRelationship.setObservation(pathTestResObservationDateTimeObs);
    return pathTestResObservationDateTimeRelationship;
  }

  private POCDMT000040EntryRelationship addPathologicalTestRequestDetails(
      PathologyTestResult pathologyTestResult) {
    POCDMT000040EntryRelationship pathTestReqDetailsRelationship =
        new POCDMT000040EntryRelationship();
    pathTestReqDetailsRelationship.setTypeCode(XActRelationshipEntryRelationship.SUBJ);
    pathTestReqDetailsRelationship.setInversionInd(true);
    POCDMT000040Act pathTestReqDetailsAct = new POCDMT000040Act();
    pathTestReqDetailsAct.setClassCode(XActClassDocumentEntryAct.ACT);
    pathTestReqDetailsAct.setMoodCode(XDocumentActMood.EVN);
    pathTestReqDetailsAct.setCode(TEST_REQ_DETAILS);
    pathologyTestResult.getTestRequestDetails().getTestRequestedNames().stream()
        .filter(Objects::nonNull).forEach(coded -> {
      POCDMT000040EntryRelationship testReqNameEntryRel =
          new POCDMT000040EntryRelationship();
      testReqNameEntryRel.setTypeCode(XActRelationshipEntryRelationship.COMP);
      POCDMT000040Observation testReqNameObservation = new POCDMT000040Observation();
      testReqNameObservation.getId().add(CDATypeUtil.getII(
          pathologyTestResult.getTestRequestDetails()
              .getLaboratoryTestResultIdentifier().getRoot(),
          pathologyTestResult.getTestRequestDetails()
              .getLaboratoryTestResultIdentifier().getExtension()));
      testReqNameObservation.setClassCode(ActClassObservation.OBS);
      testReqNameObservation.setMoodCode(XActMoodDocumentObservation.RQO);
      testReqNameObservation.setCode(TEST_REQ_NAME);
      testReqNameObservation.getValue().add(Converter.convertToCDCode(coded));
      testReqNameEntryRel.setObservation(testReqNameObservation);
      pathTestReqDetailsAct.getEntryRelationship().add(testReqNameEntryRel);
    });
    pathTestReqDetailsRelationship.setAct(pathTestReqDetailsAct);
    return pathTestReqDetailsRelationship;
  }

  private POCDMT000040EntryRelationship addPathologicalTestComment(
      PathologyTestResult pathologyTestResult) {
    POCDMT000040EntryRelationship pathTestCommentRelationship = new POCDMT000040EntryRelationship();
    pathTestCommentRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Act pathTestCommentAct = new POCDMT000040Act();
    pathTestCommentAct.setClassCode(XActClassDocumentEntryAct.INFRM);
    pathTestCommentAct.setMoodCode(XDocumentActMood.EVN);
    pathTestCommentAct.setCode(PATH_TEST_COMMENT);
    pathTestCommentAct.setText(CDATypeUtil.getST(pathologyTestResult.getTestComment()));
    pathTestCommentRelationship.setAct(pathTestCommentAct);
    return pathTestCommentRelationship;
  }

  private POCDMT000040EntryRelationship addPathologicalTestConclusionRelationship(
      PathologyTestResult pathologyTestResult) {
    POCDMT000040EntryRelationship pathTestConclusionRelationship =
        new POCDMT000040EntryRelationship();
    pathTestConclusionRelationship.setTypeCode(XActRelationshipEntryRelationship.REFR);
    POCDMT000040Observation pathTestConclusionObservation = new POCDMT000040Observation();
    pathTestConclusionObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    pathTestConclusionObservation.setClassCode(ActClassObservation.OBS);
    pathTestConclusionObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    pathTestConclusionObservation.setCode(LAB_FINDINGS_INTERPRETATION);
    pathTestConclusionObservation.getValue()
        .add(CDATypeUtil.getST(pathologyTestResult.getConclusion()));
    pathTestConclusionRelationship.setObservation(pathTestConclusionObservation);
    return pathTestConclusionRelationship;
  }

  private POCDMT000040EntryRelationship addPathologicalDiagnosisRelationship(
      PathologyTestResult pathologyTestResult) {
    POCDMT000040EntryRelationship pathDiagnosisRelationship = new POCDMT000040EntryRelationship();
    pathDiagnosisRelationship.setTypeCode(XActRelationshipEntryRelationship.REFR);
    POCDMT000040Observation pathDiagnosisObservation = new POCDMT000040Observation();
    pathDiagnosisObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    pathDiagnosisObservation.setClassCode(ActClassObservation.OBS);
    pathDiagnosisObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    pathDiagnosisObservation.setCode(PATHOLOGICAL_DIAGNOSIS);
    pathologyTestResult.getPathologicalDiagnoses().stream().filter(Objects::nonNull)
        .forEach(
            coded -> pathDiagnosisObservation.getValue().add(Converter.convertToCDCode(coded)));
    pathDiagnosisRelationship.setObservation(pathDiagnosisObservation);
    return pathDiagnosisRelationship;
  }

  private void processPhysicalDetailsList(TestSpecimenDetail testSpecimenDetail,
      POCDMT000040Observation testSpecimenDetailObservation,
      POCDMT000040PlayingEntity specimenPlayingEntity) {
    testSpecimenDetail.getPhysicalDetails().stream().filter(Objects::nonNull).forEach(
        physicalDetails -> {
          specimenPlayingEntity.getQuantity()
              .add(getPhysicalQuantityFromPhysicalDetails(physicalDetails));
          specimenPlayingEntity.setDesc(CDATypeUtil.getED(physicalDetails.getDescription()));
          specimenPlayingEntity.setAsSpecimenInContainer(
              getSpecimenInContainer(testSpecimenDetail));
          if (null != physicalDetails.getImage()) {
            POCDMT000040EntryRelationship physicalDetailsImgEntryRelationship =
                new POCDMT000040EntryRelationship();
            physicalDetailsImgEntryRelationship.setTypeCode(
                XActRelationshipEntryRelationship.SPRT);
            POCDMT000040ObservationMedia physicalDetailsImageObservationMedia =
                new POCDMT000040ObservationMedia();
            physicalDetailsImageObservationMedia.setIDAttribute(getUUID());
            physicalDetails.getImage()
                .setObservationMediaReference(physicalDetailsImageObservationMedia);
            physicalDetailsImageObservationMedia.setClassCode(ActClassObservation.OBS);
            physicalDetailsImageObservationMedia.setMoodCode(ActMood.EVN);
            physicalDetailsImageObservationMedia.getId()
                .add(CDATypeUtil.getII(UUID.randomUUID().toString()));
            physicalDetailsImageObservationMedia.setValue(
                getEDFromAttachedMedia(physicalDetails.getImage()));
            physicalDetailsImgEntryRelationship.setObservationMedia(
                physicalDetailsImageObservationMedia);
            testSpecimenDetailObservation.getEntryRelationship()
                .add(physicalDetailsImgEntryRelationship);
          }
        }); // PhysicalDetails Ends
  }

  private PQ getPhysicalQuantityFromPhysicalDetails(PhysicalDetails physicalDetails) {
    PQ physicalQuantity = new PQ();
    physicalQuantity.setUnit(physicalDetails.getWeight().getUnit());
    physicalQuantity.setValue(physicalDetails.getWeight().getValue());
    return physicalQuantity;
  }

  private SpecimenInContainer getSpecimenInContainer(TestSpecimenDetail testSpecimenDetail) {
    SpecimenInContainer containerIdentifier = new SpecimenInContainer();
    Container container = new Container();
    container.setId(CDATypeUtil.getII(
        testSpecimenDetail.getIdentifiers().getContainerIdentifier().getRoot(),
        testSpecimenDetail.getIdentifiers().getContainerIdentifier().getExtension()));
    containerIdentifier.setClassCode(EntityClass.CONT);
    containerIdentifier.setContainer(container);
    return containerIdentifier;
  }

  private List<POCDMT000040EntryRelationship> processResultGroups(List<ResultGroup> resultGroups) {
    List<POCDMT000040EntryRelationship> resultGroupEntryRelationships = new LinkedList<>();
    resultGroups.stream().filter(Objects::nonNull).forEach(resultGroup -> {
      POCDMT000040EntryRelationship resultGroupEntryRelationship =
          new POCDMT000040EntryRelationship();
      resultGroupEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
      POCDMT000040Organizer organizer = new POCDMT000040Organizer();
      organizer.setClassCode(XActClassDocumentEntryOrganizer.BATTERY);
      organizer.setMoodCode(ActMood.EVN);
      organizer.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
      organizer.setStatusCode(CDATypeUtil.getCS("completed"));
      organizer.setCode(
          Converter.convertToCDCode(resultGroup.getPathologyTestResultGroupName()));
      organizer.getComponent().addAll(processIndividualPathologyTestResults(resultGroup));
      if (null != resultGroup.getResultGroupSpecimenDetail()) {
        organizer.getComponent().add(processResultGroupSpecimenDetail(
            resultGroup.getResultGroupSpecimenDetail()));
      }
      resultGroupEntryRelationship.setOrganizer(organizer);
      resultGroupEntryRelationships.add(resultGroupEntryRelationship);
    });
    return resultGroupEntryRelationships;
  }

  private List<POCDMT000040EntryRelationship> processImagingExaminationResultGroupEntryRelationships(
      List<ImagingExaminationResultGroup> resultGroups) {

    List<POCDMT000040EntryRelationship> resultGroupEntryRelationships = new ArrayList<>();

    // Result Group Begin
    resultGroups.stream().filter(Objects::nonNull).forEach(resultGroup -> {
      POCDMT000040EntryRelationship resultGroupEntryRelationship = new POCDMT000040EntryRelationship();
      resultGroupEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
      POCDMT000040Organizer resultGroupOrganizer = new POCDMT000040Organizer();
      resultGroupOrganizer.setClassCode(XActClassDocumentEntryOrganizer.BATTERY);
      resultGroupOrganizer.setMoodCode(ActMood.EVN);
      resultGroupOrganizer.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
      resultGroupOrganizer.setStatusCode(CDATypeUtil.getCS("completed"));
      resultGroupOrganizer.setCode(Converter.convertToCDCode(resultGroup
          .getImagingExaminationResultGroupName()));

      // Individual Imaging Examination Results
      if (null != resultGroup.getResults() && !resultGroup.getResults().isEmpty()) {
        resultGroupOrganizer.getComponent()
            .addAll(processIndividualImagingExaminationResults(resultGroup.getResults(),
                resultGroup.getAnatomicalSite()));
      }

      resultGroupEntryRelationship.setOrganizer(resultGroupOrganizer);
      resultGroupEntryRelationships.add(resultGroupEntryRelationship);
    });

    return resultGroupEntryRelationships;
  }

  private List<POCDMT000040Component4> processIndividualImagingExaminationResults(
      List<ImagingResult> individualExaminationResults,
      AnatomicalSite anatomicalSiteFromResultGroup) {
    List<POCDMT000040Component4> individualImagingExaminationResultList = new LinkedList<>();

    // Individual Examination Result Begin
    POCDMT000040Component4 individualImageExaminationResultComponent = new POCDMT000040Component4();
    individualExaminationResults.stream().filter(Objects::nonNull).forEach(
        individualResult -> {
          POCDMT000040Observation indImagingExaminationResultObservation = new POCDMT000040Observation();
          indImagingExaminationResultObservation.setClassCode(ActClassObservation.OBS);
          indImagingExaminationResultObservation.setMoodCode(XActMoodDocumentObservation.EVN);
          indImagingExaminationResultObservation.getId()
              .add(CDATypeUtil.getII(UUID.randomUUID().toString()));
          indImagingExaminationResultObservation.setCode(Converter.convertToCDCode(individualResult
              .getIndividualImagingExaminationResultName()));
          indImagingExaminationResultObservation.getValue().add(Converter.convert(individualResult
              .getIndividualImagingExaminationResultValue()
              .getQuantityResultValue()));

          // Reference Ranges
          indImagingExaminationResultObservation.getReferenceRange()
              .addAll(processReferenceRanges(individualResult));

          // Result Comments
          if (null != individualResult.getResultComments()
              && !individualResult.getResultComments().isEmpty()) {
            indImagingExaminationResultObservation.getEntryRelationship()
                .addAll(processResultComments(individualResult.getResultComments()));
          }

          // Anatomical Site list (0..1 As per CDA, at Result Group level)
          if (null != anatomicalSiteFromResultGroup) {
            processAnatomicalSite(indImagingExaminationResultObservation,
                anatomicalSiteFromResultGroup, XActRelationshipEntryRelationship.REFR);
          }

          individualImageExaminationResultComponent
              .setObservation(indImagingExaminationResultObservation);
          individualImagingExaminationResultList.add(individualImageExaminationResultComponent);
        });

    return individualImagingExaminationResultList;
  }

  private List<POCDMT000040EntryRelationship> processResultComments(List<String> resultComments) {
    List<POCDMT000040EntryRelationship> referenceRanges = new LinkedList<>();
    resultComments.stream().filter(Objects::nonNull)
        .forEach(comment -> {
          POCDMT000040EntryRelationship rcEntryRelationship =
              new POCDMT000040EntryRelationship();
          rcEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
          POCDMT000040Act rcAct = new POCDMT000040Act();
          rcAct.setClassCode(XActClassDocumentEntryAct.INFRM);
          rcAct.setMoodCode(XDocumentActMood.EVN);
          rcAct.setCode(INDIVIDIUAL_RESULT_COMMENT_CODE);
          rcAct.setText(CDATypeUtil.getST(comment));
          rcEntryRelationship.setAct(rcAct);
          referenceRanges.add(rcEntryRelationship);
        });

    return referenceRanges;
  }

  private List<POCDMT000040ReferenceRange> processReferenceRanges(
      ImagingResult individualResult) {

    List<POCDMT000040ReferenceRange> referenceRanges = new LinkedList<>();

    individualResult.getIndividualImagingExaminationResultValue().getReferenceRangeDetails()
        .getReferenceRanges().stream().filter(Objects::nonNull)
        .forEach(referenceRange -> {
          POCDMT000040ReferenceRange referenceRangeCda = new POCDMT000040ReferenceRange();
          referenceRangeCda.setTypeCode(ActRelationshipType.REFV);
          POCDMT000040ObservationRange observationRange = new POCDMT000040ObservationRange();
          observationRange.setClassCode(ActClassObservation.OBS);
          observationRange.setMoodCode(ActMood.EVN_CRT);
          observationRange.setCode(
              Converter.convertToCDCode(referenceRange.getReferenceRangeMeaning()));
          observationRange.setValue(Converter.convert(referenceRange));
          referenceRangeCda.setObservationRange(observationRange);

          referenceRanges.add(referenceRangeCda);
        });

    return referenceRanges;
  }

  private POCDMT000040Component4 processResultGroupSpecimenDetail(
      TestSpecimenDetail resultGroupSpecimenDetail) {
    POCDMT000040Component4 resultGroupSpecDetailComponent = new POCDMT000040Component4();
    POCDMT000040Observation specDetailObservation = new POCDMT000040Observation();
    specDetailObservation.setClassCode(ActClassObservation.OBS);
    specDetailObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    specDetailObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    specDetailObservation.setEffectiveTime(Converter.convert(
        resultGroupSpecimenDetail.getHandlingAndProcessing().getCollectionDateTime()));
    specDetailObservation.setCode(RESULT_GROUP_SPEC_DETAIL);
    specDetailObservation.getMethodCode()
        .add(Converter.convertToCECode(resultGroupSpecimenDetail.getCollectionProcedure()));
    if (null != resultGroupSpecimenDetail.getAnatomicalSites()) {
      processAnatomicalSites(resultGroupSpecimenDetail.getAnatomicalSites(), specDetailObservation);
    }
    POCDMT000040Specimen specimen = new POCDMT000040Specimen();
    POCDMT000040SpecimenRole specimenRole = new POCDMT000040SpecimenRole();
    specimenRole.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    POCDMT000040PlayingEntity specimenPlayingEntity = new POCDMT000040PlayingEntity();
    specimenPlayingEntity.setCode(
        Converter.convertToCECode(resultGroupSpecimenDetail.getSpecimenTissueType()));
    specimenPlayingEntity.setAsSpecimenInContainer(
        getSpecimenInContainer(resultGroupSpecimenDetail));
    if (null != resultGroupSpecimenDetail.getPhysicalDetails()
        && !resultGroupSpecimenDetail.getPhysicalDetails().isEmpty()) {
      processPhysicalDetailsList(
          resultGroupSpecimenDetail, specDetailObservation, specimenPlayingEntity);
    }
    specDetailObservation.getEntryRelationship()
        .add(getCollectionSettingRelationship(resultGroupSpecimenDetail));
    specDetailObservation.getEntryRelationship()
        .add(getReceiptDateTimeRelationship(resultGroupSpecimenDetail));
    specDetailObservation.getEntryRelationship()
        .add(getParentSpecimenIdentifierRelationship(resultGroupSpecimenDetail));
    specimenRole.setSpecimenPlayingEntity(specimenPlayingEntity);
    specimen.setSpecimenRole(specimenRole);
    specDetailObservation.getSpecimen().add(specimen);
    resultGroupSpecDetailComponent.setObservation(specDetailObservation);
    return resultGroupSpecDetailComponent;
  }

  private List<POCDMT000040Component4> processIndividualPathologyTestResults(
      ResultGroup resultGroup) {
    List<POCDMT000040Component4> individualPathologyTestResults = new ArrayList<>();
    if (null != resultGroup.getIndividualPathologyTestResults()
        && !resultGroup.getIndividualPathologyTestResults().isEmpty()) {
      resultGroup.getIndividualPathologyTestResults().stream().filter(Objects::nonNull)
          .forEach(result -> {
            POCDMT000040Component4 individualPathologyTestResultComponent = new POCDMT000040Component4();
            POCDMT000040Observation observation = new POCDMT000040Observation();
            observation.setClassCode(ActClassObservation.OBS);
            observation.setMoodCode(XActMoodDocumentObservation.EVN);
            observation.getInterpretationCode().add(Converter.convertToCECode(
                result.getIndividualPathologyTestResultValue().getReferenceRangeDetails()
                    .getNormalStatus()));
            observation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
            observation.setCode(
                Converter.convertToCDCode(result.getIndividualPathologyTestResultName()));
            observation.getValue().add(Converter.convert(result
                .getIndividualPathologyTestResultValue().getQuantityResultValue()));
            observation.getEntryRelationship()
                .add(getIndividualPathologyTestResultCommentRelationship(result));
            observation.getEntryRelationship()
                .add(getIndividualPathologyTestResultRefRangeGuidanceEntryRelationship(result));
            observation.getEntryRelationship()
                .add(getIndividualPathologyTestResultStatusEntryRelationship(result));
            POCDMT000040ReferenceRange referenceRangeDetails = new POCDMT000040ReferenceRange();
            referenceRangeDetails.setTypeCode(ActRelationshipType.REFV);
            POCDMT000040ObservationRange observationRange = new POCDMT000040ObservationRange();
            observationRange.setClassCode(ActClassObservation.OBS);
            observationRange.setMoodCode(ActMood.EVN_CRT);
            individualPathologyTestResultComponent.setObservation(observation);
            individualPathologyTestResults.add(individualPathologyTestResultComponent);
          });
    }
    return individualPathologyTestResults;
  }

  private POCDMT000040EntryRelationship getIndividualPathologyTestResultStatusEntryRelationship(
      Result result) {
    POCDMT000040EntryRelationship individualTestResultStatusEntryRel =
        new POCDMT000040EntryRelationship();
    individualTestResultStatusEntryRel.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Observation resultStatusObservation = new POCDMT000040Observation();
    resultStatusObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    resultStatusObservation.setClassCode(ActClassObservation.OBS);
    resultStatusObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    resultStatusObservation.setCode(INDIVIDUAL_TEST_RESULT_STATUS);
    resultStatusObservation.getValue()
        .add(Converter.convertToCDCode(result.getIndividualPathologyTestResultStatus()));
    individualTestResultStatusEntryRel.setObservation(resultStatusObservation);
    return individualTestResultStatusEntryRel;
  }

  private POCDMT000040EntryRelationship
  getIndividualPathologyTestResultRefRangeGuidanceEntryRelationship(Result result) {
    POCDMT000040EntryRelationship individualTestResultRefRangeGuidanceEntryRel =
        new POCDMT000040EntryRelationship();
    individualTestResultRefRangeGuidanceEntryRel.setTypeCode(
        XActRelationshipEntryRelationship.COMP);
    POCDMT000040Act refRangeGuidanceAct = new POCDMT000040Act();
    refRangeGuidanceAct.setClassCode(XActClassDocumentEntryAct.INFRM);
    refRangeGuidanceAct.setMoodCode(XDocumentActMood.EVN);
    refRangeGuidanceAct.setCode(INDIVIDUAL_TEST_RESULT_REF_RANGE_COMMENTS);
    refRangeGuidanceAct.setText(
        CDATypeUtil.getST(null != result.getIndividualPathologyTestResultReferenceRangeGuidance()
            ? result.getIndividualPathologyTestResultReferenceRangeGuidance() : "NA"));
    individualTestResultRefRangeGuidanceEntryRel.setAct(refRangeGuidanceAct);
    return individualTestResultRefRangeGuidanceEntryRel;
  }

  private POCDMT000040EntryRelationship getIndividualPathologyTestResultCommentRelationship(
      Result result) {
    POCDMT000040EntryRelationship individualTestResultCommentEntryRel =
        new POCDMT000040EntryRelationship();
    individualTestResultCommentEntryRel.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Act individualResultCommentAct = new POCDMT000040Act();
    individualResultCommentAct.setClassCode(XActClassDocumentEntryAct.INFRM);
    individualResultCommentAct.setMoodCode(XDocumentActMood.EVN);
    individualResultCommentAct.setCode(INDIVIDUAL_TEST_RESULT_COMMENT);
    individualResultCommentAct.setText(
        CDATypeUtil.getST(null != result.getIndividualPathologyTestResultComment()
            ? result.getIndividualPathologyTestResultComment()
            : "NA"));
    individualTestResultCommentEntryRel.setAct(individualResultCommentAct);
    return individualTestResultCommentEntryRel;
  }

  private POCDMT000040EntryRelationship addClinicalInfoProvidedRelationship(
      PathologyTestResult pathologyTestResult) {
    POCDMT000040EntryRelationship clinicalInfoProvidedRelationship =
        new POCDMT000040EntryRelationship();
    clinicalInfoProvidedRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Act clinicalInfoAct = objectFactory.createPOCDMT000040Act();
    clinicalInfoAct.setClassCode(XActClassDocumentEntryAct.INFRM);
    clinicalInfoAct.setMoodCode(XDocumentActMood.EVN);
    clinicalInfoAct.setCode(CLINICAL_INFO);
    clinicalInfoAct.setText(
        CDATypeUtil.getED(pathologyTestResult.getClinicalInformationProvided()));
    clinicalInfoProvidedRelationship.setAct(clinicalInfoAct);
    return clinicalInfoProvidedRelationship;
  }

  private POCDMT000040EntryRelationship addOverallPathologyTestResultStatusRelationship(
      PathologyTestResult pathologyTestResult) {
    POCDMT000040EntryRelationship overallPathologyTestResultStatusRelationship =
        new POCDMT000040EntryRelationship();
    overallPathologyTestResultStatusRelationship.setTypeCode(
        XActRelationshipEntryRelationship.COMP);
    POCDMT000040Observation overallPathTestResultStatusObs = new POCDMT000040Observation();
    overallPathTestResultStatusObs.setClassCode(ActClassObservation.OBS);
    overallPathTestResultStatusObs.setMoodCode(XActMoodDocumentObservation.EVN);
    overallPathTestResultStatusObs.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    overallPathTestResultStatusObs.setCode(REPORT_STATUS);
    overallPathTestResultStatusObs
        .getValue()
        .add(CDATypeUtil.getCD(pathologyTestResult.getOverallPathologyTestResultStatus()));
    overallPathologyTestResultStatusRelationship.setObservation(overallPathTestResultStatusObs);
    return overallPathologyTestResultStatusRelationship;
  }

  private void processAnatomicalSites(
      List<AnatomicalSite> anatomicalSites, POCDMT000040Observation observation) {
    anatomicalSites.stream().filter(Objects::nonNull).forEach(
        anatomicalSite -> processAnatomicalSite(observation, anatomicalSite,
            XActRelationshipEntryRelationship.SPRT));
  }

  private void processAnatomicalSite(POCDMT000040Observation observation,
      AnatomicalSite anatomicalSite,
      XActRelationshipEntryRelationship xActRelationshipEntryRelationship) {
    observation.getTargetSiteCode().add(getTargetSiteCode(anatomicalSite));
    if (null != anatomicalSite.getAnatomicalLocationImages()
        && !anatomicalSite.getAnatomicalLocationImages().isEmpty()) {
      anatomicalSite.getAnatomicalLocationImages().stream().filter(Objects::nonNull)
          .forEach(anatomicalLocationImage ->
              observation.getEntryRelationship().add(getAnatomicalLocImageEntryRelationship(
                  anatomicalLocationImage, xActRelationshipEntryRelationship)));
    }
  }

  private POCDMT000040EntryRelationship getParentSpecimenIdentifierRelationship(
      TestSpecimenDetail testSpecimenDetail) {
    POCDMT000040EntryRelationship parentSpecIdEntryRelationship =
        new POCDMT000040EntryRelationship();
    parentSpecIdEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Observation parentSpecIdObservation = new POCDMT000040Observation();
    parentSpecIdObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    parentSpecIdObservation.setClassCode(ActClassObservation.OBS);
    parentSpecIdObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    parentSpecIdObservation.setCode(PARENT_SPECIMEN_IDENTIFIER);
    POCDMT000040Specimen parentSpecIdSpecimen = new POCDMT000040Specimen();
    POCDMT000040SpecimenRole parentSpecIdSpecimenRole = new POCDMT000040SpecimenRole();
    parentSpecIdSpecimenRole.getId().add(CDATypeUtil.getII(
        testSpecimenDetail.getIdentifiers().getParentSpecimenIdentifier().getRoot(),
        testSpecimenDetail.getIdentifiers().getParentSpecimenIdentifier().getExtension()));
    parentSpecIdSpecimen.setSpecimenRole(parentSpecIdSpecimenRole);
    parentSpecIdObservation.getSpecimen().add(parentSpecIdSpecimen);
    parentSpecIdEntryRelationship.setObservation(parentSpecIdObservation);
    return parentSpecIdEntryRelationship;
  }

  private POCDMT000040EntryRelationship getSamplingPreconditionsRelationship(
      TestSpecimenDetail testSpecimenDetail) {
    POCDMT000040EntryRelationship samplingPreconditionsEntryRelationship =
        new POCDMT000040EntryRelationship();
    samplingPreconditionsEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Observation samplingPrecondObservation = new POCDMT000040Observation();
    samplingPrecondObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    samplingPrecondObservation.setClassCode(ActClassObservation.OBS);
    samplingPrecondObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    samplingPrecondObservation.setCode(SAMPLING_PRECONDITIONS);
    samplingPrecondObservation.getValue().add(CDATypeUtil.getCD(
        testSpecimenDetail.getCollectionAndHandling().getSamplingPreconditions()));
    samplingPreconditionsEntryRelationship.setObservation(samplingPrecondObservation);
    return samplingPreconditionsEntryRelationship;
  }

  private POCDMT000040EntryRelationship getReceiptDateTimeRelationship(
      TestSpecimenDetail testSpecimenDetail) {
    POCDMT000040EntryRelationship dateTimeReceivedEntryRelationship =
        new POCDMT000040EntryRelationship();
    dateTimeReceivedEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Observation dateTimeReceivedObservation = new POCDMT000040Observation();
    dateTimeReceivedObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    dateTimeReceivedObservation.setClassCode(ActClassObservation.OBS);
    dateTimeReceivedObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    dateTimeReceivedObservation.setCode(DATETIME_RECEIVED);
    dateTimeReceivedObservation.getValue().add(CDATypeUtil.getTS(
        testSpecimenDetail.getHandlingAndProcessing().getReceiptDateTime().getDateTime()));
    dateTimeReceivedEntryRelationship.setObservation(dateTimeReceivedObservation);
    return dateTimeReceivedEntryRelationship;
  }

  private POCDMT000040EntryRelationship getCollectionSettingRelationship(
      TestSpecimenDetail testSpecimenDetail) {
    POCDMT000040EntryRelationship collectionSettingsEntryRelationship =
        new POCDMT000040EntryRelationship();
    collectionSettingsEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Observation collectionSettingsObservation = new POCDMT000040Observation();
    collectionSettingsObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    collectionSettingsObservation.setClassCode(ActClassObservation.OBS);
    collectionSettingsObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    collectionSettingsObservation.setCode(COLLECTION_SETTINGS);
    collectionSettingsObservation.getValue().add(CDATypeUtil.getST(
        testSpecimenDetail.getHandlingAndProcessing().getCollectionSetting()));
    collectionSettingsEntryRelationship.setObservation(collectionSettingsObservation);
    return collectionSettingsEntryRelationship;
  }

  private POCDMT000040EntryRelationship getAnatomicalLocImageEntryRelationship(
      AttachedMedia anatomicalLocationImage,
      XActRelationshipEntryRelationship xActRelationshipEntryRelationship) {
    POCDMT000040EntryRelationship anatomicalLocImgEntryRel = new POCDMT000040EntryRelationship();
    anatomicalLocImgEntryRel.setTypeCode(xActRelationshipEntryRelationship);
    POCDMT000040ObservationMedia anatomicalLocImgObsMedia = new POCDMT000040ObservationMedia();
    anatomicalLocImgObsMedia.setIDAttribute(getUUID());
    anatomicalLocImgObsMedia.setClassCode(ActClassObservation.OBS);
    anatomicalLocImgObsMedia.setMoodCode(ActMood.EVN);
    anatomicalLocImgObsMedia.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    anatomicalLocationImage.setObservationMediaReference(anatomicalLocImgObsMedia);
    anatomicalLocImgObsMedia.setValue(getEDFromAttachedMedia(anatomicalLocationImage));
    anatomicalLocImgEntryRel.setObservationMedia(anatomicalLocImgObsMedia);
    return anatomicalLocImgEntryRel;
  }

  private CD getTargetSiteCode(AnatomicalSite anatomicalSite) {
    CD targetSiteCode = new CD();
    if (null != anatomicalSite.getSpecificLocation()) {
      // Target Site Code as Spec Loc
      CR targetSiteCodeQualifier = new CR();
      targetSiteCodeQualifier.setName(
          Converter.convertToCVCode(
              new CodeImpl("272741003", "2.16.840.1.113883.6.96", "SNOMED CT", "Laterality")));
      targetSiteCodeQualifier.setValue(
          Converter.convertToCVCode(anatomicalSite.getSpecificLocation().getSide()));
      targetSiteCode.getQualifier().add(targetSiteCodeQualifier);
    }
    targetSiteCode.setOriginalText(CDATypeUtil.getED(anatomicalSite.getAnatomicalLocationDesc()));
    return targetSiteCode;
  }

  private POCDMT000040EntryRelationship getDiagnosticServiceEntryRelationship(
      PathologyTestResult pathologyTestResult) {
    POCDMT000040EntryRelationship diagnosticServiceEntryRel = new POCDMT000040EntryRelationship();
    diagnosticServiceEntryRel.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Observation diagnosticServiceEntryObs = new POCDMT000040Observation();
    diagnosticServiceEntryObs.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    diagnosticServiceEntryObs.setClassCode(ActClassObservation.OBS);
    diagnosticServiceEntryObs.setMoodCode(XActMoodDocumentObservation.EVN);
    diagnosticServiceEntryObs.setCode(PATHOLOGY_SERVICE);
    diagnosticServiceEntryObs.getValue().add(Converter.convertToCDCode(new CodeImpl(
        pathologyTestResult.getDiagnosticService().getCode(),
        pathologyTestResult.getDiagnosticService().getCodeSystem(),
        pathologyTestResult.getDiagnosticService().getCodeSystemName(),
        pathologyTestResult.getDiagnosticService().getName())));
    diagnosticServiceEntryRel.setObservation(diagnosticServiceEntryObs);
    return diagnosticServiceEntryRel;
  }

  private ED getEDFromAttachedMedia(AttachedMedia attachedMedia) {
    if (null == attachedMedia) {
      return null;
    }
    ED testResultRepresentation = new ED();
    testResultRepresentation.setMediaType(attachedMedia.getMediaType());
    testResultRepresentation.setIntegrityCheck(attachedMedia.getIntegrityCheck());
    TEL ref = new TEL();
    ref.setValue(attachedMedia.getFileName());
    JAXBElement<TEL> reference = objectFactory.createEDReference(ref);
    testResultRepresentation.getContent().add(reference);
    return testResultRepresentation;
  }

  private POCDMT000040Component3 getMedications() {
    if (null == clinicalModel.getContent().getMedications()
        || null == clinicalModel.getContent().getMedications().getKnownMedications()) {
      return null;
    }
    List<KnownMedication> knownMedications =
        clinicalModel.getContent().getMedications().getKnownMedications();
    POCDMT000040Component3 medicationsComponent = new POCDMT000040Component3();
    medicationsComponent.setTypeCode(ActRelationshipHasComponent.COMP);
    POCDMT000040Section medicationSection = new POCDMT000040Section();
    medicationSection.setClassCode(ActClass.DOCSECT);
    medicationSection.setMoodCode(ActMood.EVN);
    medicationSection.setId(CDATypeUtil.getII(UUID.randomUUID().toString()));
    medicationSection.setCode(MEDICATION_ORDERS);
    medicationSection.setTitle(CDATypeUtil.getST("Medications"));
    medicationSection.setText(
        NarrativeUtil.getMedicationsNarrativeBlock(clinicalModel.getContent().getMedications()));

    knownMedications.stream().filter(Objects::nonNull).forEach(
        knownMedication -> medicationSection.getEntry()
            .add(getKnownMedicationEntry(knownMedication)));

    medicationsComponent.setSection(medicationSection);
    return medicationsComponent;
  }

  private POCDMT000040Entry getKnownMedicationEntry(KnownMedication knownMedication) {
    POCDMT000040Entry knownMedicationEntry = new POCDMT000040Entry();
    POCDMT000040SubstanceAdministration substanceAdministration =
        new POCDMT000040SubstanceAdministration();
    substanceAdministration.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    substanceAdministration.setClassCode(ActClass.SBADM);
    substanceAdministration.setMoodCode(XDocumentSubstanceMood.EVN);
    substanceAdministration.setText(CDATypeUtil.getST(knownMedication.getDirections()));
    POCDMT000040Consumable consumable = new POCDMT000040Consumable();
    POCDMT000040ManufacturedProduct manufacturedProduct = new POCDMT000040ManufacturedProduct();
    POCDMT000040Material manufacturedMaterial = new POCDMT000040Material();
    manufacturedMaterial.setCode(
        Converter.convertToCECode(knownMedication.getTherapeuticGoodIdentification()));
    manufacturedProduct.setManufacturedMaterial(manufacturedMaterial);
    consumable.setManufacturedProduct(manufacturedProduct);
    substanceAdministration.setConsumable(consumable);
    substanceAdministration.getEntryRelationship()
        .add(getClinicalIndicationEntryRelationshipForKnownMedication(knownMedication));
    substanceAdministration.getEntryRelationship()
        .add(getCommentEntryRelationshipForKnownMedication(knownMedication));
    substanceAdministration.getEntryRelationship()
        .add(getChangeTypeEntryRelationshipForKnownMedication(knownMedication));
    knownMedicationEntry.setSubstanceAdministration(substanceAdministration);
    return knownMedicationEntry;
  }

  private POCDMT000040EntryRelationship getChangeTypeEntryRelationshipForKnownMedication(
      KnownMedication knownMedication) {
    POCDMT000040EntryRelationship changeTypeRelationship = new POCDMT000040EntryRelationship();
    changeTypeRelationship.setTypeCode(XActRelationshipEntryRelationship.SPRT);
    POCDMT000040Observation changeTypeObservation = new POCDMT000040Observation();
    changeTypeObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    changeTypeObservation.setClassCode(ActClassObservation.OBS);
    changeTypeObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    changeTypeObservation.setCode(CHANGE_TYPE);
    changeTypeObservation.setText(CDATypeUtil.getST(knownMedication.getChangeDesc()));
    changeTypeObservation.getValue().add(CDATypeUtil.getCD(knownMedication.getChangeType()));

    changeTypeObservation.getEntryRelationship()
        .add(getChangeStatusEntryRelationship(knownMedication));
    changeTypeObservation.getEntryRelationship()
        .add(getChangeOrRecommReasonEntryRelationship(knownMedication));

    changeTypeRelationship.setObservation(changeTypeObservation);
    return changeTypeRelationship;
  }

  private POCDMT000040EntryRelationship getChangeStatusEntryRelationship(
      KnownMedication knownMedication) {
    POCDMT000040EntryRelationship changeStatusEntryRelationship =
        new POCDMT000040EntryRelationship();
    changeStatusEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Observation changeStatusObservation = new POCDMT000040Observation();
    changeStatusObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    changeStatusObservation.setClassCode(ActClassObservation.OBS);
    changeStatusObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    changeStatusObservation.setCode(CHANGE_STATUS);
    changeStatusObservation.getValue().add(CDATypeUtil.getCD(knownMedication.getChangeStatus()));
    changeStatusEntryRelationship.setObservation(changeStatusObservation);
    return changeStatusEntryRelationship;
  }

  private POCDMT000040EntryRelationship getChangeOrRecommReasonEntryRelationship(
      KnownMedication knownMedication) {
    POCDMT000040EntryRelationship changeOrRecomReaconEntryRelationship =
        new POCDMT000040EntryRelationship();
    changeOrRecomReaconEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.RSON);
    POCDMT000040Act changeOrRecomReasonAct = new POCDMT000040Act();
    changeOrRecomReasonAct.setClassCode(XActClassDocumentEntryAct.INFRM);
    changeOrRecomReasonAct.setMoodCode(XDocumentActMood.EVN);
    changeOrRecomReasonAct.setCode(CHANGE_OR_RECOMMENDATION_REASON);
    changeOrRecomReasonAct.setText(
        CDATypeUtil.getST(knownMedication.getChangeOrRecommendationReason()));
    changeOrRecomReaconEntryRelationship.setAct(changeOrRecomReasonAct);
    return changeOrRecomReaconEntryRelationship;
  }

  private POCDMT000040EntryRelationship getCommentEntryRelationshipForKnownMedication(
      KnownMedication knownMedication) {
    POCDMT000040EntryRelationship commentRelationship = new POCDMT000040EntryRelationship();
    commentRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Act actComment = new POCDMT000040Act();
    actComment.setClassCode(XActClassDocumentEntryAct.INFRM);
    actComment.setMoodCode(XDocumentActMood.EVN);
    actComment.setCode(ADDITIONAL_COMMENTS);
    actComment.setText(CDATypeUtil.getST(knownMedication.getMedicationInstructionComment()));
    commentRelationship.setAct(actComment);
    return commentRelationship;
  }

  private POCDMT000040EntryRelationship getClinicalIndicationEntryRelationshipForKnownMedication(
      KnownMedication knownMedication) {
    POCDMT000040EntryRelationship clinicalIndicationRelationship =
        new POCDMT000040EntryRelationship();
    clinicalIndicationRelationship.setTypeCode(XActRelationshipEntryRelationship.RSON);
    POCDMT000040Act actClinicalIndication = new POCDMT000040Act();
    actClinicalIndication.setClassCode(XActClassDocumentEntryAct.INFRM);
    actClinicalIndication.setMoodCode(XDocumentActMood.EVN);
    actClinicalIndication.setCode(CLINICAL_INDICATION);
    actClinicalIndication.setText(CDATypeUtil.getED(knownMedication.getClinicalIndication()));
    clinicalIndicationRelationship.setAct(actClinicalIndication);
    return clinicalIndicationRelationship;
  }

  private POCDMT000040Component3 getDiagnosesInterventions() {
    DiagnosesInterventions diagnosesInterventions =
        clinicalModel.getContent().getDiagnosesInterventions();
    if (null == diagnosesInterventions) {
      return null;
    }
    POCDMT000040Component3 diagnosesInterventionsComponent = new POCDMT000040Component3();
    diagnosesInterventionsComponent.setTypeCode(ActRelationshipHasComponent.COMP);
    POCDMT000040Section diagnosesOrInterventionsSection = new POCDMT000040Section();
    diagnosesOrInterventionsSection.setClassCode(ActClass.DOCSECT);
    diagnosesOrInterventionsSection.setMoodCode(ActMood.EVN);
    diagnosesOrInterventionsSection.setId(CDATypeUtil.getII(UUID.randomUUID().toString()));
    diagnosesOrInterventionsSection.setCode(MEDICAL_HISTORY);
    diagnosesOrInterventionsSection.setTitle(CDATypeUtil.getST("Diagnoses/Interventions"));
    diagnosesOrInterventionsSection.setText(
        NarrativeUtil.getCustomNarrativeDiagnosesOrInterventions(diagnosesInterventions));
    // Problem Diagnoses
    if (null != diagnosesInterventions.getProblemDiagnoses()
        && !diagnosesInterventions.getProblemDiagnoses().isEmpty()) {
      diagnosesInterventions.getProblemDiagnoses().stream().filter(Objects::nonNull)
          .forEach(
              problemDiagnosis -> diagnosesOrInterventionsSection.getEntry()
                  .add(getProblemDiagnosisEntry(problemDiagnosis)));
    }
    // Procedures
    if (null != diagnosesInterventions.getProcedures()
        && !diagnosesInterventions.getProcedures().isEmpty()) {
      diagnosesInterventions.getProcedures().stream().filter(Objects::nonNull).forEach(
          procedureObj -> diagnosesOrInterventionsSection.getEntry()
              .add(getProcedureEntry(procedureObj)));
    }
    // Uncategorized Medical History
    if (null != diagnosesInterventions.getUncatagorisedMedicalHistoryItems()
        && !diagnosesInterventions.getUncatagorisedMedicalHistoryItems().isEmpty()) {
      diagnosesInterventions.getUncatagorisedMedicalHistoryItems().stream()
          .filter(Objects::nonNull).forEach(
          uncatagorisedMedicalHistoryItem -> diagnosesOrInterventionsSection.getEntry().add(
              getUncategorisedMedicalHistoryItemEntry(uncatagorisedMedicalHistoryItem)));
    }

    diagnosesInterventionsComponent.setSection(diagnosesOrInterventionsSection);
    return diagnosesInterventionsComponent;
  }

  private POCDMT000040Entry getUncategorisedMedicalHistoryItemEntry(
      UncatagorisedMedicalHistoryItem uncatagorisedMedicalHistoryItem) {
    POCDMT000040Entry uncategorisedMedHistEntry = new POCDMT000040Entry();
    POCDMT000040Act uncategorisedMedHistAct = new POCDMT000040Act();
    uncategorisedMedHistAct.setClassCode(XActClassDocumentEntryAct.ACT);
    uncategorisedMedHistAct.setMoodCode(XDocumentActMood.EVN);
    uncategorisedMedHistAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    uncategorisedMedHistAct.setCode(UNCATEGORISED_MEDICAL_HISTORY_ITEM);
    uncategorisedMedHistAct.setEffectiveTime(
        Converter.convert(uncatagorisedMedicalHistoryItem.getTimeInterval()));
    uncategorisedMedHistAct.setText(
        CDATypeUtil.getST(uncatagorisedMedicalHistoryItem.getDescription()));
    POCDMT000040EntryRelationship medHistItemCommentEntryRelationship =
        new POCDMT000040EntryRelationship();
    medHistItemCommentEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Act medHistItemEntryRelAct = new POCDMT000040Act();
    medHistItemEntryRelAct.setClassCode(XActClassDocumentEntryAct.INFRM);
    medHistItemEntryRelAct.setMoodCode(XDocumentActMood.EVN);
    medHistItemEntryRelAct.setCode(MEDICALHISTORY_ITEM_COMMENT);
    medHistItemEntryRelAct.setText(CDATypeUtil.getST(uncatagorisedMedicalHistoryItem.getComment()));
    medHistItemCommentEntryRelationship.setAct(medHistItemEntryRelAct);
    uncategorisedMedHistAct.getEntryRelationship().add(medHistItemCommentEntryRelationship);
    uncategorisedMedHistEntry.setAct(uncategorisedMedHistAct);
    return uncategorisedMedHistEntry;
  }

  private POCDMT000040Entry getProcedureEntry(Procedure procedureObj) {
    POCDMT000040Entry procedureEntry = new POCDMT000040Entry();
    POCDMT000040Procedure procedure = new POCDMT000040Procedure();
    procedure.setClassCode(ActClass.PROC);
    procedure.setMoodCode(XDocumentProcedureMood.EVN);
    procedure.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    procedure.setCode(Converter.convertToCDCode(procedureObj.getProcedureName()));
    procedure.setEffectiveTime(Converter.convert(procedureObj.getProcedureDateTime()));
    POCDMT000040EntryRelationship procedureCommentEntryRelationship =
        new POCDMT000040EntryRelationship();
    procedureCommentEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Act procEntryRelationshipAct = new POCDMT000040Act();
    procEntryRelationshipAct.setClassCode(XActClassDocumentEntryAct.INFRM);
    procEntryRelationshipAct.setMoodCode(XDocumentActMood.EVN);
    procEntryRelationshipAct.setCode(PROCEDURE_COMMENT);
    procEntryRelationshipAct.setText(CDATypeUtil.getST(procedureObj.getComment()));
    procedureCommentEntryRelationship.setAct(procEntryRelationshipAct);
    procedure.getEntryRelationship().add(procedureCommentEntryRelationship);
    procedureEntry.setProcedure(procedure);
    return procedureEntry;
  }

  private POCDMT000040Entry getProblemDiagnosisEntry(ProblemDiagnosis problemDiagnosis) {
    POCDMT000040Entry problemDiagnosisEntry = new POCDMT000040Entry();
    POCDMT000040Observation problemDiagnosisObservation = new POCDMT000040Observation();
    problemDiagnosisObservation.setClassCode(ActClassObservation.OBS);
    problemDiagnosisObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    problemDiagnosisObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    problemDiagnosisObservation.setCode(DIAGNOSIS_INTERPRETATION);
    if (null != problemDiagnosis.getDateOfRemission()) {
      RestrictedTimeInterval effectiveTime = RestrictedTimeInterval.getLowHighInstance(
          problemDiagnosis.getDateOfOnset(),
          problemDiagnosis.getDateOfRemission());
      problemDiagnosisObservation.setEffectiveTime(Converter.convert(effectiveTime));
    } else {
      problemDiagnosisObservation.setEffectiveTime(
          Converter.convertIVLTSwithLow(problemDiagnosis.getDateOfOnset()));
    }
    problemDiagnosisObservation.getValue()
        .add(CDATypeUtil.getCD(problemDiagnosis.getIdentification()));
    POCDMT000040EntryRelationship probDiagnosisCommentEntryRelationship =
        new POCDMT000040EntryRelationship();
    probDiagnosisCommentEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Act probDiagnosisCommentAct = new POCDMT000040Act();
    probDiagnosisCommentAct.setClassCode(XActClassDocumentEntryAct.INFRM);
    probDiagnosisCommentAct.setMoodCode(XDocumentActMood.EVN);
    probDiagnosisCommentAct.setCode(PROB_OR_DIAG_COMMENT);
    probDiagnosisCommentAct.setText(CDATypeUtil.getST(problemDiagnosis.getComment()));
    probDiagnosisCommentEntryRelationship.setAct(probDiagnosisCommentAct);
    problemDiagnosisObservation.getEntryRelationship().add(probDiagnosisCommentEntryRelationship);
    problemDiagnosisEntry.setObservation(problemDiagnosisObservation);
    return problemDiagnosisEntry;
  }

  private POCDMT000040Component3 getImmunisations() {
    Immunisations immunisations = clinicalModel.getContent().getImmunisations();
    if (immunisations == null) {
      return null;
    }

    POCDMT000040Component3 immunisationsComponent = new POCDMT000040Component3();
    POCDMT000040Section immunisationsSection = new POCDMT000040Section();
    immunisationsSection.setId(CDATypeUtil.getII(UUID.randomUUID().toString()));
    immunisationsSection.setClassCode(ActClass.DOCSECT);
    immunisationsSection.setMoodCode(ActMood.EVN);
    immunisationsSection.setCode(IMMUNISATIONS);
    immunisationsSection.setTitle(CDATypeUtil.getST("Immunisations"));
    immunisationsSection.setText(NarrativeUtil.getCustomNarrativeImmunisations(immunisations));
    if (null != immunisations.getImmunisations() && !immunisations.getImmunisations().isEmpty()) {
      immunisations.getImmunisations().stream().filter(Objects::nonNull).forEach(
          immunisation -> immunisationsSection.getEntry().add(getImmunisationEntry(immunisation)));
    }
    immunisationsComponent.setSection(immunisationsSection);
    return immunisationsComponent;
  }

  private POCDMT000040Entry getImmunisationEntry(Immunisation immunisation) {
    POCDMT000040Entry immunisationEntry = new POCDMT000040Entry();
    POCDMT000040SubstanceAdministration substanceAdministration =
        new POCDMT000040SubstanceAdministration();
    substanceAdministration.setClassCode(ActClass.SBADM);
    substanceAdministration.setMoodCode(XDocumentSubstanceMood.EVN);
    substanceAdministration.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    substanceAdministration.getEffectiveTime().add(Converter.convertToSxcmts(
        immunisation.getMedicationActionDateTime()));
    POCDMT000040Consumable consumable = new POCDMT000040Consumable();
    POCDMT000040ManufacturedProduct manufacturedProduct = new POCDMT000040ManufacturedProduct();
    POCDMT000040Material manufacturedMaterial = new POCDMT000040Material();
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

    POCDMT000040Component3 eventDetailsComponent = new POCDMT000040Component3();
    eventDetailsComponent.setTypeCode(ActRelationshipHasComponent.COMP);
    POCDMT000040Section eventDetailsSection = new POCDMT000040Section();
    eventDetailsSection.setId(CDATypeUtil.getII(UUID.randomUUID().toString()));
    eventDetailsSection.setCode(EVENT_OVERVIEW);
    eventDetailsSection.setTitle(CDATypeUtil.getST("Event Details"));
    eventDetailsSection.setText(NarrativeUtil.getCustomNarrativeForEventDetails(eventDetails));
    POCDMT000040Entry clinicalSynopsisEntry = new POCDMT000040Entry();
    clinicalSynopsisEntry.setAct(getClinicalSynopsisActForEventDetailsActEntry(eventDetails));
    eventDetailsSection.setClassCode(ActClass.DOCSECT);
    eventDetailsSection.setMoodCode(ActMood.EVN);
    eventDetailsSection.getEntry().add(clinicalSynopsisEntry);
    eventDetailsComponent.setSection(eventDetailsSection);

    return eventDetailsComponent;
  }

  private POCDMT000040Act getClinicalSynopsisActForEventDetailsActEntry(EventDetails eventDetails) {
    POCDMT000040Act clinicalSynopsisAct = new POCDMT000040Act();
    clinicalSynopsisAct.setClassCode(XActClassDocumentEntryAct.ACT);
    clinicalSynopsisAct.setMoodCode(XDocumentActMood.EVN);
    clinicalSynopsisAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    clinicalSynopsisAct.setCode(CLINICAL_SYNOPSIS);
    clinicalSynopsisAct.setText(CDATypeUtil.getST(eventDetails.getClinicalSynopsisDesc()));
    return clinicalSynopsisAct;
  }

  private POCDMT000040Component3 getNewlyIdentifiedAdverseReactions() {
    NewlyIdentifiedAdverseReactions newlyIdentifiedAdverseReactions =
        clinicalModel.getContent().getNewlyIdentifiedAdverseReactions();
    if (null == newlyIdentifiedAdverseReactions) {
      return null;
    }
    POCDMT000040Component3 newlyIdentifiedAdverseReactionsComponent = new POCDMT000040Component3();
    newlyIdentifiedAdverseReactionsComponent.setTypeCode(ActRelationshipHasComponent.COMP);
    POCDMT000040Section adverseReactionSection = new POCDMT000040Section();
    adverseReactionSection.setId(CDATypeUtil.getII(UUID.randomUUID().toString()));
    adverseReactionSection.setCode(ADVERSE_REACTIONS);
    adverseReactionSection.setTitle(CDATypeUtil.getST("Adverse Reactions"));
    adverseReactionSection.setText(
        NarrativeUtil.getAdverseReactionsNarrativeBlock(newlyIdentifiedAdverseReactions));
    if (null != newlyIdentifiedAdverseReactions.getAdverseReactions()) {
      newlyIdentifiedAdverseReactions.getAdverseReactions().stream()
          .filter(Objects::nonNull)
          .forEach(adverseReaction -> adverseReactionSection.getEntry()
              .add(getAdverseReactionEntry(adverseReaction)));
      newlyIdentifiedAdverseReactionsComponent.setSection(adverseReactionSection);
    }
    return newlyIdentifiedAdverseReactionsComponent;
  }

  private POCDMT000040Entry getAdverseReactionEntry(AdverseReaction adverseReaction) {
    POCDMT000040Entry adverseReactionEntry = new POCDMT000040Entry();

    POCDMT000040Act adverseReactionAct = new POCDMT000040Act();
    adverseReactionAct.setClassCode(XActClassDocumentEntryAct.ACT);
    adverseReactionAct.setMoodCode(XDocumentActMood.EVN);
    adverseReactionAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    adverseReactionAct.setCode(ADVERSE_REACTION);
    POCDMT000040Participant2 adverseReactionSubstanceOrAgent = new POCDMT000040Participant2();
    adverseReactionSubstanceOrAgent.setTypeCode(ParticipationType.CAGNT);
    POCDMT000040ParticipantRole participantRole = new POCDMT000040ParticipantRole();
    POCDMT000040PlayingEntity playingEntity = new POCDMT000040PlayingEntity();
    playingEntity.setCode(Converter.convertToCECode(adverseReaction.getSubstanceOrAgent()));
    participantRole.setPlayingEntity(playingEntity);
    adverseReactionSubstanceOrAgent.setParticipantRole(participantRole);
    adverseReactionAct.getParticipant().add(adverseReactionSubstanceOrAgent);

    adverseReactionAct.getEntryRelationship()
        .add(getReactionEventEntryRelationshipCause(adverseReaction));

    adverseReactionEntry.setAct(adverseReactionAct);
    return adverseReactionEntry;
  }

  private POCDMT000040EntryRelationship getReactionEventEntryRelationshipCause(
      AdverseReaction adverseReaction) {
    POCDMT000040EntryRelationship entryRelationshipCause = new POCDMT000040EntryRelationship();
    POCDMT000040Observation reactionEventObservation = new POCDMT000040Observation();
    reactionEventObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    reactionEventObservation.setClassCode(ActClassObservation.OBS);
    reactionEventObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    reactionEventObservation.setCode(REACTION_EVENT);
    reactionEventObservation.getValue()
        .add(Converter.convertToCDCode(adverseReaction.getReactionEvent().getReactionType()));
    if (null != adverseReaction.getReactionEvent().getManifestations()) {
      adverseReaction.getReactionEvent().getManifestations().stream().filter(Objects::nonNull)
          .forEach(manifestation -> reactionEventObservation.getEntryRelationship().add(
              getReactionEventEntryRelationshipManifestation(
                  adverseReaction.getReactionEvent().getReactionType(), manifestation)));
    }
    entryRelationshipCause.setTypeCode(XActRelationshipEntryRelationship.CAUS);
    entryRelationshipCause.setObservation(reactionEventObservation);
    return entryRelationshipCause;
  }

  private POCDMT000040EntryRelationship getReactionEventEntryRelationshipManifestation(
      Coded reactionType, Coded manifestation) {
    POCDMT000040EntryRelationship entryRelationshipManifest = new POCDMT000040EntryRelationship();
    entryRelationshipManifest.setInversionInd(true);
    entryRelationshipManifest.setTypeCode(XActRelationshipEntryRelationship.MFST);
    POCDMT000040Observation manifestObservation = new POCDMT000040Observation();
    manifestObservation.setClassCode(ActClassObservation.OBS);
    manifestObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    manifestObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    manifestObservation.setCode(Converter.convertToCDCode(manifestation));
    manifestObservation.getValue().add(Converter.convertToCVCode(reactionType));
    entryRelationshipManifest.setObservation(manifestObservation);
    return entryRelationshipManifest;
  }

  private POCDMT000040Author getDocumentAuthor() {
    POCDMT000040Author author = new POCDMT000040Author();

    EventSummaryAuthor documentAuthor = clinicalModel.getContext().getDocumentAuthor();

    DateTime authorTime = documentAuthor.getParticipationPeriod();
    if (authorTime == null) {
      authorTime = cdaModel.getLegalAuthenticator().getAuthenticationTime();
    }

    author.setTime(Converter.getTS(authorTime));

    POCDMT000040AssignedAuthor assignedAuthor = new POCDMT000040AssignedAuthor();
    assignedAuthor.getId().add(CDATypeUtil.getII(documentAuthor.getID()));
    assignedAuthor.setCode(Converter.convertToCECode(documentAuthor.getRole()));
    POCDMT000040Person person = new POCDMT000040Person();

    List<AsEntityIdentifier> ids = documentAuthor.getEntityIdentifiers();
    person.getAsEntityIdentifier().addAll(Converter.convertEntityIdentifiers(ids));

    List<AddressContext> addresses = documentAuthor.getAddresses();
    if (addresses != null && addresses.size() > 0) {
      assignedAuthor.getAddr().addAll(AddressConverter.convert(addresses));
    }
    assignedAuthor.getTelecom()
        .addAll(Converter.convert(documentAuthor.getElectronicCommunicationDetails()));
    person.getName().addAll(Converter.convertNames(documentAuthor.getPersonNames()));

    ExtendedEmploymentOrganisation employmentDetail = documentAuthor.getEmploymentDetail();
    person.setAsEmployment(
        ClinicalModelConverter.getExtendedEmploymentOrganisation(employmentDetail));

    assignedAuthor.setAssignedPerson(person);
    author.setAssignedAuthor(assignedAuthor);

    return author;
  }

  private String getUUID() {
//    String character = Character.toString(((char) (new Random().nextInt(26) + 'a')));
//    return UUID.randomUUID().toString().replaceFirst("[0-9]", character);
    String uuid = UUID.randomUUID().toString();
    if (!Character.isDigit(uuid.charAt(0))) {
      return uuid;
    }
    return getUUID();
//    return uuid;
  }

  private POCDMT000040Component3 getAdministrativeObservationsSection() {
    POCDMT000040Component3 administrativeObservationsSectionComponent =
        new POCDMT000040Component3();

    SubjectOfCareDemographicData subjectOfCareDemographicData =
        this.clinicalModel.getContext().getSubjectOfCare().getPerson().getDemographicData();
    EventSummaryAuthor author = this.clinicalModel.getContext().getDocumentAuthor();
    POCDMT000040Section administrativeObservationsSection = new POCDMT000040Section();
    administrativeObservationsSection.setCode(SectionEntryCodeSet.ADMINISTRATIVE_OBSERVATIONS);
    administrativeObservationsSection.setTitle(
        CDATypeUtil.getST(ADMINISTRATIVE_OBSERVATIONS_SECTION_TITLE));

    SubjectOfCareParticipant soc = clinicalModel.getContext().getSubjectOfCare();
    List<au.gov.nehta.model.clinical.etp.common.participation.Entitlement> subjectOfCareEntitlement = soc
        .getEntitlements();
    if (subjectOfCareEntitlement != null) {
      List<Coverage2> subjectOfCareEntitlements =
          ClinicalModelConverter.getSubjectOfCareEntitlements(soc);
      administrativeObservationsSection.getCoverage2().addAll(subjectOfCareEntitlements);
    }

    List<? extends au.gov.nehta.model.clinical.etp.common.participation.Entitlement> authorEntitlement = author
        .getEntitlements();
    if (authorEntitlement != null) {
      List<Coverage2> authorEntitlements =
          ClinicalModelConverter.getParticpantEntitlements(authorEntitlement, author.getID());
      administrativeObservationsSection.getCoverage2().addAll(authorEntitlements);
    }

    // Administrative Observations entries
    if (subjectOfCareDemographicData != null) {

      Boolean isSubjectOfCareDateOfBirthCalculatedFromAge =
          subjectOfCareDemographicData.getDateOfBirthDetail().getDateOfBirthIsCalculatedFromAge();
      if (isSubjectOfCareDateOfBirthCalculatedFromAge != null) {
        POCDMT000040Entry calcAgeEntry =
            EntryCreator.createSubjectOfCareCalcAgeEntry(
                isSubjectOfCareDateOfBirthCalculatedFromAge);
        administrativeObservationsSection.getEntry().add(calcAgeEntry);
      }

      DateAccuracy subjectOfCareDateOfBirthAccuracyIndicator =
          subjectOfCareDemographicData.getDateOfBirthDetail().getDateOfBirthAccuracyIndicator();
      if (subjectOfCareDateOfBirthAccuracyIndicator != null) {
        POCDMT000040Entry dateOfBirthAccuracyEntry =
            EntryCreator.createSubjectOfCareDateOfBirthAccuracyEntry(
                subjectOfCareDateOfBirthAccuracyIndicator);
        administrativeObservationsSection.getEntry().add(dateOfBirthAccuracyEntry);
      }

      if (subjectOfCareDemographicData instanceof ExtendedDemographicData) {
        ExtendedDemographicData ext = (ExtendedDemographicData) subjectOfCareDemographicData;
        DateOfDeath dateOfDeath = ext.getDateOfDeath();
        if (dateOfDeath != null) {
          if (dateOfDeath.getDateOfDeathAccuracyIndicator() != null) {
            POCDMT000040Entry dodAccuracyEntry =
                EntryCreator.createDeathDateAccuracyEntry(
                    dateOfDeath.getDateOfDeathAccuracyIndicator());
            administrativeObservationsSection.getEntry().add(dodAccuracyEntry);
          }

          if (dateOfDeath.getDeathNotificationSource() != null) {
            POCDMT000040Entry dodSource =
                EntryCreator.createDeathSourceCodeEntry(dateOfDeath.getDeathNotificationSource());
            administrativeObservationsSection.getEntry().add(dodSource);
          }
        }

        if (ext.getMothersOriginalFamilyName() != null) {
          POCDMT000040Entry dodSource =
              EntryCreator.createMothersMaidenNameEntry(ext.getMothersOriginalFamilyName());
          administrativeObservationsSection.getEntry().add(dodSource);
        }
      }

      POCDMT000040Entry ageEntry =
          EntryCreator.createSubjectOfCareAgeEntry(
              Integer.toString(subjectOfCareDemographicData.getAgeInYears()));
      administrativeObservationsSection.getEntry().add(ageEntry);

      if (subjectOfCareDemographicData.isAgeAccurate() != null) {
        POCDMT000040Entry ageAccuracyEntry =
            EntryCreator.createSubjectOfCareAgeAccuracyEntry(
                subjectOfCareDemographicData.isAgeAccurate());
        administrativeObservationsSection.getEntry().add(ageAccuracyEntry);
      }

      Integer subjectOfCareBirthPlurality = subjectOfCareDemographicData.getBirthPlurality();
      if (subjectOfCareBirthPlurality != null) {
        POCDMT000040Entry birthPluralityEntry =
            EntryCreator.createSubjectOfCareBirthPluralityEntry(subjectOfCareBirthPlurality);
        administrativeObservationsSection.getEntry().add(birthPluralityEntry);
      }

      // Administrative Observations narrative block
      StrucDocText administrativeObservationsSectionNarrativeBlock;
      if (subjectOfCareDemographicData instanceof ExtendedDemographicData) {
        administrativeObservationsSectionNarrativeBlock =
            StructuredBodyUtil.getAdministrativeObservationsNarrativeBlock(
                (ExtendedDemographicData) subjectOfCareDemographicData);
      } else {
        administrativeObservationsSectionNarrativeBlock =
            StructuredBodyUtil.getAdministrativeObservationsNarrativeBlock(
                subjectOfCareDemographicData);
      }

      administrativeObservationsSection.setText(administrativeObservationsSectionNarrativeBlock);
      administrativeObservationsSectionComponent.setSection(administrativeObservationsSection);
    }

    return administrativeObservationsSectionComponent;
  }
}