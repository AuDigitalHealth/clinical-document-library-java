package au.gov.nehta.builder.ds;

import static au.gov.nehta.builder.DocumentCreatorUtil.HL7_TEXT_MEDIA_TYPE;
import static au.gov.nehta.builder.common.SectionEntryCodeSet.ADDITIONAL_COMMENTS;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.ADVERSE_REACTION;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.ADVERSE_REACTIONS;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.ALERTS;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.ARRANGED_SERVICES;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.CEASED_MEDICATIONS;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.CEASED_MEDICATIONS_GLOBAL_STATEMENT;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.CHANGE_DETAIL_REASON_FOR_CHANGE;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.CHANGE_OR_RECOMMENDATION_REASON;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.CHANGE_STATUS;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.CHANGE_TYPE;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.CLINICAL_INDICATION;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.CLINICAL_INFO;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.CLINICAL_INFORMATION_PROVIDED;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.CLINICAL_INTERVENTIONS_PERF_THIS_VISIT;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.CLINICAL_SYNOPSIS;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.CLINICAL_SYNOPSIS_DESC;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.COLLECTION_SETTINGS;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.CURRENT_MEDICATIONS_ON_DISCHARGE;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.CURRENT_MEDICATIONS_ON_DISCHARGE_GLOBAL_STATEMENT;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.DATETIME_RECEIVED;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.DIAGNOSIS_INTERPRETATION;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.DIAGNOSTIC_INVESTIGATIONS;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.DICOM_SERIES_IDENTIFIER;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.DICOM_STUDY_IDENTIFIER;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.EVENT;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.EVENT_OVERVIEW;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.EXAMINATION_IMAGE_DETAILS;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.EXAMINATION_REPORT_IDENTIFIER;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.EXAMINATION_REQUESTED_NAME;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.EXAMINATION_REQUEST_DETAILS;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.HEALTH_PROFILE;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.IMAGING_EXAMINATION_RESULT;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.IMAGING_EXAMINATION_RESULT_DATETIME;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.IMAGING_EXAMINATION_RESULT_FINDINGS;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.IMAGING_EXAMINATION_RESULT_STATUS;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.IMMUNISATIONS;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.INDIVIDUAL_RESULT_COMMENT_CODE;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.INDIVIDUAL_TEST_RESULT_COMMENT;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.INDIVIDUAL_TEST_RESULT_REF_RANGE_COMMENTS;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.INDIVIDUAL_TEST_RESULT_STATUS;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.INFORMATION_PROVIDED;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.LAB_FINDINGS_INTERPRETATION;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.LATERALITY;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.MEDICALHISTORY_ITEM_COMMENT;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.MEDICAL_HISTORY;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.MEDICATIONS;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.MEDICATION_ORDERS;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.OTHER_TEST_RESULT;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.OTHER_TEST_RESULT_REPORT_STATUS;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.PARENT_SPECIMEN_IDENTIFIER;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.PATHOLOGICAL_DIAGNOSIS;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.PATHOLOGY_SERVICE;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.PATHOLOGY_TEST_RESULT;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.PATHOLOGY_TEST_RESULT_DATETIME;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.PATH_TEST_COMMENT;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.PLAN;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.PROBLEM_DIAGNOSIS_GLOBAL_STATEMENT;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.PROBLEM_DIAGNOSIS_THIS_VISIT;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.PROB_OR_DIAG_COMMENT;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.PROCEDURE_COMMENT;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.REACTION_EVENT;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.REASON_FOR_THERAPEUTIC_GOOD;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.RECOMMENDATIONS_PROVIDED;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.RECORD_OF_RECOMM_AND_INFO_PROVIDED;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.REPORT_STATUS;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.REQUESTED_SERVICE;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.REQUESTED_SERVICE_DATETIME;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.RESULT_GROUP_SPEC_DETAIL;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.SAMPLING_PRECONDITIONS;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.SPECIALTY;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.SPECIMEN;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.SUBJECT_OF_CARE_INSTR_DESC;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.SUBJECT_POSITION;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.TEST_REQ_DETAILS;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.TEST_REQ_NAME;
import static au.gov.nehta.builder.ds.DischargeSummaryCodes.UNCATEGORISED_MEDICAL_HISTORY_ITEM;
import static au.gov.nehta.builder.sl.SpecialistLetterNarrativeUtil.getMultimediaFromAttachedMedia;

import au.gov.nehta.builder.common.ClinicalDocumentCodes;
import au.gov.nehta.builder.common.HeaderUtil;
import au.gov.nehta.builder.common.NarrativeUtilCommon;
import au.gov.nehta.builder.common.SectionEntryCodeSet;
import au.gov.nehta.builder.common.components.AdministrativeObservationsComponent;
import au.gov.nehta.builder.common.components.DiagnosticInvestigationComponent;
import au.gov.nehta.builder.common.components.DocumentAuthorComponent;
import au.gov.nehta.builder.common.components.ExclusionStatementComponent;
import au.gov.nehta.builder.util.AddressConverter;
import au.gov.nehta.builder.util.CDATypeUtil;
import au.gov.nehta.builder.util.ClinicalDocumentCreator;
import au.gov.nehta.builder.util.Converter;
import au.gov.nehta.builder.util.CreatorUtil;
import au.gov.nehta.model.cda.common.code.CodeImpl;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.ds.DischargeSummaryCDAModel;
import au.gov.nehta.model.clinical.ds.AdverseReaction;
import au.gov.nehta.model.clinical.ds.AdverseReactions;
import au.gov.nehta.model.clinical.ds.Alert;
import au.gov.nehta.model.clinical.ds.Alerts;
import au.gov.nehta.model.clinical.ds.ArrangedService;
import au.gov.nehta.model.clinical.ds.ArrangedServices;
import au.gov.nehta.model.clinical.ds.CeasedMedications;
import au.gov.nehta.model.clinical.ds.ChangeDetail;
import au.gov.nehta.model.clinical.ds.ClinicalInterventionsPerformedThisVisit;
import au.gov.nehta.model.clinical.ds.CurrentMedicationsOnDischarge;
import au.gov.nehta.model.clinical.ds.DischargeSummary;
import au.gov.nehta.model.clinical.ds.Dosage;
import au.gov.nehta.model.clinical.ds.Encounter;
import au.gov.nehta.model.clinical.ds.Event;
import au.gov.nehta.model.clinical.ds.HealthProfile;
import au.gov.nehta.model.clinical.ds.MedicationHistory;
import au.gov.nehta.model.clinical.ds.Medications;
import au.gov.nehta.model.clinical.ds.Plan;
import au.gov.nehta.model.clinical.ds.ProblemDiagnosesThisVisit;
import au.gov.nehta.model.clinical.ds.ProblemDiagnosis;
import au.gov.nehta.model.clinical.ds.ReactionDetail;
import au.gov.nehta.model.clinical.ds.RecommendationsProvided;
import au.gov.nehta.model.clinical.ds.RecordOfRecommendationsAndInfoProvided;
import au.gov.nehta.model.clinical.ds.TherapeuticGood;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.gov.nehta.model.clinical.etp.common.participation.ServiceProvider;
import au.gov.nehta.model.schematron.SchematronResource.SchematronResources;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.net.electronichealth.ns.cda._2_0.ActClass;
import au.net.electronichealth.ns.cda._2_0.ActClassObservation;
import au.net.electronichealth.ns.cda._2_0.ActClassSupply;
import au.net.electronichealth.ns.cda._2_0.ActMood;
import au.net.electronichealth.ns.cda._2_0.CD;
import au.net.electronichealth.ns.cda._2_0.CE;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Act;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040AssignedEntity;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040AssociatedEntity;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ClinicalDocument;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component1;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component2;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component3;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component5;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Consumable;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040EncompassingEncounter;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040EncounterParticipant;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Entry;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040EntryRelationship;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ManufacturedProduct;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Material;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Observation;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ObservationMedia;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Participant1;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Participant2;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ParticipantRole;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Person;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040PlayingEntity;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Procedure;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Section;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040StructuredBody;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040SubstanceAdministration;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Supply;
import au.net.electronichealth.ns.cda._2_0.ParticipationType;
import au.net.electronichealth.ns.cda._2_0.RoleClassAssociative;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import au.net.electronichealth.ns.cda._2_0.XActClassDocumentEntryAct;
import au.net.electronichealth.ns.cda._2_0.XActMoodDocumentObservation;
import au.net.electronichealth.ns.cda._2_0.XActRelationshipEntry;
import au.net.electronichealth.ns.cda._2_0.XActRelationshipEntryRelationship;
import au.net.electronichealth.ns.cda._2_0.XDocumentActMood;
import au.net.electronichealth.ns.cda._2_0.XDocumentProcedureMood;
import au.net.electronichealth.ns.cda._2_0.XDocumentSubstanceMood;
import au.net.electronichealth.ns.cda._2_0.XEncounterParticipant;
import java.util.Collection;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import org.joda.time.DateTime;
import org.w3c.dom.Document;

public class DischargeSummaryCreator extends ClinicalDocumentCreator {

  private DischargeSummaryCDAModel cdaModel;
  private DischargeSummary clinicalModel;
  private boolean isFormat2;
  private static ObjectFactory objectFactory = new ObjectFactory();
  private static Map<String, CD> dischargeSummaryCodeMap;
  private ExclusionStatementComponent exclusionStatementComponent
      = new ExclusionStatementComponent();

