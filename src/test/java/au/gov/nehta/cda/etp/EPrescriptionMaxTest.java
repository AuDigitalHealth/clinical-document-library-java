package au.gov.nehta.cda.etp;

import static au.gov.nehta.model.schematron.SchematronResource.SchematronResources.E_PRESCRIPTION_3B;
import static org.junit.Assert.assertTrue;

import au.gov.nehta.builder.etp.eprescription.EPrescriptionCreator;
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
import au.gov.nehta.model.cda.common.code.PBSPrescriptionTypeCode;
import au.gov.nehta.model.cda.common.code.PBSPrescriptionTypeCode.PBSPrescriptionType;
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
import au.gov.nehta.model.cda.common.prescription.Observations;
import au.gov.nehta.model.cda.common.prescription.ObservationsImpl;
import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.cda.common.telecom.TelecomImpl;
import au.gov.nehta.model.cda.common.telecom.TelecomMedium;
import au.gov.nehta.model.cda.common.telecom.TelecomUse;
import au.gov.nehta.model.cda.common.time.PeriodicIntervalTime;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.cda.common.time.Precision;
import au.gov.nehta.model.cda.common.time.PrecisionDate;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.cda.common.time.TimeQuantity;
import au.gov.nehta.model.cda.common.time.TimeUnitOfMeasure;
import au.gov.nehta.model.cda.etp.EPrescriptionCdaModel;
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
import au.gov.nehta.model.clinical.common.participation.Occupation;
import au.gov.nehta.model.clinical.common.participation.OccupationImpl;
import au.gov.nehta.model.clinical.common.participation.Organisation;
import au.gov.nehta.model.clinical.common.participation.OrganisationImpl;
import au.gov.nehta.model.clinical.common.participation.OrganisationNameUsage;
import au.gov.nehta.model.clinical.common.participation.PersonName;
import au.gov.nehta.model.clinical.common.participation.PersonNameImpl;
import au.gov.nehta.model.clinical.common.participation.PersonNameUsage;
import au.gov.nehta.model.clinical.common.participation.Role;
import au.gov.nehta.model.clinical.common.participation.RoleImpl;
import au.gov.nehta.model.clinical.common.participation.Sex;
import au.gov.nehta.model.clinical.common.types.HPII;
import au.gov.nehta.model.clinical.common.types.HPIO;
import au.gov.nehta.model.clinical.common.types.IHI;
import au.gov.nehta.model.clinical.common.types.PbsAuthorityPrescriptionNumber;
import au.gov.nehta.model.clinical.common.types.Ratio;
import au.gov.nehta.model.clinical.common.types.RealQuantity;
import au.gov.nehta.model.clinical.common.types.StreamlinedAuthorityApprovalNumber;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;
import au.gov.nehta.model.clinical.etp.common.item.Dosage;
import au.gov.nehta.model.clinical.etp.common.item.DosageImpl;
import au.gov.nehta.model.clinical.etp.common.item.Ingredient;
import au.gov.nehta.model.clinical.etp.common.item.ItemFactory;
import au.gov.nehta.model.clinical.etp.common.item.Logo;
import au.gov.nehta.model.clinical.etp.common.item.MedicalBenefitCategoryType;
import au.gov.nehta.model.clinical.etp.common.item.PrescriptionItemIdentifier;
import au.gov.nehta.model.clinical.etp.common.item.QuantityUnitDescription;
import au.gov.nehta.model.clinical.etp.common.item.QuantityUnitDescriptionImpl;
import au.gov.nehta.model.clinical.etp.common.participation.AddressContext;
import au.gov.nehta.model.clinical.etp.common.participation.DefaultParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.DefaultParticipantImpl;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;
import au.gov.nehta.model.clinical.etp.common.participation.EntitlementImpl;
import au.gov.nehta.model.clinical.etp.common.participation.EntitlementType;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberOrganisationParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberOrganisationParticipantImpl;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberOrganisationParticipation;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberOrganisationParticipationImpl;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberParticipation;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberParticipationImpl;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderAddress;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderAddressImpl;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderEmploymentDetail;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderEmploymentDetailImpl;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderPerson;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderPersonImpl;
import au.gov.nehta.model.clinical.etp.eprescription.BodyHeight;
import au.gov.nehta.model.clinical.etp.eprescription.BodyHeightImpl;
import au.gov.nehta.model.clinical.etp.eprescription.BodyWeight;
import au.gov.nehta.model.clinical.etp.eprescription.BodyWeightImpl;
import au.gov.nehta.model.clinical.etp.eprescription.EPrescription;
import au.gov.nehta.model.clinical.etp.eprescription.EPrescriptionContent;
import au.gov.nehta.model.clinical.etp.eprescription.EPrescriptionContentImpl;
import au.gov.nehta.model.clinical.etp.eprescription.EPrescriptionContext;
import au.gov.nehta.model.clinical.etp.eprescription.EPrescriptionContextImpl;
import au.gov.nehta.model.clinical.etp.eprescription.EPrescriptionImpl;
import au.gov.nehta.model.clinical.etp.eprescription.GroundsForConcurrentSupply;
import au.gov.nehta.model.clinical.etp.eprescription.PrescriptionItem;
import au.gov.nehta.model.clinical.etp.eprescription.PrescriptionItemBuilder;
import au.gov.nehta.model.clinical.etp.eprescription.PrescriptionNoteDetailImpl;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.gov.nehta.schematron.Schematron;
import au.gov.nehta.schematron.SchematronCheckResult;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import org.joda.time.DateTime;
import org.joda.time.LocalDate;
import org.joda.time.format.DateTimeFormat;
import org.junit.Ignore;
import org.junit.Test;
import org.w3c.dom.Document;

