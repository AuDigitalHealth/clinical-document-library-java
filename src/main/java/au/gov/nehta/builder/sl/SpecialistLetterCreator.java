package au.gov.nehta.builder.sl;


import static au.gov.nehta.builder.DocumentCreatorUtil.HL7_TEXT_MEDIA_TYPE;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.ADVERSE_REACTION;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.ADVERSE_REACTIONS;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.CHANGE_OR_RECOMMENDATION_REASON;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.CHANGE_STATUS;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.CHANGE_TYPE;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.CLINICAL_INDICATION;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.CLINICAL_INFO;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.CLINICAL_INFORMATION_PROVIDED;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.CLINICAL_SYNOPSIS;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.COLLECTION_SETTINGS;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.DATETIME_RECEIVED;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.DIAGNOSIS_INTERPRETATION;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.DIAGNOSTIC_INVESTIGATIONS;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.DICOM_SERIES_IDENTIFIER;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.DICOM_STUDY_IDENTIFIER;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.EVENT_OVERVIEW;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.EXAMINATION_IMAGE_DETAILS;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.EXAMINATION_REPORT_IDENTIFIER;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.EXAMINATION_REQUESTED_NAME;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.EXAMINATION_REQUEST_DETAILS;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.GLOBAL_STATEMENT;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.IMAGING_EXAMINATION_RESULT;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.IMAGING_EXAMINATION_RESULT_DATETIME;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.IMAGING_EXAMINATION_RESULT_FINDINGS;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.IMAGING_EXAMINATION_RESULT_STATUS;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.IMMUNISATIONS;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.INDIVIDUAL_RESULT_COMMENT_CODE;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.INDIVIDUAL_TEST_RESULT_COMMENT;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.INDIVIDUAL_TEST_RESULT_REF_RANGE_COMMENTS;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.INDIVIDUAL_TEST_RESULT_STATUS;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.LAB_FINDINGS_INTERPRETATION;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.LATERALITY;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.MEDICALHISTORY_ITEM_COMMENT;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.MEDICAL_HISTORY;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.MEDICATION_ORDERS;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.OTHER_DIAGNOSIS_PROCEDURE_ENTRY;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.OTHER_TEST_RESULT;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.OTHER_TEST_RESULT_REPORT_STATUS;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.PARENT_SPECIMEN_IDENTIFIER;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.PATHOLOGICAL_DIAGNOSIS;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.PATHOLOGY_SERVICE;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.PATHOLOGY_TEST_RESULT;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.PATHOLOGY_TEST_RESULT_DATETIME;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.PATH_TEST_COMMENT;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.PROB_OR_DIAG_COMMENT;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.PROCEDURE_COMMENT;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.REACTION_EVENT;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.RECOMMENDATION;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.RECOMMENDATIONS;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.RECOMMENDATIONS_EXCLUSION;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.REPORT_STATUS;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.REQUESTED_SERVICE;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.REQUESTED_SERVICE_DATETIME;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.RESPONSE_DETAILS;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.RESPONSE_NARRATIVE;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.SAMPLING_PRECONDITIONS;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.SPECIMEN;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.SUBJECT_OF_CARE_INSTR_DESC;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.SUBJECT_POSITION;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.TEST_REQ_DETAILS;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.TEST_REQ_NAME;
import static au.gov.nehta.builder.sl.SpecialistLetterCodes.UNCATEGORISED_MEDICAL_HISTORY_ITEM;
import static au.gov.nehta.builder.sl.SpecialistLetterNarrativeUtil.getMultimediaFromAttachedMedia;
import static au.gov.nehta.builder.sl.SpecialistLetterNarrativeUtil.getNarrativeForRecommendations;
import static au.gov.nehta.builder.sl.SpecialistLetterNarrativeUtil.getResponseDetailsNarrative;

