package au.gov.nehta.cda.etp;

import au.gov.nehta.builder.etp.eprescription.EPrescriptionCreator;
import au.gov.nehta.builder.util.UUIDTool;
import au.gov.nehta.cda.test.Base;
import au.gov.nehta.cda.test.TestHelper;
import au.gov.nehta.model.cda.common.code.AMTv3Code;
import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.code.PBSPrescriptionTypeCode;
import au.gov.nehta.model.cda.common.code.PBSPrescriptionTypeCode.PBSPrescriptionType;
import au.gov.nehta.model.cda.common.custodian.*;
import au.gov.nehta.model.cda.common.document.BaseClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocumentFactory;
import au.gov.nehta.model.cda.common.id.*;
import au.gov.nehta.model.cda.common.org.Organization;
import au.gov.nehta.model.cda.common.org.OrganizationImpl;
import au.gov.nehta.model.cda.common.org.OrganizationName;
import au.gov.nehta.model.cda.common.org.OrganizationNameImpl;
import au.gov.nehta.model.cda.common.person.Person;
import au.gov.nehta.model.cda.common.person.PersonImpl;
import au.gov.nehta.model.cda.common.telecom.TelecomImpl;
import au.gov.nehta.model.cda.common.time.*;
import au.gov.nehta.model.cda.etp.EPrescriptionCdaModel;
import au.gov.nehta.model.clinical.common.*;
import au.gov.nehta.model.clinical.common.participation.*;
import au.gov.nehta.model.clinical.common.types.HPII;
import au.gov.nehta.model.clinical.common.types.HPIO;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;
import au.gov.nehta.model.clinical.etp.common.item.ItemFactory;
import au.gov.nehta.model.clinical.etp.common.item.MedicalBenefitCategoryType;
import au.gov.nehta.model.clinical.etp.common.item.PrescriptionItemIdentifier;
import au.gov.nehta.model.clinical.etp.common.participation.EntitlementType;
import au.gov.nehta.model.clinical.etp.common.participation.*;
import au.gov.nehta.model.clinical.etp.eprescription.*;
import au.gov.nehta.model.schematron.SchematronValidationException;
import org.junit.Ignore;
import org.junit.Test;
import org.w3c.dom.Document;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

import static au.gov.nehta.model.schematron.SchematronResource.SchematronResources.E_PRESCRIPTION_3B;

public class EPrescriptionMinTest extends Base {

    private static final String SCHEMATRON = E_PRESCRIPTION_3B.resource().getSchematron();
    private static String SCHEMATRON_TEMPLATE_PATH = "src/test/resources/ePrescription";
    private static final String DOCUMENT_FILE_NAME = "src/test/resources/eprescription/eprescription-min.xml";

    @Test
    @Ignore
    public void test_MIN_PrescriptionRequestCreation()
            throws ParserConfigurationException, JAXBException, SchematronValidationException, IOException {
        if (!new File(SCHEMATRON_TEMPLATE_PATH + "/schematron/schematron-Validator-report.xsl")
                .exists()) {
            SCHEMATRON_TEMPLATE_PATH = "src/" + SCHEMATRON_TEMPLATE_PATH;
        }
        generateMin();
//        SchematronCheckResult check = Schematron
//                .check(SCHEMATRON_TEMPLATE_PATH, SCHEMATRON, DOCUMENT_FILE_NAME);
//
//        show(check);
//
//        Assert.assertEquals(0, check.schemaErrors.size());
//        Assert.assertEquals(0, check.schematronErrors.size());
    }


