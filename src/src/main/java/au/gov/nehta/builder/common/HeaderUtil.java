package au.gov.nehta.builder.common;

import au.gov.nehta.builder.ereferral.ReferralParticipant;
import au.gov.nehta.builder.util.AddressConverter;
import au.gov.nehta.builder.util.CDAModelConverter;
import au.gov.nehta.builder.util.CDATypeUtil;
import au.gov.nehta.builder.util.Converter;
import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.custodian.CustodianOrganization;
import au.gov.nehta.model.cda.common.document.BaseClinicalDocument;
import au.gov.nehta.model.cda.common.document.RelatedDocument;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.id.LegalAuthenticator;
import au.gov.nehta.model.cda.common.id.TemplateId;
import au.gov.nehta.model.cda.common.id.TypeId;
import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.clinical.common.ExtendedSubjectOfCarePerson;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;
import au.gov.nehta.model.clinical.common.SubjectOfCarePerson;
import au.gov.nehta.model.clinical.common.participation.CountryState;
import au.gov.nehta.model.clinical.common.participation.IndigenousStatus;
import au.gov.nehta.model.clinical.common.participation.Role;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;
import au.gov.nehta.model.clinical.diagnostic.pathology.RequesterParticipation;
import au.gov.nehta.model.clinical.etp.common.participation.AddressContext;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderAddress;
import au.net.electronichealth.ns.cda._2_0.BL;
import au.net.electronichealth.ns.cda._2_0.CE;
import au.net.electronichealth.ns.cda._2_0.CS;
import au.net.electronichealth.ns.cda._2_0.II;
import au.net.electronichealth.ns.cda._2_0.INT;
import au.net.electronichealth.ns.cda._2_0.IVLTS;
import au.net.electronichealth.ns.cda._2_0.NullFlavor;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040AssignedAuthor;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040AssociatedEntity;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Author;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040AuthoringDevice;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Birthplace;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ClinicalDocument;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component1;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Custodian;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040EncompassingEncounter;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040HealthCareFacility;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040InfrastructureRootTypeId;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040LegalAuthenticator;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Location;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Organization;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ParentDocument;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Participant1;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Patient;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040PatientRole;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Person;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Place;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040RecordTarget;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040RelatedDocument;
import au.net.electronichealth.ns.cda._2_0.ParticipationType;
import au.net.electronichealth.ns.cda._2_0.RoleClass;
import au.net.electronichealth.ns.cda._2_0.RoleClassAssociative;
import au.net.electronichealth.ns.cda._2_0.ST;
import au.net.electronichealth.ns.cda._2_0.TS;
import java.math.BigInteger;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import java.util.UUID;
import org.joda.time.DateTime;

public class HeaderUtil {

  private static final String LEGAL_AUTHENTICATOR_SIGNATURE_CODE_CODE = "S";

  public static POCDMT000040ClinicalDocument createClinicalDocument(BaseClinicalDocument model) {
    return createClinicalDocument(model, new DateTime());
  }

  public static POCDMT000040ClinicalDocument createClinicalDocument(BaseClinicalDocument model,
      DateTime effectiveDateTime) {
    POCDMT000040ClinicalDocument clinicalDocument = new POCDMT000040ClinicalDocument();
    clinicalDocument.setTypeId(getClinicalDocumentTypeId(model.getTypeId()));

    for (TemplateId id : model.getTemplateIds()) {
      clinicalDocument.getTemplateId().add(getClinicalDocumentTemplateId(id));
    }

    clinicalDocument.setId(CDATypeUtil.getII(model.getClinicalDocumentId()));
    clinicalDocument.setEffectiveTime(Converter.getTS(effectiveDateTime));
    clinicalDocument.setConfidentialityCode(getConfidentialityCode());
    clinicalDocument.setLanguageCode(getLanguageCode(model.getLanguageCode()));

    if (model.getSetId() != null) {
      clinicalDocument.setSetId(getSetId(model.getSetId()));
    }
    clinicalDocument.setVersionNumber(getVersionNumber(model.getVersionNumber()));

    clinicalDocument.setTitle(getST(model.getTitle()));
    return clinicalDocument;
  }

  private static ST getST(String title) {
    return CDATypeUtil.getST(title);
  }

