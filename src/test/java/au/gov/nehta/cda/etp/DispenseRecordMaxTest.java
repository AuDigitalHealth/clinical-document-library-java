package au.gov.nehta.cda.etp;

import static au.gov.nehta.model.schematron.SchematronResource.SchematronResources.DISPENSE_RECORD_3A;
import static junit.framework.Assert.assertTrue;

import au.gov.nehta.builder.etp.dispenserecord.DispenseRecordCreator;
import au.gov.nehta.builder.util.UUIDTool;
import au.gov.nehta.cda.test.Base;
import au.gov.nehta.cda.test.TestHelper;
import au.gov.nehta.model.cda.common.address.PostalAddress;
import au.gov.nehta.model.cda.common.address.PostalAddressImpl;
import au.gov.nehta.model.cda.common.address.PostalAddressUseEnum;
import au.gov.nehta.model.cda.common.code.AMTCode;
import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.cda.common.code.CodeImpl;
import au.gov.nehta.model.cda.common.code.NCTISDataComponent;
import au.gov.nehta.model.cda.common.code.PatientCategory;
import au.gov.nehta.model.cda.common.code.SNOMED_AU_Code;
import au.gov.nehta.model.cda.common.custodian.AssignedCustodian;
import au.gov.nehta.model.cda.common.custodian.AssignedCustodianImpl;
import au.gov.nehta.model.cda.common.custodian.Custodian;
import au.gov.nehta.model.cda.common.custodian.CustodianImpl;
import au.gov.nehta.model.cda.common.custodian.CustodianOrganization;
import au.gov.nehta.model.cda.common.custodian.CustodianOrganizationImpl;
import au.gov.nehta.model.cda.common.document.BaseClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocumentFactory;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifierImpl;
import au.gov.nehta.model.cda.common.id.AssignedEntity;
import au.gov.nehta.model.cda.common.id.AssignedEntityImpl;
import au.gov.nehta.model.cda.common.id.LegalAuthenticator;
import au.gov.nehta.model.cda.common.id.LegalAuthenticatorImpl;
import au.gov.nehta.model.cda.common.id.MedicareCardIdentifier;
import au.gov.nehta.model.cda.common.id.TemplateIdImpl;
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
import au.gov.nehta.model.cda.etp.DispenseRecordCdaModel;
import au.gov.nehta.model.clinical.common.SubjectOfCareDemographicData;
import au.gov.nehta.model.clinical.common.SubjectOfCareDemographicDataImpl;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipantImpl;
import au.gov.nehta.model.clinical.common.SubjectOfCarePerson;
import au.gov.nehta.model.clinical.common.SubjectOfCarePersonImpl;
import au.gov.nehta.model.clinical.common.participation.Address;
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
import au.gov.nehta.model.clinical.common.participation.PersonName;
import au.gov.nehta.model.clinical.common.participation.PersonNameImpl;
import au.gov.nehta.model.clinical.common.participation.PersonNameUsage;
import au.gov.nehta.model.clinical.common.participation.Sex;
import au.gov.nehta.model.clinical.common.types.HPII;
import au.gov.nehta.model.clinical.common.types.HPIO;
import au.gov.nehta.model.clinical.common.types.IHI;
import au.gov.nehta.model.clinical.common.types.Ratio;
import au.gov.nehta.model.clinical.common.types.RealQuantity;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;
import au.gov.nehta.model.clinical.etp.common.item.Ingredient;
import au.gov.nehta.model.clinical.etp.common.item.Logo;
import au.gov.nehta.model.clinical.etp.common.item.QuantityUnitDescription;
import au.gov.nehta.model.clinical.etp.common.item.QuantityUnitDescriptionImpl;
import au.gov.nehta.model.clinical.etp.common.participation.AddressContext;
import au.gov.nehta.model.clinical.etp.common.participation.DispenserParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.DispenserParticipantImpl;
import au.gov.nehta.model.clinical.etp.common.participation.DispenserParticipation;
import au.gov.nehta.model.clinical.etp.common.participation.DispenserParticipationImpl;
import au.gov.nehta.model.clinical.etp.common.participation.DispensingOrganisationParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.DispensingOrganisationParticipantImpl;
import au.gov.nehta.model.clinical.etp.common.participation.DispensingOrganisationParticipation;
import au.gov.nehta.model.clinical.etp.common.participation.DispensingOrganisationParticipationImpl;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;
import au.gov.nehta.model.clinical.etp.common.participation.EntitlementImpl;
import au.gov.nehta.model.clinical.etp.common.participation.EntitlementType;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderAddress;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderAddressImpl;
import au.gov.nehta.model.clinical.etp.dispenserecord.ClaimTypeCategory;
import au.gov.nehta.model.clinical.etp.dispenserecord.DispenseItem;
import au.gov.nehta.model.clinical.etp.dispenserecord.DispenseItemBuilder;
import au.gov.nehta.model.clinical.etp.dispenserecord.DispenseRecord;
import au.gov.nehta.model.clinical.etp.dispenserecord.DispenseRecordContext;
import au.gov.nehta.model.clinical.etp.dispenserecord.DispenseRecordContextImpl;
import au.gov.nehta.model.clinical.etp.dispenserecord.DispenseRecordImpl;
import au.gov.nehta.model.clinical.etp.dispenserecord.DispensingStatus;
import au.gov.nehta.model.clinical.etp.dispenserecord.ManufacturingCode;
import au.gov.nehta.model.common.CDAModelImpl;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.gov.nehta.schematron.Schematron;
import au.gov.nehta.schematron.SchematronCheckResult;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.UUID;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import org.joda.time.DateTime;
import org.joda.time.LocalDate;
import org.junit.Ignore;
import org.junit.Test;

