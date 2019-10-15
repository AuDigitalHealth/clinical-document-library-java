package au.gov.nehta.builder.sr;

import static au.gov.nehta.builder.DocumentCreatorUtil.HL7_TEXT_MEDIA_TYPE;
import static au.gov.nehta.builder.common.components.DiagnosticInvestigationComponent.getEmploymentDetails;
import static au.gov.nehta.builder.common.components.DiagnosticInvestigationComponent.getOrganization;
import static au.gov.nehta.builder.common.components.DiagnosticInvestigationComponent.getQualifications;
import static au.gov.nehta.builder.sl.SpecialistLetterNarrativeUtil.getMultimediaFromAttachedMedia;
import static au.gov.nehta.builder.sr.NarrativeUtil.getInterpreterRequiredAlert;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.ADVERSE_REACTION;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.ADVERSE_REACTIONS;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.ADVERSE_REACTIONS_GLOBAL_STATEMENT;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.CHANGE_OR_RECOMMENDATION_REASON;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.CHANGE_STATUS;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.CHANGE_TYPE;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.CLINICAL_INDICATION;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.CLINICAL_INFO;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.CLINICAL_INFORMATION_PROVIDED;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.CLINICAL_SYNOPSIS;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.COLLECTION_SETTINGS;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.CURRENT_SERVICES;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.DATETIME_RECEIVED;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.DIAGNOSIS_INTERPRETATION;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.DIAGNOSTIC_INVESTIGATIONS;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.DICOM_SERIES_IDENTIFIER;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.DICOM_STUDY_IDENTIFIER;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.DOCUMENT_TITLE;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.EVENT_OVERVIEW;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.EXAMINATION_IMAGE_DETAILS;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.EXAMINATION_REPORT_IDENTIFIER;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.EXAMINATION_REQUESTED_NAME;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.EXAMINATION_REQUEST_DETAILS;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.IMAGING_EXAMINATION_RESULT;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.IMAGING_EXAMINATION_RESULT_DATETIME;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.IMAGING_EXAMINATION_RESULT_FINDINGS;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.IMAGING_EXAMINATION_RESULT_STATUS;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.IMMUNISATIONS;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.INDIVIDUAL_RESULT_COMMENT_CODE;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.INDIVIDUAL_TEST_RESULT_COMMENT;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.INDIVIDUAL_TEST_RESULT_REF_RANGE_COMMENTS;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.INDIVIDUAL_TEST_RESULT_STATUS;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.INTERESTED_PARTY;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.INTERPRETER_REQUIRED;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.LAB_FINDINGS_INTERPRETATION;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.LATERALITY;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.MEDICALHISTORY_ITEM_COMMENT;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.MEDICAL_HISTORY;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.MEDICATIONS_GLOBAL_STATEMENT;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.MEDICATION_ORDERS;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.OTHER_TEST_RESULT;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.OTHER_TEST_RESULT_REPORT_STATUS;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.PARENT_SPECIMEN_IDENTIFIER;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.PATHOLOGICAL_DIAGNOSIS;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.PATHOLOGY_SERVICE;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.PATHOLOGY_TEST_RESULT;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.PATHOLOGY_TEST_RESULT_DATETIME;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.PATH_TEST_COMMENT;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.PROB_OR_DIAG_COMMENT;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.PROCEDURE_COMMENT;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.REACTION_EVENT;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.RELATED_DOCUMENT;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.REPORT_STATUS;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.REQUESTED_SERVICE;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.REQUESTED_SERVICE_DATETIME;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.REQ_SERVICE_DATETIME;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.REQ_URGENCY_NOTES;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.REQ_VALIDITY_PERIOD;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.RESULT_GROUP_SPEC_DETAIL;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.SAMPLING_PRECONDITIONS;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.SERVICE_COMMENT;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.SERVICE_DESC;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.SERVICE_REFERRAL_DETAIL;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.SPECIMEN;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.SUBJECT_OF_CARE_INSTR_DESC;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.SUBJECT_POSITION;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.TEST_REQ_DETAILS;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.TEST_REQ_NAME;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.UNCATEGORISED_MEDICAL_HISTORY_ITEM;
import static au.gov.nehta.builder.sr.ServiceReferralCodes.URGENT;

import au.gov.nehta.builder.common.ClinicalDocumentCodes;
import au.gov.nehta.builder.common.HeaderUtil;
import au.gov.nehta.builder.common.NCTISChanceTypeValues;
import au.gov.nehta.builder.common.NCTISRecommendationOrChangeValues;
import au.gov.nehta.builder.common.NarrativeUtilCommon;
import au.gov.nehta.builder.common.SectionEntryCodeSet;
import au.gov.nehta.builder.common.components.AdministrativeObservationsComponent;
import au.gov.nehta.builder.common.components.AdverseReactionComponent;
import au.gov.nehta.builder.common.components.DiagnosticInvestigationComponent;
import au.gov.nehta.builder.common.components.DocumentAuthorComponent;
import au.gov.nehta.builder.common.components.ExclusionStatementComponent;
import au.gov.nehta.builder.common.components.MedicalHistoryComponent;
import au.gov.nehta.builder.common.components.MedicationComponent;
import au.gov.nehta.builder.util.AddressConverter;
import au.gov.nehta.builder.util.CDATypeUtil;
import au.gov.nehta.builder.util.ClinicalDocumentCreator;
import au.gov.nehta.builder.util.Converter;
import au.gov.nehta.builder.util.CreatorUtil;
import au.gov.nehta.model.cda.common.ElectronicCommunicationDetail;
import au.gov.nehta.model.cda.common.code.CodeImpl;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.informationrecipient.InformationRecipient;
import au.gov.nehta.model.cda.common.person_org.PersonHealthcareProvider;
import au.gov.nehta.model.cda.sr.ServiceReferralCDAModel;
import au.gov.nehta.model.clinical.common.address.Address;
import au.gov.nehta.model.clinical.es.DiagnosticInvestigations;
import au.gov.nehta.model.clinical.es.KnownMedication;
import au.gov.nehta.model.clinical.es.Medications;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.gov.nehta.model.clinical.etp.common.participation.ServiceProvider;
import au.gov.nehta.model.clinical.sr.AdverseReactions;
import au.gov.nehta.model.clinical.sr.InterpreterRequiredAlert;
import au.gov.nehta.model.clinical.sr.OtherAlert;
import au.gov.nehta.model.clinical.sr.RelatedDocument;
import au.gov.nehta.model.clinical.sr.RequestedService;
import au.gov.nehta.model.clinical.sr.ServiceReferral;
import au.gov.nehta.model.schematron.SchematronResource.SchematronResources;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.net.electronichealth.ns.cda._2_0.ActClass;
import au.net.electronichealth.ns.cda._2_0.ActClassDocument;
import au.net.electronichealth.ns.cda._2_0.ActClassObservation;
import au.net.electronichealth.ns.cda._2_0.ActMood;
import au.net.electronichealth.ns.cda._2_0.ActRelationshipHasComponent;
import au.net.electronichealth.ns.cda._2_0.CD;
import au.net.electronichealth.ns.cda._2_0.CE;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Act;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040AssociatedEntity;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ClinicalDocument;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component2;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component3;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Consumable;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Entry;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040EntryRelationship;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ExternalDocument;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040InformationRecipient;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040IntendedRecipient;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ManufacturedProduct;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Material;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Observation;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ObservationMedia;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Organization;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040OrganizationPartOf;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Participant1;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Performer2;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Person;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Reference;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Section;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040StructuredBody;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040SubstanceAdministration;
import au.net.electronichealth.ns.cda._2_0.ParticipationType;
import au.net.electronichealth.ns.cda._2_0.RoleClass;
import au.net.electronichealth.ns.cda._2_0.RoleClassAssociative;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import au.net.electronichealth.ns.cda._2_0.XActClassDocumentEntryAct;
import au.net.electronichealth.ns.cda._2_0.XActMoodDocumentObservation;
import au.net.electronichealth.ns.cda._2_0.XActRelationshipEntryRelationship;
import au.net.electronichealth.ns.cda._2_0.XActRelationshipExternalReference;
import au.net.electronichealth.ns.cda._2_0.XDocumentActMood;
import au.net.electronichealth.ns.cda._2_0.XDocumentSubstanceMood;
import au.net.electronichealth.ns.cda._2_0.XInformationRecipient;
import au.net.electronichealth.ns.cda._2_0.XInformationRecipientRole;
import au.net.electronichealth.ns.ci.cda.extensions._3.Employment;
import au.net.electronichealth.ns.ci.cda.extensions._3.PersonalRelationship;
import au.net.electronichealth.ns.ci.cda.extensions._3.Qualifications;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import org.joda.time.DateTime;
import org.w3c.dom.Document;

