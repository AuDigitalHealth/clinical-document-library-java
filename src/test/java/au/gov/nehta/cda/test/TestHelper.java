package au.gov.nehta.cda.test;

import static au.gov.nehta.cda.es.EventSummaryTestHelper.getAttachedMedia;
import static au.gov.nehta.cda.test.Base.ATTACHMENTS_DIR;

import au.gov.nehta.cda.es.EventSummaryTestHelper;
import au.gov.nehta.model.cda.common.ElectronicCommunicationDetail;
import au.gov.nehta.model.cda.common.ElectronicCommunicationMedium;
import au.gov.nehta.model.cda.common.ElectronicCommunicationUsage;
import au.gov.nehta.model.cda.common.address.PostalAddress;
import au.gov.nehta.model.cda.common.address.PostalAddressImpl;
import au.gov.nehta.model.cda.common.address.PostalAddressUseEnum;
import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.cda.common.code.CodeImpl;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.code.HL7ObservationInterpretationNormality;
import au.gov.nehta.model.cda.common.code.SNOMED_AU_Code;
import au.gov.nehta.model.cda.common.custodian.AssignedCustodian;
import au.gov.nehta.model.cda.common.custodian.AssignedCustodianImpl;
import au.gov.nehta.model.cda.common.custodian.Custodian;
import au.gov.nehta.model.cda.common.custodian.CustodianImpl;
import au.gov.nehta.model.cda.common.custodian.CustodianOrganization;
import au.gov.nehta.model.cda.common.custodian.CustodianOrganizationImpl;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifierImpl;
import au.gov.nehta.model.cda.common.id.AssignedEntity;
import au.gov.nehta.model.cda.common.id.AssignedEntityImpl;
import au.gov.nehta.model.cda.common.id.IntendedRecipient;
import au.gov.nehta.model.cda.common.id.IntendedRecipientImpl;
import au.gov.nehta.model.cda.common.id.LegalAuthenticator;
import au.gov.nehta.model.cda.common.id.LegalAuthenticatorImpl;
import au.gov.nehta.model.cda.common.id.MedicareCardIdentifier;
import au.gov.nehta.model.cda.common.informationrecipient.InformationRecipient;
import au.gov.nehta.model.cda.common.informationrecipient.InformationRecipientImpl;
import au.gov.nehta.model.cda.common.org.Organization;
import au.gov.nehta.model.cda.common.org.OrganizationImpl;
import au.gov.nehta.model.cda.common.org.OrganizationName;
import au.gov.nehta.model.cda.common.org.OrganizationNameImpl;
import au.gov.nehta.model.cda.common.participant.EmploymentOrganization;
import au.gov.nehta.model.cda.common.participant.EmploymentOrganizationImpl;
import au.gov.nehta.model.cda.common.person.Person;
import au.gov.nehta.model.cda.common.person.PersonImpl;
import au.gov.nehta.model.cda.common.person_org.Gender;
import au.gov.nehta.model.cda.common.person_org.PersonHealthcareProvider;
import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.cda.common.telecom.TelecomImpl;
import au.gov.nehta.model.cda.common.telecom.TelecomMedium;
import au.gov.nehta.model.cda.common.telecom.TelecomUse;
import au.gov.nehta.model.cda.common.time.Precision;
import au.gov.nehta.model.cda.common.time.PrecisionDate;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.clinical.common.DocumentAuthor;
import au.gov.nehta.model.clinical.common.DocumentAuthorImpl;
import au.gov.nehta.model.clinical.common.EventTypes;
import au.gov.nehta.model.clinical.common.SubjectOfCareDemographicData;
import au.gov.nehta.model.clinical.common.SubjectOfCareDemographicDataImpl;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipantImpl;
import au.gov.nehta.model.clinical.common.SubjectOfCarePerson;
import au.gov.nehta.model.clinical.common.SubjectOfCarePersonImpl;
import au.gov.nehta.model.clinical.common.address.Address;
import au.gov.nehta.model.clinical.common.address.AddressImpl;
import au.gov.nehta.model.clinical.common.address.AustralianAddressLevelType;
import au.gov.nehta.model.clinical.common.address.PostalDeliveryType;
import au.gov.nehta.model.clinical.common.address.StreetSuffix;
import au.gov.nehta.model.clinical.common.address.StreetType;
import au.gov.nehta.model.clinical.common.address.UnitType;
import au.gov.nehta.model.clinical.common.participation.ANZSCO_1ED_2006;
import au.gov.nehta.model.clinical.common.participation.AddressContextImpl;
import au.gov.nehta.model.clinical.common.participation.AddressPurpose;
import au.gov.nehta.model.clinical.common.participation.AustralianAddress;
import au.gov.nehta.model.clinical.common.participation.AustralianAddressImpl;
import au.gov.nehta.model.clinical.common.participation.AustralianStateTerritory;
import au.gov.nehta.model.clinical.common.participation.DateAccuracy;
import au.gov.nehta.model.clinical.common.participation.DateAccuracyImpl;
import au.gov.nehta.model.clinical.common.participation.DateOfBirthDetail;
import au.gov.nehta.model.clinical.common.participation.DateOfBirthDetailImpl;
import au.gov.nehta.model.clinical.common.participation.IndigenousStatus;
import au.gov.nehta.model.clinical.common.participation.NameSuffix;
import au.gov.nehta.model.clinical.common.participation.NameTitle;
import au.gov.nehta.model.clinical.common.participation.Organisation;
import au.gov.nehta.model.clinical.common.participation.OrganisationImpl;
import au.gov.nehta.model.clinical.common.participation.OrganisationNameUsage;
import au.gov.nehta.model.clinical.common.participation.PersonName;
import au.gov.nehta.model.clinical.common.participation.PersonNameImpl;
import au.gov.nehta.model.clinical.common.participation.PersonNameUsage;
import au.gov.nehta.model.clinical.common.participation.Sex;
import au.gov.nehta.model.clinical.common.types.HPII;
import au.gov.nehta.model.clinical.common.types.HPIO;
import au.gov.nehta.model.clinical.common.types.IHI;
import au.gov.nehta.model.clinical.common.types.Quantity;
import au.gov.nehta.model.clinical.common.types.QuantityRange;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;
import au.gov.nehta.model.clinical.diagnostic.pathology.ExtendedEmploymentOrganisationImpl;
import au.gov.nehta.model.clinical.es.AnatomicalSite;
import au.gov.nehta.model.clinical.es.AnatomicalSiteImpl;
import au.gov.nehta.model.clinical.es.DiagnosticInvestigations;
import au.gov.nehta.model.clinical.es.DiagnosticInvestigationsImpl;
import au.gov.nehta.model.clinical.es.ExaminationRequestDetails;
import au.gov.nehta.model.clinical.es.ExaminationRequestDetailsImpl;
import au.gov.nehta.model.clinical.es.ImageDetails;
import au.gov.nehta.model.clinical.es.ImageDetailsImpl;
import au.gov.nehta.model.clinical.es.ImagingExaminationResult;
import au.gov.nehta.model.clinical.es.ImagingExaminationResultGroup;
import au.gov.nehta.model.clinical.es.ImagingExaminationResultGroupImpl;
import au.gov.nehta.model.clinical.es.ImagingExaminationResultImpl;
import au.gov.nehta.model.clinical.es.ImagingResult;
import au.gov.nehta.model.clinical.es.ImagingResultImpl;
import au.gov.nehta.model.clinical.es.KnownMedication;
import au.gov.nehta.model.clinical.es.KnownMedicationImpl;
import au.gov.nehta.model.clinical.es.Medications;
import au.gov.nehta.model.clinical.es.MedicationsImpl;
import au.gov.nehta.model.clinical.es.OtherTestResult;
import au.gov.nehta.model.clinical.es.OtherTestResultImpl;
import au.gov.nehta.model.clinical.es.PathologyTestResult;
import au.gov.nehta.model.clinical.es.ReferenceRange;
import au.gov.nehta.model.clinical.es.ReferenceRangeDetails;
import au.gov.nehta.model.clinical.es.RequestedService;
import au.gov.nehta.model.clinical.es.RequestedServiceImpl;
import au.gov.nehta.model.clinical.es.ResultValue;
import au.gov.nehta.model.clinical.es.SpecificLocation;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.gov.nehta.model.clinical.etp.common.participation.AddressContext;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;
import au.gov.nehta.model.clinical.etp.common.participation.EntitlementImpl;
import au.gov.nehta.model.clinical.etp.common.participation.EntitlementType;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProviderImpl;
import au.gov.nehta.model.clinical.etp.common.participation.ServiceProvider;
import au.gov.nehta.model.clinical.etp.common.participation.ServiceProviderImpl;
import au.gov.nehta.model.clinical.shs.SharedHealthSummaryAuthor;
import au.gov.nehta.model.clinical.shs.SharedHealthSummaryAuthorImpl;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.LinkedList;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;
import org.joda.time.DateTime;
import org.joda.time.LocalDate;
import org.w3c.dom.Document;