    public void generateMin() throws IOException, ParserConfigurationException, JAXBException, SchematronValidationException {
        // Setup context

        //***************************
        //***** Subject Of Care *****
        //***************************

        // IHI subjectIHI = new IHI( "8003600300001283" );
//        MedicareCardIdentifier mcCard = new MedicareCardIdentifier( "132456789" );

        String subjectFamilyName = "Harding";

        ZonedDateTime dob = LocalDate.of(1982, 11, 28).atStartOfDay(ZoneId.systemDefault());

        AustralianAddress subjectFullAddress = new AustralianAddressImpl();
        subjectFullAddress.addUnstructuredAddressLine("Unit 1234 / 10 MadeUp Lane");
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
        SubjectOfCareDemographicData subjectDemographicData = new SubjectOfCareDemographicDataImpl(Sex.MALE, subjectDOB);

        subjectDemographicData.setIndigenousStatus(IndigenousStatus.NOT_STATED_OR_INADEQUATELY_DESCRIBED);

        SubjectOfCarePerson subjectOfCarePerson = new SubjectOfCarePersonImpl(subjectPersonName, subjectDemographicData);
        SubjectOfCareParticipant subjectParticipant = new SubjectOfCareParticipantImpl(
                new ArrayList<>(), // patient identifiers are optional here, so we send an empty list
                subjectOfCareAddress, subjectOfCarePerson);

        AsEntityIdentifier subjectEntitlementNumber = new MedicareCardIdentifier("1234567819");

        Entitlement subjectEntitlement = new EntitlementImpl(subjectEntitlementNumber, EntitlementType.MEDICARE_BENEFITS);

        ZonedDateTime now = ZonedDateTime.now();
        subjectEntitlement.setEntitlementValidityDuration(
                RestrictedTimeInterval.getLowWidthInstance(
                        // From today (day only precision) for two weeks
                        new PrecisionDate(Precision.DAY, now),
                        new TimeQuantity(2, TimeUnitOfMeasure.WEEK))
        );

        List<Entitlement> subjectOfCareEntitlementList = new ArrayList<>();
        subjectOfCareEntitlementList.add(subjectEntitlement);
        subjectParticipant.setEntitlements(subjectOfCareEntitlementList);

        //************************
        //*****   Prescriber *****
        //************************
        HPII prescriberHPII = new HPII("8003610000001145");
        String prescriberFamilyName = "Duncan";

        PersonName prescriberPersonName = new PersonNameImpl(prescriberFamilyName);

        Occupation prescriberOccupation = new OccupationImpl(ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER);
        ProviderEmploymentDetail prescriberEmploymentDetail = new ProviderEmploymentDetailImpl(prescriberOccupation);
        ProviderPerson prescriberPerson = new ProviderPersonImpl(prescriberPersonName);
        prescriberPerson.setEmploymentDetail(prescriberEmploymentDetail);

        DefaultParticipant prescriberParticipant = new DefaultParticipantImpl(prescriberHPII, prescriberPerson);
        prescriberParticipant.setQualifications("MD");

        AsEntityIdentifier prescriberNumber = new AsEntityIdentifierImpl("1.22.333.4444.55555", "12345678");

        Entitlement prescriberEntitlement = new EntitlementImpl(prescriberNumber, EntitlementType.MEDICARE_PRESCRIBER_NUMBER);
        prescriberEntitlement.setEntitlementValidityDuration(
                RestrictedTimeInterval.getLowInstance(
                        // From today (day only precision)
                        new PrecisionDate(Precision.DAY, now))
        );

        prescriberParticipant.addEntitlement(prescriberEntitlement);

        Role prescriberRole = new RoleImpl(ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER);

        PrescriberParticipation prescriberParticipation = new PrescriberParticipationImpl(prescriberRole, prescriberParticipant);

        //***********************************
        //***** Prescriber Organisation *****
        //***********************************

        HPIO prescriberHPIO = new HPIO("8003621231167886");
        String organisationName = "GP Australia";

        AustralianAddress fullAddress = new AustralianAddressImpl();
        fullAddress.addUnstructuredAddressLine("Level 1, 10 Browning street");
        fullAddress.setCity("West End");
        fullAddress.setState(AustralianStateTerritory.QUEENSLAND.getAbbreviation());
        fullAddress.setPostcode("4101");
        ProviderAddress prescriberOrganisationAddress = new ProviderAddressImpl(false, fullAddress, AddressPurpose.BUSINESS);

        Organisation prescriberOrganisation = new OrganisationImpl(organisationName);
        PrescriberOrganisationParticipant prescriberOrganisationParticipant =
                new PrescriberOrganisationParticipantImpl(prescriberHPIO,
                        prescriberOrganisationAddress,
                        Collections.singletonList(new TelecomImpl("0712345678")),
                        prescriberOrganisation);

        Role prescriberOrganisationRole = new RoleImpl(ANZSCO_1ED_2006.ZOOLOGIST);

        PrescriberOrganisationParticipation prescriberOrganisationParticipation =
                new PrescriberOrganisationParticipationImpl(
                        prescriberOrganisationRole,
                        prescriberOrganisationParticipant);

        EPrescriptionContext ePrescriptionContext = new EPrescriptionContextImpl(subjectParticipant, prescriberParticipation, prescriberOrganisationParticipation);

        // Setup content

        // Creation time must match close the gap for ctg check digit
        // target time = 200910201235+1000
        ZonedDateTime creationTime = ZonedDateTime.of(2009, 10, 20, 12, 35, 0, 0, ZoneId.systemDefault());

        ZonedDateTime expiryTime = now;

        String prescriptionIdentifierCode = "AA=SV3Cg3FNwYyD#xE";
        // boolean isAllowBrandSubstitution = true;
        Integer repeats = 3;
        
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

        // max dose = 4 tablets/24hours
        String instructionsForUse = "Take one and call me in the morning";

        TimeQuantity intervalBetweenRepeats = new TimeQuantity(3, TimeUnitOfMeasure.WEEK);
        intervalBetweenRepeats.setNarrative("3 weeks"); // a text description of this time quantity


        PrescriptionItemIdentifier prescriptionItemIdentifier = ItemFactory.createPrescriptionItemIdentifier(prescriptionIdentifierCode);

        // therapeuticGoodIdentification
        Code amt = new AMTv3Code("23641011000036102", "paracetamol 500 mg + codeine phosphate 30 mg tablet");
        amt.setOriginalText("SOME PBS/RPBSItemCode");


        PrescriptionItemBuilder builder = new PrescriptionItemBuilder();

        //can chain items on the builder
        builder.dateTimeWritten(creationTime)
                .dateTimeExpires(expiryTime)
                .pbsRPBSItemCode(amt)
                .prescriptionItemIdentifier(prescriptionItemIdentifier)
                .maximumNumberOfRepeats(repeats)
                .medicalBenefitCategoryType(MedicalBenefitCategoryType.PBS)
                .groundsForConcurrentSupply(GroundsForConcurrentSupply.PURSUANT_TO_REGULATION_24)
                .pbsType(new PBSPrescriptionTypeCode(PBSPrescriptionType.EMERGENCY_TREATMENT_SUPPLY))
                .directions(instructionsForUse)
                .closeTheGap(uuidRoot("CTG06X")) // check digit 'X' must match creation time
                .maximumNumberOfRepeats(repeats)
                .brandSubstituteAllowed(Boolean.TRUE)
        ;

        PrescriptionItem prescriptionItem = builder.build();

        EPrescriptionContent ePrescriptionContent = new EPrescriptionContentImpl(prescriptionItem);

        // Create Clinical Model Prescription
        EPrescription ePrescription = new EPrescriptionImpl(ePrescriptionContext, ePrescriptionContent);

        String prescriptionDocumentID = UUID.randomUUID().toString();

        List<PersonName> legalAuthenticatorsNames = new ArrayList<>(1);

        legalAuthenticatorsNames.add(new PersonNameImpl("Black"));

        //*******************************
        //***** Legal Authenticator *****
        //*******************************

        HPII authenticatorHPII = new HPII("8003610000001145");
        authenticatorHPII.setCode(null); // you wouldn't really do this, just for testing minimum fields.
        Person legalAuthenticatorPerson = PersonImpl.getInstance(authenticatorHPII, legalAuthenticatorsNames);

        HPIO authenticatorHPIO = new HPIO("8003621231167886");

        Organization legalAuthenticatorOrganisation =
                OrganizationImpl.getInstance(authenticatorHPIO);

        AssignedEntity cdaLegalAuthenticatorAssignedEntity =
                AssignedEntityImpl.getInstance(prescriptionDocumentID, legalAuthenticatorPerson, legalAuthenticatorOrganisation);

        Coded orgCode = ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER;
        cdaLegalAuthenticatorAssignedEntity.setCode(orgCode);

        LegalAuthenticator cdaLegalAuthenticator = LegalAuthenticatorImpl.getInstance(now, cdaLegalAuthenticatorAssignedEntity);

        //*********************
        //***** Custodian *****
        //*********************

        AsEntityIdentifier custodianIdentifier = new HPIO("8003621231167886");

        UniqueIdentifier typedPrescriptionDocumentID = new UniqueIdentifierImpl(prescriptionDocumentID);
        CustodianOrganization custodianOrganization =
                CustodianOrganizationImpl.getInstance(Collections.singletonList(typedPrescriptionDocumentID),
                        custodianIdentifier);

        OrganizationName custodianOrganizationName = OrganizationNameImpl.getInstance();
        custodianOrganization.setName(custodianOrganizationName);

        AssignedCustodian cdaAssignedCustodian = AssignedCustodianImpl.getInstance(custodianOrganization);
        Custodian cdaCustodian = CustodianImpl.getInstance(cdaAssignedCustodian);

        BaseClinicalDocument cdaClinicalDocument = ClinicalDocumentFactory.getEPrescription();
        cdaClinicalDocument.setLanguageCode("en-AU");
        cdaClinicalDocument.setVersionNumber(1);

        // As an example we can add another template if needed.
        cdaClinicalDocument.addTemplateId(TemplateIdImpl.getInstance("1.0", "1.2.36.1.2001.1001.100.149"));

        // prescriptionIdentifier
        // String prescriptionDocumentId = "2.25.36901752580752676809846395044082807160"; //must be an OID to pass into PCEHR

        // You can also use the conversion tool
        String documentUUID = UUID.randomUUID().toString();
        String prescriptionDocumentId = UUIDTool.uuidToOid(documentUUID);

        cdaClinicalDocument.setClinicalDocumentId(prescriptionDocumentId);

        EPrescriptionCdaModel ePrescriptionCdaModel = new EPrescriptionCdaModel(cdaClinicalDocument, cdaLegalAuthenticator, cdaCustodian, creationTime);

        EPrescriptionCreator ePrescriptionCreator = new EPrescriptionCreator(ePrescriptionCdaModel, ePrescription);

        Document clinicalDocument = null;
        // disabled
        //    clinicalDocument = ePrescriptionCreator.create();

        String cdaString = TestHelper.documentToXML(clinicalDocument);
        TestHelper.printToFile(cdaString, DOCUMENT_FILE_NAME);
        System.out.println(cdaString);
    }
}