public class ServiceReferralCreator extends ClinicalDocumentCreator {

  private ServiceReferralCDAModel cdaModel;
  private ServiceReferral clinicalModel;
  private POCDMT000040ClinicalDocument clinicalDocument;
  private static ObjectFactory objectFactory = new ObjectFactory();
  private static au.net.electronichealth.ns.ci.cda.extensions._3.ObjectFactory objectFactoryExt = new au.net.electronichealth.ns.ci.cda.extensions._3.ObjectFactory();
  private static Map<String, CD> serviceReferralCodeMap;
  private POCDMT000040Component3 administrativeObsComponent;
  private ExclusionStatementComponent exclusionStatementComponent
      = new ExclusionStatementComponent();

  static {
    serviceReferralCodeMap = new HashMap<String, CD>() {{
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
      put(ClinicalDocumentCodes.INTERPRETER_REQUIRED, INTERPRETER_REQUIRED);
      put(ClinicalDocumentCodes.REQ_SERVICE_DATETIME, REQ_SERVICE_DATETIME);
      put(ClinicalDocumentCodes.REQ_VALIDITY_PERIOD, REQ_VALIDITY_PERIOD);
      put(ClinicalDocumentCodes.DOCUMENT_TITLE, DOCUMENT_TITLE);
      put(ClinicalDocumentCodes.RELATED_DOCUMENT, RELATED_DOCUMENT);
      put(ClinicalDocumentCodes.SERVICE_DESC, SERVICE_DESC);
      put(ClinicalDocumentCodes.REQ_URGENCY_NOTES, REQ_URGENCY_NOTES);
      put(ClinicalDocumentCodes.URGENT, URGENT);
      put(ClinicalDocumentCodes.INTERESTED_PARTY, INTERESTED_PARTY);
      put(ClinicalDocumentCodes.SERVICE_REFERRAL_DETAIL, SERVICE_REFERRAL_DETAIL);
      put(ClinicalDocumentCodes.SERVICE_COMMENT, SERVICE_COMMENT);
      put(ClinicalDocumentCodes.CURRENT_SERVICES, CURRENT_SERVICES);
    }};
  }

  public ServiceReferralCreator(ServiceReferralCDAModel cdaModel, ServiceReferral clinicalModel) {
    this.cdaModel = cdaModel;
    this.clinicalModel = clinicalModel;

    // for schematron checking
    this.resource = SchematronResources.SERVICE_REFERRAL_3A.resource();
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
    clinicalDocument =
        HeaderUtil.createClinicalDocument(cdaModel.getBaseClinicalDocument(), new DateTime());
    clinicalDocument.setCode(SectionEntryCodeSet.SERVICE_REFERRAL);
    clinicalDocument.setTitle(CDATypeUtil.getST(clinicalModel.getContext().getDocumentTitle()));
    clinicalDocument.setCompletionCode(
        Converter.convertToCECode(cdaModel.getCompletionClinicalDoucment().getCompletionCode()));
    //Subject of Care
    clinicalDocument.getRecordTarget()
        .add(HeaderUtil.createRecordTarget(clinicalModel.getContext().getSubjectOfCare()));
    //Document Author
    clinicalDocument.getAuthor().add(new DocumentAuthorComponent().getAuthor(clinicalModel
        .getContext().getDocumentAuthor(), cdaModel.getLegalAuthenticator()));
    if (cdaModel.getCustodian() != null) {
      clinicalDocument.setCustodian(
          HeaderUtil.createCustodian(cdaModel.getCustodian().getAssignedCustodian()
              .getRepresentedCustodianOrganization()));
    }
    if (null != clinicalModel.getContext().getPatientNominatedContacts()
        && !clinicalModel.getContext().getPatientNominatedContacts().isEmpty()) {
      clinicalModel.getContext().getPatientNominatedContacts().stream().filter(Objects::nonNull)
          .forEach(patientNominatedContact -> clinicalDocument.getParticipant()
              .add(getPatientNominatedContact(patientNominatedContact)));
    }
    //Primary Care Giver
    if (null != clinicalModel.getContext().getPrimaryCareGiver()) {
      clinicalDocument.getParticipant()
          .add(getPrimaryCareGiverParticipant(clinicalModel.getContext().getPrimaryCareGiver()));
    }
    //Interested Parties
    if (null != clinicalModel.getContext().getInterestedParties()) {
      clinicalModel.getContext().getInterestedParties().stream().filter(Objects::nonNull)
          .forEach(interestedParty -> clinicalDocument.getInformationRecipient()
              .add(getInterestedParties(interestedParty)));
    }
    //Information Recipient
    cdaModel.getInformationRecipients().stream().filter(Objects::nonNull).forEach(
        informationRecipient -> clinicalDocument.getInformationRecipient()
            .add(getInformationRecipient(informationRecipient))
    );

    // Construct Legal Authenticator
    if (cdaModel.getLegalAuthenticator() != null) {
      clinicalDocument.setLegalAuthenticator(
          HeaderUtil.createLegalAuthenticator(cdaModel.getLegalAuthenticator()));
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

  private POCDMT000040InformationRecipient getInterestedParties(
      ParticipationServiceProvider interestedParty) {

    //InformationRecipient / Interested Party - Start
    POCDMT000040InformationRecipient informationRecipientCda = null;

    // Mutually Exclusive (Healthcare Person or Organisation) -stop user initializing both (throw exception)
    if (null != interestedParty.getParticipant().getHealthCareProvider()) {
      informationRecipientCda = getInterestedPartyPerson(interestedParty);

    } else if (null != interestedParty.getParticipant().getOrganisation()) {
      informationRecipientCda = getInterestedPartyOrganization(interestedParty);
    }

    return informationRecipientCda;
  }


  private POCDMT000040InformationRecipient getInterestedPartyOrganization(
      ParticipationServiceProvider interestedParty) {
    POCDMT000040InformationRecipient informationRecipientCda = objectFactory
        .createPOCDMT000040InformationRecipient();
    //Participation Type
    informationRecipientCda.setTypeCode(XInformationRecipient.TRC);
    ServiceProvider serviceProvider = interestedParty.getParticipant();

    //Role
    if (null != interestedParty.getRole()) {
      POCDMT000040IntendedRecipient intendedRecipientCda = objectFactory
          .createPOCDMT000040IntendedRecipient();
      intendedRecipientCda.setClassCode(XInformationRecipientRole.ASSIGNED);
      intendedRecipientCda.setCode(Converter.convertToCECode(interestedParty.getRole()));
      intendedRecipientCda.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));

      if (null != interestedParty.getParticipant()) {
        //Represented Organisation
        POCDMT000040Organization receivedOrganizationCda = getOrganization(serviceProvider);
        intendedRecipientCda.setReceivedOrganization(receivedOrganizationCda);
        //Entity Identifier
        if (null != interestedParty.getParticipant().getEntityIdentifiers()) {
          serviceProvider.getEntityIdentifiers().stream().filter(Objects::nonNull)
              .forEach(asEntityIdentifier -> receivedOrganizationCda.getAsEntityIdentifier()
                  .add(Converter.convert(asEntityIdentifier)));
        } else {
          throw new RuntimeException(
              "Missing: Clinical Document > Information Recipient (Interested Party) "
                  + "> Entity Identifier");
        }
        //Electronic Communication Detail
        if (null != serviceProvider.getElectronicCommunicationDetails()
            && !serviceProvider.getElectronicCommunicationDetails().isEmpty()) {
          List<ElectronicCommunicationDetail> electronicCommunicationDetails =
              serviceProvider.getElectronicCommunicationDetails();
          intendedRecipientCda.getTelecom()
              .addAll(
                  Converter.convertElectronicCommunicationDetail(electronicCommunicationDetails));
        } else {
          throw new RuntimeException(
              "Missing: Clinical Document > Information Recipient (Interested Party) "
                  + "> Electronic Communication Detail");
        }
      } else {
        throw new RuntimeException(
            "Missing: Clinical Document > Information Recipient (Interested Party) "
                + "> Participant (Intended Recipient)");
      }
      informationRecipientCda.setIntendedRecipient(intendedRecipientCda);
    } else {
      throw new RuntimeException(
          "Missing: Clinical Document > Information Recipient (Interested Party) > Role");
    }
    return informationRecipientCda;
  }