public class TestHelper {

  public static Class executingClass;

  /**
   * print the string to a file
   */
  public static void printToFile(String s, String fileName) {
    FileOutputStream fs = null;

    try {
      File file = new File(fileName);
      if (!file.isFile()) {
        file.getParentFile().mkdirs();
        file.createNewFile();
      }
      fs = new FileOutputStream(file);
      fs.write(s.getBytes());

    } catch (Exception e) {
      e.printStackTrace();
    } finally {
      if (fs != null) {
        try {
          fs.close();
        } catch (IOException e) {
          e.printStackTrace();
        }
      }
    }
  }

  /**
   * Convert a Document to a String
   */
  public static String documentToXML(Document clinicalDocument) {
    String cdaXml = "";
    try {

      TransformerFactory factory = TransformerFactory.newInstance();
      //factory.setAttribute( "indent-number", new Integer( 4 ) );
      Transformer transformer = factory.newTransformer();
      transformer.setOutputProperty(OutputKeys.OMIT_XML_DECLARATION, "no");
      transformer.setOutputProperty(OutputKeys.INDENT, "yes");

      StringWriter writer = new StringWriter();
      StreamResult result = new StreamResult(writer);

      DOMSource domSource = new DOMSource(clinicalDocument);
      transformer.transform(domSource, result);

      writer.flush();
      writer.close();
      cdaXml = writer.toString();

    } catch (Exception e) {
      e.printStackTrace();
    }
    return cdaXml;
  }

  public static LegalAuthenticator getLegalAuthenticator(DateTime now) {
    // *******************************
    // ***** Legal Authenticator *****
    // *******************************

    List<PersonName> legalAuthenticatorsNames = new ArrayList<>(2);

    legalAuthenticatorsNames.add(
        PersonNameImpl.getInstance(
            "Black",
            "Jane",
            NameTitle.MRS.getDescriptor(),
            NameSuffix.JUNIOR.getDescriptor(),
            PersonNameUsage.REGISTERED_NAME_OR_LEGAL_NAME));
    legalAuthenticatorsNames.add(
        PersonNameImpl.getInstance(
            "Alias",
            "other",
            NameTitle.MISS.getDescriptor(),
            PersonNameUsage.MAIDEN_NAME_OR_NAME_AT_BIRTH));

    HPII authenticatorHPII = new HPII("8003610000001145");
    Person legalAuthenticatorPerson =
        PersonImpl.getInstance(authenticatorHPII, legalAuthenticatorsNames);

    // This is an alternate way of doing a HPIO, HPII or other identifier
    // AsEntityIdentifier hpioTheHardWay =
    // AsEntityIdentifierImpl.getInstance(
    // "1.2.36.1.2001.1003.0.800362555555" );
    // hpioTheHardWay.setAssigningAuthorityName( "HPI-O" );
    // hpioTheHardWay.setAssigningGeographicAreaName( "National Identifier"
    // );

    HPIO authenticatorHPIO = new HPIO("8003621231167886");

    Organization legalAuthenticatorOrganisation =
        OrganizationImpl.getInstance(authenticatorHPIO, "Pathology Lab Name");

    String legalAuthenticatorID = UUID.randomUUID().toString();
    AssignedEntity cdaLegalAuthenticatorAssignedEntity =
        AssignedEntityImpl.getInstance(
            legalAuthenticatorID, legalAuthenticatorPerson, legalAuthenticatorOrganisation);

    // You can also create a code the hard way...
    Code cdaLegalAuthenticatorAssignedEntityCode = new CodeImpl("253111");
    cdaLegalAuthenticatorAssignedEntityCode.setCodeSystem("2.16.840.1.113883.13.62");
    cdaLegalAuthenticatorAssignedEntityCode.setCodeSystemName(
        "1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, 2006");
    cdaLegalAuthenticatorAssignedEntityCode.setDisplayName("General Medical Practitioner");

    // ...or use a pre-baked version
    cdaLegalAuthenticatorAssignedEntity.setCode(ANZSCO_1ED_2006.SURGEON_GENERAL);

    AustralianAddress authenticatorAddress = new AustralianAddressImpl();
    authenticatorAddress.addUnstructuredAddressLine("101 Browning Street");
    authenticatorAddress.setState("QLD");
    authenticatorAddress.setPostcode("4101");
    authenticatorAddress.setCity("Brisbane");
    PostalAddress authenticatorPostalAddress =
        new PostalAddressImpl(authenticatorAddress, PostalAddressUseEnum.WORKPLACE);

    cdaLegalAuthenticatorAssignedEntity.setAddress(
        Collections.singletonList(authenticatorPostalAddress));

    Telecom authenticatorEmail =
        new TelecomImpl(
            TelecomMedium.EMAIL, "example@sample.com", TelecomUse.BUSINESS);
    cdaLegalAuthenticatorAssignedEntity.setTelecom(Collections.singletonList(authenticatorEmail));

    return LegalAuthenticatorImpl
        .getInstance(now, cdaLegalAuthenticatorAssignedEntity);
  }

  public static Custodian getCustodian() {
    // *********************
    // ***** Custodian *****
    // *********************

    AsEntityIdentifier custodianIdentifier = new HPIO("8003621231167886");
    Telecom contact =
        new TelecomImpl(TelecomMedium.EMAIL, "example@custodian.com.au", TelecomUse.BUSINESS);

    AustralianAddress custodianAddress = new AustralianAddressImpl();
    custodianAddress.addUnstructuredAddressLine("99 Clinician Street");
    custodianAddress.setCity("Nehtaville");
    custodianAddress.setState("QLD");
    custodianAddress.setPostcode("5555");
    custodianAddress.setAdditionalLocator("Level 2");

    String documentID = UUID.randomUUID().toString();
    UniqueIdentifier typedDocumentID = new UniqueIdentifierImpl(documentID);

    // you can also use additional identifiers
    //UniqueIdentifier otherId = new UniqueIdentifierImpl(UUID.randomUUID().toString());
    CustodianOrganization custodianOrganization =
        CustodianOrganizationImpl.getInstance(
            Collections.singletonList(typedDocumentID), custodianIdentifier);

    OrganizationName custodianOrganizationName = new OrganizationNameImpl(
        "Custodian organisation");

    custodianOrganization.setName(custodianOrganizationName);
    custodianOrganization.setTelecom(contact);
    custodianOrganization.setAddress(
        new PostalAddressImpl(custodianAddress, PostalAddressUseEnum.POSTAL_ADDRESS));

    AssignedCustodian assignedCustodian = AssignedCustodianImpl
        .getInstance(custodianOrganization);
    return CustodianImpl.getInstance(assignedCustodian);
  }