  public static CE getConfidentialityCode() {
    CE confidentialityCode = new CE();
    confidentialityCode.setNullFlavor(NullFlavor.NA);

    return confidentialityCode;
  }

  private static POCDMT000040InfrastructureRootTypeId getClinicalDocumentTypeId(
      TypeId cdaModelTypeId) {
    POCDMT000040InfrastructureRootTypeId typeId = new POCDMT000040InfrastructureRootTypeId();
    typeId.setExtension(cdaModelTypeId.getExtension());
    typeId.setRoot(cdaModelTypeId.getRoot());

    return typeId;
  }

  private static II getClinicalDocumentTemplateId(TemplateId cdaModelTemplateId) {
    II templateId = new II();
    templateId.setExtension(cdaModelTemplateId.getExtension());
    templateId.setRoot(cdaModelTemplateId.getRoot());

    return templateId;
  }

  private static TS getTimeNow() {
    return Converter.getTS(new DateTime());
  }

  private static CS getLanguageCode(String cdaModelLanguageCode) {
    CS languageCode = new CS();
    languageCode.setCode(cdaModelLanguageCode);

    return languageCode;
  }

  public static II getSetId(String cdaModelSetId) {

    return CDATypeUtil.getII(cdaModelSetId);
  }

  public static INT getVersionNumber(long string) {
    INT versionNumber = new INT();
    versionNumber.setValue(BigInteger.valueOf(string));

    return versionNumber;
  }

  // Legal Authenticator
  public static POCDMT000040LegalAuthenticator createLegalAuthenticator(
      LegalAuthenticator cdaModelLegalAuthenticator) {
    POCDMT000040LegalAuthenticator legalAuthenticator = new POCDMT000040LegalAuthenticator();
    legalAuthenticator.setTime(Converter.getTS(cdaModelLegalAuthenticator.getAuthenticationTime()));
    legalAuthenticator.setSignatureCode(CDATypeUtil.getCS(LEGAL_AUTHENTICATOR_SIGNATURE_CODE_CODE));
    if (null != cdaModelLegalAuthenticator.getAssignedEntity()) {
      legalAuthenticator.setAssignedEntity(
          CDAModelConverter.convertAssignedEntity(cdaModelLegalAuthenticator.getAssignedEntity()));
    }

    return legalAuthenticator;
  }

  public static Collection<? extends POCDMT000040RelatedDocument> createRelatedDocuments(
      List<RelatedDocument> relatedDocuments) {
    List<POCDMT000040RelatedDocument> mappedDocuments = new ArrayList<>(
        relatedDocuments.size());
    for (RelatedDocument d : relatedDocuments) {
      mappedDocuments.add(creatDocument(d));
    }
    return mappedDocuments;
  }

  private static POCDMT000040RelatedDocument creatDocument(RelatedDocument d) {
    POCDMT000040RelatedDocument doc = new POCDMT000040RelatedDocument();
    POCDMT000040ParentDocument parent = new POCDMT000040ParentDocument();
    doc.setTypeCode(d.getTypeCode()); //mandatory field
    parent.getId().add(Converter.getII(d.getParentDocumentId()));//mandatory field

    UniqueIdentifier setId = d.getSetId();

    if (setId != null) {
      parent.setSetId(Converter.getII(setId));
    }

    Code documentCode = d.getDocumentCode();

    if (documentCode != null) {
      parent.setCode(Converter.convertToCDCode(documentCode));
    }

//        parent.se
    if (d.getVersionNumber() != null) {
      INT int1 = new INT();
      int1.setValue(BigInteger.valueOf(d.getVersionNumber()));
      parent.setVersionNumber(int1);
    }

    doc.setParentDocument(parent);

    return doc;
  }


  public static POCDMT000040Author createAuthorWithTime(String assignedAuthorId, Role authorRole,
      ProviderAddress authorAddress, List<Telecom> authorElectronicCommunicationDetail,
      POCDMT000040Person assignedAuthorPerson, DateTime authorTime) {
    return createAuthorWithTime(assignedAuthorId, authorRole.getCode(), authorAddress,
        authorElectronicCommunicationDetail, assignedAuthorPerson, authorTime);
  }

