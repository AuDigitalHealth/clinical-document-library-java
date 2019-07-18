package au.gov.nehta.cda.test;

import au.gov.nehta.model.cda.common.address.PostalAddress;
import au.gov.nehta.model.cda.common.address.PostalAddressImpl;
import au.gov.nehta.model.cda.common.address.PostalAddressUseEnum;
import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.cda.common.code.CodeImpl;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.custodian.AssignedCustodian;
import au.gov.nehta.model.cda.common.custodian.AssignedCustodianImpl;
import au.gov.nehta.model.cda.common.custodian.Custodian;
import au.gov.nehta.model.cda.common.custodian.CustodianImpl;
import au.gov.nehta.model.cda.common.custodian.CustodianOrganization;
import au.gov.nehta.model.cda.common.custodian.CustodianOrganizationImpl;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.id.AssignedEntity;
import au.gov.nehta.model.cda.common.id.AssignedEntityImpl;
import au.gov.nehta.model.cda.common.id.LegalAuthenticator;
import au.gov.nehta.model.cda.common.id.LegalAuthenticatorImpl;
import au.gov.nehta.model.cda.common.id.MedicareCardIdentifier;
import au.gov.nehta.model.cda.common.org.Organization;
import au.gov.nehta.model.cda.common.org.OrganizationImpl;
import au.gov.nehta.model.cda.common.org.OrganizationName;
import au.gov.nehta.model.cda.common.org.OrganizationNameImpl;
import au.gov.nehta.model.cda.common.person.Person;
import au.gov.nehta.model.cda.common.person.PersonImpl;
import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.cda.common.telecom.TelecomImpl;
import au.gov.nehta.model.cda.common.telecom.TelecomMedium;
import au.gov.nehta.model.cda.common.telecom.TelecomUse;
import au.gov.nehta.model.cda.common.time.Precision;
import au.gov.nehta.model.cda.common.time.PrecisionDate;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.clinical.common.SubjectOfCareDemographicData;
import au.gov.nehta.model.clinical.common.SubjectOfCareDemographicDataImpl;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipantImpl;
import au.gov.nehta.model.clinical.common.SubjectOfCarePerson;
import au.gov.nehta.model.clinical.common.SubjectOfCarePersonImpl;
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
import au.gov.nehta.model.clinical.common.participation.OrganisationNameUsage;
import au.gov.nehta.model.clinical.common.participation.PersonName;
import au.gov.nehta.model.clinical.common.participation.PersonNameImpl;
import au.gov.nehta.model.clinical.common.participation.PersonNameUsage;
import au.gov.nehta.model.clinical.common.participation.Sex;
import au.gov.nehta.model.clinical.common.types.HPII;
import au.gov.nehta.model.clinical.common.types.HPIO;
import au.gov.nehta.model.clinical.common.types.IHI;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;
import au.gov.nehta.model.clinical.diagnostic.pathology.ExtendedEmploymentOrganisationImpl;
import au.gov.nehta.model.clinical.es.EventSummaryAuthor;
import au.gov.nehta.model.clinical.es.EventSummaryAuthorImpl;
import au.gov.nehta.model.clinical.etp.common.participation.AddressContext;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;
import au.gov.nehta.model.clinical.etp.common.participation.EntitlementImpl;
import au.gov.nehta.model.clinical.etp.common.participation.EntitlementType;
import au.gov.nehta.model.clinical.shs.SharedHealthSummaryAuthor;
import au.gov.nehta.model.clinical.shs.SharedHealthSummaryAuthorImpl;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.StringWriter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
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

  /**
   * print the string to a file
   */
  public static void printToFile(String s, String fileName) {
    FileOutputStream fs = null;

    try {
      fs = new FileOutputStream(new File(fileName));
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
            Arrays.asList(authorOrgAddress, authorOrgAddress2, authorOrgAddress3),
            Arrays.asList(authorOrgTelephone, authorOrgFax),
            "Sarahs Clinic");
    employmentDetails.setOrganisationNameUsage(OrganisationNameUsage.BUSINESS_NAME);
    employmentDetails.setEmploymentType(CodeImpl.fromOriginalText("Permanent/Full Time"));
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

  public static EventSummaryAuthor getEventSummaryAuthor(DateTime now) {
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
            Arrays.asList(authorOrgAddress, authorOrgAddress3),
            Arrays.asList(authorOrgTelephone, authorOrgFax),
            "Sarahs Clinic");
    employmentDetails.setOrganisationNameUsage(OrganisationNameUsage.BUSINESS_NAME);
    employmentDetails.setEmploymentType(CodeImpl.fromOriginalText("Permanent/Full Time"));
    employmentDetails.setDepartmentUnit("Front Office");
    employmentDetails.setPositionInOrganisation(CodeImpl.fromOriginalText("Staff Doctor"));
    employmentDetails.setOccupation(ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER);

    return new EventSummaryAuthorImpl(
        occupation,
        now,
        Collections.singletonList(authorHPII),
        Collections.singletonList(authorAddress),
        Arrays.asList(authorTelephone, authorFax),
        Arrays.asList(authorLegalName, authorAlias),
        employmentDetails);
  }

}