  private POCDMT000040InformationRecipient getInterestedPartyPerson(
      ParticipationServiceProvider interestedParty) {
    POCDMT000040InformationRecipient informationRecipientCda = objectFactory
        .createPOCDMT000040InformationRecipient();
    //Participation Type
    informationRecipientCda.setTypeCode(XInformationRecipient.TRC);
    ServiceProvider serviceProvider = interestedParty.getParticipant();

    //Role
    if (null != interestedParty.getRole()) {
      POCDMT000040IntendedRecipient intendedRecipientCda = objectFactory
          .createPOCDMT000040IntendedRecipient();
      intendedRecipientCda.setClassCode(XInformationRecipientRole.ASSIGNED);
      intendedRecipientCda.setCode(Converter.convertToCECode(interestedParty.getRole()));
      intendedRecipientCda.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
      informationRecipientCda.setIntendedRecipient(intendedRecipientCda);

      if (null != interestedParty.getParticipant()) {
        POCDMT000040Person informationRecipientPersonCda = objectFactory.createPOCDMT000040Person();

        //Entity Identifier
        if (null != interestedParty.getParticipant().getEntityIdentifiers()) {
          serviceProvider.getEntityIdentifiers().stream().filter(Objects::nonNull)
              .forEach(asEntityIdentifier -> informationRecipientPersonCda.getAsEntityIdentifier()
                  .add(Converter.convert(asEntityIdentifier)));
        }
        //Address
        List<Address> addresses = serviceProvider.getAddresses();
        intendedRecipientCda.getAddr().addAll(AddressConverter.convertAustralianAddress(addresses));

        //Electronic Communication Detail
        if (null != serviceProvider.getElectronicCommunicationDetails()
            && !serviceProvider.getElectronicCommunicationDetails().isEmpty()) {
          List<ElectronicCommunicationDetail> electronicCommunicationDetails =
              serviceProvider.getElectronicCommunicationDetails();
          intendedRecipientCda.getTelecom()
              .addAll(
                  Converter.convertElectronicCommunicationDetail(electronicCommunicationDetails));
        } else {
          throw new RuntimeException(
              "Missing: Clinical Document > Information Recipient (Interested Party) "
                  + "> Electronic Communication Detail");
        }
        //Person Name
        if (null != serviceProvider.getHealthCareProvider()
            .getPersonNames()) {
          serviceProvider.getHealthCareProvider().getPersonNames().stream()
              .filter(Objects::nonNull).forEach(personName ->
              informationRecipientPersonCda.getName().add(Converter.getPersonName(personName)));
        } else {
          throw new RuntimeException(
              "Missing: Clinical Document > Information Recipient (Interested Party) "
                  + "> Person Names");
        }
        //Employment Detail
        if (null != serviceProvider.getHealthCareProvider()
            .getEmploymentOrganisation()) {
          //extension :  Employer Organisation for assigned Person
          Employment assignedPersonEmployment = getEmploymentDetails(serviceProvider);
          informationRecipientPersonCda.setAsEmployment(assignedPersonEmployment);
        } else {
          throw new RuntimeException(
              "Missing: Clinical Document > Information Recipient (Interested Party) "
                  + "> Employment Organisation");
        }
        //Qualifications
        Qualifications qualifications = getQualifications(serviceProvider);
        informationRecipientPersonCda.setAsQualifications(qualifications);

        intendedRecipientCda.setInformationRecipient(informationRecipientPersonCda);
      } else {
        throw new RuntimeException(
            "Missing: Clinical Document > Information Recipient (Interested Party) "
                + "> Participant (Intended Recipient)");
      }
    } else {
      throw new RuntimeException(
          "Missing: Clinical Document > Information Recipient (Interested Party) > Role");
    }

    return informationRecipientCda;
  }

  private POCDMT000040InformationRecipient getInformationRecipient(
      InformationRecipient informationRecipient) {

    POCDMT000040InformationRecipient informationRecipientCda = objectFactory
        .createPOCDMT000040InformationRecipient();
    informationRecipientCda.setTypeCode(XInformationRecipient.PRCP);
    if (null != informationRecipient.getIntendedRecipient()) {
      POCDMT000040IntendedRecipient intendedRecipientCda = objectFactory
          .createPOCDMT000040IntendedRecipient();
      intendedRecipientCda.setClassCode(XInformationRecipientRole.ASSIGNED);
      intendedRecipientCda.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
      intendedRecipientCda.getAddr().addAll(
          Converter.convertAddresses(informationRecipient.getIntendedRecipient().getAddress()));
      intendedRecipientCda.getTelecom()
          .addAll(Converter.convert(informationRecipient.getIntendedRecipient().getTelecom()));
      POCDMT000040Person assignedPerson = objectFactory.createPOCDMT000040Person();
      assignedPerson.getAsEntityIdentifier().add(Converter.convert(informationRecipient
          .getIntendedRecipient().getAssignedPerson().getAsEntityIdentifier()));
      assignedPerson.getName().addAll(Converter
          .convertNames(informationRecipient.getIntendedRecipient().getAssignedPerson().getName()));
      intendedRecipientCda.setInformationRecipient(assignedPerson);
      informationRecipientCda.setIntendedRecipient(intendedRecipientCda);
      return informationRecipientCda;
    } else {
      throw new RuntimeException(
          "Missing: Clinical Document > Information Recipient > Intended Recipient");
    }
  }