  private static POCDMT000040Author createAuthorWithTime(String assignedAuthorId, Coded authorRole,
      ProviderAddress authorAddress, List<Telecom> authorElectronicCommunicationDetail,
      POCDMT000040Person assignedAuthorPerson, DateTime authorTime) {
    POCDMT000040Author author = getBaseAuthor(assignedAuthorId, authorRole, authorAddress,
        authorElectronicCommunicationDetail, assignedAuthorPerson);
    TS creationTime = new TS();
    creationTime.setValue(Converter.HL7_DATE_TIME_FORMATTER.print(authorTime));
    author.setTime(creationTime);
    return author;
  }


  public static POCDMT000040Author createAuthorAsDeviceWithTime(
      AsEntityIdentifier deviceIdentifier, String softwareName, DateTime authorTime) {

    POCDMT000040Author author = new POCDMT000040Author();

    POCDMT000040AssignedAuthor assignedAuthor = new POCDMT000040AssignedAuthor();
    assignedAuthor.setCode(CDATypeUtil.getNullCECode());

    POCDMT000040AuthoringDevice device = new POCDMT000040AuthoringDevice();
    device.getAsEntityIdentifier().add(Converter.convert(deviceIdentifier));
    assignedAuthor.setAssignedAuthoringDevice(device);

    device.setSoftwareName(CDATypeUtil.getSC(softwareName));

    assignedAuthor.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
    author.setAssignedAuthor(assignedAuthor);

    TS creationTime = new TS();
    creationTime.setValue(Converter.HL7_DATE_TIME_FORMATTER.print(authorTime));
    author.setTime(creationTime);
    return author;
  }

  public static POCDMT000040Author createAuthorWithCurrentTime(String assignedAuthorId,
      Role authorRole, ProviderAddress authorAddress,
      List<Telecom> authorElectronicCommunicationDetail,
      POCDMT000040Person assignedAuthorPerson) {
    POCDMT000040Author author = getBaseAuthor(assignedAuthorId, authorRole.getCode(), authorAddress,
        authorElectronicCommunicationDetail, assignedAuthorPerson);
    TS creationTime = new TS();
    creationTime.setValue(Converter.HL7_DATE_TIME_FORMATTER.print(new DateTime()));
    author.setTime(creationTime);
    return author;
  }


  public static POCDMT000040Author createAuthorNullFlavourTime(String assignedAuthorId,
      Role authorRole, ProviderAddress authorAddress,
      List<Telecom> authorElectronicCommunicationDetail,
      POCDMT000040Person assignedAuthorPerson) {
    POCDMT000040Author author = getBaseAuthor(assignedAuthorId, authorRole.getCode(), authorAddress,
        authorElectronicCommunicationDetail, assignedAuthorPerson);
    TS creationTime = new TS();
    creationTime.setNullFlavor(NullFlavor.NA);
    author.setTime(creationTime);
    return author;
  }


  private static POCDMT000040Author getBaseAuthor(String assignedAuthorId, Coded authorRole,
      ProviderAddress authorAddress, List<Telecom> authorElectronicCommunicationDetail,
      POCDMT000040Person assignedAuthorPerson) {

    POCDMT000040Author author = new POCDMT000040Author();
    POCDMT000040AssignedAuthor assignedAuthor = new POCDMT000040AssignedAuthor();

    author.setTypeCode(ParticipationType.AUT);
    author.setAssignedAuthor(assignedAuthor);
    CE assignedAuthorCode = Converter.convertToCECode(authorRole);

    assignedAuthor.setCode(assignedAuthorCode);
    assignedAuthor.getId().add(CDATypeUtil.getII(assignedAuthorId));

    if (authorAddress != null) {
      assignedAuthor.getAddr().add(AddressConverter.convert(authorAddress));
    }
    if (authorElectronicCommunicationDetail != null) {
      assignedAuthor.getTelecom().addAll(Converter.convert(authorElectronicCommunicationDetail));
    }

    assignedAuthor.setAssignedPerson(assignedAuthorPerson);
    author.setAssignedAuthor(assignedAuthor);
    return author;
  }