  public static SubjectOfCareParticipant getSubjectOfCareParticipant() {
    // ***************************
    // ***** Subject Of Care *****
    // ***************************

    IHI subjectIHI = new IHI("8003600300001283");
    MedicareCardIdentifier mcCard = new MedicareCardIdentifier("1234567881");

    String subjectFamilyName = "Harding";

    DateTime dob = new LocalDate(1982, 11, 28).toDateTimeAtStartOfDay();

    AustralianAddress subjectFullAddress = new AustralianAddressImpl();

    subjectFullAddress.addUnstructuredAddressLine("The Complex");
    subjectFullAddress.addUnstructuredAddressLine("Unit 90210 / 10 Browning st");
    subjectFullAddress.setCity("West End");
    subjectFullAddress.setState(AustralianStateTerritory.QUEENSLAND.getAbbreviation());
    subjectFullAddress.setPostcode("4101");

    AddressContext subjectOfCareAddress =
        new AddressContextImpl(subjectFullAddress, AddressPurpose.RESIDENTIAL_PERMANENT);
    PersonName subjectPersonName = new PersonNameImpl(subjectFamilyName);
    subjectPersonName.addNameTitle(NameTitle.MISTER.getAbbreviation());
    subjectPersonName.addNameSuffix(NameSuffix.JUNIOR.getDescriptor());
    subjectPersonName.addGivenName("Frank");
    subjectPersonName.addPersonNameUsage(PersonNameUsage.MAIDEN_NAME_OR_NAME_AT_BIRTH);

    DateAccuracy dobAccuracy = new DateAccuracyImpl(true, true, true);
    DateOfBirthDetail subjectDOB = new DateOfBirthDetailImpl(dob, dobAccuracy);
    subjectDOB.setDateOfBirthAccuracyIndicator(dobAccuracy);
    subjectDOB.setDateOfBirthIsCalculatedFromAge(true);
    SubjectOfCareDemographicData subjectDemographicData =
        new SubjectOfCareDemographicDataImpl(Sex.MALE, subjectDOB);
    subjectDemographicData.setBirthPlurality(5);
    subjectDemographicData.setBirthOrder(2);
    int socAge = 35;
    subjectDemographicData.setAgeInYears(socAge);
    subjectDemographicData.setAgeAccurate(true);
    subjectDemographicData.setIndigenousStatus(
        IndigenousStatus.NOT_STATED_OR_INADEQUATELY_DESCRIBED);

    SubjectOfCarePerson subjectOfCarePerson =
        new SubjectOfCarePersonImpl(subjectPersonName, subjectDemographicData);
    SubjectOfCareParticipant subjectParticipant =
        new SubjectOfCareParticipantImpl(
            Collections.singletonList(subjectIHI), subjectOfCareAddress, subjectOfCarePerson);

    Telecom subjectTelephone =
        new TelecomImpl(TelecomMedium.TELEPHONE, "0712345678", TelecomUse.PERSONAL);

    Telecom subjectEmail =
        new TelecomImpl(
            TelecomMedium.EMAIL, "frank.harding@electronichealth.net.au", TelecomUse.PERSONAL);

    List<Telecom> subjectOfCareElectronicCommunicationDetailList = new ArrayList<>();
    subjectOfCareElectronicCommunicationDetailList.add(subjectTelephone);
    subjectOfCareElectronicCommunicationDetailList.add(subjectEmail);

    subjectParticipant.setElectronicCommunicationDetails(
        subjectOfCareElectronicCommunicationDetailList);

    AsEntityIdentifier subjectEntitlementNumber = new MedicareCardIdentifier("1234567881");
    Entitlement subjectEntitlement =
        new EntitlementImpl(subjectEntitlementNumber, EntitlementType.MEDICARE_BENEFITS);

    subjectEntitlement.setEntitlementValidityDuration(RestrictedTimeInterval
            .getHighInstance(new PrecisionDate(Precision.DAY, new DateTime().plusYears(1)))
        /*RestrictedTimeInterval.getLowWidthInstance(
            // from today(day only precision) for two weeks
            new PrecisionDate(Precision.DAY, new DateTime()),
            new TimeQuantity(2, TimeUnitOfMeasure.WEEK))*/);

    List<Entitlement> subjectOfCareEntitlementList = new ArrayList<>();
    subjectOfCareEntitlementList.add(subjectEntitlement);
    subjectParticipant.setEntitlements(subjectOfCareEntitlementList);
    return subjectParticipant;
  }

  public static SharedHealthSummaryAuthor getSharedHealthSummaryAuthor(DateTime now) {
    // ******************
    // ***** AUTHOR *****
    // ******************

    Coded occupation = ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER;

    AsEntityIdentifier authorHPII = new HPII("8003610000001145");
    // AsEntityIdentifier prescriberNumber = new MedicarePrescriberNumber("1234567A");

    PersonName authorLegalName =
        PersonNameImpl.getInstance(
            "Smith", "Sarah", "Dr", "III", PersonNameUsage.REGISTERED_NAME_OR_LEGAL_NAME);
    PersonName authorAlias =
        PersonNameImpl
            .getInstance("Jones", "Sarah", PersonNameUsage.MAIDEN_NAME_OR_NAME_AT_BIRTH);

    AustralianAddress authorStreetAddress = new AustralianAddressImpl();
    authorStreetAddress.addUnstructuredAddressLine("The Public");
    authorStreetAddress.addUnstructuredAddressLine("400 George Street");
    authorStreetAddress.setPostcode("4000");
    authorStreetAddress.setCity("Brisbane");
    authorStreetAddress.setState("QLD");
    AddressContext authorAddress =
        new AddressContextImpl(authorStreetAddress, AddressPurpose.BUSINESS);

    AustralianAddress authorStreetAddress2 = new AustralianAddressImpl();
    authorStreetAddress2.addUnstructuredAddressLine("1 Empty Road");
    authorStreetAddress2.addUnstructuredAddressLine("400 George Street");
    authorStreetAddress2.setPostcode("4000");
    authorStreetAddress2.setCity("Brisbane");
    authorStreetAddress2.setState("QLD");
    AddressContext authorAddress2 =
        new AddressContextImpl(authorStreetAddress2, AddressPurpose.BUSINESS);

    Telecom authorTelephone =
        new TelecomImpl(TelecomMedium.TELEPHONE, "0712345678", TelecomUse.BUSINESS);

    Telecom authorFax = new TelecomImpl(TelecomMedium.FAX, "0712345678", TelecomUse.BUSINESS);

    Telecom authorOrgTelephone = TelecomImpl.phone("0712345678");
    Telecom authorOrgFax = TelecomImpl.fax("0712345678");

    AustralianAddress authorOrgStreetAddress = new AustralianAddressImpl();
    authorOrgStreetAddress.addUnstructuredAddressLine("The Public");
    authorOrgStreetAddress.addUnstructuredAddressLine("400 George Street");
    authorOrgStreetAddress.setPostcode("4000");
    authorOrgStreetAddress.setCity("Brisbane");
    authorOrgStreetAddress.setState("QLD");
    AddressContext authorOrgAddress =
        new AddressContextImpl(authorOrgStreetAddress, AddressPurpose.BUSINESS);

    AustralianAddress authorOrgStreetAddress2 = new AustralianAddressImpl();
    authorOrgStreetAddress2.addUnstructuredAddressLine("2 George Street");
    authorOrgStreetAddress2.setPostcode("4002");
    authorOrgStreetAddress2.setCity("Brisbane");
    authorOrgStreetAddress2.setState("QLD");
    AddressContext authorOrgAddress2 =
        new AddressContextImpl(authorOrgStreetAddress2, AddressPurpose.BUSINESS);

    AddressContext authorOrgAddress3 = AddressContextImpl.noFixedAddress();

    HPIO authorHPIO = new HPIO("8003621231167886");
    ExtendedEmploymentOrganisationImpl employmentDetails =
        new ExtendedEmploymentOrganisationImpl(
            Collections.singletonList(authorHPIO),
            Arrays.asList(authorOrgAddress, authorOrgAddress2/*, authorOrgAddress3*/),
            Arrays.asList(authorOrgTelephone, authorOrgFax),
            "Sarahs Clinic");
    employmentDetails.setOrganisationNameUsage(OrganisationNameUsage.BUSINESS_NAME);
    employmentDetails.setEmploymentType(
        new CodeImpl("1", "2.16.840.1.113883.3.879.314867", "Employment type", "Permanent"));
    employmentDetails.setDepartmentUnit("Front Office");
    employmentDetails.setPositionInOrganisation(CodeImpl.fromOriginalText("Staff Doctor"));
    employmentDetails.setOccupation(ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER);

    return new SharedHealthSummaryAuthorImpl(
        occupation,
        now,
        Collections.singletonList(authorHPII),
        Arrays.asList(authorAddress, authorAddress2),
        Arrays.asList(authorTelephone, authorFax),
        Arrays.asList(authorLegalName, authorAlias),
        employmentDetails);
  }