import au.gov.nehta.builder.common.ClinicalDocumentCodes;
import au.gov.nehta.builder.common.HeaderUtil;
import au.gov.nehta.builder.common.SectionEntryCodeSet;
import au.gov.nehta.builder.common.components.AdministrativeObservationsComponent;
import au.gov.nehta.builder.common.components.AdverseReactionComponent;
import au.gov.nehta.builder.common.components.DiagnosticInvestigationComponent;
import au.gov.nehta.builder.common.components.DocumentAuthorComponent;
import au.gov.nehta.builder.common.components.MedicationComponent;
import au.gov.nehta.builder.util.CDATypeUtil;
import au.gov.nehta.builder.util.ClinicalDocumentCreator;
import au.gov.nehta.builder.util.Converter;
import au.gov.nehta.builder.util.CreatorUtil;
import au.gov.nehta.model.cda.sl.SpecialistLetterCDAModel;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.gov.nehta.model.clinical.sl.Diagnosis;
import au.gov.nehta.model.clinical.sl.OtherDiagnosisProcedureEntry;
import au.gov.nehta.model.clinical.sl.Procedure;
import au.gov.nehta.model.clinical.sl.Recommendation;
import au.gov.nehta.model.clinical.sl.Recommendations;
import au.gov.nehta.model.clinical.sl.ResponseDetails;
import au.gov.nehta.model.clinical.sl.SpecialistLetter;
import au.gov.nehta.model.schematron.SchematronResource;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.net.electronichealth.ns.cda._2_0.ActClass;
import au.net.electronichealth.ns.cda._2_0.ActClassObservation;
import au.net.electronichealth.ns.cda._2_0.ActMood;
import au.net.electronichealth.ns.cda._2_0.ActRelationshipHasComponent;
import au.net.electronichealth.ns.cda._2_0.CD;
import au.net.electronichealth.ns.cda._2_0.CE;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Act;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ClinicalDocument;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component1;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component2;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component3;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040EncompassingEncounter;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Entry;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Observation;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ObservationMedia;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Performer2;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Procedure;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Section;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040StructuredBody;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import au.net.electronichealth.ns.cda._2_0.XActClassDocumentEntryAct;
import au.net.electronichealth.ns.cda._2_0.XActMoodDocumentObservation;
import au.net.electronichealth.ns.cda._2_0.XDocumentActMood;
import au.net.electronichealth.ns.cda._2_0.XDocumentProcedureMood;
import au.net.electronichealth.ns.cda._2_0.XInformationRecipient;
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

public class SpecialistLetterCreator extends ClinicalDocumentCreator {

  private static ObjectFactory objectFactory = new ObjectFactory();
  private SpecialistLetterCDAModel cdaModel;
  private SpecialistLetter clinicalModel;
  private static Map<String, CD> specialistLetterCodeMap;
  private DiagnosticInvestigationComponent diagnosticInvestigationComponent =
      new DiagnosticInvestigationComponent(specialistLetterCodeMap);