  static {
    dischargeSummaryCodeMap = new HashMap<String, CD>() {{
      put(ClinicalDocumentCodes.MEDICATIONS, MEDICATIONS);
      put(ClinicalDocumentCodes.ARRANGED_SERVICES, ARRANGED_SERVICES);
      put(ClinicalDocumentCodes.RECORD_OF_RECOMM_AND_INFO_PROVIDED,
          RECORD_OF_RECOMM_AND_INFO_PROVIDED);
      put(ClinicalDocumentCodes.CURRENT_MEDICATIONS_ON_DISCHARGE, CURRENT_MEDICATIONS_ON_DISCHARGE);
      put(ClinicalDocumentCodes.ADDITIONAL_COMMENTS, ADDITIONAL_COMMENTS);
      put(ClinicalDocumentCodes.PLAN, PLAN);
      put(ClinicalDocumentCodes.REASON_FOR_THERAPEUTIC_GOOD, REASON_FOR_THERAPEUTIC_GOOD);
      put(ClinicalDocumentCodes.PROBLEM_DIAGNOSIS_GLOBAL_STATEMENT,
          PROBLEM_DIAGNOSIS_GLOBAL_STATEMENT);
      put(ClinicalDocumentCodes.PROBLEM_DIAGNOSIS_THIS_VISIT, PROBLEM_DIAGNOSIS_THIS_VISIT);
      put(ClinicalDocumentCodes.CLINICAL_INTERVENTIONS_PERF_THIS_VISIT,
          CLINICAL_INTERVENTIONS_PERF_THIS_VISIT);
      put(ClinicalDocumentCodes.SPECIALTY, SPECIALTY);
      put(ClinicalDocumentCodes.CLINICAL_SYNOPSIS_DESC, CLINICAL_SYNOPSIS_DESC);
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
      put(ClinicalDocumentCodes.EVENT, EVENT);
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
      put(ClinicalDocumentCodes.INFORMATION_PROVIDED, INFORMATION_PROVIDED);
      put(ClinicalDocumentCodes.RECOMMENDATIONS_PROVIDED, RECOMMENDATIONS_PROVIDED);
      put(ClinicalDocumentCodes.CHANGE_DETAIL_REASON_FOR_CHANGE, CHANGE_DETAIL_REASON_FOR_CHANGE);
      put(ClinicalDocumentCodes.CEASED_MEDICATIONS, CEASED_MEDICATIONS);
      put(ClinicalDocumentCodes.CEASED_MEDICATIONS_GLOBAL_STATEMENT,
          CEASED_MEDICATIONS_GLOBAL_STATEMENT);
      put(ClinicalDocumentCodes.CURRENT_MEDICATIONS_ON_DISCHARGE_GLOBAL_STATEMENT,
          CURRENT_MEDICATIONS_ON_DISCHARGE_GLOBAL_STATEMENT);
      put(ClinicalDocumentCodes.IMAGING_EXAMINATION_RESULT, IMAGING_EXAMINATION_RESULT);
      put(ClinicalDocumentCodes.REQUESTED_SERVICE, REQUESTED_SERVICE);
      put(ClinicalDocumentCodes.SUBJECT_OF_CARE_INSTR_DESC, SUBJECT_OF_CARE_INSTR_DESC);
      put(ClinicalDocumentCodes.REQUESTED_SERVICE_DATETIME, REQUESTED_SERVICE_DATETIME);
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
      put(ClinicalDocumentCodes.CLINICAL_SYNOPSIS, CLINICAL_SYNOPSIS);
      put(ClinicalDocumentCodes.ALERTS, ALERTS);
      put(ClinicalDocumentCodes.HEALTH_PROFILE, HEALTH_PROFILE);
    }};
  }

  /**
   * add the NeHTA Generic Stylesheet as an xml processing instruction
   */
  public void addStyleSheet(Document doc) {
    addStylesheet("DH_Generic_CDA_Stylesheet-1.6.0.xsl", doc);
  }

  public DischargeSummaryCreator(DischargeSummaryCDAModel cdaModel,
      DischargeSummary clinicalModel) {
    this.cdaModel = cdaModel;
    this.clinicalModel = clinicalModel;

    // for schematron checking
    this.resource = SchematronResources.DISCHARGE_SUMMARY_3A.resource();
  }

  public DischargeSummaryCreator(DischargeSummaryCDAModel cdaModel,
      DischargeSummary clinicalModel, boolean isFormat2) {
    this.cdaModel = cdaModel;
    this.clinicalModel = clinicalModel;
    this.isFormat2 = isFormat2;

    // for schematron checking
    this.resource = SchematronResources.DISCHARGE_SUMMARY_3A.resource();
  }

  public Document create()
      throws ParserConfigurationException, JAXBException, SchematronValidationException {
    POCDMT000040ClinicalDocument clinicalDocument =
        HeaderUtil.createClinicalDocument(cdaModel.getBaseClinicalDocument(), new DateTime());
    clinicalDocument.setCode(SectionEntryCodeSet.DISCHARGE_SUMMARY);
    clinicalDocument.setCompletionCode(
        Converter.convertToCECode(cdaModel.getCompletionClinicalDoucment().getCompletionCode()));
    //Information Recipient List (0..*)
    if (null != cdaModel.getInformationRecipients() && !cdaModel.getInformationRecipients()
        .isEmpty()) {
      cdaModel.getInformationRecipients().stream().filter(Objects::nonNull).forEach(
          informationRecipient -> clinicalDocument.getInformationRecipient()
              .add(HeaderUtil.createInformationRecipient(informationRecipient))
      );
    }
    // Construct Custodian
    if (cdaModel.getCustodian() != null) {
      clinicalDocument.setCustodian(
          HeaderUtil.createCustodian(cdaModel.getCustodian().getAssignedCustodian()
              .getRepresentedCustodianOrganization()));
    } else {
      throw new RuntimeException("Missing: Clinical Document > Custodian");
    }
    // Construct Legal Authenticator
    if (cdaModel.getLegalAuthenticator() != null) {
      clinicalDocument.setLegalAuthenticator(
          HeaderUtil.createLegalAuthenticator(cdaModel.getLegalAuthenticator()));
    }
    clinicalDocument.getAuthor().add(new DocumentAuthorComponent().getAuthor(clinicalModel
        .getContext().getDocumentAuthor(), cdaModel.getLegalAuthenticator()));
    POCDMT000040Component1 componentOf = objectFactory.createPOCDMT000040Component1();
    clinicalDocument.setComponentOf(componentOf);
    //Encompassing encounter->Responsible Healthcare Professional
    if (null != clinicalModel.getContent().getEvent().getEncounter()) {
      clinicalDocument.getComponentOf().setEncompassingEncounter(getEncompassingEncounter());
    }
    //Facility
    if (!isFormat2) {
      if (null != clinicalModel.getContext().getFacility()) {
        clinicalDocument.getComponentOf().getEncompassingEncounter().setLocation(
            HeaderUtil.getEncompassingEncounterFacility(clinicalModel.getContext().getFacility()));
      } else {
        throw new RuntimeException("Missing: Clinical Document > Facility");
      }
      // Construct Record Target
      if (null == clinicalModel.getContext().getSubjectOfCare()) {
        throw new RuntimeException("Missing: Clinical Document > Subject Of Care");
      }
    }

    clinicalDocument.getRecordTarget()
        .add(HeaderUtil.createRecordTarget(clinicalModel.getContext().getSubjectOfCare()));
    //Other Participants
    if (!isFormat2) {
      if (null != clinicalModel.getContent().getEvent().getEncounter().getOtherParticipants()
          && !clinicalModel.getContent().getEvent().getEncounter().getOtherParticipants()
          .isEmpty()) {
        clinicalDocument.getParticipant().addAll(getOtherParticipants());
      }
    }

    //Nominated Primary Healthcare Provider
    if (!isFormat2) {
      if (null != clinicalModel.getContent().getHealthProfile().getHealthCareProviders()
          && !clinicalModel.getContent().getHealthProfile().getHealthCareProviders()
          .getNominatedPrimaryHealthcareProviders().isEmpty()) {
        clinicalDocument.getParticipant().addAll(getHealthCareProviderParticipant());
      } else {
        throw new RuntimeException(
            "Missing: Clinical Document > Nominated Primary Healthcare Provider");
      }
    }
    //Location of Participant
    clinicalDocument.getParticipant().add(processEncounter(clinicalDocument));

    clinicalDocument.setComponent(getCDABody());
    Document doc = getDocumentFilteredOfNull(
        CreatorUtil.convertClinicalDocumentToDomDocument(clinicalDocument));
    // If strict checking is enabled, check this document.
    if (isStrict()) {
      check(doc);
    }
    return doc;
  }

  private POCDMT000040Participant1 processEncounter(POCDMT000040ClinicalDocument clinicalDocument) {
    if (null != clinicalModel.getContent().getEvent().getEncounter()) {
      Encounter encounterObj = clinicalModel.getContent().getEvent().getEncounter();
      POCDMT000040Participant1 locationOfDischargeParticipant = objectFactory
          .createPOCDMT000040Participant1();
      if (null == encounterObj.getEncounterPeriod()) {
        throw new RuntimeException(
            "Missing: Clinical Document > Event > Encounter > Encounter Period");
      }
      locationOfDischargeParticipant.setTime(Converter.convert(encounterObj.getEncounterPeriod()));
      locationOfDischargeParticipant.setTypeCode(ParticipationType.ORG);
      POCDMT000040AssociatedEntity associatedEntity = objectFactory
          .createPOCDMT000040AssociatedEntity();
      associatedEntity.setClassCode(RoleClassAssociative.SDLOC);
      associatedEntity.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
      associatedEntity.setCode(Converter.convertToCECode(new CodeImpl() {{
        setOriginalText(
            clinicalModel.getContent().getEvent().getEncounter().getLocationOfDischarge());
      }}));
      locationOfDischargeParticipant.setAssociatedEntity(associatedEntity);
      return locationOfDischargeParticipant;
    } else {
      throw new RuntimeException(
          "Missing: Clinical Document > Event > Encounter");
    }
  }