  public static SubjectOfCareParticipant getSubjectOfCareParticipantFemale() {
    // ***********************************
    // ***** Subject Of Care (Female)*****
    // ***********************************

    IHI subjectIHI = new IHI("8003600300001283");
    MedicareCardIdentifier mcCard = new MedicareCardIdentifier("1234567881");

    String subjectFamilyName = "Sharma";

    DateTime dob = new LocalDate(1976, 8, 28).toDateTimeAtStartOfDay();

    AustralianAddress subjectFullAddress = new AustralianAddressImpl();

    subjectFullAddress.addUnstructuredAddressLine("The Complex");
    subjectFullAddress.addUnstructuredAddressLine("Unit 90210 / 10 Browning st");
    subjectFullAddress.setCity("West End");
    subjectFullAddress.setState(AustralianStateTerritory.QUEENSLAND.getAbbreviation());
    subjectFullAddress.setPostcode("4101");

    AddressContext subjectOfCareAddress =
        new AddressContextImpl(subjectFullAddress, AddressPurpose.RESIDENTIAL_PERMANENT);
    PersonName subjectPersonName = new PersonNameImpl(subjectFamilyName);
    subjectPersonName.addNameTitle(NameTitle.MRS.getAbbreviation());
    subjectPersonName.addNameSuffix(NameSuffix.FIRST.getDescriptor());
    subjectPersonName.addGivenName("Preety");
    subjectPersonName.addPersonNameUsage(PersonNameUsage.MAIDEN_NAME_OR_NAME_AT_BIRTH);

    DateAccuracy dobAccuracy = new DateAccuracyImpl(true, true, true);
    DateOfBirthDetail subjectDOB = new DateOfBirthDetailImpl(dob, dobAccuracy);
    subjectDOB.setDateOfBirthAccuracyIndicator(dobAccuracy);
    subjectDOB.setDateOfBirthIsCalculatedFromAge(true);
    SubjectOfCareDemographicData subjectDemographicData =
        new SubjectOfCareDemographicDataImpl(Sex.FEMALE, subjectDOB);
    subjectDemographicData.setBirthPlurality(5);
    subjectDemographicData.setBirthOrder(2);
    int socAge = 43;
    subjectDemographicData.setAgeInYears(socAge);
    subjectDemographicData.setAgeAccurate(true);
    subjectDemographicData.setIndigenousStatus(
        IndigenousStatus.NOT_STATED_OR_INADEQUATELY_DESCRIBED);

    SubjectOfCarePerson subjectOfCarePerson =
        new SubjectOfCarePersonImpl(subjectPersonName, subjectDemographicData);
    SubjectOfCareParticipant subjectParticipant =
        new SubjectOfCareParticipantImpl(
            Collections.singletonList(subjectIHI), subjectOfCareAddress, subjectOfCarePerson);

    Telecom subjectTelephone =
        new TelecomImpl(TelecomMedium.TELEPHONE, "0712345678", TelecomUse.PERSONAL);

    Telecom subjectEmail =
        new TelecomImpl(
            TelecomMedium.EMAIL, "preety.sharma@electronichealth.net.au", TelecomUse.PERSONAL);

    List<Telecom> subjectOfCareElectronicCommunicationDetailList = new ArrayList<>();
    subjectOfCareElectronicCommunicationDetailList.add(subjectTelephone);
    subjectOfCareElectronicCommunicationDetailList.add(subjectEmail);

    subjectParticipant.setElectronicCommunicationDetails(
        subjectOfCareElectronicCommunicationDetailList);

    AsEntityIdentifier subjectEntitlementNumber = new MedicareCardIdentifier("1234567881");
    Entitlement subjectEntitlement =
        new EntitlementImpl(subjectEntitlementNumber, EntitlementType.MEDICARE_BENEFITS);

    subjectEntitlement.setEntitlementValidityDuration(RestrictedTimeInterval
            .getHighInstance(new PrecisionDate(Precision.DAY, new DateTime().plusYears(1)))
        /*RestrictedTimeInterval.getLowWidthInstance(
            // from today(day only precision) for two weeks
            new PrecisionDate(Precision.DAY, new DateTime()),
            new TimeQuantity(2, TimeUnitOfMeasure.WEEK))*/);

    List<Entitlement> subjectOfCareEntitlementList = new ArrayList<>();
    subjectOfCareEntitlementList.add(subjectEntitlement);
    subjectParticipant.setEntitlements(subjectOfCareEntitlementList);
    return subjectParticipant;
  }