  static {
    specialistLetterCodeMap = new HashMap<String, CD>() {{
      put(ClinicalDocumentCodes.DIAGNOSTIC_INVESTIGATIONS, DIAGNOSTIC_INVESTIGATIONS);
      put(ClinicalDocumentCodes.SPECIMEN, SPECIMEN);
      put(ClinicalDocumentCodes.RECOMMENDATIONS_EXCLUSION, RECOMMENDATIONS_EXCLUSION);
      put(ClinicalDocumentCodes.PATHOLOGY_TEST_RESULT, PATHOLOGY_TEST_RESULT);
      put(ClinicalDocumentCodes.DATETIME_RECEIVED, DATETIME_RECEIVED);
      put(ClinicalDocumentCodes.PARENT_SPECIMEN_IDENTIFIER, PARENT_SPECIMEN_IDENTIFIER);
      put(ClinicalDocumentCodes.CLINICAL_INFO, CLINICAL_INFO);
      put(ClinicalDocumentCodes.RECOMMENDATION, RECOMMENDATION);
      put(ClinicalDocumentCodes.RESPONSE_DETAILS, RESPONSE_DETAILS);
      put(ClinicalDocumentCodes.RESPONSE_NARRATIVE, RESPONSE_NARRATIVE);
      put(ClinicalDocumentCodes.OTHER_DIAGNOSIS_PROCEDURE_ENTRY, OTHER_DIAGNOSIS_PROCEDURE_ENTRY);
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
      put(ClinicalDocumentCodes.RECOMMENDATIONS, RECOMMENDATIONS);
      put(ClinicalDocumentCodes.ADVERSE_REACTION, ADVERSE_REACTION);
      put(ClinicalDocumentCodes.EVENT_OVERVIEW, EVENT_OVERVIEW);
      put(ClinicalDocumentCodes.INDIVIDUAL_TEST_RESULT_COMMENT, INDIVIDUAL_TEST_RESULT_COMMENT);
      put(ClinicalDocumentCodes.INDIVIDUAL_TEST_RESULT_REF_RANGE_COMMENTS,
          INDIVIDUAL_TEST_RESULT_REF_RANGE_COMMENTS);
      put(ClinicalDocumentCodes.INDIVIDUAL_TEST_RESULT_STATUS, INDIVIDUAL_TEST_RESULT_STATUS);
      put(ClinicalDocumentCodes.CLINICAL_INFORMATION_PROVIDED, CLINICAL_INFORMATION_PROVIDED);
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
      put(ClinicalDocumentCodes.PATHOLOGY_TEST_RESULT_DATETIME, PATHOLOGY_TEST_RESULT_DATETIME);
      put(ClinicalDocumentCodes.INDIVIDIUAL_RESULT_COMMENT_CODE, INDIVIDUAL_RESULT_COMMENT_CODE);
      put(ClinicalDocumentCodes.EXAMINATION_REQUESTED_NAME, EXAMINATION_REQUESTED_NAME);
      put(ClinicalDocumentCodes.DICOM_STUDY_IDENTIFIER, DICOM_STUDY_IDENTIFIER);
      put(ClinicalDocumentCodes.DICOM_SERIES_IDENTIFIER, DICOM_SERIES_IDENTIFIER);
      put(ClinicalDocumentCodes.EXAMINATION_REQUEST_DETAILS, EXAMINATION_REQUEST_DETAILS);
      put(ClinicalDocumentCodes.EXMANATION_IMAGE_DETAILS, EXAMINATION_IMAGE_DETAILS);
      put(ClinicalDocumentCodes.EXAMINATION_REPORT_IDENTIFIER, EXAMINATION_REPORT_IDENTIFIER);
      put(ClinicalDocumentCodes.SUBJECT_POSITION, SUBJECT_POSITION);
      put(ClinicalDocumentCodes.IMAGING_EXAMINATION_RESULT_DATETIME,
          IMAGING_EXAMINATION_RESULT_DATETIME);
      put(ClinicalDocumentCodes.OTHER_TEST_RESULT, OTHER_TEST_RESULT);
      put(ClinicalDocumentCodes.OTHER_TEST_RESULT_REPORT_STATUS,
          OTHER_TEST_RESULT_REPORT_STATUS);
      put(ClinicalDocumentCodes.SAMPLING_PRECONDITIONS, SAMPLING_PRECONDITIONS);
      put(ClinicalDocumentCodes.LATERALITY, LATERALITY);
      put(ClinicalDocumentCodes.GLOBAL_STATEMENT, GLOBAL_STATEMENT);
    }};
  }

  public SpecialistLetterCreator(SpecialistLetterCDAModel cdaModel,
      SpecialistLetter clinicalModel) {
    this.cdaModel = cdaModel;
    this.clinicalModel = clinicalModel;

    // for schematron checking
    this.resource = SchematronResource.SchematronResources.SPECIALIST_LETTER_3A.resource();
  }