  private Collection<POCDMT000040Participant1> getHealthCareProviderParticipant() {
    List<POCDMT000040Participant1> healthcareParticipants = new LinkedList<>();
    clinicalModel.getContent().getHealthProfile().getHealthCareProviders()
        .getNominatedPrimaryHealthcareProviders().stream()
        .filter(Objects::nonNull).forEach(serviceProvider -> {
      POCDMT000040Participant1 healthcareParticipant = objectFactory
          .createPOCDMT000040Participant1();
      healthcareParticipant.setTypeCode(ParticipationType.PART);
      CE functionCode = objectFactory.createCE();
      functionCode.setCode("PCP");
      healthcareParticipant.setFunctionCode(functionCode);

      POCDMT000040AssociatedEntity associatedEntity = objectFactory
          .createPOCDMT000040AssociatedEntity();
      associatedEntity.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
      associatedEntity.setClassCode(RoleClassAssociative.PROV);
      associatedEntity.setCode(Converter.convertToCECode(serviceProvider.getRole()));

      POCDMT000040Person associatedPerson = objectFactory.createPOCDMT000040Person();
      if (null != serviceProvider.getParticipant().getEntityIdentifiers()) {
        serviceProvider.getParticipant().getEntityIdentifiers().stream().filter(Objects::nonNull)
            .forEach(asEntityIdentifier -> associatedPerson.getAsEntityIdentifier()
                .add(Converter.convert(asEntityIdentifier)));
      } else {
        throw new RuntimeException(
            "Missing attribute: Health Care Provider > Participant > Associated Person > "
                + "Entitiy Identifier");
      }

      if (null != serviceProvider.getParticipant().getAddresses()) {
        associatedEntity.getAddr().addAll(AddressConverter
            .convertAustralianAddress(serviceProvider.getParticipant().getAddresses()));
      } else {
        throw new RuntimeException(
            "Missing attribute: Health Care Provider > Participant > Associated Person > "
                + "Address");
      }
      if (null != serviceProvider.getParticipant().getElectronicCommunicationDetails()) {
        associatedEntity.getTelecom().addAll(Converter.convertElectronicCommunicationDetail(
            serviceProvider.getParticipant().getElectronicCommunicationDetails()));
      } else {
        throw new RuntimeException(
            "Missing attribute: Health Care Provider > Participant > Associated Person > "
                + "Electronic Communication Detail");
      }

      if (null != serviceProvider.getParticipant().getHealthCareProvider().getPersonNames()
          && !serviceProvider.getParticipant().getHealthCareProvider().getPersonNames().isEmpty()) {
        serviceProvider.getParticipant().getHealthCareProvider().getPersonNames().stream()
            .filter(Objects::nonNull).forEach(
            personName -> associatedPerson.getName().add(Converter.getPersonName(personName)));
      } else {
        throw new RuntimeException(
            "Missing attribute: Health Care Provider > Participant > Associated Person > "
                + "Person Name");
      }

      associatedPerson.setAsEmployment(
          DiagnosticInvestigationComponent.getEmploymentDetails(serviceProvider.getParticipant()));
      associatedEntity.setAssociatedPerson(associatedPerson);
      healthcareParticipant.setAssociatedEntity(associatedEntity);
    });
    return healthcareParticipants;
  }

  private Collection<POCDMT000040Participant1> getOtherParticipants() {

    List<POCDMT000040Participant1> otherParticipants = new LinkedList<>();
    clinicalModel.getContent()
        .getEvent().getEncounter().getOtherParticipants().stream()
        .filter(Objects::nonNull).forEach(serviceProvider -> {
      POCDMT000040Participant1 otherParticipant = objectFactory.createPOCDMT000040Participant1();
      otherParticipant.setTypeCode(ParticipationType.PART);
      POCDMT000040AssociatedEntity associatedEntity = objectFactory
          .createPOCDMT000040AssociatedEntity();
      associatedEntity.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
      associatedEntity.setClassCode(RoleClassAssociative.CAREGIVER);
      associatedEntity.setCode(Converter.convertToCECode(serviceProvider.getRole()));

      if (null != serviceProvider.getParticipationPeriod()) {
        otherParticipant.setTime(Converter.convert(serviceProvider.getParticipationPeriod()));
      }
      POCDMT000040Person associatedPerson = objectFactory.createPOCDMT000040Person();
      if (null != serviceProvider.getParticipant().getEntityIdentifiers()) {
        serviceProvider.getParticipant().getEntityIdentifiers().stream().filter(Objects::nonNull)
            .forEach(asEntityIdentifier -> associatedPerson.getAsEntityIdentifier()
                .add(Converter.convert(asEntityIdentifier)));
      }
      if (null != serviceProvider.getParticipant().getAddresses()) {
        associatedEntity.getAddr().addAll(AddressConverter
            .convertAustralianAddress(serviceProvider.getParticipant().getAddresses()));
      }
      if (null != serviceProvider.getParticipant().getElectronicCommunicationDetails()) {
        associatedEntity.getTelecom().addAll(Converter.convertElectronicCommunicationDetail(
            serviceProvider.getParticipant().getElectronicCommunicationDetails()));
      }
      serviceProvider.getParticipant().getHealthCareProvider().getPersonNames().stream()
          .filter(Objects::nonNull).forEach(
          personName -> associatedPerson.getName().add(Converter.getPersonName(personName)));
      associatedPerson.setAsEmployment(
          DiagnosticInvestigationComponent.getEmploymentDetails(serviceProvider.getParticipant()));
      associatedEntity.setAssociatedPerson(associatedPerson);
      otherParticipant.setAssociatedEntity(associatedEntity);
      otherParticipants.add(otherParticipant);
    });
    return otherParticipants;
  }

  private POCDMT000040EncompassingEncounter getEncompassingEncounter() {
    //POCDMT000040Component1 componentOf = objectFactory.createPOCDMT000040Component1();
    POCDMT000040EncompassingEncounter encompassingEncounter =
        objectFactory.createPOCDMT000040EncompassingEncounter();
    POCDMT000040EncounterParticipant encounterParticipant = objectFactory
        .createPOCDMT000040EncounterParticipant();
    encounterParticipant.setTypeCode(XEncounterParticipant.DIS);
    Encounter encounter = clinicalModel.getContent().getEvent().getEncounter();

    if (null != encounter.getResponsibleHealthProfessionalAtDischarge().getParticipationPeriod()) {
      encounterParticipant.setTime(Converter.convert(
          encounter.getResponsibleHealthProfessionalAtDischarge().getParticipationPeriod()));
    }
    POCDMT000040AssignedEntity assignedEntity = createAssignedEntityForEncounter(encounter);
    encounterParticipant.setAssignedEntity(assignedEntity);
    encompassingEncounter.getEncounterParticipant().add(encounterParticipant);
    encompassingEncounter.setEffectiveTime(Converter.convert(encounter.getEncounterPeriod()));
    encompassingEncounter
        .setDischargeDispositionCode(Converter.convertToCECode(encounter.getSeparationMode()));
    return encompassingEncounter;
  }

  private POCDMT000040Person getAssignedPersonForEncounter(
      ServiceProvider responsibleHealthProfessional) {
    POCDMT000040Person assignedPerson = objectFactory.createPOCDMT000040Person();
    responsibleHealthProfessional.getEntityIdentifiers().stream().filter(Objects::nonNull).forEach(
        asEntityIdentifier -> assignedPerson.getAsEntityIdentifier()
            .add(Converter.convert(asEntityIdentifier)));
    responsibleHealthProfessional.getHealthCareProvider().getPersonNames().stream()
        .filter(Objects::nonNull).forEach(
        personName -> assignedPerson.getName().add(Converter.getPersonName(personName)));
    if (null != responsibleHealthProfessional.getHealthCareProvider().getQualifications()) {
      assignedPerson.setAsQualifications(
          DiagnosticInvestigationComponent.getQualifications(responsibleHealthProfessional));
    }
    if (null != responsibleHealthProfessional.getHealthCareProvider().getEmploymentOrganisation()) {
      assignedPerson.setAsEmployment(
          DiagnosticInvestigationComponent.getEmploymentDetails(responsibleHealthProfessional));
    }
    return assignedPerson;
  }

  private POCDMT000040AssignedEntity createAssignedEntityForEncounter(Encounter encounter) {
    POCDMT000040AssignedEntity assignedEntity = objectFactory.createPOCDMT000040AssignedEntity();
    assignedEntity.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    assignedEntity.setCode(Converter.convertToCECode(
        encounter.getResponsibleHealthProfessionalAtDischarge().getRole()));
    ServiceProvider responsibleHealthProfessional = encounter
        .getResponsibleHealthProfessionalAtDischarge().getParticipant();
    if (null != responsibleHealthProfessional.getAddresses()
        && !responsibleHealthProfessional.getAddresses().isEmpty()) {
      assignedEntity.getAddr().addAll(AddressConverter.convertAustralianAddress(
          responsibleHealthProfessional.getAddresses()));
    }
    if (null != responsibleHealthProfessional.getElectronicCommunicationDetails()
        && !responsibleHealthProfessional
        .getElectronicCommunicationDetails().isEmpty()) {
      assignedEntity.getTelecom().addAll(Converter.convertElectronicCommunicationDetail(
          responsibleHealthProfessional.getElectronicCommunicationDetails()));
    }
    assignedEntity.setAssignedPerson(getAssignedPersonForEncounter(responsibleHealthProfessional));
    return assignedEntity;
  }

  private POCDMT000040Component2 getCDABody() {
    POCDMT000040Component2 component = objectFactory.createPOCDMT000040Component2();
    POCDMT000040StructuredBody structuredBody = objectFactory.createPOCDMT000040StructuredBody();
    structuredBody.getComponent().add(getHealthProfile());
    structuredBody.getComponent().add(getEvent());
    structuredBody.getComponent().add(getMedications());
    structuredBody.getComponent().add(getPlan());
    POCDMT000040Component3 adminObservationComponent = new AdministrativeObservationsComponent()
        .getComponent(clinicalModel.getContext().getSubjectOfCare(),
            clinicalModel.getContext().getDocumentAuthor());
    if (!isFormat2) {
      addEncounterSpecialtyEntries(adminObservationComponent);
    }
    structuredBody.getComponent().add(adminObservationComponent);
    component.setStructuredBody(structuredBody);
    return component;
  }

  private void addEncounterSpecialtyEntries(POCDMT000040Component3 adminObservationComponent) {
    if (null != clinicalModel.getContent().getEvent().getEncounter().getSpecialtyList()) {
      POCDMT000040Entry specialtyEntry = objectFactory.createPOCDMT000040Entry();
      specialtyEntry.setTypeCode(XActRelationshipEntry.DRIV);
      POCDMT000040Observation specialtyObs = objectFactory.createPOCDMT000040Observation();
      specialtyObs.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
      specialtyObs.setClassCode(ActClassObservation.OBS);
      specialtyObs.setMoodCode(XActMoodDocumentObservation.EVN);
      clinicalModel.getContent().getEvent().getEncounter().getSpecialtyList().stream()
          .filter(Objects::nonNull).forEach(specialty -> {
        specialtyObs.setCode(dischargeSummaryCodeMap.get(ClinicalDocumentCodes.SPECIALTY));
        specialtyObs.getValue().add(Converter.convertToCDCode(specialty));
      });
      specialtyEntry.setObservation(specialtyObs);
      adminObservationComponent.getSection().getEntry().add(specialtyEntry);
    } else {
      throw new RuntimeException(
          "Missing: Discharge Summary > Content > Event > Encounter > Specialty");
    }
  }

