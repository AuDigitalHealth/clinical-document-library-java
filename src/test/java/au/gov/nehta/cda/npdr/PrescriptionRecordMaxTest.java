package au.gov.nehta.cda.npdr;

import au.gov.nehta.builder.npdr.prescriptionrecord.PrescriptionCreator;
import au.gov.nehta.builder.util.UUIDTool;
import au.gov.nehta.cda.test.Base;
import au.gov.nehta.cda.test.TestHelper;
import au.gov.nehta.model.cda.common.address.PostalAddress;
import au.gov.nehta.model.cda.common.address.PostalAddressImpl;
import au.gov.nehta.model.cda.common.address.PostalAddressUseEnum;
import au.gov.nehta.model.cda.common.code.*;
import au.gov.nehta.model.cda.common.custodian.*;
import au.gov.nehta.model.cda.common.document.BaseClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocumentFactory;
import au.gov.nehta.model.cda.common.document.RelatedDocument;
import au.gov.nehta.model.cda.common.document.TransformRelatedDocument;
import au.gov.nehta.model.cda.common.id.*;
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
import au.gov.nehta.model.cda.common.time.*;
import au.gov.nehta.model.cda.npdr.PCEHRPrescriptionItem;
import au.gov.nehta.model.cda.npdr.PCEHRPrescriptionItemBuilder;
import au.gov.nehta.model.cda.npdr.PrescriptionCdaModel;
import au.gov.nehta.model.clinical.common.*;
import au.gov.nehta.model.clinical.common.participation.*;
import au.gov.nehta.model.clinical.common.types.*;
import au.gov.nehta.model.clinical.etp.common.item.*;
import au.gov.nehta.model.clinical.etp.common.participation.EntitlementType;
import au.gov.nehta.model.clinical.etp.common.participation.*;
import au.gov.nehta.model.clinical.etp.eprescription.*;
import org.junit.Assert;
import org.junit.Ignore;
import org.junit.Test;

import java.io.File;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.*;

public class PrescriptionRecordMaxTest extends Base {

    private static final String SCHEMATRON = "ccd-3B.sch";
    private static String SCHEMATRON_TEMPLATE_PATH = "src/test/resources/PCEHR-PrescriptionRecord";
    private static final String DOCUMENT_FILE_NAME = "src/test/resources/generated_xml/npdr/npdr-prescription-max.xml";

    @Test
    @Ignore
    public void test_MAX__NPDR_PrecriptionDocumentCreation() {
        generateMaxDocument();
//        SchematronCheckResult check = Schematron
//                .check(SCHEMATRON_TEMPLATE_PATH, SCHEMATRON, DOCUMENT_FILE_NAME);
//        show(check);
//        assertEquals(0, check.schemaErrors.size());
//        assertEquals(0, check.schematronErrors.size());
        File f = new File(DOCUMENT_FILE_NAME);
        Assert.assertTrue(f.exists());
        Assert.assertTrue(f.length() > 0L);
    }