public class DispenseRecordMaxTest extends Base {

  private static final String SCHEMATRON = DISPENSE_RECORD_3A.resource().getSchematron();
  private static String SCHEMATRON_TEMPLATE_PATH = "src/test/resources/dispenseRecord";
  private static final String DOCUMENT_FILE_NAME = "src/test/resources/generated_xml/dispense_record/dispense-max.xml";


  @Test
  @Ignore
  public void test_MAX_DispenseRecordCreation()
      throws ParserConfigurationException, JAXBException,
          SchematronValidationException {
    generateMax();
    SchematronCheckResult check = Schematron
        .check(SCHEMATRON_TEMPLATE_PATH, SCHEMATRON, DOCUMENT_FILE_NAME);

    show(check);

    assertTrue(check.schemaErrors.size() == 0);
    assertTrue(check.schematronErrors.size() == 0);
  }


  public void generateMax()
      throws ParserConfigurationException, JAXBException, SchematronValidationException {
    // Setup context
    // Subject Of Care
    IHI ihi = new IHI("8003600300001283");
    String socFamilyName = "Example";

    DateTime dob = new LocalDate(1982, 11, 28).toDateTimeAtStartOfDay();

    AustralianAddress subjectOfCareAustralianAddress = new AustralianAddressImpl();
    subjectOfCareAustralianAddress
        .addUnstructuredAddressLine("Desk-40, Level 2, 10 Browning street");
    subjectOfCareAustralianAddress.setCity("Brisbane");
    subjectOfCareAustralianAddress.setState(AustralianStateTerritory.QUEENSLAND.getAbbreviation());
    subjectOfCareAustralianAddress.setPostcode("4101");

    AddressContext subjectOfCareAddress = new AddressContextImpl(subjectOfCareAustralianAddress,
        AddressPurpose.RESIDENTIAL_PERMANENT);
    PersonName subjectOfCarePersonName = new PersonNameImpl(socFamilyName);
    subjectOfCarePersonName.addNameTitle(NameTitle.MISTER.getDescriptor());
    subjectOfCarePersonName.addNameSuffix(NameSuffix.JUNIOR.getDescriptor());
    subjectOfCarePersonName.addGivenName("I'm an");
    subjectOfCarePersonName.addPersonNameUsage(PersonNameUsage.MAIDEN_NAME_OR_NAME_AT_BIRTH);

    //the most common way of adding a date of birth, age and accuracy indicator.
    //age will be calculated from date of birth
    DateAccuracy dobAccuracy = new DateAccuracyImpl(/*day */ true,  /*month*/ true, /*year*/ true);
    DateOfBirthDetail socDobDetail = new DateOfBirthDetailImpl(dob, dobAccuracy);

    SubjectOfCareDemographicData socDemographicData = new SubjectOfCareDemographicDataImpl(Sex.MALE,
        socDobDetail);
    socDemographicData.setBirthPlurality(5);
    socDemographicData.setBirthOrder(2);
    socDemographicData.setIndigenousStatus(IndigenousStatus.NOT_STATED_OR_INADEQUATELY_DESCRIBED);

		/*
		  
		 - An alternate option is to specify the age.
             The Date of birth will be calculated in reverse, accuracy will be UUA, 
             Date of Birth Calculated From Age will be set to true
        
        int ageInYears = 30;
        SubjectOfCareDemographicData socDemographicData = new SubjectOfCareDemographicDataImpl(Sex.MALE, ageInYears );
        
        */

    SubjectOfCarePerson subjectOfCarePerson = new SubjectOfCarePersonImpl(subjectOfCarePersonName,
        socDemographicData);
    SubjectOfCareParticipant subjectOfCareParticipant = new SubjectOfCareParticipantImpl(
        Arrays.asList(ihi), Arrays.asList(subjectOfCareAddress), subjectOfCarePerson);

    Telecom socTelephone =
        new TelecomImpl(
            TelecomMedium.TELEPHONE,
            "0712345678",
            TelecomUse.PERSONAL
        );

    Telecom socEmail =
        new TelecomImpl(
            TelecomMedium.EMAIL,
            "iman.example@electronichealth.net.au",
            TelecomUse.PERSONAL
        );

    List<Telecom> socComms = new ArrayList<Telecom>();
    socComms.add(socTelephone);
    socComms.add(socEmail);

    subjectOfCareParticipant.setElectronicCommunicationDetails(socComms);

    AsEntityIdentifier subjectOfCareEntitlementNumber = new MedicareCardIdentifier("123456789-1");

    Entitlement subjectOfCareEntitlement = new EntitlementImpl(subjectOfCareEntitlementNumber,
        EntitlementType.MEDICARE_BENEFITS);

    //new ParticipantEntitlement starting from today
    subjectOfCareEntitlement.setEntitlementValidityDuration(
        RestrictedTimeInterval.getLowInstance(new PrecisionDate(Precision.DAY)));

    List<Entitlement> subjectOfCareEntitlementList = new ArrayList<Entitlement>();
    subjectOfCareEntitlementList.add(subjectOfCareEntitlement);
    subjectOfCareParticipant.setEntitlements(subjectOfCareEntitlementList);

    // Dispenser
    HPII dispenserHPII = new HPII("8003610000001145");
    String dispenserFamilyName = "Davo";

    Calendar dispenserDOB = GregorianCalendar.getInstance();
    dispenserDOB.set(1952, Calendar.JANUARY, 1);
    //the author location
    AustralianAddress dispenserAddress = new AustralianAddressImpl();
    dispenserAddress.addUnstructuredAddressLine("chemical wherehouse 10 Browning street");
    dispenserAddress.setCity("Brisbane");
    dispenserAddress.setState(AustralianStateTerritory.QUEENSLAND.getAbbreviation());
    dispenserAddress.setPostcode("4101");
    ProviderAddress dispenserProviderAddress = new ProviderAddressImpl(false, dispenserAddress,
        AddressPurpose.BUSINESS);

    DispenserParticipant dispenserParticipant = new DispenserParticipantImpl(dispenserHPII,
        PersonNameImpl.getInstance(dispenserFamilyName, "Duncan", NameTitle.DOCTOR.getDescriptor(),
            PersonNameUsage.REGISTERED_NAME_OR_LEGAL_NAME), dispenserProviderAddress);
    dispenserParticipant.addElectronicCommunicationDetail(new TelecomImpl("0299345678"));
    DispenserParticipation dispenserParticipation = new DispenserParticipationImpl(
        dispenserParticipant);

    //add A phone number

    // Dispenser Organisation
    //component of section
    HPIO dispensingOrgHPIO = new HPIO("8003621231167886");
    String dispenserOrgName = "London Drugs";

    AustralianAddress dispensingOrgAddress = new AustralianAddressImpl();
    dispensingOrgAddress
        .addUnstructuredAddressLine("London Drugs, Shop 42, Level 2, 10 Browning street");
    dispensingOrgAddress.setCity("West End");
    dispensingOrgAddress.setState(AustralianStateTerritory.QUEENSLAND.getAbbreviation());
    dispensingOrgAddress.setPostcode("4101");

    ProviderAddress dispensingOrganisationAddress = new ProviderAddressImpl(false,
        dispensingOrgAddress, AddressPurpose.BUSINESS);
    Telecom dispensingOrgEmail =
        new TelecomImpl(TelecomMedium.EMAIL, "info1@londondrugs.com.au");
    Telecom dispensingOrgTel = new TelecomImpl("0299345678");

    List<Telecom> electronicCommunicationDetailList = Arrays
        .asList(dispensingOrgEmail, dispensingOrgTel);

    Organisation dispensingOrganisation = new OrganisationImpl(dispenserOrgName);
    dispensingOrganisation.setDepartmentUnit("General Health");

    DispensingOrganisationParticipant dispensingOrganisationParticipant = new DispensingOrganisationParticipantImpl(
        dispensingOrgHPIO,
        dispensingOrganisationAddress, electronicCommunicationDetailList, dispensingOrganisation);

    AsEntityIdentifier dispensingOrgEntitlement = new AsEntityIdentifierImpl("1.22.333.4444",
        "123456781");

    Entitlement dispensingOrganisationEntitlement = new EntitlementImpl(dispensingOrgEntitlement,
        EntitlementType.MEDICARE_PHARMACY_APPROVAL_NUMBER);

    dispensingOrganisationEntitlement.setEntitlementValidityDuration(
        RestrictedTimeInterval.getLowHighInstance(new PrecisionDate(Precision.DAY, 1l),
            new PrecisionDate(Precision.DAY))
    );
    dispensingOrganisationParticipant
        .setEntitlement(Arrays.asList(dispensingOrganisationEntitlement));

    DispensingOrganisationParticipation dispensingOrganisationParticipation = new DispensingOrganisationParticipationImpl(
        dispensingOrganisationParticipant);

    DispenseRecordContext dispenseRecordContext = new DispenseRecordContextImpl(
        subjectOfCareParticipant, dispenserParticipation, dispensingOrganisationParticipation);

    // Setup content
    DispenseItemBuilder builder = new DispenseItemBuilder();

    //Extemporaneous Ingredients
    Code nacl = new NCTISDataComponent("1.1.1.1.1", "PBS Extemporaneous Ingredient Name");
    nacl.setOriginalText("Sodium Chloride");
    Ratio _5mg = Ratio.numeratorOnly(new RealQuantity(5, "mg"));
    Ingredient salt5mg = new Ingredient(nacl, _5mg);

    Code C6H12O6 = new NCTISDataComponent("1.1.1.1.1", "PBS Extemporaneous Ingredient Name");
    C6H12O6.setOriginalText("Glucose");
    Ratio _10mg = Ratio.numeratorOnly(new RealQuantity(10, "mg"));
    Ingredient glucose10mg = new Ingredient(C6H12O6, _10mg);
    String formula = "BORIC ACID, OLIVE OIL AND ZINC OXIDE (BOZ) Ointment: Boric Acid 1% in Paraffin Ointment B.P. 25 Olive Oil 25 Zinc Oxide Ointment to 100";

    //therapeuticGoodIdentification
    Code amt = new AMTCode("23641011000036102",
        "paracetamol 500 mg + codeine phosphate 30 mg tablet");
    amt.setOriginalText("SOME PBS/RPBSItemCode");

    Code amtToNctisTranslation = new NCTISDataComponent("1.1.1.1.1.1.1", "PBSRPBSItemCode");
    amt.addTranslation(amtToNctisTranslation);

    //an elaborate style dispensing unit code
    SNOMED_AU_Code dispensingUnitCode = new SNOMED_AU_Code("32570641000036102",
        "foo bar disepnsing unit");
    dispensingUnitCode.setOriginalText("more elaborate text here if needed");
    QuantityUnitDescription dispensedQuantity = QuantityUnitDescriptionImpl
        .create(7, dispensingUnitCode);

    ManufacturingCode manufacturingCode = ManufacturingCode.AUSTRALIAN_PBS_MANUFACTURER_CODE;
    manufacturingCode.setExtension("AP"); //astrazeneca example

    builder //may chain calls

        //mandatory items
        .therapeuticGood(amt)
        .eventDate(new DateTime())
        .isbrandSubstitutionOccured(true)
        .maximumNumberOfRepeats(5)
        .numberOfThisDispense(2)
        .quantityDispensed(dispensedQuantity)
        .claimTypeCategory(ClaimTypeCategory.CLOSING_THE_GAP_BENEFIT)
        .patientCategory(PatientCategory.PAPERLESS_PRIVATE_HOSPITAL_PATIENT)
        .prescriptionItem(UniqueIdentifierImpl.createSimpleIdentifier("1.22.33.444", "12345"))
        .dispenseItem(UniqueIdentifierImpl.createSimpleIdentifier("1.22.33.444", "12345"))
        .dispensingStatusType(DispensingStatus.ACTIVE)

        //optional items
        .addExtemporaneousIngredients(salt5mg)
        .addExtemporaneousIngredients(glucose10mg)
        .formula(formula)
        .labelInstruction("Take 1 every 3 Hours with a meal, or as directed")
        .closeTheGapId(uuidRoot("CTG001"))
        .pbsItemCode(amt)
        .pbsManufacturerCode(manufacturingCode)
        .underCoPayment(ClaimTypeCategory.GENERAL_BENEFIT)
        .earlySupplyWithBenifit(true)
        .additionalComments("Phoned doctor to clarify medication.")
        .racfId("RACFId")
    ;

    DispenseItem dispenseItem = builder
        .build(); //throws illegal argument exception if missing mandatory fields

    Logo logo = new Logo(new File("logo.png")); //will use sha1 by default

    //optional alternative, but not recommended
    //Logo logo = new Logo( new File("logo.png"), IntegerityCheckType.SHA_256 );

    dispenseRecordContext.setLogo(logo);

    // Create Dispense Record
    DispenseRecord dispenseRecord = new DispenseRecordImpl(dispenseRecordContext, dispenseItem);

    // Create CDA Model

    BaseClinicalDocument cdaClinicalDocument = ClinicalDocumentFactory.getDispenseRecord();
    cdaClinicalDocument.setLanguageCode("en-AU");
    cdaClinicalDocument.setVersionNumber(1);

    cdaClinicalDocument.setSetId(UUID.randomUUID().toString());

    // String dispenseDocumentId = "2.25.300851251280737466240776669920800075139";

    // You can also use the conversion tool
    String doucmentUUID = UUID.randomUUID().toString();
    String documentIdAsAnOid = UUIDTool.uuidToOid(doucmentUUID);
    String dispenseDocumentId = documentIdAsAnOid;

    cdaClinicalDocument.setClinicalDocumentId(dispenseDocumentId);

    // as an example we can add another template if needed.
    cdaClinicalDocument
        .addTemplateId(TemplateIdImpl.getInstance("1.0", "1.2.36.1.2001.1001.100.149"));

    // Legal Authenticator
    AsEntityIdentifier authenticatorHPII = new HPII("8003610000001145");

    PersonName authenticatorName = PersonNameImpl
        .getInstance("Black", "Jane", NameTitle.MRS.getDescriptor(),
            NameSuffix.JUNIOR.getDescriptor(), PersonNameUsage.REGISTERED_NAME_OR_LEGAL_NAME);

    Person authenticatorPerson = PersonImpl.getInstance(authenticatorHPII, authenticatorName);

    AsEntityIdentifier authenticatorHPIO = new HPIO("8003621231167886");

    Organization authenticatorOrgImpl = OrganizationImpl.getInstance(
        authenticatorHPIO,
        "Primary Healthcare Clinic Name");

    AssignedEntity authenticator = AssignedEntityImpl.getInstance(
        UUID.randomUUID().toString(),
        authenticatorPerson,
        authenticatorOrgImpl);

    authenticator.setRepresentedOrganization(authenticatorOrgImpl);

    LegalAuthenticator cdaLegalAuthenticator = LegalAuthenticatorImpl
        .getInstance(new DateTime(), authenticator);

    Code authenticatorEntityCode = new CodeImpl("251513");
    authenticatorEntityCode.setCodeSystem("1.2.36.1.2001.1001.101.103.10289");
    authenticatorEntityCode.setCodeSystemName("Occupation (METeOR NHDD V14)");
    authenticatorEntityCode.setDisplayName("Retail Pharmacist");
    authenticator.setCode(authenticatorEntityCode);

    //An example of using multiple addresses for an authenticator
    Address authenticatorAddress1 = new AustralianAddressImpl();

    authenticatorAddress1.addUnstructuredAddressLine("P.O. Box 4212");
    authenticatorAddress1.setPostcode("4101");
    authenticatorAddress1.setCity("Brisbane");
    authenticatorAddress1.setState("QLD");
    PostalAddress authenticatorPostal1 = new PostalAddressImpl(authenticatorAddress1,
        PostalAddressUseEnum.POSTAL_ADDRESS);

    Address authenticatorAddress2 = new AustralianAddressImpl();

    authenticatorAddress2.addUnstructuredAddressLine("10 Browning Street");
    authenticatorAddress1.setPostcode("4101");
    authenticatorAddress1.setCity("Brisbane");
    authenticatorAddress2.setState("QLD");
    authenticatorAddress2.setCountry("Australia");
    PostalAddress authenticatorPostal2 = new PostalAddressImpl(authenticatorAddress1,
        PostalAddressUseEnum.TEMPORARY_ADDRESS);

    authenticator.setAddress(Arrays.asList(authenticatorPostal1, authenticatorPostal2));

    Telecom tel1 = new TelecomImpl("04123456789", TelecomUse.BUSINESS_AND_PERSONAL);
    Telecom tel2 = new TelecomImpl("0712345678", TelecomUse.PERSONAL);
    authenticator.setTelecom(Arrays.asList(tel1, tel2));

    // Custodian

    //HPIO the easy way
    AsEntityIdentifier custodianIdentifier = new HPIO("8003621231167886");

    Telecom custodianTelecom = new TelecomImpl("0712341234", TelecomUse.BUSINESS);

    AustralianAddressImpl custodianPostalAddress = new AustralianAddressImpl();

    custodianPostalAddress.addUnstructuredAddressLine("99 madeup Street");
    custodianPostalAddress.setCity("Example");
    custodianPostalAddress.setState("QLD");
    custodianPostalAddress.setPostcode("5555");
    custodianPostalAddress.setCountry("Australia");
    custodianPostalAddress.setAdditionalLocator("'The Precinct'");

    PostalAddress pa = new PostalAddressImpl(custodianPostalAddress,
        PostalAddressUseEnum.WORKPLACE);

    UniqueIdentifier uniqueId = UniqueIdentifierImpl.random();
    UniqueIdentifier otherId = UniqueIdentifierImpl.random();

    CustodianOrganization custodianOrg = CustodianOrganizationImpl
        .getInstance(Arrays.asList(uniqueId, otherId), custodianIdentifier);

    OrganizationName custodianOrganizationName = OrganizationNameImpl.getInstance();
    custodianOrganizationName.setValue("CustodianOrgName");
    custodianOrg.setName(custodianOrganizationName);
    custodianOrg.setTelecom(custodianTelecom);
    custodianOrg.setAddress(pa);

    AssignedCustodian cdaAssignedCustodian = AssignedCustodianImpl.getInstance(custodianOrg);
    Custodian cdaCustodian = CustodianImpl.getInstance(cdaAssignedCustodian);

    CDAModelImpl dispenseRecordCdaModel =
        new DispenseRecordCdaModel(
            cdaClinicalDocument,
            cdaLegalAuthenticator,
            cdaCustodian,
            UUID.randomUUID().toString(),//"ASSIGNED AUTHOR ID UUID",
            UUID.randomUUID().toString()//"HEALTH CARE FACILITY ID UUID"
        );

    DispenseRecordCreator dispenseRecordCreatorCreator = new DispenseRecordCreator(
        dispenseRecordCdaModel, dispenseRecord);
    dispenseRecordCreatorCreator.useStrict(); // do strict Schematron checking

    //disabled
    String cdaString = "";//TestHelper.documentToXML( dispenseRecordCreatorCreator.create() );
    TestHelper.printToFile(cdaString, DOCUMENT_FILE_NAME);
    System.out.println(cdaString);
  }
}