  private POCDMT000040Component3 getPlan() {
    if (null == clinicalModel.getContent().getPlan().getArrangedServices()) {
      return null;
    }
    Plan planObj = clinicalModel.getContent().getPlan();
    ArrangedServices arrangedServices = planObj.getArrangedServices();
    POCDMT000040Component3 planComponent = objectFactory.createPOCDMT000040Component3();
    POCDMT000040Section planSection = objectFactory.createPOCDMT000040Section();
    String idAttribute = CDATypeUtil.getUUID();
    planSection.setId(CDATypeUtil.getII(idAttribute));
    planSection.setCode((CE) dischargeSummaryCodeMap.get(ClinicalDocumentCodes.PLAN));
    planSection.setTitle(CDATypeUtil
        .getST(dischargeSummaryCodeMap.get(ClinicalDocumentCodes.PLAN).getDisplayName()));
    planSection.setText(NarrativeUtil.getPlan(planObj));
      //Arranged Services
      planSection.getComponent().add(getArrangedServicesForPlan(arrangedServices));
      if (null != planObj.getRecordOfRecommendationsAndInfoProvided()) {
        planSection.getComponent().add(getRecordOfRecommendationsAndInfoProvided(
            planObj.getRecordOfRecommendationsAndInfoProvided()));
      } else {
        throw new RuntimeException(
            "Missing: Discharge Summary > Content > Plan > Record of Recommendations & Info Provided");
      }

    planComponent.setSection(planSection);
    return planComponent;
  }

  private POCDMT000040Component5 getRecordOfRecommendationsAndInfoProvided(
      RecordOfRecommendationsAndInfoProvided recordOfRecommendationsAndInfoProvided) {
    POCDMT000040Component5 recordOfRecommComp = objectFactory.createPOCDMT000040Component5();
    POCDMT000040Section recordOfRecommSection = objectFactory.createPOCDMT000040Section();
    recordOfRecommSection.setCode(
        (CE) dischargeSummaryCodeMap.get(ClinicalDocumentCodes.RECORD_OF_RECOMM_AND_INFO_PROVIDED));
    recordOfRecommSection
        .setTitle(CDATypeUtil.getST(RECORD_OF_RECOMM_AND_INFO_PROVIDED.getDisplayName()));
    recordOfRecommSection.setText(
        NarrativeUtil.getRecordOfRecommendNInfoForPlan(recordOfRecommendationsAndInfoProvided));
    if (!isFormat2) {
      recordOfRecommendationsAndInfoProvided.getRecommendationsProvidedList().stream()
          .filter(Objects::nonNull).forEach(
          recommendationsProvided -> recordOfRecommSection.getEntry()
              .add(getRecommendationProvidedEntry(recommendationsProvided)));
      if (null != recordOfRecommendationsAndInfoProvided.getInformationProvided()) {
        recordOfRecommSection.getEntry().add(getInfoProvidedForRecommendationsNInfo(
            recordOfRecommendationsAndInfoProvided));
      }
    }
    recordOfRecommComp.setSection(recordOfRecommSection);
    return recordOfRecommComp;
  }

  private POCDMT000040Entry getRecommendationProvidedEntry(
      RecommendationsProvided recommendationsProvided) {
    POCDMT000040Entry recommProvidedEntry = objectFactory.createPOCDMT000040Entry();
    POCDMT000040Act recommProvidedAct = objectFactory.createPOCDMT000040Act();
    recommProvidedAct.setClassCode(XActClassDocumentEntryAct.INFRM);
    recommProvidedAct.setMoodCode(XDocumentActMood.PRP);
    recommProvidedAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    recommProvidedAct
        .setCode(dischargeSummaryCodeMap.get(ClinicalDocumentCodes.RECOMMENDATIONS_PROVIDED));
    recommProvidedAct.setText(CDATypeUtil.getST(recommendationsProvided.getRecommendationNote()));
    recommProvidedAct.getPerformer().add(DiagnosticInvestigationComponent
        .getServiceProviderPerformer(recommendationsProvided.getRecommendationRecipient(), false));
    recommProvidedEntry.setAct(recommProvidedAct);
    return recommProvidedEntry;
  }

  private POCDMT000040Entry getInfoProvidedForRecommendationsNInfo(
      RecordOfRecommendationsAndInfoProvided recordOfRecommendationsAndInfoProvided) {
    POCDMT000040Entry infoProvidedEntry = objectFactory.createPOCDMT000040Entry();
    POCDMT000040Act infoProvidedAct = objectFactory.createPOCDMT000040Act();
    infoProvidedAct.setClassCode(XActClassDocumentEntryAct.INFRM);
    infoProvidedAct.setMoodCode(XDocumentActMood.EVN);
    infoProvidedAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    infoProvidedAct
        .setCode(dischargeSummaryCodeMap.get(ClinicalDocumentCodes.INFORMATION_PROVIDED));
    infoProvidedAct.setText(CDATypeUtil.getST(
        recordOfRecommendationsAndInfoProvided.getInformationProvided()
            .getInfoProvidedToSubOfCareOrRelParties()));
    infoProvidedEntry.setAct(infoProvidedAct);
    return infoProvidedEntry;
  }

  private POCDMT000040Component5 getArrangedServicesForPlan(ArrangedServices arrangedServices) {
    POCDMT000040Component5 arrangedServicesComp = objectFactory.createPOCDMT000040Component5();
    POCDMT000040Section arrangedServicesSection = objectFactory.createPOCDMT000040Section();
    String idAttribute = CDATypeUtil.getUUID();
    arrangedServicesSection.setId(CDATypeUtil.getII(idAttribute));
    arrangedServicesSection.setCode(
        (CE) dischargeSummaryCodeMap.get(ClinicalDocumentCodes.ARRANGED_SERVICES));
    arrangedServicesSection.setTitle(CDATypeUtil.getST(ARRANGED_SERVICES.getDisplayName()));
    arrangedServicesSection.setText(NarrativeUtil.getArrangedServices(arrangedServices));
    if (!isFormat2) {
      arrangedServices.getArrangedServiceList().stream().filter(Objects::nonNull)
          .forEach(arrangedService -> arrangedServicesSection.getEntry()
              .add(getArrangedServiceEntry(arrangedService)));
    }
    arrangedServicesComp.setSection(arrangedServicesSection);
    return arrangedServicesComp;
  }

  private POCDMT000040Entry getArrangedServiceEntry(ArrangedService arrangedService) {
    POCDMT000040Entry arrangedServiceEntry = objectFactory.createPOCDMT000040Entry();
    POCDMT000040Act arrangedServiceAct = objectFactory.createPOCDMT000040Act();
    arrangedServiceAct.setClassCode(XActClassDocumentEntryAct.ACT);
    arrangedServiceAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    arrangedServiceAct
        .setCode(Converter.convertToCECode(arrangedService.getArrangedServiceDesc()));
    arrangedServiceAct
        .setEffectiveTime(Converter.convert(arrangedService.getServiceCommencementWindow()));
    arrangedServiceAct.setMoodCode(arrangedService.getServiceBookingStatusMoodCode());
    if (null != arrangedService.getProtocol()) {
      arrangedServiceAct.getPerformer().add(
          DiagnosticInvestigationComponent.getServiceProviderPerformer(arrangedService.getProtocol()
              .getServiceProvider(), true));
    }
    arrangedServiceEntry.setAct(arrangedServiceAct);
    return arrangedServiceEntry;
  }

  private POCDMT000040Component3 getHealthProfile() {
    POCDMT000040Component3 healthProfileComponent = objectFactory.createPOCDMT000040Component3();
    POCDMT000040Section healthProfileSection = objectFactory.createPOCDMT000040Section();
    healthProfileSection.setCode(
        (CE) dischargeSummaryCodeMap.get(ClinicalDocumentCodes.HEALTH_PROFILE));
    healthProfileSection.setTitle(CDATypeUtil
        .getST(dischargeSummaryCodeMap.get(ClinicalDocumentCodes.HEALTH_PROFILE).getDisplayName()));
    healthProfileComponent.setSection(healthProfileSection);

    //Nominated Primary Healthcare Provider
    if (null == clinicalModel.getContent().getHealthProfile()) {
      throw new RuntimeException("Mandatory section missing : Health Profile");
    }
    HealthProfile healthProfileObj = clinicalModel.getContent().getHealthProfile();
    healthProfileSection.setText(NarrativeUtil.getHealthProfile(healthProfileObj));

    //Note : //Nominated Primary Healthcare Provider (Participant/Person) as per CDA document P279
    //The implementation can be found at line 342 and resides on clinical document level
    //Adverse Reactions
    if (!isFormat2) {
      if (null == clinicalModel.getContent().getHealthProfile().getAdverseReactions()) {
        throw new RuntimeException("Mandatory section missing : Adverse Reactions");
      }
    }
    POCDMT000040Component5 adverseReactionsComp = objectFactory.createPOCDMT000040Component5();
    POCDMT000040Section adverseReactionSection = objectFactory.createPOCDMT000040Section();
    adverseReactionSection.setCode(
        (CE) dischargeSummaryCodeMap.get(ClinicalDocumentCodes.ADVERSE_REACTIONS));
    adverseReactionSection.setTitle(CDATypeUtil.getST(
        dischargeSummaryCodeMap.get(ClinicalDocumentCodes.ADVERSE_REACTIONS).getDisplayName()));
    adverseReactionsComp.setSection(adverseReactionSection);
    healthProfileSection.getComponent().add(adverseReactionsComp);
    AdverseReactions adverseReactionObj = clinicalModel.getContent()
        .getHealthProfile().getAdverseReactions();
    adverseReactionSection
        .setText(NarrativeUtil.getAdverseReactions(healthProfileObj.getAdverseReactions()));

    //Adverse Reactions Entries
    if (!isFormat2) {
      if (null != adverseReactionObj.getAdverseReactionList()
          && !adverseReactionObj.getAdverseReactionList().isEmpty()) {
        adverseReactionObj.getAdverseReactionList().stream().filter(Objects::nonNull)
            .forEach(adverseReaction -> adverseReactionSection.getEntry()
                .add(getAdverseReactionEntry(adverseReaction)));
      }
    }

    //Alerts
    POCDMT000040Component5 alertsComponent = objectFactory.createPOCDMT000040Component5();
    POCDMT000040Section alertsSection = objectFactory.createPOCDMT000040Section();
    alertsSection.setCode((CE) dischargeSummaryCodeMap.get(ClinicalDocumentCodes.ALERTS));
    alertsSection.setTitle(CDATypeUtil.getST(ALERTS.getDisplayName()));
    alertsComponent.setSection(alertsSection);
    healthProfileSection.getComponent().add(alertsComponent);

    Alerts alertsObj = clinicalModel.getContent().getHealthProfile().getAlerts();
    alertsSection.setText(NarrativeUtil.getAlerts(healthProfileObj.getAlerts()));

    //Alert Entries
    if (!isFormat2) {
      if (null != alertsObj.getAlertList() && !alertsObj.getAlertList().isEmpty()) {
        alertsObj.getAlertList().stream().filter(Objects::nonNull)
            .forEach(alert -> alertsSection.getEntry()
                .add(getAlertEntry(alert)));
      } else {
        throw new RuntimeException("Mandatory section missing : Alerts");
      }
    }

    return healthProfileComponent;
  }