  private POCDMT000040Participant1 getPrimaryCareGiverParticipant(
      ParticipationServiceProvider primaryCareGiver) {
    POCDMT000040Participant1 primaryCareGiverParticipant = objectFactory
        .createPOCDMT000040Participant1();
    primaryCareGiverParticipant.setTypeCode(ParticipationType.PART);
    primaryCareGiverParticipant.setFunctionCode(Converter.convertToCECode(new CodeImpl() {{
      setCode("PCP");
    }}));
    POCDMT000040AssociatedEntity associatedEntity = getAssociatedEntityForParticipantServiceProvider(
        primaryCareGiver,
        RoleClassAssociative.PROV);
    primaryCareGiverParticipant.setAssociatedEntity(associatedEntity);
    if (null != primaryCareGiver.getParticipant().getHealthCareProvider()) {
      POCDMT000040Person associatedPerson = objectFactory.createPOCDMT000040Person();
      associatedEntity.setAssociatedPerson(associatedPerson);
      handleAsPersonOrHealthcareProvider(primaryCareGiver, associatedPerson,
          associatedEntity);
      if (null != primaryCareGiver.getParticipant().getEntityIdentifiers()) {
        associatedPerson.getAsEntityIdentifier().addAll(Converter
            .convertEntityIdentifiers(primaryCareGiver.getParticipant().getEntityIdentifiers()));
      }
      if (null != primaryCareGiver.getParticipant().getHealthCareProvider().getEntitlements()) {
        primaryCareGiver.getParticipant().getHealthCareProvider().getEntitlements().stream()
            .filter(Objects::nonNull).forEach(
            entitlement -> administrativeObsComponent.getSection().getCoverage2()
                .add(DiagnosticInvestigationComponent.getEntitlementCoverage(entitlement
                    , associatedEntity.getId().get(0).getRoot())));
      }
    } else {
      handleAsOrganization(primaryCareGiver.getParticipant(), associatedEntity);
    }
    return primaryCareGiverParticipant;
  }

  private POCDMT000040Participant1 getPatientNominatedContact(
      ParticipationServiceProvider patientNominatedContact) {
    POCDMT000040Participant1 contactParticipant = objectFactory.createPOCDMT000040Participant1();
    //Location of participation is currently not mapped (under "Known issues" in spec)
    contactParticipant.setTypeCode(ParticipationType.IRCP);
    ServiceProvider nominatedServiceProvider = patientNominatedContact.getParticipant();
    POCDMT000040AssociatedEntity associatedEntity = getAssociatedEntityForParticipantServiceProvider(
        patientNominatedContact, RoleClassAssociative.CON);
    if (null != nominatedServiceProvider.getHealthCareProvider()) {//Health Care Provider/Person
      POCDMT000040Person nominatedPerson = objectFactory.createPOCDMT000040Person();
      associatedEntity.setAssociatedPerson(nominatedPerson);
      handleAsPersonOrHealthcareProvider(patientNominatedContact, nominatedPerson,
          associatedEntity);
    } else {//Organization
      handleAsOrganization(nominatedServiceProvider, associatedEntity);
    }
    contactParticipant.setAssociatedEntity(associatedEntity);
    return contactParticipant;
  }

  private void handleAsOrganization(ServiceProvider serviceProvider,
      POCDMT000040AssociatedEntity associatedEntity) {
    if (null == serviceProvider.getOrganisation()) {
      throw new RuntimeException("Data does not exist for nominated contact > organization");
    }
    POCDMT000040Organization scopingOrg = objectFactory.createPOCDMT000040Organization();
    POCDMT000040OrganizationPartOf organizationPartOf = objectFactory
        .createPOCDMT000040OrganizationPartOf();
    POCDMT000040Organization wholeOrganization = objectFactory.createPOCDMT000040Organization();
    if (null != serviceProvider.getEntityIdentifiers()
        && !serviceProvider.getEntityIdentifiers().isEmpty()) {
      wholeOrganization.getAsEntityIdentifier().addAll(
          Converter.convertEntityIdentifiers(serviceProvider.getEntityIdentifiers()));
    }
    if (null != serviceProvider.getOrganisation().getDepartmentUnit()) {
      scopingOrg.getName().add(Converter.getOrganizationNameAndUse(
          serviceProvider.getOrganisation().getDepartmentUnit()));
    }
    if (null != serviceProvider.getOrganisation().getOrganisationName()) {
      wholeOrganization.getName()
          .add(Converter.getOrganizationNameAndUse(serviceProvider.getOrganisation()));
    }
    organizationPartOf.setWholeOrganization(wholeOrganization);
    scopingOrg.setAsOrganizationPartOf(organizationPartOf);
    associatedEntity.setScopingOrganization(scopingOrg);
  }

  private void handleAsPersonOrHealthcareProvider(
      ParticipationServiceProvider participationServiceProvider,
      POCDMT000040Person associatedPerson, POCDMT000040AssociatedEntity associatedEntity) {
    ServiceProvider serviceProvider = participationServiceProvider.getParticipant();
    PersonHealthcareProvider healthcareProvider = serviceProvider.getHealthCareProvider();
    if (null != healthcareProvider.getPersonNames()
        && !healthcareProvider.getPersonNames().isEmpty()) {
      healthcareProvider.getPersonNames().stream().filter(Objects::nonNull).forEach(
          personName -> associatedPerson.getName().add(Converter.getPersonName(personName)));
    } else {
      throw new RuntimeException(
          "Missing attribute: Nomincated Contact > Participant > Associated Person > Person Name");
    }
    if (null != serviceProvider.getAddresses() && !serviceProvider.getAddresses().isEmpty()) {
      associatedEntity.getAddr()
          .addAll(AddressConverter.convertAustralianAddress(serviceProvider.getAddresses()));
    }
    if (null != serviceProvider.getElectronicCommunicationDetails()
        && !serviceProvider.getElectronicCommunicationDetails().isEmpty()) {
      associatedEntity.getTelecom().addAll(Converter.convertElectronicCommunicationDetail(
          serviceProvider.getElectronicCommunicationDetails()));
    }
    if (null != healthcareProvider.getEmploymentOrganisation()) {
      if (null != healthcareProvider.getEmploymentOrganisation().getEmploymentType()) {
        associatedPerson
            .setAsEmployment(getEmploymentDetails(participationServiceProvider.getParticipant()));
      }
    }
    processRelationshipToSubjectOfCare(associatedPerson, healthcareProvider);
  }

  private void processRelationshipToSubjectOfCare(POCDMT000040Person nominatedPerson,
      PersonHealthcareProvider healthcareProvider) {
    //Applicable to Primary Caregiver
    if (null != healthcareProvider.getRelationshipToSubjectOfCare()) {
      PersonalRelationship relationshipToSubjectOfCareCDA = objectFactoryExt
          .createPersonalRelationship();
      relationshipToSubjectOfCareCDA.setClassCode(RoleClass.PRS);
      relationshipToSubjectOfCareCDA.setCode(Converter.convertToCDCode(new CodeImpl() {{
        setCode(healthcareProvider.getRelationshipToSubjectOfCare().getCode());
        setDisplayName(healthcareProvider.getRelationshipToSubjectOfCare().getName());
      }}));
      relationshipToSubjectOfCareCDA
          .setId(clinicalDocument.getRecordTarget().get(0).getPatientRole().getId().get(0));
      nominatedPerson.getPersonalRelationship().add(relationshipToSubjectOfCareCDA);
    }
  }

