package au.gov.nehta.builder.ereferral;

import static au.gov.nehta.builder.DocumentCreatorUtil.HL7_TEXT_MEDIA_TYPE;
import static au.gov.nehta.builder.DocumentCreatorUtil.add;
import static au.gov.nehta.builder.DocumentCreatorUtil.addBody;
import static au.gov.nehta.builder.DocumentCreatorUtil.addCaption;
import static au.gov.nehta.builder.DocumentCreatorUtil.addHeader;
import static au.gov.nehta.builder.DocumentCreatorUtil.addTable;
import static au.gov.nehta.builder.DocumentCreatorUtil.getBoldTextTd;
import static au.gov.nehta.builder.DocumentCreatorUtil.getNormalTextTd;
import static au.gov.nehta.builder.DocumentCreatorUtil.narrativeVersion;
import static au.gov.nehta.builder.common.components.DiagnosticInvestigationComponent.getEmploymentDetails;
import static au.gov.nehta.builder.ereferral.EReferralCodes.ADVERSE_REACTION;
import static au.gov.nehta.builder.ereferral.EReferralCodes.ADVERSE_REACTIONS;
import static au.gov.nehta.builder.ereferral.EReferralCodes.ADVERSE_REACTIONS_GLOBAL_STATEMENT;
import static au.gov.nehta.builder.ereferral.EReferralCodes.CHANGE_OR_RECOMMENDATION_REASON;
import static au.gov.nehta.builder.ereferral.EReferralCodes.CHANGE_STATUS;
import static au.gov.nehta.builder.ereferral.EReferralCodes.CHANGE_TYPE;
import static au.gov.nehta.builder.ereferral.EReferralCodes.CLINICAL_INDICATION;
import static au.gov.nehta.builder.ereferral.EReferralCodes.CLINICAL_INFO;
import static au.gov.nehta.builder.ereferral.EReferralCodes.CLINICAL_INFORMATION_PROVIDED;
import static au.gov.nehta.builder.ereferral.EReferralCodes.CLINICAL_SYNOPSIS;
import static au.gov.nehta.builder.ereferral.EReferralCodes.COLLECTION_SETTINGS;
import static au.gov.nehta.builder.ereferral.EReferralCodes.CURRENT_SERVICES;
import static au.gov.nehta.builder.ereferral.EReferralCodes.DATETIME_RECEIVED;
import static au.gov.nehta.builder.ereferral.EReferralCodes.DIAGNOSIS_INTERPRETATION;
import static au.gov.nehta.builder.ereferral.EReferralCodes.DIAGNOSTIC_INVESTIGATIONS;
import static au.gov.nehta.builder.ereferral.EReferralCodes.DICOM_SERIES_IDENTIFIER;
import static au.gov.nehta.builder.ereferral.EReferralCodes.DICOM_STUDY_IDENTIFIER;
import static au.gov.nehta.builder.ereferral.EReferralCodes.DOCUMENT_TITLE;
import static au.gov.nehta.builder.ereferral.EReferralCodes.EVENT_OVERVIEW;
import static au.gov.nehta.builder.ereferral.EReferralCodes.EXAMINATION_IMAGE_DETAILS;
import static au.gov.nehta.builder.ereferral.EReferralCodes.EXAMINATION_REPORT_IDENTIFIER;
import static au.gov.nehta.builder.ereferral.EReferralCodes.EXAMINATION_REQUESTED_NAME;
import static au.gov.nehta.builder.ereferral.EReferralCodes.EXAMINATION_REQUEST_DETAILS;
import static au.gov.nehta.builder.ereferral.EReferralCodes.IMAGING_EXAMINATION_RESULT;
import static au.gov.nehta.builder.ereferral.EReferralCodes.IMAGING_EXAMINATION_RESULT_DATETIME;
import static au.gov.nehta.builder.ereferral.EReferralCodes.IMAGING_EXAMINATION_RESULT_FINDINGS;
import static au.gov.nehta.builder.ereferral.EReferralCodes.IMAGING_EXAMINATION_RESULT_STATUS;
import static au.gov.nehta.builder.ereferral.EReferralCodes.IMMUNISATIONS;
import static au.gov.nehta.builder.ereferral.EReferralCodes.INDIVIDUAL_RESULT_COMMENT_CODE;
import static au.gov.nehta.builder.ereferral.EReferralCodes.INDIVIDUAL_TEST_RESULT_COMMENT;
import static au.gov.nehta.builder.ereferral.EReferralCodes.INDIVIDUAL_TEST_RESULT_REF_RANGE_COMMENTS;
import static au.gov.nehta.builder.ereferral.EReferralCodes.INDIVIDUAL_TEST_RESULT_STATUS;
import static au.gov.nehta.builder.ereferral.EReferralCodes.INTERESTED_PARTY;
import static au.gov.nehta.builder.ereferral.EReferralCodes.INTERPRETER_REQUIRED;
import static au.gov.nehta.builder.ereferral.EReferralCodes.LAB_FINDINGS_INTERPRETATION;
import static au.gov.nehta.builder.ereferral.EReferralCodes.LATERALITY;
import static au.gov.nehta.builder.ereferral.EReferralCodes.MEDICALHISTORY_ITEM_COMMENT;
import static au.gov.nehta.builder.ereferral.EReferralCodes.MEDICAL_HISTORY;
import static au.gov.nehta.builder.ereferral.EReferralCodes.MEDICATIONS_GLOBAL_STATEMENT;
import static au.gov.nehta.builder.ereferral.EReferralCodes.MEDICATION_ORDERS;
import static au.gov.nehta.builder.ereferral.EReferralCodes.OTHER_TEST_RESULT;
import static au.gov.nehta.builder.ereferral.EReferralCodes.OTHER_TEST_RESULT_REPORT_STATUS;
import static au.gov.nehta.builder.ereferral.EReferralCodes.PARENT_SPECIMEN_IDENTIFIER;
import static au.gov.nehta.builder.ereferral.EReferralCodes.PATHOLOGICAL_DIAGNOSIS;
import static au.gov.nehta.builder.ereferral.EReferralCodes.PATHOLOGY_SERVICE;
import static au.gov.nehta.builder.ereferral.EReferralCodes.PATHOLOGY_TEST_RESULT;
import static au.gov.nehta.builder.ereferral.EReferralCodes.PATHOLOGY_TEST_RESULT_DATETIME;
import static au.gov.nehta.builder.ereferral.EReferralCodes.PATH_TEST_COMMENT;
import static au.gov.nehta.builder.ereferral.EReferralCodes.PROB_OR_DIAG_COMMENT;
import static au.gov.nehta.builder.ereferral.EReferralCodes.PROCEDURE_COMMENT;
import static au.gov.nehta.builder.ereferral.EReferralCodes.REACTION_EVENT;
import static au.gov.nehta.builder.ereferral.EReferralCodes.REFERRAL_DATETIME;
import static au.gov.nehta.builder.ereferral.EReferralCodes.REFERRAL_DETAIL;
import static au.gov.nehta.builder.ereferral.EReferralCodes.REFERRAL_REASON;
import static au.gov.nehta.builder.ereferral.EReferralCodes.REFERRAL_VALIDITY_DURATION;
import static au.gov.nehta.builder.ereferral.EReferralCodes.RELATED_DOCUMENT;
import static au.gov.nehta.builder.ereferral.EReferralCodes.REPORT_STATUS;
import static au.gov.nehta.builder.ereferral.EReferralCodes.REQUESTED_SERVICE;
import static au.gov.nehta.builder.ereferral.EReferralCodes.REQUESTED_SERVICE_DATETIME;
import static au.gov.nehta.builder.ereferral.EReferralCodes.REQ_SERVICE_DATETIME;
import static au.gov.nehta.builder.ereferral.EReferralCodes.REQ_URGENCY_NOTES;
import static au.gov.nehta.builder.ereferral.EReferralCodes.REQ_VALIDITY_PERIOD;
import static au.gov.nehta.builder.ereferral.EReferralCodes.RESULT_GROUP_SPEC_DETAIL;
import static au.gov.nehta.builder.ereferral.EReferralCodes.SAMPLING_PRECONDITIONS;
import static au.gov.nehta.builder.ereferral.EReferralCodes.SERVICE_COMMENT;
import static au.gov.nehta.builder.ereferral.EReferralCodes.SERVICE_DESC;
import static au.gov.nehta.builder.ereferral.EReferralCodes.SERVICE_REFERRAL_DETAIL;
import static au.gov.nehta.builder.ereferral.EReferralCodes.SPECIMEN;
import static au.gov.nehta.builder.ereferral.EReferralCodes.SUBJECT_OF_CARE_INSTR_DESC;
import static au.gov.nehta.builder.ereferral.EReferralCodes.SUBJECT_POSITION;
import static au.gov.nehta.builder.ereferral.EReferralCodes.TEST_REQ_DETAILS;
import static au.gov.nehta.builder.ereferral.EReferralCodes.TEST_REQ_NAME;
import static au.gov.nehta.builder.ereferral.EReferralCodes.UNCATEGORISED_MEDICAL_HISTORY_ITEM;
import static au.gov.nehta.builder.ereferral.EReferralCodes.URGENT;

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
import au.gov.nehta.builder.util.narrative.NarrativeUtil;
import au.gov.nehta.model.cda.common.code.CodeImpl;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.person_org.PersonHealthcareProvider;
import au.gov.nehta.model.cda.ereferral.EReferralCDAModel;
import au.gov.nehta.model.clinical.ereferral.EReferral;
import au.gov.nehta.model.clinical.es.KnownMedication;
import au.gov.nehta.model.clinical.es.Medications;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.gov.nehta.model.clinical.etp.common.participation.ServiceProvider;
import au.gov.nehta.model.clinical.sr.AdverseReactions;
import au.gov.nehta.model.schematron.SchematronResource.SchematronResources;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.net.electronichealth.ns.cda._2_0.ANY;
import au.net.electronichealth.ns.cda._2_0.ActClass;
import au.net.electronichealth.ns.cda._2_0.ActClassObservation;
import au.net.electronichealth.ns.cda._2_0.CD;
import au.net.electronichealth.ns.cda._2_0.CE;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040AssociatedEntity;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ClinicalDocument;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component2;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component3;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Consumable;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Entry;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ManufacturedProduct;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Material;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Observation;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Organization;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040OrganizationPartOf;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Participant1;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Person;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Section;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040StructuredBody;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040SubstanceAdministration;
import au.net.electronichealth.ns.cda._2_0.ParticipationType;
import au.net.electronichealth.ns.cda._2_0.RoleClass;
import au.net.electronichealth.ns.cda._2_0.RoleClassAssociative;
import au.net.electronichealth.ns.cda._2_0.StrucDocTable;
import au.net.electronichealth.ns.cda._2_0.StrucDocTbody;
import au.net.electronichealth.ns.cda._2_0.StrucDocTd;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import au.net.electronichealth.ns.cda._2_0.XActMoodDocumentObservation;
import au.net.electronichealth.ns.cda._2_0.XDocumentSubstanceMood;
import au.net.electronichealth.ns.cda._2_0.XInformationRecipient;
import au.net.electronichealth.ns.cda._2_0.XInformationRecipientRole;
import au.net.electronichealth.ns.ci.cda.extensions._3.PersonalRelationship;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Objects;
import java.util.UUID;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import org.joda.time.DateTime;
import org.w3c.dom.Document;