  /**
   * Document Author for the Clinical Document
   */
  public static DocumentAuthor getDocumentAuthor(DateTime now) {
    Coded occupation = ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER;

    AsEntityIdentifier authorHPII = new HPII("8003610000001145");
    // AsEntityIdentifier prescriberNumber = new MedicarePrescriberNumber("1234567A");

    PersonName authorLegalName =
        PersonNameImpl.getInstance(
            "Smith", "Sarah", "Dr", "III", PersonNameUsage.REGISTERED_NAME_OR_LEGAL_NAME);
    PersonName authorAlias =
        PersonNameImpl
            .getInstance("Jones", "Sarah", PersonNameUsage.MAIDEN_NAME_OR_NAME_AT_BIRTH);

    AustralianAddress authorStreetAddress = new AustralianAddressImpl();
    authorStreetAddress.addUnstructuredAddressLine("The Public");
    authorStreetAddress.addUnstructuredAddressLine("400 George Street");
    authorStreetAddress.setPostcode("4000");
    authorStreetAddress.setCity("Brisbane");
    authorStreetAddress.setState("QLD");
    AddressContext authorAddress =
        new AddressContextImpl(authorStreetAddress, AddressPurpose.BUSINESS);

    /*AustralianAddress authorStreetAddress2 = new AustralianAddressImpl();
    authorStreetAddress2.addUnstructuredAddressLine("1 Empty Road");
    authorStreetAddress2.addUnstructuredAddressLine("400 George Street");
    authorStreetAddress2.setPostcode("4000");
    authorStreetAddress2.setCity("Brisbane");
    authorStreetAddress2.setState("QLD");
    AddressContext authorAddress2 =
        new AddressContextImpl(authorStreetAddress2, AddressPurpose.BUSINESS);*/

    Telecom authorTelephone =
        new TelecomImpl(TelecomMedium.TELEPHONE, "0712345678", TelecomUse.BUSINESS);

    Telecom authorFax = new TelecomImpl(TelecomMedium.FAX, "0712345678", TelecomUse.BUSINESS);

    Telecom authorOrgTelephone = TelecomImpl.phone("0712345678");
    Telecom authorOrgFax = TelecomImpl.fax("0712345678");

    AustralianAddress authorOrgStreetAddress = new AustralianAddressImpl();
    authorOrgStreetAddress.addUnstructuredAddressLine("The Public");
    authorOrgStreetAddress.addUnstructuredAddressLine("400 George Street");
    authorOrgStreetAddress.setPostcode("4000");
    authorOrgStreetAddress.setCity("Brisbane");
    authorOrgStreetAddress.setState("QLD");
    AddressContext authorOrgAddress =
        new AddressContextImpl(authorOrgStreetAddress, AddressPurpose.BUSINESS);

    /*AustralianAddress authorOrgStreetAddress2 = new AustralianAddressImpl();
    authorOrgStreetAddress2.addUnstructuredAddressLine("2 George Street");
    authorOrgStreetAddress2.setPostcode("4002");
    authorOrgStreetAddress2.setCity("Brisbane");
    authorOrgStreetAddress2.setState("QLD");
    AddressContext authorOrgAddress2 =
        new AddressContextImpl(authorOrgStreetAddress2, AddressPurpose.BUSINESS);*/

    AddressContext authorOrgAddress3 = AddressContextImpl.noFixedAddress();

    HPIO authorHPIO = new HPIO("8003621231167886");
    ExtendedEmploymentOrganisationImpl employmentDetails =
        new ExtendedEmploymentOrganisationImpl(
            Collections.singletonList(authorHPIO),
            Collections.singletonList(authorOrgAddress),
            Arrays.asList(authorOrgTelephone, authorOrgFax),
            "Sarahs Clinic");
    employmentDetails.setOrganisationNameUsage(OrganisationNameUsage.BUSINESS_NAME);
    employmentDetails.setEmploymentType(
        new CodeImpl("1", "2.16.840.1.113883.3.879.314867", "Employment type", "Permanent"));
    employmentDetails.setDepartmentUnit("Front Office");
    employmentDetails.setPositionInOrganisation(CodeImpl.fromOriginalText("Staff Doctor"));
    employmentDetails.setOccupation(ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER);

    return new DocumentAuthorImpl(
        occupation,
        now,
        Collections.singletonList(authorHPII),
        Collections.singletonList(authorAddress),
        Arrays.asList(authorTelephone, authorFax),
        Arrays.asList(authorLegalName, authorAlias),
        employmentDetails);
  }

  public static List<InformationRecipient> getInformationRecipients() {

    List<InformationRecipient> informationRecipients = new ArrayList<>();

    List<PersonName> intendedRecipientNames = new ArrayList<>(2);
    intendedRecipientNames.add(
        PersonNameImpl.getInstance(
            "Black",
            "Joe",
            NameTitle.MRS.getDescriptor(),
            NameSuffix.JUNIOR.getDescriptor(),
            PersonNameUsage.REGISTERED_NAME_OR_LEGAL_NAME));
    intendedRecipientNames.add(
        PersonNameImpl.getInstance(
            "Alias",
            "other",
            NameTitle.MISS.getDescriptor(),
            PersonNameUsage.MAIDEN_NAME_OR_NAME_AT_BIRTH));

    HPII authenticatorHPII = new HPII("8003610000001145");
    Person intendedRecipientPerson =
        PersonImpl
            .getInstance(authenticatorHPII, intendedRecipientNames);

    HPIO authenticatorHPIO = new HPIO("8003621231167886");

    Organization legalAuthenticatorOrganisation =
        OrganizationImpl.getInstance(authenticatorHPIO, "Some Lab Name");

    String legalAuthenticatorID = UUID.randomUUID().toString();
    IntendedRecipient intendedRecipientCda =
        IntendedRecipientImpl.getInstance(
            legalAuthenticatorID, intendedRecipientPerson, legalAuthenticatorOrganisation);

    intendedRecipientCda.setCode(ANZSCO_1ED_2006.SURGEON_GENERAL);

    AustralianAddress authenticatorAddress = new AustralianAddressImpl();
    authenticatorAddress.addUnstructuredAddressLine("616 Bromley Street");
    authenticatorAddress.setState("QLD");
    authenticatorAddress.setPostcode("4169");
    authenticatorAddress.setCity("Brisbane");
    PostalAddress authenticatorPostalAddress =
        new PostalAddressImpl(authenticatorAddress, PostalAddressUseEnum.WORKPLACE);

    intendedRecipientCda.setAddress(
        Collections.singletonList(authenticatorPostalAddress));

    Telecom authenticatorEmail =
        new TelecomImpl(
            TelecomMedium.EMAIL, "example@sample.com", TelecomUse.BUSINESS);
    intendedRecipientCda.setTelecom(Collections.singletonList(authenticatorEmail));
    InformationRecipient informationRecipient = InformationRecipientImpl
        .getInstance(intendedRecipientCda);
    informationRecipients.add(informationRecipient);

    return informationRecipients;
  }

  public static ElectronicCommunicationDetail getElectronicCommunicationDetail() {
    ElectronicCommunicationDetail electronicCommunicationDetail =
        new ElectronicCommunicationDetail();
    electronicCommunicationDetail.setAddress("mail@blah.com");
    electronicCommunicationDetail.setMedium(ElectronicCommunicationMedium.EMAIL);
    electronicCommunicationDetail.setUsage(ElectronicCommunicationUsage.WORKPLACE);
    return electronicCommunicationDetail;
  }

  public static Address getAddress() {
    Address address = new AddressImpl();
    au.gov.nehta.model.clinical.common.address.AustralianAddress australianAddress = new au.gov.nehta.model.clinical.common.address.AustralianAddress();
    australianAddress.setAddressPurpose(AddressPurpose.BUSINESS);
    australianAddress.setAustralianAddressLevelType(AustralianAddressLevelType.Ground);
    australianAddress.setAddressSiteName("Nehtaville Site");
    australianAddress.setAustralianStateTerritory(AustralianStateTerritory.QUEENSLAND);
    australianAddress.setDeliveryPointId(69);
    australianAddress.setLevelNumber("1");
    australianAddress.setLotNumber("2");
    australianAddress.setPostalDeliveryType(PostalDeliveryType.GeneralPostOfficeBox);
    australianAddress.setPostCode("5555");
    australianAddress.setStreetName("Clinician Street");
    australianAddress.setStreetNumber(1);
    australianAddress.setStreetSuffix(StreetSuffix.Extension);
    australianAddress.setStreetType(StreetType.Street);
    australianAddress.setSuburbTownLocality("Nehtaville");
    australianAddress.setUnitNumber("123");
    australianAddress.setUnitType(UnitType.HALL);
    address.setAustralianAddress(australianAddress);
    return address;
  }