  // extended Subject Of Care
  public static POCDMT000040RecordTarget createRecordTarget(
      SubjectOfCareParticipant subjectOfCareParticipant) {
    String patientRoleId = subjectOfCareParticipant.getPatientRoleId();

    POCDMT000040RecordTarget recordTarget = new POCDMT000040RecordTarget();

    recordTarget.setTypeCode(ParticipationType.RCT);

    POCDMT000040Patient patient = new POCDMT000040Patient();

    patient.getAsEntityIdentifier()
        .addAll(Converter.getAsEntityIdentifier(subjectOfCareParticipant.getEntityIdentifiers()));

    SubjectOfCarePerson person = subjectOfCareParticipant.getPerson();

    mapSOCPerson(patient, person);

    if (person instanceof ExtendedSubjectOfCarePerson) {
      mapPersonExtensions(patient, (ExtendedSubjectOfCarePerson) person);
    }

    POCDMT000040PatientRole patientRole = new POCDMT000040PatientRole();

    patientRole.setClassCode(RoleClass.PAT);
    patientRole.getId().add(CDATypeUtil.getII(patientRoleId));
    patientRole.setPatient(patient);

    if (subjectOfCareParticipant.getAddresses() != null) {
      for (AddressContext ctx : subjectOfCareParticipant.getAddresses()) {
        patientRole.getAddr().add(AddressConverter.convert(ctx));
      }
    }

    if (subjectOfCareParticipant.getElectronicCommunicationDetail() != null) {
      patientRole.getTelecom()
          .addAll(Converter.convert(subjectOfCareParticipant.getElectronicCommunicationDetail()));
    }

    recordTarget.setPatientRole(patientRole);

    return recordTarget;
  }

  //map the extra fields in ExtendedSubjectOfCarePerson not covered by SubjectOfCarePerson
  public static void mapPersonExtensions(POCDMT000040Patient patient,
      ExtendedSubjectOfCarePerson person) {
    if (person.getDemographicData().getDateOfDeath() != null) {
      patient.setDeceasedInd(CDATypeUtil.getBL(true));
      patient.setDeceasedTime(Converter.getTS(person.getDemographicData().getDateOfDeath()));
    }

    if (person.getDemographicData().getBirthPlace() != null) {
      POCDMT000040Birthplace bp = getBirthPlace(person.getDemographicData().getBirthPlace());
      patient.setBirthplace(bp);
    }
  }


  public static void mapSOCPerson(POCDMT000040Patient patient, SubjectOfCarePerson person) {
    patient.getName().add(Converter.getPersonName(person.getPersonName()));
    patient.setAdministrativeGenderCode(Converter.convert(person.getDemographicData().getSex()));
    patient.setBirthTime(
        Converter.getTS(person.getDemographicData().getDateOfBirthDetail().getDateOfBirth()));
    BL multipleBirthInd = getMultipleBirthInd(
        person.getDemographicData().getBirthPlurality());
    patient.setMultipleBirthInd(multipleBirthInd);
    if (multipleBirthInd.isValue()) {
      patient.setMultipleBirthOrderNumber(
          Converter.convertIntegerToINT(person.getDemographicData().getBirthOrder()));
    }

    IndigenousStatus indigenousStatus = person.getDemographicData().getIndigenousStatus();
    if (null != indigenousStatus) {
      CE status = new CE();
      status.setCode(indigenousStatus.getCode());
      status.setCodeSystem(indigenousStatus.getCodeSystem());
      status.setCodeSystemName(indigenousStatus.getCodeSystemName());
      status.setCodeSystemVersion(indigenousStatus.getCodeSystemVersion());
      status.setDisplayName(indigenousStatus.getDisplayName());
      patient.setEthnicGroupCode(status);
    }

  }

  private static BL getMultipleBirthInd(Integer birthPlurality) {
    BL multipleBirthInd = new BL();
    if (birthPlurality != null && birthPlurality > 1) {
      multipleBirthInd.setValue(true);
    } else {
      multipleBirthInd.setValue(false);
    }

    return multipleBirthInd;
  }

  // Location
  private static POCDMT000040Location createLocation(Role clinicalModelParticipationRole,
      POCDMT000040Organization serviceProviderOrganizationPartOf, String healthCareFacilityId) {
    POCDMT000040Location location = new POCDMT000040Location();
    POCDMT000040HealthCareFacility healthCareFacility = new POCDMT000040HealthCareFacility();

    healthCareFacility.getId().add(CDATypeUtil.getII(healthCareFacilityId));

    CE healthCareFacilityCode = getHealthCareFacilityCode(clinicalModelParticipationRole);
    healthCareFacility.setCode(healthCareFacilityCode);

    healthCareFacility.setServiceProviderOrganization(serviceProviderOrganizationPartOf);
    location.setHealthCareFacility(healthCareFacility);

    return location;
  }