  private POCDMT000040AssociatedEntity getAssociatedEntityForParticipantServiceProvider(
      ParticipationServiceProvider patientNominatedContact,
      RoleClassAssociative roleClassAssociative) {
    ServiceProvider nominatedServiceProvider = patientNominatedContact.getParticipant();
    POCDMT000040AssociatedEntity associatedEntity = objectFactory
        .createPOCDMT000040AssociatedEntity();
    associatedEntity.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    associatedEntity.setClassCode(roleClassAssociative);
    associatedEntity.setCode(Converter.convertToCECode(patientNominatedContact.getRole()));
    if (null != nominatedServiceProvider.getAddresses()) {
      associatedEntity.getAddr().addAll(AddressConverter
          .convertAustralianAddress(nominatedServiceProvider.getAddresses()));
    }
    if (null != nominatedServiceProvider.getElectronicCommunicationDetails()) {
      associatedEntity.getTelecom().addAll(Converter.convertElectronicCommunicationDetail(
          nominatedServiceProvider.getElectronicCommunicationDetails()));
    }
    return associatedEntity;
  }

  private POCDMT000040Component2 getCDABody() {
    POCDMT000040Component2 component = objectFactory.createPOCDMT000040Component2();
    POCDMT000040StructuredBody structuredBody = objectFactory.createPOCDMT000040StructuredBody();
    structuredBody.getComponent().add(getRelatedDocuments());
    administrativeObsComponent = new AdministrativeObservationsComponent()
        .getComponent(clinicalModel.getContext().getSubjectOfCare(),
            clinicalModel.getContext().getDocumentAuthor());
    structuredBody.getComponent().add(administrativeObsComponent);
    if (null != this.clinicalModel.getContent().getServiceReferralDetail()
        .getInterpreterRequiredAlert()) {
      administrativeObsComponent.getSection().getEntry().add(addInterpreterRequiredAlertEntry());
      if (null != administrativeObsComponent.getSection().getText()) {
        getInterpreterRequiredAlert(administrativeObsComponent.getSection().getText(),
            this.clinicalModel.getContent().getServiceReferralDetail()
                .getInterpreterRequiredAlert());
      }
    }
    if (null != clinicalModel.getContent().getCurrentServices()
        && !clinicalModel.getContent().getCurrentServices().getCurrentServices().isEmpty()) {
      structuredBody.getComponent().add(getCurrentServices());
    }
    processAdverseReactions(structuredBody);
    if (null != this.clinicalModel.getContent().getMedications()) {
      structuredBody.getComponent().add(getMedications(clinicalModel.getContent()
          .getMedications()));
    }
    if (null != this.clinicalModel.getContent().getPastAndCurrentMedicalHistory()) {
      MedicalHistoryComponent medicalHistoryComponent = new MedicalHistoryComponent(
          serviceReferralCodeMap);
      structuredBody.getComponent().add(medicalHistoryComponent
          .getMedicalHistory(clinicalModel.getContent().getPastAndCurrentMedicalHistory(),
              "Medical History"));
    }
    processDiagnosticInvestigation(structuredBody);
    component.setStructuredBody(structuredBody);
    return component;
  }

  private void processAdverseReactions(POCDMT000040StructuredBody structuredBody) {
    AdverseReactions adverseReactionsObj = clinicalModel.getContent().getAdverseReactions();
    if (null != adverseReactionsObj) {
      //Exclusion statement and Adverse Reaction is mutually exclusive
      if (null != adverseReactionsObj.getExclusionStatement()
          && null != adverseReactionsObj.getAdverseReactions()) {
        throw new RuntimeException(
            "Invalid service referral data : adverse reactions can only have either exclusion "
                + "statement or and adverse reaction");
      }
      POCDMT000040Section adverseReactionSection = objectFactory.createPOCDMT000040Section();
      //Check if an exclusion statement exists for adverse reactions
      if (null != adverseReactionsObj.getExclusionStatement()) {
        //if the exclusion statement exists, check if it has a global statement
        //associated with it. If it does, add the exclusion statement
        if (null != adverseReactionsObj.getExclusionStatement().getGlobalStatement()) {
          Coded globalStatement = adverseReactionsObj.getExclusionStatement().getGlobalStatement();
          adverseReactionSection.getEntry()
              .add(exclusionStatementComponent
                  .createExclusionStatement(ADVERSE_REACTIONS_GLOBAL_STATEMENT, globalStatement,
                      ActClassObservation.OBS, XActMoodDocumentObservation.EVN));
        } else {
          throw new RuntimeException(
              "Mandatory Attribute Missing : Service Referral  > Adverse Reactions > "
                  + "Exclusion Statement > Global Statement");
        }
      } else { //If exclusion statement is empty, the Adverse Reaction component can be created
        AdverseReactionComponent adverseReactionComponent = new AdverseReactionComponent(
            serviceReferralCodeMap);
        structuredBody.getComponent().add(adverseReactionComponent.getAdverseReactions(
            clinicalModel.getContent().getAdverseReactions()));
      }
    }
  }

  private void processDiagnosticInvestigation(POCDMT000040StructuredBody structuredBody) {
    if (null != clinicalModel.getContent().getDiagnosticInvestigations()) {
      DiagnosticInvestigations diagnosticInvestigations = clinicalModel.getContent()
          .getDiagnosticInvestigations();
      POCDMT000040Component3 diagnosticInvestigationsComponent = objectFactory
          .createPOCDMT000040Component3();
      diagnosticInvestigationsComponent.setTypeCode(ActRelationshipHasComponent.COMP);
      DiagnosticInvestigationComponent diagnosticInvestigationComponent = new DiagnosticInvestigationComponent(
          serviceReferralCodeMap);
      POCDMT000040Section diagnosticInvestigationsSection = getDiagnosticInvestigationSection();
      // Other Test Results - Undifferentiated Pathology & Radiology report(s)
      diagnosticInvestigationComponent
          .createOtherTestResults(diagnosticInvestigations, diagnosticInvestigationsSection);
      // Requested Service List
      if (null != diagnosticInvestigations.getRequestedServicesServiceReferral()
          && !diagnosticInvestigations.getRequestedServicesServiceReferral().isEmpty()) {
        diagnosticInvestigations.getRequestedServicesServiceReferral().stream()
            .filter(Objects::nonNull).forEach(service ->
            diagnosticInvestigationsSection.getEntry().add(getRequestedServiceEntry(service, false))
        );
        NarrativeUtil.getRequestedServices(diagnosticInvestigationsSection.getText(),
            diagnosticInvestigations.getRequestedServicesServiceReferral());
      }
      // Pathology Test Results List
      diagnosticInvestigationComponent
          .createPathologyTestResults(diagnosticInvestigations, diagnosticInvestigationsSection);
      // Imaging Examination Results List
      diagnosticInvestigationComponent.createImagingExaminationResults(diagnosticInvestigations,
          diagnosticInvestigationsSection);
      diagnosticInvestigationsComponent.setSection(diagnosticInvestigationsSection);
      structuredBody.getComponent().add(diagnosticInvestigationsComponent);
    }
  }

  private POCDMT000040Section getDiagnosticInvestigationSection() {
    POCDMT000040Section diagnosticInvestigationsSection = objectFactory
        .createPOCDMT000040Section();
    diagnosticInvestigationsSection.setClassCode(ActClass.DOCSECT);
    diagnosticInvestigationsSection.setMoodCode(ActMood.EVN);
    diagnosticInvestigationsSection.setId(CDATypeUtil.getII(UUID.randomUUID().toString()));
    diagnosticInvestigationsSection.setCode(
        (CE) serviceReferralCodeMap.get(ClinicalDocumentCodes.DIAGNOSTIC_INVESTIGATIONS));
    diagnosticInvestigationsSection.setTitle(CDATypeUtil.getST(
        serviceReferralCodeMap.get(ClinicalDocumentCodes.DIAGNOSTIC_INVESTIGATIONS)
            .getDisplayName()));
    diagnosticInvestigationsSection
        .setText(NarrativeUtilCommon.DIAGNOSTIC_INVESTIGATIONS_SECTION_TEXT);
    return diagnosticInvestigationsSection;
  }