  public static ServiceProvider getServiceProviderIndividual() {
    ServiceProvider serviceProvider = new ServiceProviderImpl();
    List<Address> addresses = new ArrayList<>();
    addresses.add(getAddress());
    //addresses.add(getAddress());
    serviceProvider.setAddresses(addresses);
    List<ElectronicCommunicationDetail> electronicCommunicationDetails = new ArrayList<>();
    electronicCommunicationDetails.add(getElectronicCommunicationDetail());
    serviceProvider.setElectronicCommunicationDetails(electronicCommunicationDetails);
    PersonHealthcareProvider personHealthcareProvider = new au.gov.nehta.model.cda.common.person_org.PersonImpl();
    PersonName personName = new PersonNameImpl("Smith");
    personName.addGivenName("John");
    personName.addNameTitle("Dr");
    personName.addNameSuffix("Snr");
    personName.addPersonNameUsage(PersonNameUsage.REGISTERED_NAME_OR_LEGAL_NAME);
    personHealthcareProvider.setPersonNames(new ArrayList<PersonName>() {{
      add(personName);
    }});
    personHealthcareProvider.setQualifications("MBBS MS");
    personHealthcareProvider.setGender(Gender.Male);
    personHealthcareProvider
        .setDateOfBirth(new PrecisionDate(Precision.DAY, new DateTime("1970-11-11")));
    personHealthcareProvider.setEmploymentOrganisation(getEmploymentOrganization());
    serviceProvider.setHealthCareProvider(personHealthcareProvider);
    List<AsEntityIdentifier> entityIdentifiers = new ArrayList<>();
    HPII hpii = new HPII("8003610000001145");

    personHealthcareProvider.setIdentifiers(new ArrayList<UniqueIdentifier>() {{
      add(new UniqueIdentifierImpl("2.16.840.1.113883.19", "123A45"));
    }});

    entityIdentifiers.add(hpii);
    serviceProvider.setEntityIdentifiers(entityIdentifiers);
    serviceProvider.setOrganisation(
        new OrganisationImpl("Acme Hospital", OrganisationNameUsage.BUSINESS_NAME));
    return serviceProvider;
  }

  public static EmploymentOrganization getEmploymentOrganization() {
    EmploymentOrganization employmentOrganization = new EmploymentOrganizationImpl();
    employmentOrganization.setAddresses(new ArrayList<Address>() {
      {
        add(getAddress());
      }
    });
    employmentOrganization.setDepartment("Some department service provider");
    employmentOrganization.setElectronicCommunicationDetails(
        new ArrayList<ElectronicCommunicationDetail>() {
          {
            add(getElectronicCommunicationDetail());
          }
        });
    employmentOrganization.setEmploymentType(
        new CodeImpl("1", "2.16.840.1.113883.3.879.314867", "Employment type", "Permanent"));
    employmentOrganization.setName("Brisbane Health & Wellness Clinic");
    employmentOrganization.setOccupation(
        new CodeImpl(
            "253314", "2.16.840.1.113883.13.62",
            "1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, 2006",
            "Medical Oncologist", "Medical Oncologist"));
    employmentOrganization.setOrganisationNameUsage(OrganisationNameUsage.BUSINESS_NAME);
    employmentOrganization.setPositionInOrganization(
        new CodeImpl(
            "253314", "2.16.840.1.113883.13.62",
            "1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, 2006",
            "Medical Oncologist",
            "Medical Oncologist"));

    List<AsEntityIdentifier> entityIdentifiers = new ArrayList<>();
    HPIO hpio = new HPIO("8003620000045562");
    entityIdentifiers.add(hpio);
    employmentOrganization.setIdentifiers(entityIdentifiers);

    return employmentOrganization;
  }

  public static ServiceProvider getServiceProviderOrganization() {
    ServiceProvider serviceProvider = new ServiceProviderImpl();
    List<Address> addresses = new ArrayList<>();
    addresses.add(getAddress());
    serviceProvider.setAddresses(addresses);
    List<ElectronicCommunicationDetail> electronicCommunicationDetails = new ArrayList<>();
    electronicCommunicationDetails.add(getElectronicCommunicationDetail());
    serviceProvider.setElectronicCommunicationDetails(electronicCommunicationDetails);
    Organisation organisation = new OrganisationImpl("Warner Bros Hospital",
        OrganisationNameUsage.BUSINESS_NAME);

    organisation.setDepartmentUnit("112");
    List<AsEntityIdentifier> entityIdentifiers = new ArrayList<>();
    HPIO hpio = new HPIO("8003621566695741");
    //hpio.setExtension("fgfgfgffgfg");
    entityIdentifiers.add(hpio);

    serviceProvider.setEntityIdentifiers(entityIdentifiers);
    serviceProvider.setOrganisation(organisation);
    return serviceProvider;
  }

  public static ReferenceRangeDetails getReferenceRangeDetails() {
    ReferenceRangeDetails referenceRangeDetails = new ReferenceRangeDetails();
    referenceRangeDetails
        .setNormalStatus(HL7ObservationInterpretationNormality.Normal.getAsCoded());
    List<ReferenceRange> referenceRangeList = new LinkedList<>();
    ReferenceRange referenceRange = new ReferenceRange();
    //These reference range high and low values need to be included in the narrative.
    // As ref ranges are rare in DI we'll remove them from the example when publish but leave it here until IQ
    // rule testing is complete.
    QuantityRange quantityRange = new QuantityRange(0.11, 0.04, "g/L");
    referenceRange.setReferenceRange(quantityRange);
    referenceRangeList.add(referenceRange);

    referenceRange.setReferenceRange(quantityRange);
    referenceRange.setReferenceRangeMeaning(
        new CodeImpl("260395002", "2.16.840.1.113883.6.96", "SNOMED CT-AU",
            "normal range", "normal range"));

    referenceRangeDetails.setReferenceRange(referenceRangeList);
    return referenceRangeDetails;
  }

  public static OtherTestResult getOtherTestResultWithReportFile() {
    AttachedMedia reportFile = getAttachedMediaPDF("radiologyreport.pdf");
    return new OtherTestResultImpl(new CodeImpl() {{
      setOriginalText("Report Name (with attachment)");
    }},
        new CodeImpl("3", "1.2.36.1.2001.1001.101.104.16501", "NCTIS Result Status Values",
            "Final"), new PrecisionDate(Precision.DAY, new DateTime("2018-1-1")),
        reportFile);
  }