  private static CE getHealthCareFacilityCode(Role clinicalModelRole) {
    return Converter.convertToCECode(clinicalModelRole.getCode());
  }

  // Custodian
  public static POCDMT000040Custodian createCustodian(
      CustodianOrganization cdaModelAssignedCustodianRepresentedOrganization) {
    POCDMT000040Custodian custodian = new POCDMT000040Custodian();
    custodian.setAssignedCustodian(CDAModelConverter
        .convertAssignedCustodian(cdaModelAssignedCustodianRepresentedOrganization));

    return custodian;
  }

  private static POCDMT000040Birthplace getBirthPlace(CountryState countryState) {
    POCDMT000040Birthplace bp = new POCDMT000040Birthplace();
    POCDMT000040Place place = new POCDMT000040Place();
    place.setAddr(AddressConverter.convert(countryState));
    bp.setPlace(place);
    return bp;
  }

  // Encompassing Encounter
  public static POCDMT000040Component1 createEncompassingEncounter(
      Role clinicalModelParticipationRole,
      POCDMT000040Organization serviceProviderOrganizationPartOf, String healthCareFacilityId) {
    POCDMT000040Component1 componentOf = new POCDMT000040Component1();
    POCDMT000040EncompassingEncounter encompassingEncounter = new POCDMT000040EncompassingEncounter();
    IVLTS encompassingEncounterEffectiveTime = new IVLTS();
    encompassingEncounterEffectiveTime.setNullFlavor(NullFlavor.NA);
    encompassingEncounter.setEffectiveTime(encompassingEncounterEffectiveTime);
    POCDMT000040Location location = HeaderUtil
        .createLocation(clinicalModelParticipationRole, serviceProviderOrganizationPartOf,
            healthCareFacilityId);
    encompassingEncounter.setLocation(location);
    componentOf.setEncompassingEncounter(encompassingEncounter);

    return componentOf;
  }

  public static POCDMT000040Participant1 createParticipant(RequesterParticipation requester) {

    POCDMT000040Participant1 part = new POCDMT000040Participant1();
    part.setTypeCode(ParticipationType.REF);
    part.setTime(Converter.convert(requester.getParticipationEndTime()));
    POCDMT000040AssociatedEntity entity = new POCDMT000040AssociatedEntity();
    entity.setClassCode(RoleClassAssociative.ASSIGNED);

    entity.getId().add(Converter.getII(UniqueIdentifierImpl.random()));

    entity.setCode(Converter.convertToCECode(requester.getRole().getCode()));
    List<Telecom> tels = requester.getParticipant().getElectronicCommunicationDetail();

    if (tels != null) {
      for (Telecom t : tels) {
        entity.getTelecom().add(Converter.convert(t));
      }
    }

    if (null != requester.getParticipant() && null != requester.getParticipant().getAddresses()) {
      entity.getAddr().add(AddressConverter.convert(requester.getParticipant().getAddresses()));
    }

    POCDMT000040Person person2 = ClinicalModelConverter
        .getRequestersPerson(requester.getParticipant());

    entity.setAssociatedPerson(person2);

    part.setAssociatedEntity(entity);

    return part;
  }

  public static POCDMT000040Participant1 createParticipant(ReferralParticipant referee) {
    POCDMT000040Participant1 part = new POCDMT000040Participant1();
    part.setTypeCode(ParticipationType.REFT);
    POCDMT000040AssociatedEntity entity = new POCDMT000040AssociatedEntity();
    entity.setClassCode(RoleClassAssociative.PROV);

    entity.getId().add(Converter.getII(referee.getID()));

    CE ce = new CE();
    ce.setNullFlavor(NullFlavor.ASKU);
    entity.setCode(ce);

    List<Telecom> tels = referee.getElectronicCommunicationDetails();

    if (tels != null) {
      for (Telecom t : tels) {
        entity.getTelecom().add(Converter.convert(t));
      }
    }

    entity.getAddr().add(AddressConverter.convert(referee.getProviderAddress()));

    POCDMT000040Person person2 = ClinicalModelConverter.getRefereePerson(referee);

    entity.setAssociatedPerson(person2);

    part.setAssociatedEntity(entity);
    return part;
  }


}