  public Document create()
      throws ParserConfigurationException, JAXBException, SchematronValidationException {
    POCDMT000040ClinicalDocument clinicalDocument = getClinicalDocumentWithHeaders();
    // Construct Legal Authenticator
    if (cdaModel.getLegalAuthenticator() != null) {
      clinicalDocument.setLegalAuthenticator(
          HeaderUtil.createLegalAuthenticator(cdaModel.getLegalAuthenticator()));
    }

    // Encompassing Encounter
    clinicalDocument.setComponentOf(getEncompassingEncounter());

    //Information Recipient List (0..*)
    cdaModel.getInformationRecipients().stream().filter(Objects::nonNull)
        .forEach(informationRecipient -> clinicalDocument.getInformationRecipient()
            .add(HeaderUtil
                .createInformationRecipient(informationRecipient, XInformationRecipient.TRC))
        );
    // Construct Custodian
    if (cdaModel.getCustodian() != null) {
      clinicalDocument.setCustodian(
          HeaderUtil.createCustodian(cdaModel.getCustodian().getAssignedCustodian()
              .getRepresentedCustodianOrganization()));
    }
    // Construct Legal Authenticator
    clinicalDocument.getAuthor().add(new DocumentAuthorComponent().getAuthor(clinicalModel
        .getContext().getDocumentAuthor(), cdaModel.getLegalAuthenticator()));

    // Construct Subject of Care (Record Target)
    clinicalDocument.getRecordTarget().add(HeaderUtil.createRecordTarget(
        clinicalModel.getContext().getSubjectOfCare()));

    //Construct Referrer
    if (cdaModel.getReferrer() != null) {
      clinicalDocument.getParticipant()
          .add(HeaderUtil.createReferrerParticipant(cdaModel.getReferrer()));
    }

    // Construct UsualGP
    if (cdaModel.getUsualGP() != null) {
      clinicalDocument.getParticipant()
          .add(HeaderUtil.createUsualGPParticipant(cdaModel.getUsualGP()));
    }

    clinicalDocument.setComponent(getCDABody());
    Document doc = getDocumentFilteredOfNull(
        CreatorUtil.convertClinicalDocumentToDomDocument(clinicalDocument));
    // If strict checking is enabled, check this document.
    if (isStrict()) {
      check(doc);
    }
    return doc;
  }

  private POCDMT000040Component1 getEncompassingEncounter() {
    POCDMT000040Component1 componentOf = objectFactory.createPOCDMT000040Component1();
    POCDMT000040EncompassingEncounter encompassingEncounter =
        objectFactory.createPOCDMT000040EncompassingEncounter();
    encompassingEncounter.setEffectiveTime(Converter
        .convert(clinicalModel.getContext().getDateTimeSubjectOfCareSeen()));
    componentOf.setEncompassingEncounter(encompassingEncounter);
    return componentOf;
  }

  private POCDMT000040ClinicalDocument getClinicalDocumentWithHeaders() {
    // Construct clinical document with headers
    POCDMT000040ClinicalDocument clinicalDocument =
        HeaderUtil.createClinicalDocument(cdaModel.getBaseClinicalDocument(), new DateTime());
    clinicalDocument.setCode(SectionEntryCodeSet.SPECIALIST_LETTER);
    clinicalDocument.setCompletionCode(
        Converter.convertToCECode(cdaModel.getCompletionClinicalDocument().getCompletionCode()));
    return clinicalDocument;
  }

  private POCDMT000040Component2 getCDABody() {
    POCDMT000040StructuredBody structuredBody = objectFactory.createPOCDMT000040StructuredBody();
    POCDMT000040Component2 component = objectFactory.createPOCDMT000040Component2();

    MedicationComponent medicationComponent =
        new MedicationComponent(specialistLetterCodeMap);
    AdverseReactionComponent adverseReactionComponent =
        new AdverseReactionComponent(specialistLetterCodeMap);
    structuredBody.getComponent().add(getResponseDetails());
    structuredBody.getComponent().add(getRecommendations());
    structuredBody.getComponent().add(adverseReactionComponent.getAdverseReactions(
        clinicalModel.getContent().getNewlyIdentifiedAdverseReactions()));
    structuredBody.getComponent().add(
        medicationComponent.getMedications(clinicalModel.getContent().getMedications()));
    structuredBody.getComponent().add(diagnosticInvestigationComponent.getDiagnosticInvestigations(
        clinicalModel.getContent().getDiagnosticInvestigations()));
    structuredBody.getComponent().add(new AdministrativeObservationsComponent()
        .getComponent(clinicalModel.getContext().getSubjectOfCare(),
            clinicalModel.getContext().getDocumentAuthor()));
    component.setStructuredBody(structuredBody);
    return component;
  }