  private POCDMT000040Component3 getCurrentServices() {
    POCDMT000040Component3 currentServicesComponent = objectFactory.createPOCDMT000040Component3();
    POCDMT000040Section currentServicesSection = objectFactory.createPOCDMT000040Section();
    currentServicesComponent.setSection(currentServicesSection);
    clinicalModel.getContent().getCurrentServices().getCurrentServices().stream()
        .filter(Objects::nonNull).forEach(currentService -> currentServicesSection.getEntry()
        .add(getRequestedServiceEntry(currentService, true)));
    currentServicesSection.setTitle(CDATypeUtil.getST(
        serviceReferralCodeMap.get(ClinicalDocumentCodes.CURRENT_SERVICES).getDisplayName()));
    currentServicesSection.setCode(
        (CE) serviceReferralCodeMap.get(ClinicalDocumentCodes.CURRENT_SERVICES));
    currentServicesSection.setText(
        NarrativeUtil.getCurrentServices(clinicalModel.getContent().getCurrentServices()));
    return currentServicesComponent;
  }

  public POCDMT000040Component3 getMedications(Medications medicationsObj) {
    POCDMT000040Component3 medicationsComponent = objectFactory.createPOCDMT000040Component3();

    //Exclusion statement and Medications is mutually exclusive
    if (null != medicationsObj.getExclusionStatement()
        && null != medicationsObj.getKnownMedications()) {
      throw new RuntimeException(
          "Invalid service referral data :medications can only have either exclusion "
              + "statement or and medications");
    }

    POCDMT000040Section medicationSection = objectFactory.createPOCDMT000040Section();
    medicationSection.setId(CDATypeUtil.getII(UUID.randomUUID().toString()));
    medicationSection.setCode(MEDICATION_ORDERS);
    medicationSection.setTitle(CDATypeUtil.getST("Medications"));

    //Check if an exclusion statement exists for medications
    if (null != medicationsObj.getExclusionStatement()) {
      //if the exclusion statement exists, check if it has a global statement
      //associated with it. If it does, add the exclusion statement
      if (null != medicationsObj.getExclusionStatement().getGlobalStatement()) {
        Coded globalStatement = medicationsObj.getExclusionStatement().getGlobalStatement();
        medicationSection.getEntry().add(exclusionStatementComponent
            .createExclusionStatement(MEDICATIONS_GLOBAL_STATEMENT, globalStatement,
                ActClassObservation.OBS, XActMoodDocumentObservation.EVN));
      } else {
        throw new RuntimeException(
            "Mandatory Attribute Missing : Service Referral  > Medications > "
                + "Exclusion Statement > Global Statement");
      }
      //If the exclusion statement is null, the Known Medications components can be created
    } else if (null != medicationsObj.getKnownMedications() && !medicationsObj.getKnownMedications()
        .isEmpty()) {
      List<KnownMedication> knownMedications = medicationsObj.getKnownMedications();
      knownMedications.stream().filter(Objects::nonNull).forEach(
          knownMedication -> medicationSection.getEntry()
              .add(getKnownMedicationEntry(knownMedication)));
      medicationSection.setText(NarrativeUtilCommon.getMedications(medicationsObj));
    }
    medicationsComponent.setSection(medicationSection);
    return medicationsComponent;
  }

  private POCDMT000040Entry getKnownMedicationEntry(KnownMedication knownMedication) {
    POCDMT000040Entry knownMedicationEntry = objectFactory.createPOCDMT000040Entry();
    POCDMT000040SubstanceAdministration substanceAdministration =
        new POCDMT000040SubstanceAdministration();
    substanceAdministration.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    substanceAdministration.setClassCode(ActClass.SBADM);
    substanceAdministration.setMoodCode(XDocumentSubstanceMood.EVN);
    substanceAdministration.setText(CDATypeUtil.getST(knownMedication.getDirections()));
    if (NCTISChanceTypeValues.CEASED.getCodeValue().getCode().equals(knownMedication.getChangeType()
        .getCode())
        && NCTISRecommendationOrChangeValues.CHANGE_HAS_BEEN_MADE.getCodeValue().getCode()
        .equals(knownMedication.getChangeStatus().getCode())) {
      substanceAdministration.setNegationInd(true);
    }
    POCDMT000040Consumable consumable = objectFactory.createPOCDMT000040Consumable();
    POCDMT000040ManufacturedProduct manufacturedProduct = new POCDMT000040ManufacturedProduct();
    POCDMT000040Material manufacturedMaterial = objectFactory.createPOCDMT000040Material();
    manufacturedMaterial.setCode(
        Converter.convertToCECode(knownMedication.getTherapeuticGoodIdentification()));
    manufacturedProduct.setManufacturedMaterial(manufacturedMaterial);
    consumable.setManufacturedProduct(manufacturedProduct);
    substanceAdministration.setConsumable(consumable);
    MedicationComponent medicationComponent = new MedicationComponent(serviceReferralCodeMap);
    substanceAdministration.getEntryRelationship()
        .add(medicationComponent
            .getClinicalIndicationEntryRelationshipForKnownMedication(knownMedication));
    substanceAdministration.getEntryRelationship()
        .add(medicationComponent.getCommentEntryRelationshipForKnownMedication(knownMedication));
    knownMedicationEntry.setSubstanceAdministration(substanceAdministration);
    return knownMedicationEntry;
  }

  private POCDMT000040Entry addInterpreterRequiredAlertEntry() {
    InterpreterRequiredAlert interpreterRequiredAlert = this.clinicalModel.getContent()
        .getServiceReferralDetail().getInterpreterRequiredAlert();
    POCDMT000040Entry interpreterRequiredAlertEntry = objectFactory.createPOCDMT000040Entry();
    POCDMT000040Observation interpreterReqObs = objectFactory.createPOCDMT000040Observation();
    interpreterReqObs.setClassCode(ActClassObservation.OBS);
    interpreterReqObs.setMoodCode(XActMoodDocumentObservation.EVN);
    interpreterReqObs
        .setCode(serviceReferralCodeMap.get(ClinicalDocumentCodes.INTERPRETER_REQUIRED));
    if (null != interpreterRequiredAlert.getPreferredLanguages()) {
      interpreterRequiredAlert.getPreferredLanguages().stream().filter(Objects::nonNull).forEach(
          preferredLang -> interpreterReqObs.getValue()
              .add(CDATypeUtil.getCS(preferredLang.getCode())));
    } else {
      throw new RuntimeException(
          "Missing info : Interpreter Required Alert > Preferred Language(s)");
    }
    interpreterReqObs.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    interpreterRequiredAlertEntry.setObservation(interpreterReqObs);
    return interpreterRequiredAlertEntry;
  }