public class EReferral3ACreator extends ClinicalDocumentCreator {

  private EReferralCDAModel cdaModel;
  private EReferral clinicalModel;
  private POCDMT000040ClinicalDocument clinicalDocument;
  private ExclusionStatementComponent exclusionStatementComponent
      = new ExclusionStatementComponent();
  private static ObjectFactory objectFactory = new ObjectFactory();
  private static au.net.electronichealth.ns.ci.cda.extensions._3.ObjectFactory objectFactoryExt = new au.net.electronichealth.ns.ci.cda.extensions._3.ObjectFactory();
  private static Map<String, CD> eReferralCodeMap;

  static {
    eReferralCodeMap = new HashMap<String, CD>() {{
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
      put(ClinicalDocumentCodes.REFERRAL_DETAIL, REFERRAL_DETAIL);
      put(ClinicalDocumentCodes.REFERRAL_REASON, REFERRAL_REASON);
      put(ClinicalDocumentCodes.REFERRAL_VALIDITY_DURATION, REFERRAL_VALIDITY_DURATION);
    }};
  }

  public EReferral3ACreator(EReferralCDAModel cdaModel, EReferral clinicalModel) {
    this.cdaModel = cdaModel;
    this.clinicalModel = clinicalModel;

    // for schematron checking
    this.resource = SchematronResources.E_REFERRAL_3A.resource();
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
    clinicalDocument.setCompletionCode(
        Converter.convertToCECode(cdaModel.getCompletionClinicalDocument().getCompletionCode()));
    clinicalDocument.setCode(SectionEntryCodeSet.E_REFERRAL);
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
    if (clinicalModel.getContent().getReferralDetail() != null) {
      if (null != clinicalModel.getContent().getReferralDetail().getUsualGP()) {
        clinicalDocument.getParticipant().add(HeaderUtil.createUsualGPParticipant(
            clinicalModel.getContent().getReferralDetail().getUsualGP()));
      }
      if (null != clinicalModel.getContent().getReferralDetail().getReferee()) {
        clinicalDocument.getParticipant()
            .add(getReferee(clinicalModel.getContent().getReferralDetail().getReferee()));
      } else {
        throw new RuntimeException("Mandatory info missing: Referee");
      }
    }
    if (null != clinicalModel.getContext().getPatientNominatedContacts()
        && !clinicalModel.getContext().getPatientNominatedContacts().isEmpty()) {
      clinicalModel.getContext().getPatientNominatedContacts().stream().filter(Objects::nonNull)
          .forEach(patientNominatedContact -> clinicalDocument.getParticipant()
              .add(getPatientNominatedContact(patientNominatedContact)));
    }

    cdaModel.getInformationRecipients().stream().filter(Objects::nonNull).forEach(
        informationRecipient -> clinicalDocument.getInformationRecipient()
            .add(HeaderUtil.getInformationRecipient(informationRecipient,
                XInformationRecipient.TRC, XInformationRecipientRole.ASSIGNED))
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

  private POCDMT000040Component2 getCDABody() {
    POCDMT000040StructuredBody structuredBody = objectFactory.createPOCDMT000040StructuredBody();
    POCDMT000040Component2 component = objectFactory.createPOCDMT000040Component2();
    POCDMT000040Component3 administrativeObsComponent = new AdministrativeObservationsComponent()
        .getComponent(clinicalModel.getContext().getSubjectOfCare(),
            clinicalModel.getContext().getDocumentAuthor());
    structuredBody.getComponent().add(administrativeObsComponent);
    structuredBody.getComponent().add(getReferralDetail());
    structuredBody.getComponent().add(getMedications(clinicalModel.getContent().getMedications()));
    structuredBody.getComponent().add(new MedicalHistoryComponent(eReferralCodeMap)
        .getMedicalHistory(clinicalModel.getContent().getMedicalHistory(), "Medical History"));
    processAdverseReactions(structuredBody);
    structuredBody.getComponent().add(new DiagnosticInvestigationComponent(eReferralCodeMap)
        .getDiagnosticInvestigations(clinicalModel.getContent().getDiagnosticInvestigations()));
    component.setStructuredBody(structuredBody);
    return component;
  }

  private POCDMT000040Component3 getReferralDetail() {
    POCDMT000040Component3 referralDetailComponent = objectFactory.createPOCDMT000040Component3();
    POCDMT000040Section referralDetailSection = objectFactory.createPOCDMT000040Section();
    referralDetailSection.setCode((CE) eReferralCodeMap.get(ClinicalDocumentCodes.REFERRAL_DETAIL));
    referralDetailSection.setTitle(CDATypeUtil
        .getST(eReferralCodeMap.get(ClinicalDocumentCodes.REFERRAL_DETAIL).getDisplayName()));
    referralDetailSection.setText(getReferralDetailNarrative());
    if (null != clinicalModel.getContent().getReferralDetail()) {
      if (null != clinicalModel.getContent().getReferralDetail().getReferralDateTime()) {
        referralDetailSection.getEntry().add(getReferralDetailEntry(REFERRAL_DATETIME, CDATypeUtil
            .getTS(clinicalModel.getContent().getReferralDetail().getReferralDateTime()
                .getDateTime())));
      } else {
        throw new RuntimeException("Mandatory info missing: Referral Detail > Referral DateTime");
      }
      if (null != clinicalModel.getContent().getReferralDetail().getReferralReason()) {
        referralDetailSection.getEntry()
            .add(getReferralDetailEntry(eReferralCodeMap.get(ClinicalDocumentCodes.REFERRAL_REASON),
                CDATypeUtil
                    .getST(clinicalModel.getContent().getReferralDetail().getReferralReason())));
      } else {
        throw new RuntimeException("Mandatory info missing: Referral Detail > Referral Reason");
      }
      if (null != clinicalModel.getContent().getReferralDetail().getReferralValidityDuration()) {
        referralDetailSection.getEntry().add(getReferralDetailEntry(
            eReferralCodeMap.get(ClinicalDocumentCodes.REFERRAL_VALIDITY_DURATION),
            Converter.convert(
                clinicalModel.getContent().getReferralDetail().getReferralValidityDuration())));
      } else {
        throw new RuntimeException("Mandatory info missing: Referral Detail > Referral Reason");
      }
    }
    referralDetailComponent.setSection(referralDetailSection);
    return referralDetailComponent;
  }

  private StrucDocText getReferralDetailNarrative() {
    StrucDocText narrative = objectFactory.createStrucDocText();
    if (null != clinicalModel.getContent().getReferralDetail()) {
      StrucDocTable referralDetailTable = objectFactory.createStrucDocTable();
      StrucDocTbody referralDetailTBody = addBody(referralDetailTable);
      addCaption(referralDetailTable, "Referral Detail");
      addHeader(referralDetailTable, "Field", "Value");
      if (null != clinicalModel.getContent().getReferralDetail().getReferralDateTime()) {
        add(referralDetailTBody, getBoldTextTd("Referral DateTime"),
            getNormalTextTd(clinicalModel.getContent().getReferralDetail().getReferralDateTime()
                .toNarrativeForm()));
      }
      if (null != clinicalModel.getContent().getReferralDetail().getReferralReason()) {
        add(referralDetailTBody, getBoldTextTd("Referral Reason"),
            getNormalTextTd(clinicalModel.getContent().getReferralDetail().getReferralReason()));
      }
      if (null != clinicalModel.getContent().getReferralDetail().getReferralValidityDuration()) {
        add(referralDetailTBody, getBoldTextTd("Referral Validity Duration"),
            getNormalTextTd(narrativeVersion(
                clinicalModel.getContent().getReferralDetail().getReferralValidityDuration())));
      }
      if (null != clinicalModel.getContent().getReferralDetail().getUsualGP()) {
        StrucDocTd usualGPTdHeader = getBoldTextTd("Usual GP:");
        usualGPTdHeader.setColspan("2");
        add(referralDetailTBody, usualGPTdHeader);
        StrucDocTd usualGPTd = NarrativeUtil.getParticipationServiceProviderTdNarrative(
            clinicalModel.getContent().getReferralDetail().getUsualGP());
        usualGPTd.setColspan("2");
        add(referralDetailTBody, usualGPTd);
      }
      if (null != clinicalModel.getContent().getReferralDetail().getReferee()) {
        StrucDocTd refereeTdHeader = getBoldTextTd("Referee:");
        refereeTdHeader.setColspan("2");
        add(referralDetailTBody, refereeTdHeader);
        StrucDocTd refereeTd = NarrativeUtil.getParticipationServiceProviderTdNarrative(
            clinicalModel.getContent().getReferralDetail().getUsualGP());
        refereeTd.setColspan("2");
        add(referralDetailTBody, refereeTd);
      }
      addTable(narrative, referralDetailTable);
    }
    return narrative;
  }

  private POCDMT000040Entry getReferralDetailEntry(CD referralCode, ANY value) {
    POCDMT000040Entry referralDetailEntry = objectFactory.createPOCDMT000040Entry();
    POCDMT000040Observation referralDetailObs = objectFactory.createPOCDMT000040Observation();
    referralDetailObs.setClassCode(ActClassObservation.OBS);
    referralDetailObs.setMoodCode(XActMoodDocumentObservation.EVN);
    referralDetailObs.setCode(referralCode);
    referralDetailObs.getValue().add(value);
    referralDetailEntry.setObservation(referralDetailObs);
    return referralDetailEntry;
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
      associatedPerson.getName()
          .addAll(Converter.convertNames(healthcareProvider.getPersonNames()));
    } else {
      throw new RuntimeException(
          "Missing attribute: Nominated Contact > Participant > Associated Person > Person Name");
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

  private POCDMT000040Participant1 getReferee(ParticipationServiceProvider referee) {
    POCDMT000040Participant1 refereeParticipant = objectFactory
        .createPOCDMT000040Participant1();
    refereeParticipant.setTypeCode(ParticipationType.REFT);
    POCDMT000040AssociatedEntity associatedEntity =
        getAssociatedEntityForParticipantServiceProvider(referee, RoleClassAssociative.PROV);
    refereeParticipant.setAssociatedEntity(associatedEntity);
    if (null != referee.getParticipant().getHealthCareProvider()) {
      POCDMT000040Person associatedPerson = objectFactory.createPOCDMT000040Person();
      associatedEntity.setAssociatedPerson(associatedPerson);
      handleAsPersonOrHealthcareProvider(referee, associatedPerson,
          associatedEntity);
      if (null != referee.getParticipant().getEntityIdentifiers()) {
        associatedPerson.getAsEntityIdentifier().addAll(Converter
            .convertEntityIdentifiers(referee.getParticipant().getEntityIdentifiers()));
      }
    } else {
      handleAsOrganization(referee.getParticipant(), associatedEntity);
    }
    return refereeParticipant;
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
    MedicationComponent medicationComponent = new MedicationComponent(eReferralCodeMap);
    substanceAdministration.getEntryRelationship()
        .add(medicationComponent
            .getClinicalIndicationEntryRelationshipForKnownMedication(knownMedication));
    substanceAdministration.getEntryRelationship()
        .add(medicationComponent.getCommentEntryRelationshipForKnownMedication(knownMedication));
    knownMedicationEntry.setSubstanceAdministration(substanceAdministration);
    return knownMedicationEntry;
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
            eReferralCodeMap);
        structuredBody.getComponent().add(adverseReactionComponent.getAdverseReactions(
            clinicalModel.getContent().getAdverseReactions()));
      }
    }
  }

  private POCDMT000040ClinicalDocument getClinicalDocumentWithHeaders() {
    // Construct clinical document with headers
    POCDMT000040ClinicalDocument clinicalDocument =
        HeaderUtil.createClinicalDocument(cdaModel.getBaseClinicalDocument(), new DateTime());
    clinicalDocument.setCode(SectionEntryCodeSet.E_REFERRAL);
    clinicalDocument.setCompletionCode(
        Converter.convertToCECode(cdaModel.getCompletionClinicalDocument().getCompletionCode()));
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
    narrativeSection.setText(clinicalModel.getContent().getCustomNarrative());
    if (null != clinicalModel.getContent().getReferralDetail().getReferee()) {
      clinicalDocument.getParticipant()
          .add(getReferee(clinicalModel.getContent().getReferralDetail().getReferee()));
    } else {
      throw new RuntimeException("Mandatory info missing: Referee");
    }
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