  private POCDMT000040Entry getAlertEntry(Alert alert) {
    POCDMT000040Entry alertEntry = objectFactory.createPOCDMT000040Entry();
    POCDMT000040Observation alertObservation = objectFactory.createPOCDMT000040Observation();
    alertObservation.setClassCode(ActClassObservation.OBS);
    alertObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    alertObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    alertObservation.setCode((Converter.convertToCECode(alert.getAlertType())));
    alertObservation.getValue().add(Converter.convertToCDCode(alert.getAlertDesc()));
    alertEntry.setObservation(alertObservation);
    return alertEntry;
  }

  private POCDMT000040Entry getAdverseReactionEntry(AdverseReaction adverseReaction) {
    POCDMT000040Entry adverseReactionEntry = objectFactory.createPOCDMT000040Entry();
    POCDMT000040Observation adverseReactionObservation = objectFactory
        .createPOCDMT000040Observation();
    adverseReactionObservation.setClassCode(ActClassObservation.OBS);
    adverseReactionObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    adverseReactionObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    adverseReactionObservation
        .setCode(dischargeSummaryCodeMap.get(ClinicalDocumentCodes.ADVERSE_REACTION));
    adverseReactionEntry.setObservation(adverseReactionObservation);

    //Adverse Reaction Description & Role
    if (null == adverseReaction.getAgentDesc()) {
      throw new RuntimeException(
          "Mandatory attribute missing : Adverse Reaction > Agent Description (Participant)");
    }
    POCDMT000040Participant2 adverseReactionParticipant = objectFactory
        .createPOCDMT000040Participant2();
    adverseReactionParticipant.setTypeCode(ParticipationType.CAGNT);

    //Participant Role
    POCDMT000040ParticipantRole participantRole = objectFactory.createPOCDMT000040ParticipantRole();
    POCDMT000040PlayingEntity playingEntity = objectFactory.createPOCDMT000040PlayingEntity();
    playingEntity.setCode(Converter.convertToCECode(adverseReaction.getAgentDesc()));
    participantRole.setPlayingEntity(playingEntity);
    adverseReactionParticipant.setParticipantRole(participantRole);
    adverseReactionObservation.getParticipant().add(adverseReactionParticipant);

    //Adverse Reaction Type
    if (null != adverseReaction.getAdverseReactionType()) {
      adverseReactionObservation.getValue()
          .add(Converter.convertToCDCode(adverseReaction.getAdverseReactionType()));
    } else {
      throw new RuntimeException(
          "Mandatory attribute missing : Adverse Reaction > Reaction Type)");
    }

    //Adverse Reaction Detail
    if (null != adverseReaction.getReactionDetail()) {
      adverseReaction.getReactionDetail().stream().filter(Objects::nonNull)
          .forEach(reactionDetail -> adverseReactionObservation.getEntryRelationship().add(
              getReactionDetailEntryRelationship(reactionDetail)));
    }

    return adverseReactionEntry;
  }