  private POCDMT000040Component3 getRelatedDocuments() {
    POCDMT000040Component3 referenceDetailComp = objectFactory.createPOCDMT000040Component3();
    POCDMT000040Section referenceDetailSection = objectFactory.createPOCDMT000040Section();
    referenceDetailSection.setId(CDATypeUtil.getII(UUID.randomUUID().toString()));
    referenceDetailSection
        .setCode((CE) serviceReferralCodeMap.get(ClinicalDocumentCodes.SERVICE_REFERRAL_DETAIL));
    referenceDetailSection.setTitle(CDATypeUtil.getST("Referral Detail"));
    if (null != clinicalModel.getContext().getRelatedDocuments()
        && !clinicalModel.getContext().getRelatedDocuments().isEmpty()) {
      clinicalModel.getContext().getRelatedDocuments().stream().filter(Objects::nonNull)
          .forEach(relatedDocument -> referenceDetailSection.getEntry()
              .add(getRelatedDocumentEntry(relatedDocument)));
      referenceDetailSection.setText(
          NarrativeUtil.getRelatedDocuments(clinicalModel.getContext().getRelatedDocuments()));
    }
    //Add Requested Services
    if (null == clinicalModel.getContent().getServiceReferralDetail().getRequestedServices()) {
      throw new RuntimeException(
          "Missing data : Service Referral > Service Referral Detail > Requested Services");
    }
    clinicalModel.getContent().getServiceReferralDetail().getRequestedServices().stream()
        .filter(Objects::nonNull).forEach(requestedService -> referenceDetailSection.getEntry()
        .add(getRequestedServiceEntry(requestedService, false)));
    NarrativeUtil.getRequestedServices(referenceDetailSection.getText(),
        clinicalModel.getContent().getServiceReferralDetail().getRequestedServices());
    // Other Alerts
    if (null != clinicalModel.getContent().getServiceReferralDetail().getOtherAlert()
        && !clinicalModel.getContent().getServiceReferralDetail().getOtherAlert().isEmpty()) {
      clinicalModel.getContent().getServiceReferralDetail().getOtherAlert().stream()
          .filter(Objects::nonNull).forEach(
          otherAlert -> referenceDetailSection.getEntry().add(getOtherAlertEntry(otherAlert)));
      NarrativeUtil.getOtherAlerts(referenceDetailSection.getText(),
          clinicalModel.getContent().getServiceReferralDetail().getOtherAlert());
    }
    referenceDetailComp.setSection(referenceDetailSection);
    return referenceDetailComp;
  }

  private POCDMT000040Entry getOtherAlertEntry(OtherAlert otherAlert) {
    POCDMT000040Entry otherAlertEntry = objectFactory.createPOCDMT000040Entry();
    POCDMT000040Observation otherAlertObs = objectFactory.createPOCDMT000040Observation();
    otherAlertObs.setClassCode(ActClassObservation.ALRT);
    otherAlertObs.setMoodCode(XActMoodDocumentObservation.EVN);
    otherAlertObs.setCode(Converter.convertToCDCode(otherAlert.getAlertType()));
    otherAlertObs.getValue().add(Converter.convertToCDCode(otherAlert.getAlertDesc()));
    otherAlertObs.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    otherAlertEntry.setObservation(otherAlertObs);
    return otherAlertEntry;
  }

  private POCDMT000040Entry getRequestedServiceEntry(RequestedService requestedService,
      boolean isCurrentService) {
    POCDMT000040Entry reqServiceEntry = objectFactory.createPOCDMT000040Entry();
    POCDMT000040Act reqServiceAct = objectFactory.createPOCDMT000040Act();
    reqServiceAct.setClassCode(XActClassDocumentEntryAct.ACT);
    reqServiceAct.setMoodCode(XDocumentActMood.EVN);
    if (null != requestedService.getServiceCategory()) {
      reqServiceAct.setCode(Converter.convertToCDCode(requestedService.getServiceCategory()));
    }
    if (null != requestedService.getReasonForService()) {
      reqServiceAct.getEntryRelationship().add(getReasonForServiceEntryRelationship(
          requestedService));
    }
    if (null != requestedService.getServiceDesc()) {
      reqServiceAct.getEntryRelationship().add(getServiceDescEntryRelationship(requestedService));
    }
    if (null != requestedService.getRequestUrgencyNotes()) {
      reqServiceAct.getEntryRelationship()
          .add(getReqUrgencyNotesEntryRelationship(requestedService));
    }
    if (null != requestedService.getRequestValidityPeriod()) {
      reqServiceAct.getEntryRelationship()
          .add(getReqValidityPeriodEntryRelationship(requestedService));
    }
    if (null != requestedService.getRequestedServiceDateTime()) {
      reqServiceAct.getEntryRelationship()
          .add(getReqServiceDateTimeEntryRelationship(requestedService));
    } else {
      throw new RuntimeException(
          "Mandatory attribute missing: Requested Service > Requested Service DataTime");
    }
    //Mutually Exclusive (None mandatory for Current Services)
    if (null != requestedService.getDateTimeServiceScheduled()) {
      reqServiceAct
          .setEffectiveTime(Converter.convert(requestedService.getDateTimeServiceScheduled()));
    } else {
      if (null != requestedService.getServiceCommencementWindow()) {
        reqServiceAct
            .setEffectiveTime(Converter.convert(requestedService.getServiceCommencementWindow()));
      }
    }
    reqServiceAct.setPriorityCode((CE) serviceReferralCodeMap.get(ClinicalDocumentCodes.URGENT));
    //reqServiceAct.setMoodCode(requestedService.getServiceBookingStatusMoodCode());
    if (null != requestedService.getServiceProvider()) {
      POCDMT000040Performer2 serviceProviderPerformer = DiagnosticInvestigationComponent
          .getServiceProviderPerformer(requestedService.getServiceProvider(), true);
      if (isCurrentService) {
        serviceProviderPerformer.getAssignedEntity().setRepresentedOrganization(
            getOrganization(requestedService.getServiceProvider().getParticipant()));
      }
      reqServiceAct.getPerformer().add(serviceProviderPerformer);
    }
    reqServiceAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    reqServiceEntry.setAct(reqServiceAct);
    return reqServiceEntry;
  }

  private POCDMT000040EntryRelationship getReqServiceDateTimeEntryRelationship(
      RequestedService requestedService) {
    POCDMT000040EntryRelationship reqServiceDateTimeEntryRel = objectFactory
        .createPOCDMT000040EntryRelationship();
    reqServiceDateTimeEntryRel.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Act reqServiceDateTimeAct = objectFactory.createPOCDMT000040Act();
    reqServiceDateTimeAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    reqServiceDateTimeAct.setClassCode(XActClassDocumentEntryAct.ACT);
    reqServiceDateTimeAct.setMoodCode(XDocumentActMood.EVN);
    reqServiceDateTimeAct.setCode(REQ_SERVICE_DATETIME);
    reqServiceDateTimeAct
        .setEffectiveTime(Converter.convert(requestedService.getRequestedServiceDateTime()));
    reqServiceDateTimeEntryRel.setAct(reqServiceDateTimeAct);
    return reqServiceDateTimeEntryRel;
  }

  private POCDMT000040EntryRelationship getReqValidityPeriodEntryRelationship(
      RequestedService requestedService) {
    POCDMT000040EntryRelationship reqValidityPeriodEntryRel = objectFactory
        .createPOCDMT000040EntryRelationship();
    reqValidityPeriodEntryRel.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Act reqValidityPeriodAct = objectFactory.createPOCDMT000040Act();
    reqValidityPeriodAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    reqValidityPeriodAct.setClassCode(XActClassDocumentEntryAct.INFRM);
    reqValidityPeriodAct.setMoodCode(XDocumentActMood.EVN);
    reqValidityPeriodAct
        .setCode(serviceReferralCodeMap.get(ClinicalDocumentCodes.REQ_VALIDITY_PERIOD));
    reqValidityPeriodAct
        .setEffectiveTime(Converter.convert(requestedService.getRequestValidityPeriod()));
    reqValidityPeriodEntryRel.setAct(reqValidityPeriodAct);
    return reqValidityPeriodEntryRel;
  }