public class EPrescriptionMaxTest extends Base {

  private static final String SCHEMATRON = E_PRESCRIPTION_3B.resource().getSchematron();
  private static String SCHEMATRON_TEMPLATE_PATH = "src/test/resources/ePrescription";
  private static final String DOCUMENT_FILE_NAME = "src/test/resources/eprescription/eprescription-max.xml";

  @Test
  @Ignore
  public void test_MAX_EPrescriptionCreation()
      throws ParserConfigurationException, JAXBException, SchematronValidationException, IOException, ParseException {
    generateMax();
    SchematronCheckResult check = Schematron
        .check(SCHEMATRON_TEMPLATE_PATH, SCHEMATRON, DOCUMENT_FILE_NAME);
    show(check);
    assertTrue(check.schemaErrors.size() == 0);
    assertTrue(check.schematronErrors.size() == 0);
  }


  public void generateMax()
      throws IOException, ParserConfigurationException, JAXBException, ParseException, SchematronValidationException {
    // Setup context

    //***************************
    //***** Subject Of Care *****
    //***************************

    IHI subjectIHI = new IHI("8003600300001283");
    MedicareCardIdentifier mcCard = new MedicareCardIdentifier("4324567871");

    String subjectFamilyName = "Harding";

    DateTime dob = new LocalDate(1982, 11, 28).toDateTimeAtStartOfDay();

    AustralianAddress subjectFullAddress = new AustralianAddressImpl();
    subjectFullAddress.addUnstructuredAddressLine("10 browning st");
    subjectFullAddress.setCity("West End");
    subjectFullAddress.setState(AustralianStateTerritory.QUEENSLAND.getAbbreviation());
    subjectFullAddress.setPostcode("4101");

    AddressContext subjectOfCareAddress = new AddressContextImpl(subjectFullAddress,
        AddressPurpose.RESIDENTIAL_PERMANENT);
    PersonName subjectPersonName = new PersonNameImpl(subjectFamilyName);
    subjectPersonName.addNameTitle(NameTitle.MISTER.getDescriptor());
    subjectPersonName.addNameSuffix(NameSuffix.JUNIOR.getDescriptor());
    subjectPersonName.addGivenName("Frank");
    subjectPersonName.addPersonNameUsage(PersonNameUsage.MAIDEN_NAME_OR_NAME_AT_BIRTH);

    DateAccuracy dobAccuracy = new DateAccuracyImpl(true, true, true);
    DateOfBirthDetail subjectDOB = new DateOfBirthDetailImpl(dob, dobAccuracy);
    subjectDOB.setDateOfBirthAccuracyIndicator(dobAccuracy);
    subjectDOB.setDateOfBirthIsCalculatedFromAge(true);
    SubjectOfCareDemographicData subjectDemographicData = new SubjectOfCareDemographicDataImpl(
        Sex.MALE, subjectDOB);
    subjectDemographicData.setBirthPlurality(5);
    subjectDemographicData.setBirthOrder(2);
    int socAge = 35;
    subjectDemographicData.setAgeInYears(socAge);
    subjectDemographicData.setAgeAccurate(true);

    subjectDemographicData
        .setIndigenousStatus(IndigenousStatus.NOT_STATED_OR_INADEQUATELY_DESCRIBED);

    SubjectOfCarePerson subjectOfCarePerson = new SubjectOfCarePersonImpl(subjectPersonName,
        subjectDemographicData);
    SubjectOfCareParticipant subjectParticipant = new SubjectOfCareParticipantImpl(
        Arrays.asList(subjectIHI, mcCard),
        subjectOfCareAddress, subjectOfCarePerson);

    Telecom subjectTelephone =
        new TelecomImpl(
            TelecomMedium.TELEPHONE,
            "0712345678",
            TelecomUse.PERSONAL);

    Telecom subjectEmail =
        new TelecomImpl(
            TelecomMedium.EMAIL,
            "frank.harding@electronichealth.net.au",
            TelecomUse.PERSONAL);

    List<Telecom> subjectOfCareElectronicCommunicationDetailList = new ArrayList<Telecom>();
    subjectOfCareElectronicCommunicationDetailList.add(subjectTelephone);
    subjectOfCareElectronicCommunicationDetailList.add(subjectEmail);

    subjectParticipant
        .setElectronicCommunicationDetails(subjectOfCareElectronicCommunicationDetailList);

    Entitlement subjectEntitlement = new EntitlementImpl(mcCard, EntitlementType.MEDICARE_BENEFITS);

    subjectEntitlement.setEntitlementValidityDuration(
        RestrictedTimeInterval.getLowWidthInstance(
            //from today(day only precision) for two weeks
            new PrecisionDate(Precision.DAY, new DateTime()),
            new TimeQuantity(2, TimeUnitOfMeasure.WEEK))
    );

    List<Entitlement> subjectOfCareEntitlementList = new ArrayList<Entitlement>();
    subjectOfCareEntitlementList.add(subjectEntitlement);
    subjectParticipant.setEntitlements(subjectOfCareEntitlementList);

    //************************
    //*****   Prescriber *****
    //************************
    HPII prescriberHPII = new HPII("8003610000001145");
    String prescriberFamilyName = "Duncan";

    PersonName prescriberPersonName = new PersonNameImpl(prescriberFamilyName);

    //"Unstructured" address example
    AustralianAddress prescriberFullAddress = new AustralianAddressImpl();
    prescriberFullAddress.addUnstructuredAddressLine("level 2, 10 browning street");
    prescriberFullAddress.setCity("West End");
    prescriberFullAddress.setState(AustralianStateTerritory.QUEENSLAND.getAbbreviation());
    prescriberFullAddress.setPostcode("4101");

    ProviderAddress prescriberAddress = new ProviderAddressImpl(false, prescriberFullAddress,
        AddressPurpose.BUSINESS);

    Occupation prescriberOccupation = new OccupationImpl(
        ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER);
    ProviderEmploymentDetail prescriberEmploymentDetail = new ProviderEmploymentDetailImpl(
        prescriberOccupation);
    ProviderPerson prescriberPerson = new ProviderPersonImpl(prescriberPersonName);
    prescriberPerson.setEmploymentDetail(prescriberEmploymentDetail);

    DefaultParticipant prescriberParticipant = new DefaultParticipantImpl(prescriberHPII,
        prescriberPerson);
    prescriberParticipant.setAddress(prescriberAddress);
    prescriberParticipant.setQualifications("MD");

    AsEntityIdentifier prescriberNumber = new AsEntityIdentifierImpl("1.22.333.4444.55555",
        "12345678");

    Entitlement prescriberEntitlement = new EntitlementImpl(prescriberNumber,
        EntitlementType.MEDICARE_PRESCRIBER_NUMBER);
    prescriberEntitlement.setEntitlementValidityDuration(
        RestrictedTimeInterval.getLowInstance(
            //from today(day only precision)
            new PrecisionDate(Precision.DAY, new DateTime()))
    );

    prescriberParticipant.addEntitlement(prescriberEntitlement);

    Role prescriberRole = new RoleImpl(ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER);

    PrescriberParticipation prescriberParticipation = new PrescriberParticipationImpl(
        prescriberRole, prescriberParticipant);

    Telecom prescriberTelephone =
        new TelecomImpl(
            TelecomMedium.TELEPHONE,
            "0756781234",
            TelecomUse.PERSONAL);

    Telecom prescriberEmail =
        new TelecomImpl(
            TelecomMedium.EMAIL,
            "dr_gp@electronichealth.net.au",
            TelecomUse.PERSONAL
        );

    List<Telecom> prescriberCommunicationList = new ArrayList<Telecom>();
    prescriberCommunicationList.add(prescriberTelephone);
    prescriberCommunicationList.add(prescriberEmail);

    prescriberParticipant.setElectronicCommunicationDetail(prescriberCommunicationList);

    //***********************************
    //***** Prescriber Organisation *****
    //***********************************

    HPIO prescriberHPIO = new HPIO("8003621231167886");
    String organisationName = "GP Australia";

    AustralianAddress fullAddress = new AustralianAddressImpl();
    fullAddress.addUnstructuredAddressLine("Level 1, 10 Browning streed");
    fullAddress.setCity("West End");
    fullAddress.setState(AustralianStateTerritory.QUEENSLAND.getAbbreviation());
    fullAddress.setPostcode("4101");
    ProviderAddress prescriberOrganisationAddress = new ProviderAddressImpl(false, fullAddress,
        AddressPurpose.BUSINESS);

    Telecom prescriberOrganisationEmail =
        new TelecomImpl(
            TelecomMedium.EMAIL,
            "info@some-gp.com.au",
            TelecomUse.BUSINESS);

    Telecom prescriberOrganisationTelephone =
        new TelecomImpl(
            TelecomMedium.TELEPHONE,
            "0212345678",
            TelecomUse.BUSINESS);

    List<Telecom> electronicCommunicationDetailList = Arrays
        .asList(prescriberOrganisationEmail, prescriberOrganisationTelephone);

    Organisation prescriberOrganisation = new OrganisationImpl(organisationName);
    prescriberOrganisation.setOrganisationNameUsage(OrganisationNameUsage.BUSINESS_NAME);
    prescriberOrganisation.setDepartmentUnit("SOME DEPARTMENT");
    PrescriberOrganisationParticipant prescriberOrganisationParticipant =
        new PrescriberOrganisationParticipantImpl(prescriberHPIO,
            prescriberOrganisationAddress, electronicCommunicationDetailList,
            prescriberOrganisation);

    Role prescriberOrganisationRole = new RoleImpl(ANZSCO_1ED_2006.ZOOLOGIST);

    PrescriberOrganisationParticipation prescriberOrganisationParticipation =
        new PrescriberOrganisationParticipationImpl(
            prescriberOrganisationRole,
            prescriberOrganisationParticipant);

    EPrescriptionContext ePrescriptionContext = new EPrescriptionContextImpl(subjectParticipant,
        prescriberParticipation, prescriberOrganisationParticipation);

    // Setup content
    //Calendar prescriptionTime = GregorianCalendar.getInstance();
    //prescriptionTime.set( 2012, Calendar.OCTOBER, 2 );

    //creation time must match close the gap for ctg check digit
    //target time = 200910201235+1000
    DateTime creationTime =
        DateTimeFormat.forPattern("yyyyMMddHHmm").parseDateTime("200910201235");

    DateTime expiryTime = new DateTime();
    expiryTime.plusYears(1);

    String prescriptionIdentifierCode = "AA=SV3Cg3FNwYyD#xE";
    boolean isAllowBrandSubstitution = true;
    Integer repeats = 31;
    String formula = "N-(4-Hydroxyphenyl)acetamide C8H9NO2";
		
		
		
		
		/*
		 ===============
		  Important Note: 
		 ===============
		 
		 From the CDA Prescription document 4888_3 Section 8.3.4 CDA mapping
		 
		  If any of	STRUCTURED DOSE, TIMING and ADMINISTRATION	DETAILS are included,
			Directions SHALL be	fully and automatically	derived from that information. 
			Directions SHALL NOT contradict that information.
		 
		 This is left as an exercise for the software vendor.
		 
		 */

    String doseUnits = "Tablet(s)";
    Dosage dosage = new DosageImpl();
    dosage.setDoseQuantity(QuantityUnitDescriptionImpl
        .create(30, new SNOMED_AU_Code("385057009", "Film-coated tablet")));

    //max dose = 4 tablets/24hours
    dosage.setMaxDose(
        Ratio.getUnitsOverTime(4.0, doseUnits, new TimeQuantity(24.0, TimeUnitOfMeasure.HOUR)));
    String scriptNote = "Call me in the morning";
    String instructionsForUse = "Take one and call me in the morning";

    TimeQuantity intervalBetweenRepeats = new TimeQuantity(3, TimeUnitOfMeasure.WEEK);
    intervalBetweenRepeats.setNarrative("3 weeks"); //a text descripton of this time quantity

    String additionalComments = "Patient must retrun for a checkup at the end of treatment";
    String reasonForTherapeuticGood = "Long-term treatment of Clinical Document Anxiety disorder";

    PrescriptionItemIdentifier prescriptionItemIdentifier = ItemFactory
        .createPrescriptionItemIdentifier(prescriptionIdentifierCode);

    //therapeuticGoodIdentification
    Code amt = new AMTCode("23641011000036102",
        "paracetamol 500 mg + codeine phosphate 30 mg tablet");
    Code amtToNctisTranslation = new NCTISDataComponent("1.1.1.1.1.1.1", "PBSRPBSItemCode");

    amt.addTranslation(amtToNctisTranslation);
    amt.setOriginalText("some original text");

    //an elaborate style dispensing unit code
    SNOMED_AU_Code dispensingUnitCode = new SNOMED_AU_Code("32570641000036102",
        "foo bar disepnsing unit");
    dispensingUnitCode.setOriginalText("more elaborate text here if needed");
    QuantityUnitDescription dispenseQuantity = QuantityUnitDescriptionImpl
        .create(3, dispensingUnitCode);

    //for start, stop and structured time
    PeriodicIntervalTime onceADay = new PeriodicIntervalTime(
        new TimeQuantity(1.0, TimeUnitOfMeasure.DAY), 1);
    onceADay.setNarrative("Once every twenty four (24) Hours");

    DateTime twoWeeks = new DateTime();
    twoWeeks.plusWeeks(2);

    PreciseDate twoWeeksLater = new PrecisionDate(Precision.DAY, twoWeeks);
    RestrictedTimeInterval betweenNowAndTwoWeeks = RestrictedTimeInterval
        .getLowHighInstance(new PrecisionDate(Precision.DAY), twoWeeksLater);
    betweenNowAndTwoWeeks.setNarrative("for a fortnight");

    //Extemporaneous Ingredients
    Code nacl = new NCTISDataComponent("1.1.1.1.1", "PBS Extemporaneous Ingredient Name");
    nacl.setOriginalText("Sodium Chloride");
    Ratio _5mg = Ratio.numeratorOnly(new RealQuantity(5, "mg"));
    Ingredient salt5mg = new Ingredient(nacl, _5mg);

    Code C6H12O6 = new NCTISDataComponent("1.1.1.1.1", "PBS Extemporaneous Ingredient Name");
    C6H12O6.setOriginalText("Glucose");
    Ratio _10mg = Ratio.numeratorOnly(new RealQuantity(10, "mg"));
    Ingredient glucose10mg = new Ingredient(C6H12O6, _10mg);

    PrescriptionItemBuilder builder = new PrescriptionItemBuilder();

    builder //can chain items on the builder

        //** mandatory fields **
        .dateTimeWritten(creationTime)
        .dateTimeExpires(expiryTime)
        .prescriptionItemIdentifier(prescriptionItemIdentifier)
        .brandSubstituteAllowed(isAllowBrandSubstitution)
        .maximumNumberOfRepeats(repeats)
        .medicalBenefitCategoryType(MedicalBenefitCategoryType.PBS)
        .groundsForConcurrentSupply(GroundsForConcurrentSupply.PURSUANT_TO_REGULATION_24)
        .pbsType(new PBSPrescriptionTypeCode(PBSPrescriptionType.STANDARD_PRESCRIPTION))
        .pbsRPBSItemCode(amt)
        .directions(instructionsForUse)
        .closeTheGap(uuidRoot("CTG06X")) //check digit 'X' must match creation time

        //** optional fields **
        .formula(formula)
        .dosage(dosage)
        .longTerm(Boolean.TRUE)
        .reasonForTherapeuticGood(reasonForTherapeuticGood)

        /*
         * PRN is an indicator that states the timing of the use or administration of the medicine, vaccine or other therapeutic good
         * is dependent, within limits, on the conditions or symptoms of the subject of care.
         *
         */
        .prn(Boolean.TRUE)

        .medicationInstruction(uuidRoot("instructionId"))
        .minimumIntervalBetweenRepeats(intervalBetweenRepeats)

        .startCriterion(new PrecisionDate()) //start from now
        .stopCriterion(new PrecisionDate(Precision.DAY, twoWeeks))  //stop in two weeks

        //SNOMED code to describe timing
        .setTimingDescription("307448006")

        .addStructuredTime(onceADay)
        .addStructuredTime(betweenNowAndTwoWeeks)

        .methodCode(new SNOMED_AU_Code("70655008", "MedicationDeliveryMethod"))
        .routeCode(new SNOMED_AU_Code("26643006", "SampleRouteCode"))
        .approachSiteCode(new SNOMED_AU_Code("110731006", "SampleAnatomicalSite"))

        .dispenseQuantity(dispenseQuantity)
        .dispensItemIdentifier(uuidRoot("dispenseIdentifier"))

        /**
         * Important note:

         PbsAuthorityPrescriptionNumber should NOT be populated if:
         (i)
         1 the Medical Benefit Category type is PBS; and
         2 the item is not listed as �Authority Required�, 'Authority Required (Streamlined)', or an application to increase the maximum quantity and/or repeats has not been approved; or
         (ii) the Medical Benefit Category type is neither PBS nor RPBS.
         */
        .pbsAuthorityPrescriptionNumber(
            new PbsAuthorityPrescriptionNumber("my PBS authority prescription approval Number "))
        .pbsAuthorityApprovalNumber(UniqueIdentifierImpl
            .createSimpleIdentifier("1.2.36.1.5001.1.1.3.2.3",
                "Some PBS/RPBS Authority Approval Number"))
        .pbsRpbsManufacturerCode(UniqueIdentifierImpl
            .createSimpleIdentifier("1.1.1.1.1.1.1.1", "The PBSRPBS Manufacturer Code"))
        .streamlinedAuthorityApprovalNumber(
            new StreamlinedAuthorityApprovalNumber("my streamlined authority approval Number "))
        .stateAuthorityNumber(uuidRoot("my state auth number"))
        .additionalComments(additionalComments)

        .extemporaneousIngredient(glucose10mg)
        .extemporaneousIngredient(salt5mg)

    ;
		
		
		
		
		
		/*
    		Build will throw illegal argument exception if one of the mandatory fields is missing
            mandatory fields are:
                Prescription expiry time 
                Prescription written time
                pbs/rpbs item code
                prescriptionItemIdentifier
                brandSubstituteAllowed
                maximumNumberOfRepeats
                medicalBenefitCategoryType
                groundsForConcurrentSupply
                directions
                pbs type
                close the gap ids
        */
    PrescriptionItem prescriptionItem = builder.build();

    //include some measurements
    String bodyWeight = "75";
    PreciseDate weightObservationTime = new PrecisionDate(Precision.DAY,
        System.currentTimeMillis());
    BodyWeight weightObservation = new BodyWeightImpl(bodyWeight, weightObservationTime);

    String height = "180";
    PreciseDate heightObservationTime = new PrecisionDate(Precision.DAY,
        System.currentTimeMillis());
    BodyHeight heightObservation = new BodyHeightImpl(height, heightObservationTime);

    Observations observations = new ObservationsImpl(heightObservation, weightObservation);

    Logo logo = new Logo(new File("logo.png")); //will use sha1 by default

    //optional alternative, but not recommended
    //Logo logo = new Logo( new File("logo.png"), IntegerityCheckType.SHA_256 );

    EPrescriptionContent ePrescriptionContent = new EPrescriptionContentImpl(prescriptionItem);
    ePrescriptionContent.setObservations(observations);
    ePrescriptionContent.setPrescriptionNoteDetail(new PrescriptionNoteDetailImpl(scriptNote));
    ePrescriptionContent.setLogo(logo);

    // Create Clinical Model Prescription
    EPrescription ePrescription = new EPrescriptionImpl(ePrescriptionContext, ePrescriptionContent);

    String prescriptionDocumentID = UUID.randomUUID().toString();

    List<PersonName> legalAuthenticatorsNames = new ArrayList<PersonName>(2);

    legalAuthenticatorsNames.add(PersonNameImpl
        .getInstance("Black", "Jane", NameTitle.MRS.getDescriptor(),
            NameSuffix.JUNIOR.getDescriptor(), PersonNameUsage.REGISTERED_NAME_OR_LEGAL_NAME));
    legalAuthenticatorsNames.add(PersonNameImpl
        .getInstance("Alias", "other", NameTitle.MISS.getDescriptor(),
            PersonNameUsage.MAIDEN_NAME_OR_NAME_AT_BIRTH));

    //*******************************
    //***** Legal Authenticator *****
    //*******************************

    HPII authenticatorHPII = new HPII("8003610000001145");
    Person legalAuthenticatorPerson = PersonImpl
        .getInstance(authenticatorHPII, legalAuthenticatorsNames);

    //This is an alternate way of doing a HPIO, HPII or other identifier
    //AsEntityIdentifier hpioTheHardWay = AsEntityIdentifierImpl.getInstance( "1.2.36.1.2001.1003.0.800362555555" );
    //hpioTheHardWay.setAssigningAuthorityName( "HPI-O" );
    //hpioTheHardWay.setAssigningGeographicAreaName( "National Identifier" );

    HPIO authenticatorHPIO = new HPIO("8003621231167886");

    Organization legalAuthenticatorOrganisation =
        OrganizationImpl.getInstance(authenticatorHPIO, "Clinic Name");

    AssignedEntity cdaLegalAuthenticatorAssignedEntity =
        AssignedEntityImpl.getInstance(prescriptionDocumentID, legalAuthenticatorPerson,
            legalAuthenticatorOrganisation);

    //You can also create a code the hard way...
    Code cdaLegalAuthenticatorAssignedEntityCode = new CodeImpl("253111");
    cdaLegalAuthenticatorAssignedEntityCode.setCodeSystem("2.16.840.1.113883.13.62");
    cdaLegalAuthenticatorAssignedEntityCode.setCodeSystemName(
        "1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, 2006");
    cdaLegalAuthenticatorAssignedEntityCode.setDisplayName("General Medical Practitioner");

    //...or use a pre-baked version
    cdaLegalAuthenticatorAssignedEntity.setCode(ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER);

    AustralianAddress authenticatorAddress = new AustralianAddressImpl();
    authenticatorAddress.addUnstructuredAddressLine("10 Browning Street");
    authenticatorAddress.setState("QLD");
    authenticatorAddress.setPostcode("4101");
    authenticatorAddress.setCity("Brisbane");
    PostalAddress authenticatorPostalAddress = new PostalAddressImpl(authenticatorAddress,
        PostalAddressUseEnum.WORKPLACE);

    cdaLegalAuthenticatorAssignedEntity.setAddress(Arrays.asList(authenticatorPostalAddress));

    Telecom authenticatorEmail = new TelecomImpl(TelecomMedium.EMAIL, "example@sample.com",
        TelecomUse.BUSINESS_AND_PERSONAL);
    cdaLegalAuthenticatorAssignedEntity.setTelecom(Arrays.asList(authenticatorEmail));

    LegalAuthenticator cdaLegalAuthenticator = LegalAuthenticatorImpl
        .getInstance(new DateTime(), cdaLegalAuthenticatorAssignedEntity);

    //*********************
    //***** Custodian *****
    //*********************

    AsEntityIdentifier custodianIdentifier = new HPIO("8003621231167886");
    Telecom custodianEmail = new TelecomImpl(TelecomMedium.EMAIL, "example@custodian.com.au",
        TelecomUse.BUSINESS_AND_PERSONAL);

    AustralianAddress custodianAddress = new AustralianAddressImpl();
    custodianAddress.addUnstructuredAddressLine("99 Clinician Street");
    custodianAddress.setCity("Nehtaville");
    custodianAddress.setState("QLD");
    custodianAddress.setPostcode("5555");
    custodianAddress.setAdditionalLocator("32568931");

    UniqueIdentifier typedPrescriptionDocumentID = new UniqueIdentifierImpl(prescriptionDocumentID);

    //you can also use additional identifiers
    UniqueIdentifier otherId = new UniqueIdentifierImpl(UUID.randomUUID().toString());
    CustodianOrganization custodianOrganization =
        CustodianOrganizationImpl
            .getInstance(Arrays.asList(typedPrescriptionDocumentID, otherId), custodianIdentifier);

    OrganizationName custodianOrganizationName = OrganizationNameImpl.getInstance();
    custodianOrganizationName.setValue("Oz Health Clinic");
    custodianOrganization.setName(custodianOrganizationName);
    custodianOrganization.setTelecom(custodianEmail);
    custodianOrganization
        .setAddress(new PostalAddressImpl(custodianAddress, PostalAddressUseEnum.POSTAL_ADDRESS));

    AssignedCustodian cdaAssignedCustodian = AssignedCustodianImpl
        .getInstance(custodianOrganization);
    Custodian cdaCustodian = CustodianImpl.getInstance(cdaAssignedCustodian);

    BaseClinicalDocument cdaClinicalDocument = ClinicalDocumentFactory.getEPrescription();
    cdaClinicalDocument.setLanguageCode("en-AU");
    cdaClinicalDocument.setVersionNumber(1);

    cdaClinicalDocument.setSetId(prescriptionDocumentID);
    // as an example we can add another template if needed.
    cdaClinicalDocument
        .addTemplateId(TemplateIdImpl.getInstance("1.0", "1.2.36.1.2001.1001.100.149"));

    // prescriptionIdentifier
    //String prescriptionDocumentId = "2.25.36901752580752676809846395044082807160"; //must be an OID to pass into PCEHR

    // You can also use the conversion tool
    String doucmentUUID = UUID.randomUUID().toString();
    String documentIdAsAnOid = UUIDTool.uuidToOid(doucmentUUID);
    String prescriptionDocumentId = documentIdAsAnOid;

    cdaClinicalDocument.setClinicalDocumentId(prescriptionDocumentId);

    EPrescriptionCdaModel ePrescriptionCdaModel = new EPrescriptionCdaModel(cdaClinicalDocument,
        cdaLegalAuthenticator, cdaCustodian, creationTime);

    EPrescriptionCreator ePrescriptionCreator = new EPrescriptionCreator(ePrescriptionCdaModel,
        ePrescription);

    Document clinicalDocument = null;
    //diabled
    //clinicalDocument = ePrescriptionCreator.create();

    String cdaString = TestHelper.documentToXML(clinicalDocument);
    TestHelper.printToFile(cdaString, DOCUMENT_FILE_NAME);
    System.out.println(cdaString);
  }


}