  private POCDMT000040Component3 getRecommendations() {
    if (null == clinicalModel.getContent().getRecommendations()) {
      throw new RuntimeException("Missing mandatory section : Recommendations");
    }
    Recommendations recommendations = clinicalModel.getContent()
        .getRecommendations();
    POCDMT000040Component3 recommendationsComponent = objectFactory.createPOCDMT000040Component3();
    recommendationsComponent.setTypeCode(ActRelationshipHasComponent.COMP);
    POCDMT000040Section recommendationsSection = objectFactory.createPOCDMT000040Section();
    recommendationsSection.setCode(
        (CE) specialistLetterCodeMap.get(ClinicalDocumentCodes.RECOMMENDATIONS));
    recommendationsSection.setTitle(CDATypeUtil.getST(
        specialistLetterCodeMap.get(ClinicalDocumentCodes.RECOMMENDATIONS).getDisplayName()));
    recommendationsSection.setText(getNarrativeForRecommendations(recommendations));
    if (null != recommendations.getRecommendationList()) {
      recommendationsSection.getEntry().addAll(getRecommendationEntriesForRecommendations(
          recommendations));
    }
    if (null != recommendations.getRecommendationsExclusion()) {
      POCDMT000040Entry recommendationsExclusionEntry = objectFactory.createPOCDMT000040Entry();
      POCDMT000040Observation recommendationExclusionObs = objectFactory
          .createPOCDMT000040Observation();
      recommendationExclusionObs.setClassCode(ActClassObservation.OBS);
      recommendationExclusionObs.setMoodCode(XActMoodDocumentObservation.EVN);
      recommendationExclusionObs
          .setCode(specialistLetterCodeMap.get(ClinicalDocumentCodes.RECOMMENDATIONS_EXCLUSION));
      recommendationExclusionObs.getValue().add(
          CDATypeUtil.getST(recommendations.getRecommendationsExclusion().getGeneralStatement()));
      recommendationsExclusionEntry.setObservation(recommendationExclusionObs);
      recommendationsSection.getEntry().add(recommendationsExclusionEntry);
    }
    recommendationsComponent.setSection(recommendationsSection);
    return recommendationsComponent;
  }

  private List<POCDMT000040Entry> getRecommendationEntriesForRecommendations(
      Recommendations recommendations) {
    List<POCDMT000040Entry> recommendationEntries = new LinkedList<>();
    recommendations.getRecommendationList().stream().filter(Objects::nonNull).forEach(
        recommendation -> {
          POCDMT000040Entry recommendationEntry = objectFactory.createPOCDMT000040Entry();
          POCDMT000040Act recommendationAct = objectFactory.createPOCDMT000040Act();
          recommendationAct.setClassCode(XActClassDocumentEntryAct.ACT);
          recommendationAct.setMoodCode(XDocumentActMood.PRP);
          recommendationAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
          recommendationAct
              .setCode(specialistLetterCodeMap.get(ClinicalDocumentCodes.RECOMMENDATION));
          //Recommendation -> Addressee
          recommendationAct.getPerformer().add(getServiceProviderPerformer(recommendation));
          recommendationAct.setEffectiveTime(
              Converter
                  .convert(recommendation.getTimeFrame(), true, true, true));
          recommendationAct
              .setText(CDATypeUtil.getST(recommendation.getRecommendationNarrative()));
          recommendationEntry.setAct(recommendationAct);
          recommendationEntries.add(recommendationEntry);
        });
    return recommendationEntries;
  }

  private POCDMT000040Performer2 getServiceProviderPerformer(Recommendation recommendation) {
    //Service Provider Start
    POCDMT000040Performer2 performer = null;
    ParticipationServiceProvider participationServiceProvider = recommendation.getAddressee();

    // Mutually Exclusive (Healthcare Person or Organisation) -stop user initializing both (throw exception)
    if (null != participationServiceProvider.getParticipant().getHealthCareProvider()) {
      performer = DiagnosticInvestigationComponent
          .getHealthcarePersonPerformer(participationServiceProvider, false);

    } else if (null != participationServiceProvider.getParticipant().getOrganisation()) {
      performer = DiagnosticInvestigationComponent
          .getOrganizationPerformer(participationServiceProvider);
    }

    return performer;
  }