  private POCDMT000040EntryRelationship getReqUrgencyNotesEntryRelationship(
      RequestedService requestedService) {
    POCDMT000040EntryRelationship reqUrgencyNotesEntryRel = objectFactory
        .createPOCDMT000040EntryRelationship();
    reqUrgencyNotesEntryRel.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Act reqUrgencyNotesAct = objectFactory.createPOCDMT000040Act();
    reqUrgencyNotesAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    reqUrgencyNotesAct.setClassCode(XActClassDocumentEntryAct.INFRM);
    reqUrgencyNotesAct.setMoodCode(XDocumentActMood.EVN);
    reqUrgencyNotesAct.setCode(serviceReferralCodeMap.get(ClinicalDocumentCodes.REQ_URGENCY_NOTES));
    reqUrgencyNotesAct.setText(CDATypeUtil.getST(requestedService.getRequestUrgencyNotes()));
    reqUrgencyNotesEntryRel.setAct(reqUrgencyNotesAct);
    return reqUrgencyNotesEntryRel;
  }

  private POCDMT000040EntryRelationship getServiceDescEntryRelationship(
      RequestedService requestedService) {
    POCDMT000040EntryRelationship serviceDescEntryRel = objectFactory
        .createPOCDMT000040EntryRelationship();
    serviceDescEntryRel.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Observation serviceDescObs = objectFactory.createPOCDMT000040Observation();
    serviceDescObs.setClassCode(ActClassObservation.OBS);
    serviceDescObs.setMoodCode(XActMoodDocumentObservation.EVN);
    serviceDescObs.setCode(serviceReferralCodeMap.get(ClinicalDocumentCodes.SERVICE_DESC));
    serviceDescObs.getValue().add(Converter.convertToCDCode(requestedService.getServiceDesc()));
    serviceDescEntryRel.setObservation(serviceDescObs);
    return serviceDescEntryRel;
  }

  private POCDMT000040EntryRelationship getReasonForServiceEntryRelationship(
      RequestedService requestedService) {
    POCDMT000040EntryRelationship reasonForServiceEntryRel = objectFactory
        .createPOCDMT000040EntryRelationship();
    reasonForServiceEntryRel.setTypeCode(XActRelationshipEntryRelationship.COMP);
    POCDMT000040Act reasonForServiceAct = objectFactory.createPOCDMT000040Act();
    reasonForServiceAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    reasonForServiceAct.setClassCode(XActClassDocumentEntryAct.ACT);
    reasonForServiceAct.setMoodCode(XDocumentActMood.EVN);
    reasonForServiceAct.setCode(Converter.convertToCDCode(requestedService.getReasonForService()));
    reasonForServiceAct.setText(CDATypeUtil.getST(requestedService.getReasonForServiceDesc()));
    reasonForServiceEntryRel.setAct(reasonForServiceAct);
    return reasonForServiceEntryRel;
  }

  private POCDMT000040Entry getRelatedDocumentEntry(RelatedDocument relatedDocument) {
    POCDMT000040Entry relatedDocEntry = objectFactory.createPOCDMT000040Entry();
    POCDMT000040Act relatedDocAct = objectFactory.createPOCDMT000040Act();
    relatedDocAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    relatedDocAct.setClassCode(XActClassDocumentEntryAct.ACT);
    relatedDocAct.setMoodCode(XDocumentActMood.EVN);
    relatedDocAct.setCode(serviceReferralCodeMap.get(ClinicalDocumentCodes.RELATED_DOCUMENT));
    //Related Document > Link Nature
    POCDMT000040Reference linkReference = objectFactory.createPOCDMT000040Reference();
    linkReference.setSeperatableInd(CDATypeUtil.getBL(true));
    linkReference.setTypeCode(XActRelationshipExternalReference.REFR);
    relatedDocAct.getReference().add(linkReference);
    //Related Document > Document Target
    POCDMT000040ExternalDocument externalDocument = objectFactory
        .createPOCDMT000040ExternalDocument();
    externalDocument.setClassCode(ActClassDocument.DOC);
    externalDocument.setMoodCode(ActMood.EVN);
    externalDocument.setText(DiagnosticInvestigationComponent
        .getEDFromAttachedMedia(relatedDocument.getDocumentTarget()));
    processDocumentDetail(relatedDocument, relatedDocAct, externalDocument);
    linkReference.setExternalDocument(externalDocument);
    relatedDocEntry.setAct(relatedDocAct);
    return relatedDocEntry;
  }

  private void processDocumentDetail(RelatedDocument relatedDocument, POCDMT000040Act relatedDocAct,
      POCDMT000040ExternalDocument externalDocument) {
    if (null != relatedDocument.getDocumentDetail()) {
      if (null != relatedDocument.getDocumentDetail().getDocumentType()) {
        externalDocument.setCode(
            Converter.convertToCDCode(relatedDocument.getDocumentDetail().getDocumentType()));
      }
      if (null != relatedDocument.getDocumentDetail().getDocumentTitle()) {
        POCDMT000040EntryRelationship docTitleEntryRelationship = objectFactory
            .createPOCDMT000040EntryRelationship();
        docTitleEntryRelationship.setTypeCode(XActRelationshipEntryRelationship.COMP);
        POCDMT000040Act docTitleAct = objectFactory.createPOCDMT000040Act();
        docTitleAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
        docTitleAct.setClassCode(XActClassDocumentEntryAct.ACT);
        docTitleAct.setMoodCode(XDocumentActMood.EVN);
        docTitleAct.setCode(serviceReferralCodeMap.get(ClinicalDocumentCodes.DOCUMENT_TITLE));
        docTitleAct.setText(
            CDATypeUtil.getST(relatedDocument.getDocumentDetail().getDocumentTitle()));
        docTitleEntryRelationship.setAct(docTitleAct);
        relatedDocAct.getEntryRelationship().add(docTitleEntryRelationship);
      } else {
        throw new RuntimeException(
            "Mandatory attribute missing : Service Referral > Context > Related Document(s) > Related Document > Document Detail > Document Title");
      }
      if (null != relatedDocument.getDocumentDetail().getDocumentIdentifier()) {
        externalDocument.getId().add(CDATypeUtil
            .getII(relatedDocument.getDocumentDetail().getDocumentIdentifier().getRoot(),
                relatedDocument.getDocumentDetail().getDocumentIdentifier().getExtension()));
      }
    } else {
      throw new RuntimeException(
          "Mandatory attribute missing : Service Referral > Context > Related Document(s) > Related Document > Document Detail");
    }
  }

  private POCDMT000040ClinicalDocument getClinicalDocumentWithHeaders() {
    // Construct clinical document with headers
    POCDMT000040ClinicalDocument clinicalDocument =
        HeaderUtil.createClinicalDocument(cdaModel.getBaseClinicalDocument(), new DateTime());
    clinicalDocument.setCode(SectionEntryCodeSet.SERVICE_REFERRAL);
    clinicalDocument.setCompletionCode(
        Converter.convertToCECode(cdaModel.getCompletionClinicalDoucment().getCompletionCode()));
    return clinicalDocument;
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
    //Information Recipient
    cdaModel.getInformationRecipients().stream().filter(Objects::nonNull)
        .forEach(informationRecipient -> clinicalDocument.getInformationRecipient()
            .add(HeaderUtil.createInformationRecipient(informationRecipient))
        );
    return clinicalDocument;
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