  public static OtherTestResult getOtherTestResultWithContent() {
    String reportContent = "    GLUCOSE - FASTING\n"
        + "\n"
        + "         BLOOD GLUCOSE                 10.8 * mmol/L         (3.9-6.0)\n"
        + "\n"
        + "      Values for Diagnosis of Diabetes Mellitus and other Hyperglycaemia\n"
        + "\n"
        + "       DIABETES MELLITUS (DM)\n"
        + "         Fasting                & > 6.9  mmol/L\n"
        + "         or 2 hrs post load     & > 11.0 mmol/L\n"
        + "\n"
        + "       IMPAIRED FASTING GLYCAEMIA (IFG)\n"
        + "         Fasting                & > 6.0 mmol/L and & < 7.0 mmol/L\n"
        + "\n"
        + "\n"
        + "\n"
        + "    Date Collected  : 07/07/2005\n"
        + "    Time Collected  : 12:15                 Reference\n"
        + "    Episode         : 1    Units      Range\n"
        + "    ==============    ==========\n"
        + "\n"
        + "\n"
        + "    GLUCOSE - FASTING\n"
        + "    BLOOD GLUCOSE   : 10.8 *     mmol/L     (3.9-6.0)";
    return new OtherTestResultImpl(new CodeImpl() {{
      setOriginalText("Report Name");
    }}, new CodeImpl("3", "1.2.36.1.2001.1001.101.104.16501", "NCTIS Result Status Values",
        "Final"), new PrecisionDate(Precision.DAY, new DateTime("2017-1-1")), reportContent);
  }

  public static DiagnosticInvestigations getDiagnosticInvestigations(
      boolean showPathologyTestResults,
      boolean showImagingExaminationResults, boolean showRequestedServices,
      boolean showOtherTestResults) throws FileNotFoundException {
    DiagnosticInvestigations diagnosticInvestigations = new DiagnosticInvestigationsImpl();
    //Pathology Test Results
    if (showPathologyTestResults) {
      List<PathologyTestResult> pathologyTestResults = new ArrayList<>();
      pathologyTestResults.add(EventSummaryTestHelper.createPathologyResults(true));
      diagnosticInvestigations.setPathologyTestResults(pathologyTestResults);
    }
    //Imaging Examination Results
    if (showImagingExaminationResults) {
      List<ImagingExaminationResult> imagingExaminationResults = new ArrayList<>();
      imagingExaminationResults.add(getImagingExaminationResult());
      diagnosticInvestigations.setImagingExaminationResults(imagingExaminationResults);
    }
    //Requested Services
    if (showRequestedServices) {
      List<RequestedService> requestedServices = getRequestedServices();
      diagnosticInvestigations.setRequestedServices(requestedServices);
    }
    //Other test results
    if (showOtherTestResults) {
      List<OtherTestResult> otherTestResults = new ArrayList<>();
      otherTestResults.add(getOtherTestResultWithContent());
      otherTestResults.add(getOtherTestResultWithReportFile());
      diagnosticInvestigations.setOtherTestResults(otherTestResults);
    }
    return diagnosticInvestigations;
  }

  public static List<RequestedService> getRequestedServices() {
    List<RequestedService> requestedServices = new ArrayList<>();
    requestedServices
        .add(getRequestedService(getServiceProviderIndividual(), EventTypes.EVENT)); //Ind
    requestedServices
        .add(getRequestedService(getServiceProviderOrganization(), EventTypes.INTENT)); //Org
    return requestedServices;
  }

  public static List<RequestedService> getRequestedServicesIndividualProvider() {
    List<RequestedService> requestedServices = new ArrayList<>();
    requestedServices
        .add(getRequestedService(getServiceProviderIndividual(), EventTypes.EVENT)); //Ind
    return requestedServices;
  }

  public static ImagingExaminationResult getImagingExaminationResult()
      throws FileNotFoundException {
    List<AnatomicalSite> anatomicalSites = new ArrayList<>();
    anatomicalSites.add(getAnatomicalSite("ImagingExaminationResult"));
    ImagingExaminationResult imagingExaminationResult = new ImagingExaminationResultImpl();
    ImagingExaminationResultGroup imagingExaminationResultGroup = new ImagingExaminationResultGroupImpl();
    imagingExaminationResultGroup
        .setAnatomicalSite(getAnatomicalSite("ImagingExaminationResultGroup"));
    imagingExaminationResultGroup.setImagingExaminationResultGroupName(new CodeImpl() {{
      setOriginalText("Result Group Name");
      setCode(UUID.randomUUID().toString());
      setCodeSystem("2.999.333");
    }});
    ImagingResult imagingResult = new ImagingResultImpl();
    imagingResult.setIndividualImagingExaminationResultName(new CodeImpl() {{
      setOriginalText("Imaging Result Name");
    }});
    ResultValue resultValue = new ResultValue();
    resultValue.setQuantityResultValue(new Quantity("2.2", "mL"));

    //Todo we'll remove reference range details in the final example.
    // But we'll leave it in while we are doing the IQ rules testing
    resultValue.setReferenceRangeDetails(getReferenceRangeDetails());
    imagingResult.setIndividualImagingExaminationResultValue(resultValue);
    imagingResult.setResultComment(new ArrayList<String>() {
      {
        add("Please");
        add("Add Comments");
      }
    });
    imagingExaminationResultGroup.setResults(new ArrayList<ImagingResult>() {{
      add(imagingResult);
    }});
    imagingExaminationResult.setResultGroups(new ArrayList<ImagingExaminationResultGroup>() {{
      add(imagingExaminationResultGroup);
    }});
    imagingExaminationResult.setImagingExaminationResultName(
        new CodeImpl() {{
          setOriginalText("Result Name");
        }});
    imagingExaminationResult
        .setObservationDateTime(new PrecisionDate(Precision.DAY, new DateTime("2013-01-02")));
    imagingExaminationResult.setFindings("xyz");
    imagingExaminationResult
        .setImagingModality(
            new CodeImpl("363680008", "2.16.840.1.113883.6.96",
                "SNOMED CT-AU", "x-ray", "x-ray"));
    imagingExaminationResult.setImagingExaminationResultStatus(
        new CodeImpl("3", "1.2.36.1.2001.1001.101.104.16501",
            "NCTIS Result Status Values", "Final", "Final"));
    imagingExaminationResult.setAnatomicalSites(anatomicalSites);
    imagingExaminationResult.setClinicalInformationProvided("Fluid Retention.");
    imagingExaminationResult.setCustomNarrative(null);
    List<ExaminationRequestDetails> examinationRequestDetailsList = new ArrayList<>();
    examinationRequestDetailsList.add(getExaminationRequestDetails());
    imagingExaminationResult.setExaminationRequestDetails(examinationRequestDetailsList);
    imagingExaminationResult
        .setExaminationResultRepresentation("Rich Text Format");
    return imagingExaminationResult;
  }

  public static ExaminationRequestDetails getExaminationRequestDetails()
      throws FileNotFoundException {
    //Image Details
    ImageDetails imageDetail = new ImageDetailsImpl();
    imageDetail.setSubjectPosition("Subject Pos");
    imageDetail.setImageViewName(
        new CodeImpl() {{
          setOriginalText("1 X-Ray - A/U Skin - Stuff");
        }});
    imageDetail.setSubjectPosition("Subject Position");
    imageDetail.setImage(getAttachedMedia("", Optional.empty()));
    imageDetail.setImageDateTime(
        new PrecisionDate(Precision.DAY, new DateTime("2013-01-1")));
    imageDetail.setSeriesIdentifier(
        new UniqueIdentifierImpl("2.999.23",
            "Accession Number Group: 0008  Element: 0050"));
    imageDetail.setImageIdentifier(
        new UniqueIdentifierImpl(UUID.randomUUID().toString(), "Image Identifier"));
    List<ImageDetails> imageDetails = new LinkedList<>();
    imageDetails.add(imageDetail);
    ExaminationRequestDetails examinationRequestDetails = new ExaminationRequestDetailsImpl();
    List<String> names = new LinkedList<>();
    names.add("Chest X-ray");
    examinationRequestDetails.setExaminationRequestedNames(names);
    examinationRequestDetails.setImageDetails(imageDetails);
    examinationRequestDetails.setObservationDateTime(
        new PrecisionDate(Precision.DAY, new DateTime("2013-01-1")));
    examinationRequestDetails.setReportIdentifier(
        new UniqueIdentifierImpl(UUID.randomUUID().toString()));
    examinationRequestDetails.setSeriesIdentifier(
        new UniqueIdentifierImpl("2.999.24", "Series Identifier"));

    return examinationRequestDetails;
  }