  private POCDMT000040Component3 getResponseDetails() {
    if (null == clinicalModel.getContent().getResponseDetails()) {
      throw new RuntimeException("Missing mandatory section : Response Details");
    }
    ResponseDetails responseDetails = clinicalModel.getContent().getResponseDetails();
    POCDMT000040Component3 responseDetailsComponent = objectFactory.createPOCDMT000040Component3();
    responseDetailsComponent.setTypeCode(ActRelationshipHasComponent.COMP);
    POCDMT000040Section responseDetailSection = objectFactory.createPOCDMT000040Section();
    responseDetailSection
        .setCode((CE) specialistLetterCodeMap.get(ClinicalDocumentCodes.RESPONSE_DETAILS));
    responseDetailSection.setTitle(CDATypeUtil.getST(
        specialistLetterCodeMap.get(ClinicalDocumentCodes.RESPONSE_DETAILS).getDisplayName()));
    responseDetailSection.setText(getResponseDetailsNarrative(responseDetails));
    //Response Details -> Procedure Entry
    if (null != responseDetails.getProcedures()) {
      responseDetailSection.getEntry().addAll(getProcedureEntriesForResponseDetails(
          responseDetails.getProcedures()));
    }
    //Response Details -> Problem Diagnoses/Diagnoses
    if (null != responseDetails.getDiagnoses()) {
      responseDetailSection.getEntry().addAll(getDiagnosesEntriesForResponseDetails(
          responseDetails.getDiagnoses()));
    }
    //Response Details -> Other Diagnoses
    if (null != responseDetails.getOtherDiagnosisProcedureEntries()) {
      responseDetailSection.getEntry().addAll(getOtherDiagnosisProcedureEntriesForResponseDetails(
          responseDetails.getOtherDiagnosisProcedureEntries()));
    }
    //Response Details -> Response Narrative
    if (null != responseDetails.getResponseNarrative()) {
      if (null != responseDetails.getResponseNarrative().getNarrative()) {
        responseDetailSection.getEntry()
            .add(getResponseNarrativeEntryForResponseDetails(responseDetails));
      }
    } else {
      throw new RuntimeException("Response Details > Response Narrative > Narrative is mandatory");
    }
    responseDetailsComponent.setSection(responseDetailSection);
    return responseDetailsComponent;
  }

  private POCDMT000040Entry getResponseNarrativeEntryForResponseDetails(
      ResponseDetails responseDetails) {
    POCDMT000040Entry responseNarrativeEntry = objectFactory.createPOCDMT000040Entry();
    POCDMT000040Act responseNarrativeAct = objectFactory.createPOCDMT000040Act();
    responseNarrativeAct.setClassCode(XActClassDocumentEntryAct.ACT);
    responseNarrativeAct.setMoodCode(XDocumentActMood.EVN);
    responseNarrativeAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    responseNarrativeAct
        .setCode(specialistLetterCodeMap.get(ClinicalDocumentCodes.RESPONSE_NARRATIVE));
    responseNarrativeAct
        .setText(CDATypeUtil.getST(responseDetails.getResponseNarrative().getNarrative()));
    responseNarrativeEntry.setAct(responseNarrativeAct);
    return responseNarrativeEntry;
  }

  private List<POCDMT000040Entry> getOtherDiagnosisProcedureEntriesForResponseDetails(
      List<OtherDiagnosisProcedureEntry> otherDiagnosisProcedureEntries) {
    List<POCDMT000040Entry> otherDiagnosisProcedureEntryList = new LinkedList<>();
    otherDiagnosisProcedureEntries.stream().filter(Objects::nonNull)
        .forEach(otherDiagnosisProcedureObj -> {
          POCDMT000040Entry otherDiagnosisProcedureEntry = objectFactory.createPOCDMT000040Entry();
          POCDMT000040Act otherDiagnosisProcedureAct = objectFactory.createPOCDMT000040Act();
          otherDiagnosisProcedureAct.setClassCode(XActClassDocumentEntryAct.ACT);
          otherDiagnosisProcedureAct.setMoodCode(XDocumentActMood.EVN);
          otherDiagnosisProcedureAct.setCode(
              specialistLetterCodeMap.get(ClinicalDocumentCodes.OTHER_DIAGNOSIS_PROCEDURE_ENTRY));
          otherDiagnosisProcedureAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
          otherDiagnosisProcedureAct.setText(
              CDATypeUtil.getST(otherDiagnosisProcedureObj.getOtherDiagnosisOrProcedureName()));
          otherDiagnosisProcedureEntry.setAct(otherDiagnosisProcedureAct);
          otherDiagnosisProcedureEntryList.add(otherDiagnosisProcedureEntry);
        });
    return otherDiagnosisProcedureEntryList;
  }