    public void generateMaxDocument() {
        // Setup context

        //***************************
        //***** Subject Of Care *****
        //***************************

        IHI subjectIHI = new IHI("8003600300001283");
        MedicareCardIdentifier mcCard = new MedicareCardIdentifier("1234567881");

        String subjectFamilyName = "Harding";

        ZonedDateTime dob = LocalDate.of(1982, 11, 28).atStartOfDay(ZoneId.systemDefault());

        AustralianAddress subjectFullAddress = new AustralianAddressImpl();

        subjectFullAddress.addUnstructuredAddressLine("The Complex");
        subjectFullAddress.addUnstructuredAddressLine("Unit 90210 / 10 Browning st");
        subjectFullAddress.setCity("West End");
        subjectFullAddress.setState(AustralianStateTerritory.QUEENSLAND.getAbbreviation());
        subjectFullAddress.setPostcode("4101");

        AddressContext subjectOfCareAddress = new AddressContextImpl(subjectFullAddress, AddressPurpose.RESIDENTIAL_PERMANENT);
        PersonName subjectPersonName = new PersonNameImpl(subjectFamilyName);
        subjectPersonName.addNameTitle(NameTitle.MISTER.getDescriptor());
        subjectPersonName.addNameSuffix(NameSuffix.JUNIOR.getDescriptor());
        subjectPersonName.addGivenName("Frank");
        subjectPersonName.addPersonNameUsage(PersonNameUsage.MAIDEN_NAME_OR_NAME_AT_BIRTH);

        DateAccuracy dobAccuracy = new DateAccuracyImpl(true, true, true);
        DateOfBirthDetail subjectDOB = new DateOfBirthDetailImpl(dob, dobAccuracy);
        subjectDOB.setDateOfBirthAccuracyIndicator(dobAccuracy);
        subjectDOB.setDateOfBirthIsCalculatedFromAge(true);
        SubjectOfCareDemographicData subjectDemographicData = new SubjectOfCareDemographicDataImpl(Sex.MALE, subjectDOB);
        subjectDemographicData.setBirthPlurality(5);
        subjectDemographicData.setBirthOrder(2);
        int socAge = 35;
        subjectDemographicData.setAgeInYears(socAge);
        subjectDemographicData.setAgeAccurate(true);

        subjectDemographicData.setIndigenousStatus(IndigenousStatus.NOT_STATED_OR_INADEQUATELY_DESCRIBED);

        SubjectOfCarePerson subjectOfCarePerson = new SubjectOfCarePersonImpl(subjectPersonName, subjectDemographicData);
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

        subjectParticipant.setElectronicCommunicationDetails(subjectOfCareElectronicCommunicationDetailList);

        AsEntityIdentifier subjectEntitlementNumber = new MedicareCardIdentifier("1234567881");

        Entitlement subjectEntitlement = new EntitlementImpl(subjectEntitlementNumber, EntitlementType.MEDICARE_BENEFITS);

        subjectEntitlement.setEntitlementValidityDuration(
                RestrictedTimeInterval.getLowWidthInstance(
                        // From today (day only precision) for two weeks
                        new PrecisionDate(Precision.DAY, ZonedDateTime.now()),
                        new TimeQuantity(2, TimeUnitOfMeasure.WEEK))
        );

        List<Entitlement> subjectOfCareEntitlementList = new ArrayList<Entitlement>();
        subjectOfCareEntitlementList.add(subjectEntitlement);
        subjectParticipant.setEntitlements(subjectOfCareEntitlementList);

        //************************
        //*****   Prescriber *****
        //************************
        HPII prescriberHPII = new HPII("8003610000010401");
        String prescriberFamilyName = "Duncan";

        PersonName prescriberPersonName = new PersonNameImpl(prescriberFamilyName);

        // "Unstructured" address example
        AustralianAddress prescriberFullAddress = new AustralianAddressImpl();
        prescriberFullAddress.addUnstructuredAddressLine("level 2, 10 browning street");
        prescriberFullAddress.setCity("West End");
        prescriberFullAddress.setState(AustralianStateTerritory.QUEENSLAND.getAbbreviation());
        prescriberFullAddress.setPostcode("4101");

        ProviderAddress prescriberAddress = new ProviderAddressImpl(false, prescriberFullAddress, AddressPurpose.BUSINESS);

        Occupation prescriberOccupation = new OccupationImpl(ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER);
        ProviderEmploymentDetail prescriberEmploymentDetail = new ProviderEmploymentDetailImpl(prescriberOccupation);
        ProviderPerson prescriberPerson = new ProviderPersonImpl(prescriberPersonName);
        prescriberPerson.setEmploymentDetail(prescriberEmploymentDetail);

        DefaultParticipant prescriberParticipant = new DefaultParticipantImpl(prescriberHPII, prescriberPerson);
        prescriberParticipant.setAddress(prescriberAddress);
        prescriberParticipant.setQualifications("MD");

        AsEntityIdentifier prescriberNumber = new AsEntityIdentifierImpl("1.22.333.4444.55555", "12345678");

        Entitlement prescriberEntitlement = new EntitlementImpl(prescriberNumber, EntitlementType.MEDICARE_PRESCRIBER_NUMBER);
        prescriberEntitlement.setEntitlementValidityDuration(
                RestrictedTimeInterval.getLowInstance(
                        // From today (day only precision)
                        new PrecisionDate(Precision.DAY, ZonedDateTime.now()))
        );

        prescriberParticipant.addEntitlement(prescriberEntitlement);

        Role prescriberRole = new RoleImpl(ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER);

        PrescriberParticipation prescriberParticipation = new PrescriberParticipationImpl(prescriberRole, prescriberParticipant);

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

        HPIO prescriberHPIO = new HPIO("8003620000030333");
        String organisationName = "GP Australia";

        AustralianAddress fullAddress = new AustralianAddressImpl();
        fullAddress.addUnstructuredAddressLine("Level 1, 10 Browning streed");
        fullAddress.setCity("West End");
        fullAddress.setState(AustralianStateTerritory.QUEENSLAND.getAbbreviation());
        fullAddress.setPostcode("4101");
        ProviderAddress prescriberOrganisationAddress = new ProviderAddressImpl(false, fullAddress, AddressPurpose.BUSINESS);

        Telecom prescriberOrgEmail =
                new TelecomImpl(
                        TelecomMedium.EMAIL,
                        "info@some-gp.com.au",
                        TelecomUse.BUSINESS);

        Telecom prescriberOrgTelephone =
                new TelecomImpl(
                        TelecomMedium.TELEPHONE,
                        "0212345678",
                        TelecomUse.BUSINESS);

        List<Telecom> electronicCommunicationDetailList = Arrays.asList(prescriberOrgEmail, prescriberOrgTelephone);

        Organisation prescriberOrganisation = new OrganisationImpl(organisationName);
        prescriberOrganisation.setOrganisationNameUsage(OrganisationNameUsage.BUSINESS_NAME);
        prescriberOrganisation.setDepartmentUnit("SOME DEPARTMENT");
        PrescriberOrganisationParticipant prescriberOrganisationParticipant =
                new PrescriberOrganisationParticipantImpl(prescriberHPIO,
                        prescriberOrganisationAddress, electronicCommunicationDetailList, prescriberOrganisation);

        Role prescriberOrganisationRole = new RoleImpl(ANZSCO_1ED_2006.ZOOLOGIST);

        PrescriberOrganisationParticipation prescriberOrganisationParticipation =
                new PrescriberOrganisationParticipationImpl(
                        prescriberOrganisationRole,
                        prescriberOrganisationParticipant);


        EPrescriptionContext ePrescriptionContext = new EPrescriptionContextImpl(subjectParticipant, prescriberParticipation, prescriberOrganisationParticipation);

        // Setup content
        ZonedDateTime creationTime = ZonedDateTime.of(2012, 8, 2, 0, 0, 0, 0, ZoneId.systemDefault());

        ZonedDateTime expiryTime = ZonedDateTime.now();
        expiryTime.plusYears(1);

        boolean isAllowBrandSubstitution = true;
        Integer repeats = 3;
        String formula = "N-(4-Hydroxyphenyl)acetamide C8H9NO2";

        /*
         ===============
          Important Note: 
         ===============
         
         From the CDA Prescription document 4888_3 Section 8.3.4 CDA mapping
         
          If any of STRUCTURED DOSE, TIMING and ADMINISTRATION  DETAILS are included,
            Directions SHALL be fully and automatically derived from that information. 
            Directions SHALL NOT contradict that information.
         
         This is left as an exercise for the software vendor.
         
         */
        Dosage dosage = new DosageImpl();
        dosage.setDoseQuantity(QuantityUnitDescriptionImpl.create(1, new SNOMED_AU_Code("385057009", "Film-coated tablet")));

        // max dose = 4 tablets/24hours
        // dosage.setMaxDose( Ratio.getUnitsOverTime( 4.0, doseUnits, new TimeQuantity(24.0, TimeUnitOfMeasure.HOUR) ) );

        String scriptNote = "Call me in the morning";
        String instructionsForUse = "Take one and call me in the morning";

        SimplifiedPeriodicIntervalTime minIntervalBetweenRepeats = new SimplifiedPeriodicIntervalTime(3, TimeUnitOfMeasure.WEEK);
        minIntervalBetweenRepeats.setNarrative("3 weeks"); //a text descripton of this time quantity

        String additionalComments = "Patient must retrun for a checkup at the end of treatment";
        String reasonForTherapeuticGood = "Long-term treatment of Clinical Document Anxiety disorder";

        PrescriptionItemIdentifier prescriptionItemIdentifier = ItemFactory.createPrescriptionItemIdentifier(UUID.randomUUID().toString());

        // therapeuticGoodIdentification
        Code amt = new AMTv3Code("23641011000036102", "paracetamol 500 mg + codeine phosphate 30 mg tablet");
        Code translation = new PBSCode("1471K", "FLUCONAZOLE");
        amt.addTranslation(translation);

        // An elaborate style dispensing unit code
        SNOMED_AU_Code dispensingUnitCode = new SNOMED_AU_Code("32570641000036102", "foo bar disepnsing unit");
        dispensingUnitCode.setOriginalText("more elaborate text here if needed");
        QuantityUnitDescription dispenseQuantity = QuantityUnitDescriptionImpl.create(3, dispensingUnitCode);

        // For start, stop and structured time
        PeriodicIntervalTime onceADay = new PeriodicIntervalTime(new TimeQuantity(1.0, TimeUnitOfMeasure.DAY), 1);
        onceADay.setNarrative("Once every twenty four (24) Hours");

        ZonedDateTime twoWeeks = ZonedDateTime.now().plusWeeks(2);

        PreciseDate twoWeeksLater = new PrecisionDate(Precision.DAY, twoWeeks);
        RestrictedTimeInterval betweenNowAndTwoWeeks = RestrictedTimeInterval.getLowHighInstance(new PrecisionDate(Precision.DAY), twoWeeksLater);
        betweenNowAndTwoWeeks.setNarrative("for a fortnight");

        PCEHRPrescriptionItemBuilder builder = new PCEHRPrescriptionItemBuilder();

        // can chain items on the builder
        builder
                //** mandatory fields **
                .dateTimeWritten(creationTime)
                .dateTimeExpires(expiryTime)
                .prescriptionItemIdentifier(prescriptionItemIdentifier)
                .brandSubstituteAllowed(isAllowBrandSubstitution)
                .maximumNumberOfRepeats(repeats)
                .medicalBenefitCategoryType(MedicalBenefitCategoryType.PBS)
                .pbsRPBSItemCode(amt)
                .directions(instructionsForUse)
                .quantityDescription("A SNOMED CT CODE FOR quantities description")

                //** optional fields **
                .form(new SNOMED_AU_Code("385057009", "Film-coated tablet"))
                .therapeuticGoodGenericName("Theraputic good generic name")
                .formula(formula)
                .reasonForTherapeuticGood(reasonForTherapeuticGood)
                .therapeuticGoodGenericStrength("Theraputic good strength")
                .therapeuticGoodGenericName("Generic name")
                .minimumIntervalBetweenRepeats(minIntervalBetweenRepeats)
                .setTimingDescription("Snomed code to describe timing")
                .routeCode(new SNOMED_AU_Code("1.1.1.1.1.1", "SampleRouteCode"))
                .dispenseQuantity(dispenseQuantity)
                .dispensItemIdentifier(uuidRoot("dispenseIdentifier"))
                .pbsRpbsManufacturerCode(UniqueIdentifierImpl.createSimpleIdentifier("1.1.1.1.1.1.1.1", "The PBS/RPBS Manufacturer Code"))
                .additionalComments(additionalComments)
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
        PCEHRPrescriptionItem prescriptionItem = builder.build();

        EPrescriptionContent ePrescriptionContent = new EPrescriptionContentImpl(prescriptionItem);
        ePrescriptionContent.setPrescriptionNoteDetail(new PrescriptionNoteDetailImpl(scriptNote));

        // Create Clinical Model Prescription
        EPrescription ePrescription = new EPrescriptionImpl(ePrescriptionContext, ePrescriptionContent);

        String prescriptionDocumentID = UUID.randomUUID().toString();

        List<PersonName> legalAuthenticatorsNames = new ArrayList<PersonName>(2);

        legalAuthenticatorsNames.add(PersonNameImpl.getInstance("Black", "Jane", NameTitle.MRS.getDescriptor(), NameSuffix.JUNIOR.getDescriptor(), PersonNameUsage.REGISTERED_NAME_OR_LEGAL_NAME));
        legalAuthenticatorsNames.add(PersonNameImpl.getInstance("Alias", "other", NameTitle.MISS.getDescriptor(), PersonNameUsage.MAIDEN_NAME_OR_NAME_AT_BIRTH));

        //*******************************
        //***** Legal Authenticator *****
        //*******************************

        HPII authenticatorHPII = new HPII("8003610000010401");
        Person legalAuthenticatorPerson = PersonImpl.getInstance(authenticatorHPII, legalAuthenticatorsNames);

        // This is an alternate way of doing a HPIO, HPII or other identifier
        // AsEntityIdentifier hpioTheHardWay = AsEntityIdentifierImpl.getInstance( "1.2.36.1.2001.1003.0.800362555555" );
        // hpioTheHardWay.setAssigningAuthorityName( "HPI-O" );
        // hpioTheHardWay.setAssigningGeographicAreaName( "National Identifier" );

        HPIO authenticatorHPIO = new HPIO("8003620000030333");

        Organization legalAuthenticatorOrganisation =
                OrganizationImpl.getInstance(authenticatorHPIO, "Primary Healthcare Clinic Name");

        AssignedEntity authenticatorEntity =
                AssignedEntityImpl.getInstance(prescriptionDocumentID, legalAuthenticatorPerson, legalAuthenticatorOrganisation);

        // You can also create a code the hard way...
        Code cdaLegalAuthenticatorAssignedEntityCode = new CodeImpl("253111");
        cdaLegalAuthenticatorAssignedEntityCode.setCodeSystem("2.16.840.1.113883.13.62");
        cdaLegalAuthenticatorAssignedEntityCode.setCodeSystemName("1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, 2006");
        cdaLegalAuthenticatorAssignedEntityCode.setDisplayName("General Medical Practitioner");

        // ...or use a pre-baked version
        authenticatorEntity.setCode(ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER);

        AustralianAddress authenticatorAddress = new AustralianAddressImpl();
        authenticatorAddress.addUnstructuredAddressLine("10 Browning Street");
        authenticatorAddress.setState("QLD");
        authenticatorAddress.setPostcode("4101");
        authenticatorAddress.setCity("Brisbane");
        PostalAddress authenticatorPostalAddress = new PostalAddressImpl(authenticatorAddress, PostalAddressUseEnum.WORKPLACE);

        authenticatorEntity.setAddress(Collections.singletonList(authenticatorPostalAddress));

        Telecom authEmail =
                new TelecomImpl(TelecomMedium.EMAIL, "example@sample.com", TelecomUse.BUSINESS);
        authenticatorEntity.setTelecom(Collections.singletonList(authEmail));

        LegalAuthenticator cdaLegalAuthenticator = LegalAuthenticatorImpl.getInstance(ZonedDateTime.now(), authenticatorEntity);

        //*********************
        //***** Custodian *****
        //*********************

        AsEntityIdentifier custodianIdentifier = new HPIO("8003620000030333");
        Telecom custodianTelecom = new TelecomImpl("0712341234", TelecomUse.BUSINESS);

        AustralianAddress custodianAddress = new AustralianAddressImpl();
        custodianAddress.addUnstructuredAddressLine("99 Clinician Street");
        custodianAddress.setCity("Nehtaville");
        custodianAddress.setState("QLD");
        custodianAddress.setPostcode("5555");
        custodianAddress.setAdditionalLocator("32568931");

        UniqueIdentifier typedPrescriptionDocumentID = new UniqueIdentifierImpl(prescriptionDocumentID);
        UniqueIdentifier otherId = new UniqueIdentifierImpl("d0000000-a000-4000-a000-d00000000000");
        CustodianOrganization custodianOrganization =
                CustodianOrganizationImpl.getInstance(Arrays.asList(typedPrescriptionDocumentID, otherId), custodianIdentifier);

        OrganizationName custodianOrganizationName = OrganizationNameImpl.getInstance();
        custodianOrganizationName.setValue("Oz Health Clinic");
        custodianOrganization.setName(custodianOrganizationName);
        custodianOrganization.setTelecom(custodianTelecom);
        custodianOrganization.setAddress(new PostalAddressImpl(custodianAddress, PostalAddressUseEnum.POSTAL_ADDRESS));

        AssignedCustodian cdaAssignedCustodian = AssignedCustodianImpl.getInstance(custodianOrganization);
        Custodian cdaCustodian = CustodianImpl.getInstance(cdaAssignedCustodian);

        BaseClinicalDocument cdaClinicalDocument = ClinicalDocumentFactory.getNPDREPrescription();
        cdaClinicalDocument.setLanguageCode("en-AU");
        cdaClinicalDocument.setVersionNumber(1);

        cdaClinicalDocument.setSetId(prescriptionDocumentID);
        // As an example we can add another template if needed.
        cdaClinicalDocument.addTemplateId(TemplateIdImpl.getInstance("1.0", "1.2.36.1.2001.1001.100.149"));

        // prescriptionIdentifier
        // Must be an OID to pass into PCEHR
        // String prescriptionDocumentId = "2.25.36901752580752676809846395044082807160";

        // You can also use the conversion tool
        String documentUUID = UUID.randomUUID().toString();
        String documentIdAsAnOid = UUIDTool.uuidToOid(documentUUID);
        String prescriptionDocumentId = documentIdAsAnOid;

        cdaClinicalDocument.setClinicalDocumentId(prescriptionDocumentId);

        // Transform style replacement document
        UniqueIdentifier docId = new UniqueIdentifierImpl(UUIDTool.uuidToOid(UUID.randomUUID()));
        UniqueIdentifier setId = new UniqueIdentifierImpl(UUID.randomUUID().toString());

        TransformRelatedDocument relatedDocument = new TransformRelatedDocument(docId, setId, 1);
        List<RelatedDocument> relatedDocuments = Collections.singletonList((RelatedDocument) relatedDocument);

        PrescriptionCdaModel ePrescriptionCdaModel = new PrescriptionCdaModel(
                cdaClinicalDocument,
                cdaLegalAuthenticator,
                relatedDocuments,
                cdaCustodian);

        PrescriptionCreator prescriptionCreator = new PrescriptionCreator(ePrescriptionCdaModel, ePrescription);
        // Turn on schematron file checking
        // prescriptionCreator.useStrict();

//        Document clinicalDocument=null;
//            clinicalDocument = ePrescriptionCreator.create();

        String cdaString = "";
        try {
            cdaString = TestHelper.documentToXML(prescriptionCreator.create());

        } catch (Exception e) {

            throw new RuntimeException(e);
        }

        TestHelper.printToFile(cdaString, DOCUMENT_FILE_NAME);
        System.out.println(cdaString);
    }
}