  private POCDMT000040EntryRelationship getReactionDetailEntryRelationship(
      ReactionDetail reactionDetail) {
    POCDMT000040EntryRelationship reactionDetailEntryRelationship = objectFactory
        .createPOCDMT000040EntryRelationship();
    reactionDetailEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.MFST);
    reactionDetailEntryRelationship.setInversionInd(true);
    POCDMT000040Observation manifestObservation = objectFactory.createPOCDMT000040Observation();
    manifestObservation.setClassCode(ActClassObservation.OBS);
    manifestObservation.setMoodCode(XActMoodDocumentObservation.EVN);
    manifestObservation.setCode(Converter.convertToCDCode(reactionDetail.getReactionDesc()));
    reactionDetailEntryRelationship.setObservation(manifestObservation);
    return reactionDetailEntryRelationship;
  }

  private POCDMT000040Component3 getMedications() {
    POCDMT000040Component3 medicationsComponent = objectFactory.createPOCDMT000040Component3();
    POCDMT000040Section medicationsSection = objectFactory.createPOCDMT000040Section();
    medicationsSection.setCode((CE) dischargeSummaryCodeMap.get(ClinicalDocumentCodes.MEDICATIONS));
    medicationsSection.setTitle(CDATypeUtil
        .getST(dischargeSummaryCodeMap.get(ClinicalDocumentCodes.MEDICATIONS).getDisplayName()));
    medicationsComponent.setSection(medicationsSection);

    //Medications
    if (null == clinicalModel.getContent().getMedications()) {
      throw new RuntimeException("Mandatory section missing : Medications");
    }
    Medications medicationsObj = clinicalModel.getContent().getMedications();
    medicationsSection.setText(NarrativeUtilCommon.DIAGNOSTIC_INVESTIGATIONS_SECTION_TEXT);

      //Current Medications on Discharge
      if (null != medicationsObj.getCurrentMedicationsOnDischarge().getExclusionStatement()
          && null != medicationsObj.getCurrentMedicationsOnDischarge().getTherapeuticGoods()) {
        throw new RuntimeException(
            "Invalid current-medications data : person can only have either exclusion statement or therapeutic goods");
      }

      POCDMT000040Component5 currentMedicationsOnDischargeComponent = objectFactory
          .createPOCDMT000040Component5();
      POCDMT000040Section currentMedicationsOnDischargeSection = objectFactory
          .createPOCDMT000040Section();
      currentMedicationsOnDischargeSection.setCode(
          (CE) dischargeSummaryCodeMap.get(ClinicalDocumentCodes.CURRENT_MEDICATIONS_ON_DISCHARGE));
      currentMedicationsOnDischargeSection
          .setTitle(CDATypeUtil.getST(
              dischargeSummaryCodeMap.get(ClinicalDocumentCodes.CURRENT_MEDICATIONS_ON_DISCHARGE)
                  .getDisplayName()));
      currentMedicationsOnDischargeComponent.setSection(currentMedicationsOnDischargeSection);
      if (null == medicationsObj.getCurrentMedicationsOnDischarge()) {
        throw new RuntimeException(
            "Mandatory section missing : Medications > Current Medications on Discharge");
      }
      CurrentMedicationsOnDischarge currentMedicationsOnDischargeObj = medicationsObj
          .getCurrentMedicationsOnDischarge();
    currentMedicationsOnDischargeSection
        .setText(NarrativeUtil.getCurrentMedicationsOnDischarge(currentMedicationsOnDischargeObj));

      //Current Medications on Discharge -> Exclusion Statement / Global Statement (
      if (null != currentMedicationsOnDischargeObj.getExclusionStatement()) {
        if (null != currentMedicationsOnDischargeObj.getExclusionStatement().getGlobalStatement()) {
          Coded globalStatement = currentMedicationsOnDischargeObj.getExclusionStatement()
              .getGlobalStatement();
          currentMedicationsOnDischargeSection.getEntry()
              .add(exclusionStatementComponent
                  .createExclusionStatement(CURRENT_MEDICATIONS_ON_DISCHARGE_GLOBAL_STATEMENT,
                      globalStatement, ActClassObservation.OBS, XActMoodDocumentObservation.EVN));
        } else {
          throw new RuntimeException(
              "Mandatory Attribute Missing : Medications > Current Medications on Discharge > Exclusion Statement > Global Statement");
        }
      }

      //Current Medications on Discharge -> Therapeutic Good
      if (null != currentMedicationsOnDischargeObj.getTherapeuticGoods()
          && !currentMedicationsOnDischargeObj.getTherapeuticGoods().isEmpty()) {
        currentMedicationsOnDischargeObj.getTherapeuticGoods().stream().filter(Objects::nonNull)
            .forEach(therapeuticGood -> currentMedicationsOnDischargeSection.getEntry()
                .add(getCurrentMedicationsTherapeuticGoodEntry(therapeuticGood)));
      }
      medicationsSection.getComponent().add(currentMedicationsOnDischargeComponent);
      //Ceased Medication
      if (null != medicationsObj.getCeasedMedications().getExclusionStatement()
          && null != medicationsObj.getCeasedMedications().getTherapeuticGoods()) {
        throw new RuntimeException(
            "Invalid ceased-medications data : person can only have either exclusion statement or therapeutic goods");
      }
      POCDMT000040Component5 ceasedMedicationComponent = objectFactory
          .createPOCDMT000040Component5();
      POCDMT000040Section ceasedMedicationSection = objectFactory.createPOCDMT000040Section();
      ceasedMedicationSection.setCode(
          (CE) dischargeSummaryCodeMap.get(ClinicalDocumentCodes.CEASED_MEDICATIONS));
      ceasedMedicationSection.setTitle(CDATypeUtil.getST(
          dischargeSummaryCodeMap.get(ClinicalDocumentCodes.CEASED_MEDICATIONS).getDisplayName()));
      ceasedMedicationComponent.setSection(ceasedMedicationSection);
      if (null == medicationsObj.getCeasedMedications()) {
        throw new RuntimeException(
            "Mandatory section missing : Medications > Ceased Medications");
      }
      CeasedMedications ceasedMedicationsObj = medicationsObj.getCeasedMedications();
    ceasedMedicationSection.setText(NarrativeUtil.getCeasedMedications(ceasedMedicationsObj));

      //Ceased Medications -> Exclusion Statement / Global Statement
      if (null != ceasedMedicationsObj.getExclusionStatement()) {
        if (null != ceasedMedicationsObj.getExclusionStatement().getGlobalStatement()) {
          Coded globalStatement = ceasedMedicationsObj.getExclusionStatement().getGlobalStatement();
          ceasedMedicationSection.getEntry()
              .add(exclusionStatementComponent
                  .createExclusionStatement(CEASED_MEDICATIONS_GLOBAL_STATEMENT, globalStatement,
                      ActClassObservation.OBS, XActMoodDocumentObservation.EVN));
        } else {
          throw new RuntimeException(
              "Mandatory Attribute Missing : Medications > Ceased Medications > Exclusion Statement > Global Statement");
        }
      }
      // medicationsSection.getComponent().add(ceasedMedicationComponent);

      //Ceased Medications -> Therapeutic Good
      if (null != ceasedMedicationsObj.getTherapeuticGoods()
          && !ceasedMedicationsObj.getTherapeuticGoods().isEmpty()) {
        ceasedMedicationsObj.getTherapeuticGoods().stream().filter(Objects::nonNull)
            .forEach(therapeuticGood -> ceasedMedicationSection.getEntry()
                .add(getCeasedMedicationsTherapeuticGoodEntry(therapeuticGood)));

      }
    medicationsSection.getComponent().add(ceasedMedicationComponent);

    return medicationsComponent;
  }

  private POCDMT000040Entry getCeasedMedicationsTherapeuticGoodEntry(
      TherapeuticGood therapeuticGood) {
    POCDMT000040Entry therapeuticGoodEntry = objectFactory.createPOCDMT000040Entry();
    POCDMT000040SubstanceAdministration substanceAdministrationComp = objectFactory
        .createPOCDMT000040SubstanceAdministration();
    substanceAdministrationComp.setMoodCode(XDocumentSubstanceMood.EVN);
    substanceAdministrationComp.setClassCode(ActClass.SBADM);
    substanceAdministrationComp.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    substanceAdministrationComp.setStatusCode(CDATypeUtil.getCS("cancelled"));
    therapeuticGoodEntry.setSubstanceAdministration(substanceAdministrationComp);

    //Therapeutic Good Identification
    POCDMT000040Consumable consumableComp = objectFactory.createPOCDMT000040Consumable();
    POCDMT000040ManufacturedProduct manufacturedProductComp = objectFactory
        .createPOCDMT000040ManufacturedProduct();
    POCDMT000040Material manufacturedMaterialComp = objectFactory.createPOCDMT000040Material();
    manufacturedMaterialComp
        .setCode(Converter.convertToCECode(therapeuticGood.getTherapeuticGoodIdentification()));
    manufacturedProductComp.setManufacturedMaterial(manufacturedMaterialComp);
    consumableComp.setManufacturedProduct(manufacturedProductComp);
    substanceAdministrationComp.setConsumable(consumableComp);

    //Medication History
    if (null == therapeuticGood.getMedicationHistory()) {
      throw new RuntimeException(
          "Mandatory attribute missing : Ceased Medications > Therapeutic Good > "
              + "Medication History");
    }
    MedicationHistory medicationHistoryObj = therapeuticGood.getMedicationHistory();
    if (null == medicationHistoryObj.getItemStatus()) {
      throw new RuntimeException(
          "Mandatory attribute missing : Ceased Medications > Therapeutic Good > "
              + "Medication History");
    }
    //Item Status Entry Relationship
    POCDMT000040EntryRelationship itemStatusEntryRelationshipComp =
        getSubstanceAdministrationItemStatusEntryRelationship(medicationHistoryObj);
    substanceAdministrationComp.getEntryRelationship().add(itemStatusEntryRelationshipComp);

    //Change Detail
    if (null == medicationHistoryObj.getChangeDetail()) {
      throw new RuntimeException(
          "Mandatory attribute missing : Ceased Medications > Therapeutic Good > "
              + "Medication History > Change Detail");
    }
    ChangeDetail changeDetailObj = medicationHistoryObj.getChangeDetail();

    if (null == changeDetailObj.getChangesMade()) {
      throw new RuntimeException(
          "Mandatory attribute missing :Ceased Medications > Therapeutic Good > "
              + "Medication History > Change Detail > Changes Made");
    }
    //Change Detail Entry Relationship
    POCDMT000040EntryRelationship changeDetailEntryRelationshipComp =
        getSubstanceAdministrationChangeDetailEntryRelationship(changeDetailObj);
    substanceAdministrationComp.getEntryRelationship().add(changeDetailEntryRelationshipComp);

    return therapeuticGoodEntry;
  }


  private POCDMT000040Entry getCurrentMedicationsTherapeuticGoodEntry(
      TherapeuticGood therapeuticGood) {
    POCDMT000040Entry therapeuticGoodEntry = objectFactory.createPOCDMT000040Entry();
    POCDMT000040SubstanceAdministration substanceAdministrationComp = objectFactory
        .createPOCDMT000040SubstanceAdministration();
    substanceAdministrationComp.setMoodCode(XDocumentSubstanceMood.EVN);
    substanceAdministrationComp.setClassCode(ActClass.SBADM);
    substanceAdministrationComp.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    substanceAdministrationComp.setStatusCode(CDATypeUtil.getCS("active"));
    therapeuticGoodEntry.setSubstanceAdministration(substanceAdministrationComp);

    //Therapeutic Good Identification
    POCDMT000040Consumable consumableComp = objectFactory.createPOCDMT000040Consumable();
    POCDMT000040ManufacturedProduct manufacturedProductComp = objectFactory
        .createPOCDMT000040ManufacturedProduct();
    POCDMT000040Material manufacturedMaterialComp = objectFactory.createPOCDMT000040Material();
    manufacturedMaterialComp
        .setCode(Converter.convertToCECode(therapeuticGood.getTherapeuticGoodIdentification()));
    manufacturedProductComp.setManufacturedMaterial(manufacturedMaterialComp);
    consumableComp.setManufacturedProduct(manufacturedProductComp);
    substanceAdministrationComp.setConsumable(consumableComp);
    //Dosage
    if (null == therapeuticGood.getDosage()) {
      throw new RuntimeException(
          "Mandatory attribute missing : Current Medications on Discharge > Therapeutic Good > Dosage");
    }
    Dosage dosageObj = therapeuticGood.getDosage();
    if (null == dosageObj.getDosageInstruction()) {
      throw new RuntimeException(
          "Mandatory attribute missing : Current Medications on Discharge > Therapeutic Good > Dosage > Dosage Instruction");
    }
    substanceAdministrationComp.setText(CDATypeUtil.getST(dosageObj.getDosageInstruction()));

    //Dosage -> Supply
    POCDMT000040EntryRelationship supplyEntryRelationshipComp = objectFactory
        .createPOCDMT000040EntryRelationship();
    supplyEntryRelationshipComp.setTypeCode(XActRelationshipEntryRelationship.REFR);
    POCDMT000040Supply supplyComp = objectFactory.createPOCDMT000040Supply();
    supplyComp.setClassCode(ActClassSupply.SPLY);
    supplyComp.setMoodCode(XDocumentSubstanceMood.EVN);
    supplyComp.setText(CDATypeUtil.getST(therapeuticGood.getUnitOfUseQuantityDispensed()));
    supplyEntryRelationshipComp.setSupply(supplyComp);
    substanceAdministrationComp.getEntryRelationship().add(supplyEntryRelationshipComp);

    //Reason Entry Relationship
    POCDMT000040EntryRelationship reasonEntryRelationshipComp =
        getSubstanceAdministrationReasonEntryRelationship(therapeuticGood);
    substanceAdministrationComp.getEntryRelationship().add(reasonEntryRelationshipComp);

    //Additional Comments
    POCDMT000040EntryRelationship additionalCommentsEntryRelationshipComp =
        getSubstanceAdministrationAdditionalCommentsEntryRelationship(therapeuticGood);
    substanceAdministrationComp.getEntryRelationship().add(additionalCommentsEntryRelationshipComp);

    //Medication History
    if (null == therapeuticGood.getMedicationHistory()) {
      throw new RuntimeException(
          "Mandatory attribute missing : Current Medications on Discharge > Therapeutic Good > "
              + "Medication History");
    }
    MedicationHistory medicationHistoryObj = therapeuticGood.getMedicationHistory();
    if (null == medicationHistoryObj.getItemStatus()) {
      throw new RuntimeException(
          "Mandatory attribute missing : Current Medications on Discharge > Therapeutic Good > "
              + "Medication History");
    }
    POCDMT000040EntryRelationship itemStatusEntryRelationshipComp =
        getSubstanceAdministrationItemStatusEntryRelationship(medicationHistoryObj);
    substanceAdministrationComp.getEntryRelationship().add(itemStatusEntryRelationshipComp);

    //Change Detail
    if (null == medicationHistoryObj.getChangeDetail()) {
      throw new RuntimeException(
          "Mandatory attribute missing : Current Medications on Discharge > Therapeutic Good > "
              + "Medication History > Change Detail");
    }
    ChangeDetail changeDetailObj = medicationHistoryObj.getChangeDetail();

    if (null == changeDetailObj.getChangesMade()) {
      throw new RuntimeException(
          "Mandatory attribute missing : Current Medications on Discharge > Therapeutic Good > "
              + "Medication History > Change Detail > Changes Made");
    }
    //Change Detail Entry Relationship
    POCDMT000040EntryRelationship changeDetailEntryRelationshipComp =
        getSubstanceAdministrationChangeDetailEntryRelationship(changeDetailObj);
    substanceAdministrationComp.getEntryRelationship().add(changeDetailEntryRelationshipComp);

    //Medication Duration / Effective Time
    substanceAdministrationComp.getEffectiveTime().add(Converter.convert(
        medicationHistoryObj.getMedicationDuration()));

    return therapeuticGoodEntry;
  }

  private POCDMT000040EntryRelationship getSubstanceAdministrationChangeDetailEntryRelationship(
      ChangeDetail changeDetailObj) {
    POCDMT000040EntryRelationship entryRelationshipComp = objectFactory
        .createPOCDMT000040EntryRelationship();
    entryRelationshipComp.setTypeCode(XActRelationshipEntryRelationship.SPRT);
    POCDMT000040Observation observationComp = objectFactory.createPOCDMT000040Observation();
    observationComp.setClassCode(ActClassObservation.OBS);
    observationComp.setMoodCode(XActMoodDocumentObservation.EVN);
    observationComp.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    observationComp.setCode(Converter.convertToCECode(changeDetailObj.getChangesMade()));
    //Change Detail -> Reason for Change
    if (null == changeDetailObj.getReasonForChange()) {
      throw new RuntimeException(
          "Mandatory attribute missing : Current Medications on Discharge > Therapeutic Good > "
              + "Medication History > Change Detail > Changes Made > Reason for change");
    }
    POCDMT000040EntryRelationship reasonForChangeEntryRelationshipComp = objectFactory
        .createPOCDMT000040EntryRelationship();
    reasonForChangeEntryRelationshipComp.setTypeCode(XActRelationshipEntryRelationship.RSON);
    POCDMT000040Act reasonForChangeAct = new POCDMT000040Act();
    reasonForChangeAct.setClassCode(XActClassDocumentEntryAct.INFRM);
    reasonForChangeAct.setMoodCode(XDocumentActMood.EVN);
    reasonForChangeAct.setCode(
        dischargeSummaryCodeMap.get(ClinicalDocumentCodes.CHANGE_DETAIL_REASON_FOR_CHANGE));
    reasonForChangeAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    reasonForChangeAct.setText(CDATypeUtil.getST(changeDetailObj.getReasonForChange()));
    reasonForChangeEntryRelationshipComp.setAct(reasonForChangeAct);
    observationComp.getEntryRelationship().add(reasonForChangeEntryRelationshipComp);
    entryRelationshipComp.setObservation(observationComp);
    return entryRelationshipComp;
  }


  private POCDMT000040EntryRelationship getSubstanceAdministrationReasonEntryRelationship(
      TherapeuticGood therapeuticGoodObj) {
    POCDMT000040EntryRelationship entryRelationshipComp = objectFactory
        .createPOCDMT000040EntryRelationship();
    entryRelationshipComp.setTypeCode(XActRelationshipEntryRelationship.RSON);
    POCDMT000040Act reasonAct = objectFactory.createPOCDMT000040Act();
    reasonAct.setClassCode(XActClassDocumentEntryAct.INFRM);
    reasonAct.setMoodCode(XDocumentActMood.RQO);
    reasonAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    reasonAct
        .setCode(dischargeSummaryCodeMap.get(ClinicalDocumentCodes.REASON_FOR_THERAPEUTIC_GOOD));
    reasonAct.setText(CDATypeUtil.getST(therapeuticGoodObj.getReasonForTherapeuticGood()));
    entryRelationshipComp.setAct(reasonAct);
    return entryRelationshipComp;
  }

  private POCDMT000040EntryRelationship getSubstanceAdministrationAdditionalCommentsEntryRelationship(
      TherapeuticGood therapeuticGoodObj) {
    POCDMT000040EntryRelationship entryRelationshipComp = objectFactory
        .createPOCDMT000040EntryRelationship();
    entryRelationshipComp.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Act cmtsAct = objectFactory.createPOCDMT000040Act();
    cmtsAct.setClassCode(XActClassDocumentEntryAct.INFRM);
    cmtsAct.setMoodCode(XDocumentActMood.EVN);
    cmtsAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    cmtsAct.setCode(dischargeSummaryCodeMap.get(ClinicalDocumentCodes.ADDITIONAL_COMMENTS));
    cmtsAct.setText(CDATypeUtil.getST(therapeuticGoodObj.getAdditionalComments()));
    entryRelationshipComp.setAct(cmtsAct);
    return entryRelationshipComp;
  }

  private POCDMT000040EntryRelationship getSubstanceAdministrationItemStatusEntryRelationship(
      MedicationHistory medicationHistoryObj) {
    POCDMT000040EntryRelationship entryRelationshipComp = objectFactory
        .createPOCDMT000040EntryRelationship();
    entryRelationshipComp.setTypeCode(XActRelationshipEntryRelationship.SUBJ);
    entryRelationshipComp.setInversionInd(true);
    POCDMT000040Observation observationComp = objectFactory.createPOCDMT000040Observation();
    observationComp.setClassCode(ActClassObservation.OBS);
    observationComp.setMoodCode(XActMoodDocumentObservation.EVN);
    observationComp.setCode(Converter.convertToCECode(medicationHistoryObj.getItemStatus()));
    observationComp.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    entryRelationshipComp.setObservation(observationComp);
    return entryRelationshipComp;
  }

  private POCDMT000040Component3 getEvent() {
    POCDMT000040Component3 eventComponent = objectFactory.createPOCDMT000040Component3();
    POCDMT000040Section eventSection = objectFactory.createPOCDMT000040Section();
    eventSection.setCode((CE) dischargeSummaryCodeMap.get(ClinicalDocumentCodes.EVENT));
    eventSection.setTitle(CDATypeUtil
        .getST(dischargeSummaryCodeMap.get(ClinicalDocumentCodes.EVENT).getDisplayName()));
    eventComponent.setSection(eventSection);
    if (null == clinicalModel.getContent().getEvent()) {
      throw new RuntimeException("Mandatory section missing : Discharge Summary > Event");
    }
    Event eventObj = clinicalModel.getContent().getEvent();
    eventSection.setText(NarrativeUtil.getEvent(eventObj));

    //Clinical Synopsis / Summary
    if (null != eventObj.getClinicalSynopsis()) {
      eventSection.getComponent().add(getClinicalSynopsisForEvent(eventObj));
    } else {
      throw new RuntimeException(
          "Mandatory section missing : Discharge Summary > Event > Clinical Synopsis");
    }

    //Problem Diagnosis This Visit
    if (!isFormat2) {
      if (null == eventObj.getProblemDiagnosesThisVisit()) {
        throw new RuntimeException(
            "Mandatory section missing : Discharge Summary > Event > Problems Diagnoses This Visit");
      }
    }
    ProblemDiagnosesThisVisit problemDiagnosesThisVisit = eventObj.getProblemDiagnosesThisVisit();
    eventSection.getComponent().add(getProblemDiagnosesForEvent(problemDiagnosesThisVisit));
    if (doesClinicalInterventionsExistForEvent(eventObj)) {
      eventSection.getComponent().add(getClinicalInterventionsPerformedForEvent(
          eventObj.getClinicalInterventionsPerformedThisVisit()));
    }

    //TODO MS : Check if procedures missing from all docs ?

    //Diagnostic Investigations
    if (null != eventObj.getDiagnosticInvestigations()) {
      DiagnosticInvestigationComponent diagnosticInvestigationComponent = new DiagnosticInvestigationComponent(
          dischargeSummaryCodeMap);
      POCDMT000040Component5 diagnosticInvestigationComp = objectFactory
          .createPOCDMT000040Component5();
      diagnosticInvestigationComp.setSection(diagnosticInvestigationComponent
          .getDiagnosticInvestigationSection(eventObj.getDiagnosticInvestigations()));
      eventSection.getComponent().add(diagnosticInvestigationComp);
    }

    return eventComponent;
  }

  private boolean doesClinicalInterventionsExistForEvent(Event eventObj) {
    return null != eventObj.getClinicalInterventionsPerformedThisVisit() && ((
        null != eventObj.getClinicalInterventionsPerformedThisVisit().getClinicalInterventions()
            && !eventObj.getClinicalInterventionsPerformedThisVisit().getClinicalInterventions()
            .isEmpty()));
  }

  private POCDMT000040Component5 getClinicalSynopsisForEvent(Event eventObj) {
    POCDMT000040Component5 clinicalSynopsisComponent = objectFactory
        .createPOCDMT000040Component5();
    POCDMT000040Section clinicalSynopsisSection = objectFactory.createPOCDMT000040Section();
    clinicalSynopsisSection.setCode(
        (CE) dischargeSummaryCodeMap.get(ClinicalDocumentCodes.CLINICAL_SYNOPSIS));
    clinicalSynopsisSection.setTitle(CDATypeUtil.getST(
        dischargeSummaryCodeMap.get(ClinicalDocumentCodes.CLINICAL_SYNOPSIS).getDisplayName()));
    clinicalSynopsisSection
        .setText(NarrativeUtil.getClinicalSynopsisForEvent(eventObj.getClinicalSynopsis()));
    if (!isFormat2) {
      POCDMT000040Entry clinicalSyopsisEntry = objectFactory.createPOCDMT000040Entry();
      clinicalSyopsisEntry.setTypeCode(XActRelationshipEntry.DRIV);
      POCDMT000040Act clinicalSynopsisAct = objectFactory.createPOCDMT000040Act();
      clinicalSynopsisAct.setClassCode(XActClassDocumentEntryAct.ACT);
      clinicalSynopsisAct.setMoodCode(XDocumentActMood.EVN);
      clinicalSynopsisAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
      clinicalSynopsisAct
          .setCode(dischargeSummaryCodeMap.get(ClinicalDocumentCodes.CLINICAL_SYNOPSIS_DESC));
      clinicalSyopsisEntry.setAct(clinicalSynopsisAct);
      clinicalSynopsisAct
          .setText(CDATypeUtil.getST(eventObj.getClinicalSynopsis().getClinicalSynopsisDesc()));
      clinicalSynopsisSection.getEntry().add(clinicalSyopsisEntry);
    }
    clinicalSynopsisComponent.setSection(clinicalSynopsisSection);
    return clinicalSynopsisComponent;
  }

  private POCDMT000040Component5 getClinicalInterventionsPerformedForEvent(
      ClinicalInterventionsPerformedThisVisit clinicalInterventionsPerformedThisVisit) {
    POCDMT000040Component5 clinicalInterventionComponent = objectFactory
        .createPOCDMT000040Component5();
    POCDMT000040Section clinicalInterventionSection = objectFactory.createPOCDMT000040Section();
    clinicalInterventionSection.setCode(
        (CE) dischargeSummaryCodeMap
            .get(ClinicalDocumentCodes.CLINICAL_INTERVENTIONS_PERF_THIS_VISIT));
    clinicalInterventionSection
        .setTitle(CDATypeUtil.getST(dischargeSummaryCodeMap
            .get(ClinicalDocumentCodes.CLINICAL_INTERVENTIONS_PERF_THIS_VISIT).getDisplayName()));
    clinicalInterventionSection.setText(NarrativeUtil
        .getClinicalInterventionsPerformedForEvent(clinicalInterventionsPerformedThisVisit));
    clinicalInterventionComponent.setSection(clinicalInterventionSection);
    clinicalInterventionsPerformedThisVisit.getClinicalInterventions().stream()
        .filter(Objects::nonNull).forEach(clinicalIntervention -> {
      POCDMT000040Entry clinicalInterventionEntry = objectFactory.createPOCDMT000040Entry();
      clinicalInterventionEntry.setTypeCode(XActRelationshipEntry.DRIV);
      POCDMT000040Procedure clinicalInterventionProc = objectFactory
          .createPOCDMT000040Procedure();
      clinicalInterventionProc.setClassCode(ActClass.PROC);
      clinicalInterventionProc.setMoodCode(XDocumentProcedureMood.EVN);
      clinicalInterventionEntry.setProcedure(clinicalInterventionProc);
      clinicalInterventionProc.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
      clinicalInterventionProc
          .setCode(Converter.convertToCDCode(clinicalIntervention.getClinicalInterventionDesc()));
      clinicalInterventionSection.getEntry().add(clinicalInterventionEntry);
    });
    return clinicalInterventionComponent;
  }

  private POCDMT000040Component5 getProblemDiagnosesForEvent(
      ProblemDiagnosesThisVisit problemDiagnosesThisVisit) {
    if (!isFormat2) {
      if (null != problemDiagnosesThisVisit.getExclusionStatement()
          && null != problemDiagnosesThisVisit.getProblemDiagnoses()) {
        throw new RuntimeException(
            "Invalid problem diagnoses data : person can only have either exclusion statement or problem diagnoses");
      }
    }

    POCDMT000040Component5 probDiagnosisComponent = objectFactory.createPOCDMT000040Component5();
    POCDMT000040Section probDiagnosisSection = objectFactory.createPOCDMT000040Section();
    probDiagnosisSection.setCode(
        (CE) dischargeSummaryCodeMap.get(ClinicalDocumentCodes.PROBLEM_DIAGNOSIS_THIS_VISIT));
    probDiagnosisSection.setTitle(CDATypeUtil.getST(
        dischargeSummaryCodeMap.get(ClinicalDocumentCodes.PROBLEM_DIAGNOSIS_THIS_VISIT)
            .getDisplayName()));
    probDiagnosisSection
        .setText(NarrativeUtil.getProblemDiagnosesForEvent(problemDiagnosesThisVisit));
    if (null != problemDiagnosesThisVisit.getExclusionStatement()) {
      if (null != problemDiagnosesThisVisit.getExclusionStatement().getGlobalStatement()) {
        Coded globalStatement = problemDiagnosesThisVisit.getExclusionStatement()
            .getGlobalStatement();
        probDiagnosisSection.getEntry()
            .add(exclusionStatementComponent
                .createExclusionStatement(PROBLEM_DIAGNOSIS_GLOBAL_STATEMENT, globalStatement,
                    ActClassObservation.OBS, XActMoodDocumentObservation.EVN));
      } else {
        throw new RuntimeException(
            "Mandatory Attribute Missing : Event > Problems Diagnoses This Visit > Exclusion Statement > Global Statement");
      }
    }
    if (null != problemDiagnosesThisVisit.getProblemDiagnoses()
        && !problemDiagnosesThisVisit.getProblemDiagnoses().isEmpty()) {
      problemDiagnosesThisVisit.getProblemDiagnoses().stream().filter(Objects::nonNull).forEach(
          problemDiagnosis -> probDiagnosisSection.getEntry()
              .add(getProblemDiagnosisEntry(problemDiagnosis)));
    }
    probDiagnosisComponent.setSection(probDiagnosisSection);
    return probDiagnosisComponent;
  }

  private POCDMT000040Entry getProblemDiagnosisEntry(ProblemDiagnosis problemDiagnosis) {
    POCDMT000040Entry problemDiagnosisEntry = objectFactory.createPOCDMT000040Entry();
    POCDMT000040Observation problemDiagnosisObs = objectFactory
        .createPOCDMT000040Observation();
    problemDiagnosisObs.setClassCode(ActClassObservation.OBS);
    problemDiagnosisObs.setMoodCode(XActMoodDocumentObservation.EVN);
    problemDiagnosisObs.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    problemDiagnosisObs
        .setCode(Converter.convertToCDCode(problemDiagnosis.getProblemDiagnosisType()));
    problemDiagnosisObs.getValue()
        .add(Converter.convertToCDCode(problemDiagnosis.getProblemDiagnosisDesc()));
    problemDiagnosisEntry.setObservation(problemDiagnosisObs);
    return problemDiagnosisEntry;
  }

  @Override
  public Document create1AFormatCDADocument()
      throws JAXBException, ParserConfigurationException, SchematronValidationException {
    if (null == this.clinicalModel.getContent().getReportFile()) {
      throw new RuntimeException("Missing mandatory attribute : reportFile must not be null");
    }
    AttachedMedia reportFile = this.clinicalModel.getContent().getReportFile();
    POCDMT000040ClinicalDocument clinicalDocument = createCommonDocumentDetails();
    clinicalDocument.setCode(SectionEntryCodeSet.DISCHARGE_SUMMARY);
    // Create body part
    POCDMT000040StructuredBody structuredBody = objectFactory.createPOCDMT000040StructuredBody();
    POCDMT000040Component2 component = objectFactory.createPOCDMT000040Component2();
    POCDMT000040Component3 attachmentComponent = objectFactory.createPOCDMT000040Component3();
    POCDMT000040Section attachmentSection = objectFactory.createPOCDMT000040Section();
    POCDMT000040Entry observationMediaEntry = objectFactory.createPOCDMT000040Entry();
    POCDMT000040ObservationMedia reportObservationMedia = objectFactory
        .createPOCDMT000040ObservationMedia();
    reportObservationMedia.setClassCode(ActClassObservation.OBS);
    reportObservationMedia.setMoodCode(ActMood.EVN);
    String idAttribute = CDATypeUtil.getUUID();
    reportObservationMedia.setIDAttribute(idAttribute);
    reportObservationMedia.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    reportObservationMedia
        .setValue(DiagnosticInvestigationComponent.getEDFromAttachedMedia(reportFile));
    reportFile.setObservationMediaReference(reportObservationMedia);
    observationMediaEntry.setObservationMedia(reportObservationMedia);
    attachmentSection.getEntry().add(observationMediaEntry);
    attachmentSection.setTitle(CDATypeUtil.getST(reportFile.getFileName()));
    StrucDocText narrative = new StrucDocText();
    narrative.getContent()
        .add(getMultimediaFromAttachedMedia(reportFile, "Discharge Summary (1A) %s"));
    attachmentSection.setText(narrative);
    attachmentComponent.setSection(attachmentSection);
    structuredBody.getComponent().add(attachmentComponent);
    component.setStructuredBody(structuredBody);
    clinicalDocument.setComponent(component);
    Document doc = getDocumentFilteredOfNull(
        CreatorUtil.convertClinicalDocumentToDomDocument(clinicalDocument));
    // If strict checking is enabled, check this document.
    if (isStrict()) {
      check(doc);
    }
    return doc;
  }

  @Override
  public Document create1BFormatCDADocument()
      throws JAXBException, ParserConfigurationException, SchematronValidationException {
    POCDMT000040ClinicalDocument clinicalDocument = createCommonDocumentDetails();
    // Create body part
    POCDMT000040StructuredBody structuredBody = objectFactory.createPOCDMT000040StructuredBody();
    POCDMT000040Component2 component = objectFactory.createPOCDMT000040Component2();
    POCDMT000040Component3 attachmentComponent = objectFactory.createPOCDMT000040Component3();
    POCDMT000040Section narrativeSection = objectFactory.createPOCDMT000040Section();
    narrativeSection
        .setTitle(CDATypeUtil.getST(clinicalModel.getContent().getCustomNarrativeTitle()));
    StrucDocText narrative = objectFactory.createStrucDocText();
    // narrative.getContent().add();
    narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
    narrativeSection.setText(clinicalModel.getContent().getCustomNarrativeText());

    attachmentComponent.setSection(narrativeSection);
    structuredBody.getComponent().add(attachmentComponent);
    component.setStructuredBody(structuredBody);
    clinicalDocument.setComponent(component);
    Document doc = getDocumentFilteredOfNull(
        CreatorUtil.convertClinicalDocumentToDomDocument(clinicalDocument));
    // If strict checking is enabled, check this document.
    if (isStrict()) {
      check(doc);
    }
    return doc;
  }


  private POCDMT000040ClinicalDocument createCommonDocumentDetails() {
    POCDMT000040ClinicalDocument clinicalDocument = getClinicalDocumentWithHeaders();
    // Construct Document Author
    DocumentAuthorComponent documentAuthorComponent = new DocumentAuthorComponent();

    if (null == clinicalModel.getContext().getDocumentAuthor()) {
      throw new RuntimeException(
          "Missing: Clinical Document > Document Author");
    }
    clinicalDocument.getAuthor().add(documentAuthorComponent.getAuthor(
        this.clinicalModel.getContext().getDocumentAuthor(),
        this.cdaModel.getLegalAuthenticator()));
    // Construct Subject of Care (Record Target)
    clinicalDocument.getRecordTarget()
        .add(HeaderUtil.createRecordTarget(clinicalModel.getContext().getSubjectOfCare()));

    //Information Recipient
    cdaModel.getInformationRecipients().stream().filter(Objects::nonNull).forEach(
        informationRecipient -> clinicalDocument.getInformationRecipient()
            .add(HeaderUtil.createInformationRecipient(informationRecipient))
    );
    // Construct Custodian
    if (cdaModel.getCustodian() != null) {
      clinicalDocument.setCustodian(
          HeaderUtil.createCustodian(cdaModel.getCustodian().getAssignedCustodian()
              .getRepresentedCustodianOrganization()));
    }

    return clinicalDocument;
  }

  private POCDMT000040ClinicalDocument getClinicalDocumentWithHeaders() {
    // Construct clinical document with headers
    POCDMT000040ClinicalDocument clinicalDocument =
        HeaderUtil.createClinicalDocument(cdaModel.getBaseClinicalDocument(), new DateTime());
    clinicalDocument.setCode(SectionEntryCodeSet.DISCHARGE_SUMMARY);
    clinicalDocument.setCompletionCode(
        Converter.convertToCECode(cdaModel.getCompletionClinicalDoucment().getCompletionCode()));
    return clinicalDocument;
  }
}