  private List<POCDMT000040Entry> getDiagnosesEntriesForResponseDetails(
      List<Diagnosis> diagnoses) {
    List<POCDMT000040Entry> diagnosesEntries = new LinkedList<>();
    diagnoses.stream().filter(Objects::nonNull).forEach(procedureObj -> {
      POCDMT000040Entry diagnosisEntry = objectFactory.createPOCDMT000040Entry();
      POCDMT000040Observation observation = objectFactory.createPOCDMT000040Observation();
      observation.setClassCode(ActClassObservation.OBS);
      observation.setMoodCode(XActMoodDocumentObservation.EVN);
      observation
          .setCode(specialistLetterCodeMap.get(ClinicalDocumentCodes.DIAGNOSIS_INTERPRETATION));
      observation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
      observation.getValue().add(Converter.convertToCDCode(procedureObj.getDiagnosisName()));
      diagnosisEntry.setObservation(observation);
      diagnosesEntries.add(diagnosisEntry);
    });
    return diagnosesEntries;
  }

  private List<POCDMT000040Entry> getProcedureEntriesForResponseDetails(
      List<Procedure> procedures) {
    List<POCDMT000040Entry> procedureEntries = new LinkedList<>();
    procedures.stream().filter(Objects::nonNull).forEach(procedureObj -> {
      POCDMT000040Entry procedureEntry = objectFactory.createPOCDMT000040Entry();
      POCDMT000040Procedure procedure = objectFactory.createPOCDMT000040Procedure();
      procedure.setClassCode(ActClass.PROC);
      procedure.setMoodCode(XDocumentProcedureMood.EVN);
      procedure.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
      procedure.setCode(Converter.convertToCDCode(procedureObj.getProcedureName()));
      procedureEntry.setProcedure(procedure);
      procedureEntries.add(procedureEntry);
    });
    return procedureEntries;
  }

  @Override
  public Document create1AFormatCDADocument()
      throws JAXBException, ParserConfigurationException, SchematronValidationException {
    if (null == this.clinicalModel.getContent().getReportFile()) {
      throw new RuntimeException("Missing mandatory attribute : reportFile must not be null");
    }
    AttachedMedia reportFile = this.clinicalModel.getContent().getReportFile();
    POCDMT000040ClinicalDocument clinicalDocument = createCommonDocumentDetails();
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
        .add(getMultimediaFromAttachedMedia(reportFile, "Specialist Letter (1A) %s"));
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

  private POCDMT000040ClinicalDocument createCommonDocumentDetails() {
    POCDMT000040ClinicalDocument clinicalDocument = getClinicalDocumentWithHeaders();
    // Construct Document Author
    DocumentAuthorComponent documentAuthorComponent = new DocumentAuthorComponent();
    clinicalDocument.getAuthor().add(documentAuthorComponent.getAuthor(
        this.clinicalModel.getContext().getDocumentAuthor(),
        this.cdaModel.getLegalAuthenticator()));
    // Construct Subject of Care (Record Target)
    clinicalDocument.getRecordTarget()
        .add(HeaderUtil.createRecordTarget(clinicalModel.getContext().getSubjectOfCare()));
    // Construct Custodian
    if (cdaModel.getCustodian() != null) {
      clinicalDocument.setCustodian(
          HeaderUtil.createCustodian(cdaModel.getCustodian().getAssignedCustodian()
              .getRepresentedCustodianOrganization()));
    }
    // Encompassing Encounter
    clinicalDocument.setComponentOf(getEncompassingEncounter());
    return clinicalDocument;
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

}
