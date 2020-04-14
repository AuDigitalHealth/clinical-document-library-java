package nehta.cda.etp;

import au.gov.nehta.builder.util.UUIDTool;
import au.gov.nehta.cda.test.Base;
import au.gov.nehta.model.cda.common.code.AMTCode;
import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.cda.common.code.NCTISDataComponent;
import au.gov.nehta.model.cda.common.code.PatientCategory;
import au.gov.nehta.model.cda.common.custodian.*;
import au.gov.nehta.model.cda.common.document.BaseClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocumentFactory;
import au.gov.nehta.model.cda.common.id.*;
import au.gov.nehta.model.cda.common.org.Organization;
import au.gov.nehta.model.cda.common.org.OrganizationImpl;
import au.gov.nehta.model.cda.common.person.Person;
import au.gov.nehta.model.cda.common.person.PersonImpl;
import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.cda.common.telecom.TelecomImpl;
import au.gov.nehta.model.cda.common.telecom.TelecomMedium;
import au.gov.nehta.model.cda.common.time.Precision;
import au.gov.nehta.model.cda.common.time.PrecisionDate;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.cda.etp.DispenseRecordCdaModel;
import au.gov.nehta.model.clinical.common.*;
import au.gov.nehta.model.clinical.common.participation.*;
import au.gov.nehta.model.clinical.common.types.*;
import au.gov.nehta.model.clinical.etp.common.item.QuantityUnitDescriptionImpl;
import au.gov.nehta.model.clinical.etp.common.participation.EntitlementType;
import au.gov.nehta.model.clinical.etp.common.participation.*;
import au.gov.nehta.model.clinical.etp.dispenserecord.*;
import au.gov.nehta.model.common.CDAModelImpl;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.gov.nehta.schematron.Schematron;
import au.gov.nehta.schematron.SchematronCheckResult;
import junit.framework.Assert;
import org.joda.time.DateTime;
import org.joda.time.LocalDate;
import org.junit.Ignore;
import org.junit.Test;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.util.*;

import static au.gov.nehta.model.schematron.SchematronResource.SchematronResources.DISPENSE_RECORD_3A;

public class DispenseRecordMinTest extends Base {

  private static final String SCHEMATRON = DISPENSE_RECORD_3A.resource().getSchematron();
  private static String SCHEMATRON_TEMPLATE_PATH = "resources/dispenseRecord";


  private static final String DOCUMENT_FILE_NAME = TEST_GENERATION + "dispense-min.xml";

  @Test
  @Ignore
  public void test_MIN_DispenseRecord()
      throws ParserConfigurationException, JAXBException, SchematronValidationException {
    if (!new File(SCHEMATRON_TEMPLATE_PATH + "/schematron/schematron-Validator-report.xsl")
        .exists()) {
      SCHEMATRON_TEMPLATE_PATH = "src/" + SCHEMATRON_TEMPLATE_PATH;
    }

    generateMin();
        /*    if (!new File(SCHEMATRON_TEMPLATE_PATH
				+ "/schematron/schematron-Validator-report.xsl").exists()) {
      SCHEMATRON_TEMPLATE_PATH = "src/" + SCHEMATRON_TEMPLATE_PATH;
    }*/
    SchematronCheckResult check = Schematron
        .check(SCHEMATRON_TEMPLATE_PATH, SCHEMATRON, DOCUMENT_FILE_NAME);

    show(check);

    Assert.assertTrue(check.schemaErrors.size() == 0);
    Assert.assertTrue(check.schematronErrors.size() == 0);
  }