  public static AnatomicalSite getAnatomicalSite(String s) throws FileNotFoundException {
    AnatomicalSite anatomicalSite = new AnatomicalSiteImpl();
    anatomicalSite.setAnatomicalLocationImages(new ArrayList<AttachedMedia>() {{
      add(getAttachedMedia(s, Optional.empty()));
      add(getAttachedMedia(s, Optional.empty()));
    }});
    anatomicalSite.setSpecificLocation(
        new SpecificLocation(
            //Joshua's change
            new SNOMED_AU_Code("14975008", String.format("Forearm structure %s", s)),
            //Joshua's change    anatomicalSite.setAnatomicalLocationDesc("Left Forearm");
            new SNOMED_AU_Code("7771000", "Left")));
    anatomicalSite.setAnatomicalLocationDesc("Left Forearm");
    return anatomicalSite;
  }

  private static RequestedService getRequestedService(ServiceProvider serviceProvider,
                                                      EventTypes eventType) {
    RequestedService requestedService = new RequestedServiceImpl();
    requestedService.setCustomNarrative(null);
    requestedService.setServiceComment("Service comment");
    requestedService.setSubjectOfCareInstructionDesc("Drip dry.");
    ParticipationServiceProvider participantServiceProvider =
        new ParticipationServiceProviderImpl();
    participantServiceProvider.setParticipant(serviceProvider);
    participantServiceProvider.setRole(
        new CodeImpl(
            "309964003",
            "2.16.840.1.113883.6.96",
            "SNOMED CT",
            "Radiology Department",
            "Radiology Department"));
    participantServiceProvider.setParticipationPeriod(
        RestrictedTimeInterval.getLowHighInstance(
            new PrecisionDate(Precision.DAY, new DateTime("2013-01-1")),
            new PrecisionDate(Precision.DAY, new DateTime("2013-04-1"))));
    requestedService.setParticipant(participantServiceProvider);
    if (eventType == EventTypes.EVENT) {
      requestedService.setRequestedDateTime(
          new PrecisionDate(Precision.DAY, new DateTime("2012-12-1")));
    } else {
      requestedService.setServiceCommencementWindow(RestrictedTimeInterval.getLowHighInstance(
          new PrecisionDate(Precision.DAY, new DateTime("2015-02-2")),
          new PrecisionDate(Precision.DAY, new DateTime("2015-04-1"))));
    }
    requestedService.setRequestedServiceDateTime(
        new PrecisionDate(Precision.DAY, new DateTime("2015-01-22")));

    //Healthcare provider will have a commencement window, Organization will have a service scheduled date
   /* if(null != serviceProvider.getHealthCareProvider()){
      requestedService.setServiceCommencementWindow(RestrictedTimeInterval.getLowHighInstance(
              new PrecisionDate(Precision.DAY, new DateTime("2015-03-1")),
              new PrecisionDate(Precision.DAY, new DateTime("2015-06-1"))));
    }else{
      requestedService.setServiceScheduled(
              new PrecisionDate(Precision.DAY, new DateTime("2015-02-3")));
    }*/
    requestedService.setServiceBookingStatus(eventType);
    /*requestedService
        .setServiceScheduled(new PrecisionDate(Precision.DAY, new DateTime("2015-06-1")));*/
    requestedService.setSubjectOfCareInstructionDesc("Drip dry");
    requestedService.setRequestedServiceDescription(
        new CodeImpl("399208008", "2.16.840.1.113883.6.96", "SNOMED CT-AU",
            "chest x-ray", "chest x-ray"));

    List<Entitlement> entitlements = new ArrayList<>();

    AsEntityIdentifier entityIdentifier = new AsEntityIdentifierImpl();
    entityIdentifier.setRoot("1.2.36.174030967.0.3");
    //entityIdentifier.setRoot("2.999.52");
    entityIdentifier.setExtension("123456AF");
    entityIdentifier.setCode(new CodeImpl() {{
      setCode(EntitlementType.MEDICARE_PRESCRIBER_NUMBER.getCode());
      setCodeSystemName(EntitlementType.MEDICARE_PRESCRIBER_NUMBER.getCodeSystemName());
      setCodeSystem(EntitlementType.MEDICARE_PRESCRIBER_NUMBER.getCodeSystem());
    }});

    Entitlement entitlement = new EntitlementImpl(entityIdentifier,
        EntitlementType.MEDICARE_PRESCRIBER_NUMBER);
    entitlement.setEntitlementValidityDuration(RestrictedTimeInterval.getLowHighInstance(
        new PrecisionDate(Precision.DAY, new DateTime("2013-01-1")),
        new PrecisionDate(Precision.DAY, new DateTime("2013-04-1"))));
    entitlements.add(entitlement);

    if (null != requestedService.getParticipant().getParticipant().getHealthCareProvider()) {
      requestedService.getParticipant().getParticipant().getHealthCareProvider()
          .setEntitlements(entitlements);
    }
    return requestedService;
  }

  public static AttachedMedia getAttachedMediaPDF(String fileName) {
    File media;
    if (!new File(String.format("%s/%s", ATTACHMENTS_DIR, fileName)).exists()) {
      media = new File(String.format("src/%s/%s", ATTACHMENTS_DIR, fileName));
    } else {
      media = new File(String.format("%s/%s", ATTACHMENTS_DIR, fileName));
    }
    if (!media.exists()) {
      throw new RuntimeException(
          "Attachment does not exist in DIR : " + ATTACHMENTS_DIR + fileName);
    }
    return new AttachedMedia(media);
  }

  public static Medications getMedications() {
    Medications medications = new MedicationsImpl();
    List<KnownMedication> knownMedications = new ArrayList<>();
    KnownMedication knownMedication = new KnownMedicationImpl();
    knownMedication.setChangeDesc("New - prescribed");
    knownMedication.setChangeOrRecommendationReason("New - prescribed");
    knownMedication.setChangeStatus(
        new CodeImpl("703465008", "2.16.840.1.113883.6.96", "SNOMED CT",
            "Change made", "Change made"));
    knownMedication.setChangeType(
        new CodeImpl("105681000036100", "2.16.840.1.113883.6.96", "SNOMED CT",
            "Prescribed", "Prescribed"));
    knownMedication.setClinicalIndication("Pain control");
    knownMedication.setDirections("Directions Text");
    knownMedication.setMedicationInstructionComment("Dosage to be reviewed in 10 days");
    knownMedication.setTherapeuticGoodIdentification(
        new CodeImpl(
            "835831000168109", "2.16.840.1.113883.6.96", "SNOMED CT",
            "Panadeine Forte uncoated tablet", "Panadeine Forte uncoated tablet"));
    knownMedications.add(knownMedication);
    medications.setKnownMedications(knownMedications);
    return medications;
  }

}