  public void generateMin()
      throws ParserConfigurationException, JAXBException, SchematronValidationException {
    // Setup context
    // Subject Of Care
    //IHI ihi = new IHI( "8003600300001283" );
    String socFamilyName = "Example";

    DateTime dob = new LocalDate(1982, 11, 28).toDateTimeAtStartOfDay();

    AustralianAddress subjectOfCareAustralianAddress = new AustralianAddressImpl();
    subjectOfCareAustralianAddress
        .addUnstructuredAddressLine("Desk-40, Level 2, 10 Browning street");
    subjectOfCareAustralianAddress.setCity("West End");
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

    SubjectOfCarePerson subjectOfCarePerson = new SubjectOfCarePersonImpl(subjectOfCarePersonName,
        socDemographicData);
    SubjectOfCareParticipant subjectOfCareParticipant = new SubjectOfCareParticipantImpl(
        new ArrayList<AsEntityIdentifier>(0), subjectOfCareAddress, subjectOfCarePerson);

    AsEntityIdentifier subjectOfCareEntitlementNumber = new MedicareCardIdentifier("1234567891");

    Entitlement subjectOfCareEntitlement = new EntitlementImpl(subjectOfCareEntitlementNumber,
        EntitlementType.MEDICARE_BENEFITS);

    //new ParticipantEntitlement starting from today
    subjectOfCareEntitlement.setEntitlementValidityDuration(
        RestrictedTimeInterval.getLowInstance(new PrecisionDate(Precision.DAY)));

    List<Entitlement> subjectOfCareEntitlementList = new ArrayList<Entitlement>();
    subjectOfCareEntitlementList.add(subjectOfCareEntitlement);
    subjectOfCareParticipant.setEntitlements(subjectOfCareEntitlementList);

//      String subjectOfCareParticipationType ="Subject Of Care";
//      SubjectOfCareParticipation subjectOfCareParticipation = new SubjectOfCareParticipationImpl( subjectOfCareParticipationType,  subjectOfCareParticipant );

    // Dispenser
    HPII dispenserHPII = new HPII("8003610000001145");
    String dispenserFamilyName = "Davo";

    Calendar dispenserDOB = GregorianCalendar.getInstance();
    dispenserDOB.set(1952, Calendar.JANUARY, 1);

    //the author location
    AustralianAddress dispenserAddress = new AustralianAddressImpl();
    dispenserAddress.addUnstructuredAddressLine("chemical wherehouse 10 Browning street");
    dispenserAddress.setCity("West End");
    dispenserAddress.setState(AustralianStateTerritory.QUEENSLAND.getAbbreviation());
    dispenserAddress.setPostcode("4101");
    ProviderAddress addressCotext = new ProviderAddressImpl(false, dispenserAddress,
        AddressPurpose.BUSINESS);
    DispenserParticipant dispenserParticipant = new DispenserParticipantImpl(dispenserHPII,
        new PersonNameImpl(dispenserFamilyName), addressCotext);
    dispenserParticipant.addElectronicCommunicationDetail(new TelecomImpl("0299345678"));

    DispenserParticipation dispenserParticipation = new DispenserParticipationImpl(
        dispenserParticipant);

    // Dispenser Organisation
    HPIO dispensingOrgHPIO = new HPIO("8003621231167886");
    String dispenserOrgName = "London Drugs";

    AustralianAddress dispensingOrgAddress = new AustralianAddressImpl();
    dispensingOrgAddress.addUnstructuredAddressLine("Desk-40, Level 2, 10 Browning street");
    dispensingOrgAddress.setCity("West End");
    dispensingOrgAddress.setState(AustralianStateTerritory.QUEENSLAND.getAbbreviation());
    dispensingOrgAddress.setPostcode("4101");

    ProviderAddress dispensingOrganisationAddress = new ProviderAddressImpl(false,
        dispensingOrgAddress, AddressPurpose.BUSINESS);
    Telecom dispensingOrganisationEmail = new TelecomImpl(TelecomMedium.EMAIL,
        "info@londondrugs.com.au");
    Telecom dispensingOrganisationTel = new TelecomImpl("02123456789");
    List<Telecom> electronicCommunicationDetailList = Arrays
        .asList(dispensingOrganisationEmail, dispensingOrganisationTel);
    Organisation dispensingOrganisation = new OrganisationImpl(dispenserOrgName);

    DispensingOrganisationParticipant dispensingOrganisationParticipant = new DispensingOrganisationParticipantImpl(
        dispensingOrgHPIO,
        dispensingOrganisationAddress, electronicCommunicationDetailList, dispensingOrganisation);

    AsEntityIdentifier dispensingOrgEntitlement = new AsEntityIdentifierImpl("1.22.333.4444",
        "12345678-1");

    Entitlement dispensingOrganisationEntitlement = new EntitlementImpl(dispensingOrgEntitlement,
        EntitlementType.MEDICARE_PHARMACY_APPROVAL_NUMBER);

    dispensingOrganisationEntitlement.setEntitlementValidityDuration(
        RestrictedTimeInterval.getLowHighInstance(new PrecisionDate(Precision.DAY, 900l),
            new PrecisionDate(Precision.DAY))
    );

    DispensingOrganisationParticipation dispensingOrganisationParticipation = new DispensingOrganisationParticipationImpl(
        dispensingOrganisationParticipant);

    DispenseRecordContext dispenseRecordContext = new DispenseRecordContextImpl(
        subjectOfCareParticipant, dispenserParticipation, dispensingOrganisationParticipation);

    //therapeuticGoodIdentification
    Code amt = new AMTCode("23641011000036102",
        "paracetamol 500 mg + codeine phosphate 30 mg tablet");
    Code amtToNctisTranslation = new NCTISDataComponent("1.1.1.1.1.1.1", "PBSRPBSItemCode");
    amt.setOriginalText("SOME PBS/RPBSItemCode");
    amt.addTranslation(amtToNctisTranslation);

    // A builder pattern to create a 'DispenseItem' object which can be complex.
    DispenseItemBuilder builder = new DispenseItemBuilder();

    builder //may chain calls

        .therapeuticGood(amt)
        .eventDate(new DateTime())
        .isbrandSubstitutionOccured(true)
        .maximumNumberOfRepeats(5)
        .numberOfThisDispense(1)
        .quantityDispensed(QuantityUnitDescriptionImpl.create(new RealQuantity(3, "bottles")))
        .claimTypeCategory(ClaimTypeCategory.GENERAL_BENEFIT)
        .patientCategory(PatientCategory.COMMUNITY_PATIENT)
        .prescriptionItem(UniqueIdentifierImpl.createSimpleIdentifier("1.22.33.444", "12345"))
        .dispenseItem(UniqueIdentifierImpl.createSimpleIdentifier("1.22.33.444", "12345"))
        .dispensingStatusType(DispensingStatus.COMPLETED)
    ;

    DispenseItem dispenseItem = builder
        .build(); //throws illegal argument exception if missing mandatory fields

    // Create Dispense Record
    DispenseRecord dispenseRecord = new DispenseRecordImpl(dispenseRecordContext, dispenseItem);

    // Create CDA Model

    BaseClinicalDocument cdaClinicalDocument = ClinicalDocumentFactory.getDispenseRecord();
    cdaClinicalDocument.setLanguageCode("en-AU");
    cdaClinicalDocument.setVersionNumber(1);

    // String dispenseDocumentId = "2.25.300851251280737466240776669920800075139";

    // You can also use the conversion tool
    String doucmentUUID = UUID.randomUUID().toString();
    String documentIdAsAnOid = UUIDTool.uuidToOid(doucmentUUID);
    String dispenseDocumentId = documentIdAsAnOid;

    cdaClinicalDocument.setClinicalDocumentId(dispenseDocumentId);

    cdaClinicalDocument.setSetId(UUID.randomUUID().toString());
    // as an example we can add another template if needed.
    cdaClinicalDocument
        .addTemplateId(TemplateIdImpl.getInstance("1.0", "1.2.36.1.2001.1001.100.149"));

    // Legal Authenticator
    AsEntityIdentifier authenticatorHPII = new HPII("8003610000001145");

    Person authenticatorPerson = PersonImpl
        .getInstance(authenticatorHPII, PersonNameImpl.createPersonName("Black"));

    AsEntityIdentifier authenticatorHPIO = new HPIO("8003621231167886");
    authenticatorHPIO.setCode(null); //optional

    Organization authenticatorOrgImpl = OrganizationImpl.getInstance(
        authenticatorHPIO,
        "Phony Pharmacuticles");

    AssignedEntity authenticator = AssignedEntityImpl.getInstance(
        UUID.randomUUID().toString(),
        authenticatorPerson,
        authenticatorOrgImpl);

    authenticator.setRepresentedOrganization(authenticatorOrgImpl);

    LegalAuthenticator cdaLegalAuthenticator = LegalAuthenticatorImpl
        .getInstance(new DateTime(), authenticator);

    // Custodian

    //HPIO the easy way
    AsEntityIdentifier custodianIdentifier = new HPIO("8003621231167886");

    UniqueIdentifier typedDocumentID = new UniqueIdentifierImpl(UUID.randomUUID().toString());

    CustodianOrganization custodianOrg =
        CustodianOrganizationImpl.getInstance(Arrays.asList(typedDocumentID),
            custodianIdentifier);

    AssignedCustodian cdaAssignedCustodian = AssignedCustodianImpl.getInstance(custodianOrg);
    Custodian cdaCustodian = CustodianImpl.getInstance(cdaAssignedCustodian);

    CDAModelImpl dispenseRecordCdaModel =
        new DispenseRecordCdaModel(
            cdaClinicalDocument,
            cdaLegalAuthenticator,
            cdaCustodian,
            UUID.randomUUID().toString(), //"ASSIGNED AUTHOR ID UUID",
            UUID.randomUUID().toString() //"HEALTH CARE FACILITY ID UUID",
        );

    //   DispenseRecordCreator dispenseRecordCreatorCreator = new DispenseRecordCreator( dispenseRecordCdaModel, dispenseRecord );

    //disabled
    //		String cdaString =  TestHelper.documentToXML( dispenseRecordCreatorCreator.create() );
    //    TestHelper.printToFile( cdaString, DOCUMENT_FILE_NAME);
    //     System.out.println( cdaString );
  }


}
