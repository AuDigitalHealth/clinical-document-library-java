package au.gov.nehta.cda.shs;

import au.gov.nehta.builder.shs.SharedHealthSummaryCreator;
import au.gov.nehta.builder.util.UUIDTool;
import au.gov.nehta.cda.test.Base;
import au.gov.nehta.cda.test.TestHelper;
import au.gov.nehta.model.cda.common.address.PostalAddress;
import au.gov.nehta.model.cda.common.address.PostalAddressImpl;
import au.gov.nehta.model.cda.common.address.PostalAddressUseEnum;
import au.gov.nehta.model.cda.common.code.*;
import au.gov.nehta.model.cda.common.custodian.Custodian;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocumentFactory;
import au.gov.nehta.model.cda.common.id.*;
import au.gov.nehta.model.cda.common.org.Organization;
import au.gov.nehta.model.cda.common.org.OrganizationImpl;
import au.gov.nehta.model.cda.common.person.Person;
import au.gov.nehta.model.cda.common.person.PersonImpl;
import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.cda.common.telecom.TelecomImpl;
import au.gov.nehta.model.cda.common.telecom.TelecomMedium;
import au.gov.nehta.model.cda.common.telecom.TelecomUse;
import au.gov.nehta.model.cda.common.time.*;
import au.gov.nehta.model.cda.shs.SharedHealthSummaryCDAModel;
import au.gov.nehta.model.clinical.common.*;
import au.gov.nehta.model.clinical.common.participation.*;
import au.gov.nehta.model.clinical.common.types.AdverseReaction;
import au.gov.nehta.model.clinical.common.types.AdverseReactionImpl;
import au.gov.nehta.model.clinical.common.types.*;
import au.gov.nehta.model.clinical.diagnostic.pathology.ExtendedEmploymentOrganisationImpl;
import au.gov.nehta.model.clinical.etp.common.participation.AddressContext;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;
import au.gov.nehta.model.clinical.etp.common.participation.EntitlementImpl;
import au.gov.nehta.model.clinical.etp.common.participation.EntitlementType;
import au.gov.nehta.model.clinical.shs.MedicalHistory;
import au.gov.nehta.model.clinical.shs.*;
import org.junit.Assert;
import org.junit.Test;
import org.w3c.dom.Document;

import java.io.File;
import java.time.*;
import java.util.*;

import static au.gov.nehta.cda.test.TestHelper.*;
import static au.gov.nehta.model.schematron.SchematronResource.SchematronResources.SHARED_HEALTH_SUMMARY_3B;

public class SharedHealthSummaryMaxTest extends Base {

    private static final String SCHEMATRON = SHARED_HEALTH_SUMMARY_3B.resource().getSchematron();
    private static String SCHEMATRON_TEMPLATE_PATH = "src/test/resources/SharedHealthSummary";

    private static final String DOCUMENT_FILE_NAME = "src/test/resources/generated_xml/shared_health_summary/shs-max-java.xml";
    private static final String MAX_EXCLUDED_DOCUMENT_FILE_NAME = "src/test/resources/generated_xml/shared_health_summary/shs-max-excluded-java.xml";

    @Test
    public void test_MAX_shsCreation() throws Exception {
        if (!new File(SCHEMATRON_TEMPLATE_PATH
                + "/schematron/schematron-Validator-report.xsl").exists()) {
            SCHEMATRON_TEMPLATE_PATH = "src/" + SCHEMATRON_TEMPLATE_PATH;
        }
        generateMax();
//        SchematronCheckResult check =
//                Schematron.check(SCHEMATRON_TEMPLATE_PATH, SCHEMATRON, DOCUMENT_FILE_NAME);
//
//        show(check);
//
//        Assert.assertEquals(0, check.schemaErrors.size());
//        Assert.assertEquals(0, check.schematronErrors.size());
        File f = new File(DOCUMENT_FILE_NAME);
        Assert.assertTrue(f.exists());
        Assert.assertTrue(f.length() > 0L);
    }

    @Test
    public void test_MAX_excludedall_shsCreation() throws Exception {
        if (!new File(SCHEMATRON_TEMPLATE_PATH
                + "/schematron/schematron-Validator-report.xsl").exists()) {
            SCHEMATRON_TEMPLATE_PATH = "src/" + SCHEMATRON_TEMPLATE_PATH;
        }
        if (!new File(DOCUMENT_FILE_NAME).exists()) {
            generateMax();
        }
        generateMaxExcluded();

//        SchematronCheckResult check =
//                Schematron.check(SCHEMATRON_TEMPLATE_PATH, SCHEMATRON, DOCUMENT_FILE_NAME);
//
//        show(check);
//
//        Assert.assertEquals(0, check.schemaErrors.size());
//        Assert.assertEquals(0, check.schematronErrors.size());
        File f = new File(DOCUMENT_FILE_NAME);
        Assert.assertTrue(f.exists());
        Assert.assertTrue(f.length() > 0L);
    }

    // Test the exclusion statements
    private void generateMaxExcluded() throws Exception {
        ZonedDateTime now = ZonedDateTime.now();

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

        AsEntityIdentifier authenticatorHPII = new HPII("8003610000001145");
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
                OrganizationImpl.getInstance(authenticatorHPIO, "GP Clinic");

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
        cdaLegalAuthenticatorAssignedEntity.setCode(
                new ANZSCO_1ED_2006_CD("253511", "Surgeon (General)"));

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
                        TelecomMedium.EMAIL, "example@sample.com", TelecomUse.BUSINESS_AND_PERSONAL);
        cdaLegalAuthenticatorAssignedEntity.setTelecom(Collections.singletonList(authenticatorEmail));

        LegalAuthenticator cdaLegalAuthenticator =
                LegalAuthenticatorImpl.getInstance(now, cdaLegalAuthenticatorAssignedEntity);

        // *********************
        // ***** Custodian *****
        // *********************

        Custodian cdaCustodian = getCustodian();

        // ***************************
        // ***** Subject Of Care *****
        // ***************************

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

        AddressContext subjectOfCareAddress =
                new AddressContextImpl(subjectFullAddress, AddressPurpose.RESIDENTIAL_PERMANENT);
        PersonName subjectPersonName = new PersonNameImpl(subjectFamilyName);
        subjectPersonName.addNameTitle(NameTitle.MISTER.getDescriptor());
        subjectPersonName.addNameSuffix(NameSuffix.JUNIOR.getDescriptor());
        subjectPersonName.addGivenName("Frank");
        subjectPersonName.addPersonNameUsage(PersonNameUsage.MAIDEN_NAME_OR_NAME_AT_BIRTH);

        DateAccuracy dobAccuracy = new DateAccuracyImpl(true, true, true);
        DateOfBirthDetail subjectDOB = new DateOfBirthDetailImpl(dob, dobAccuracy);
        subjectDOB.setDateOfBirthAccuracyIndicator(dobAccuracy);
        subjectDOB.setDateOfBirthIsCalculatedFromAge(true);
        ExtendedDemographicDataImpl subjectDemographicData =
                new ExtendedDemographicDataImpl(Sex.MALE, subjectDOB);
        subjectDemographicData.setBirthPlurality(5);
        subjectDemographicData.setBirthOrder(2);
        int socAge = 35;
        subjectDemographicData.setAgeInYears(socAge);
        subjectDemographicData.setAgeAccurate(true);
        DateOfDeath dod =
                new DateOfDeathImpl(
                        now,
                        new DateAccuracyImpl(false, false, true),
                        SourceOfDeathNotificationCode.HEALTH_CARE_PROVIDER);
        subjectDemographicData.setDateOfDeath(dod);
        subjectDemographicData.setMothersOriginalFamilyName("Tester");
        subjectDemographicData.setIndigenousStatus(
                IndigenousStatus.NOT_STATED_OR_INADEQUATELY_DESCRIBED);

        SubjectOfCarePerson subjectOfCarePerson =
                new SubjectOfCarePersonImpl(subjectPersonName, subjectDemographicData);
        SubjectOfCareParticipant subjectParticipant =
                new SubjectOfCareParticipantImpl(
                        Arrays.asList(subjectIHI, mcCard), subjectOfCareAddress, subjectOfCarePerson);

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

        subjectEntitlement.setEntitlementValidityDuration(
                RestrictedTimeInterval.getLowWidthInstance(
                        // from today(day only precision) for two weeks
                        new PrecisionDate(Precision.DAY, ZonedDateTime.now()),
                        new TimeQuantity(2, TimeUnitOfMeasure.WEEK)));

        List<Entitlement> subjectOfCareEntitlementList = new ArrayList<>();
        subjectOfCareEntitlementList.add(subjectEntitlement);
        subjectParticipant.setEntitlements(subjectOfCareEntitlementList);

        // ******************
        // ***** AUTHOR *****
        // ******************

        Coded occupation = ANZSCO_1ED_2006.SURGEON_GENERAL;

        AsEntityIdentifier authorHPII = new HPII("8003610000001145");

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
        authorStreetAddress2.addUnstructuredAddressLine("2 George Street");
        authorStreetAddress2.setPostcode("4002");
        authorStreetAddress2.setCity("Brisbane");
        authorStreetAddress2.setState("QLD");
        AddressContext authorAddress2 =
                new AddressContextImpl(authorStreetAddress2, AddressPurpose.BUSINESS);

        AddressContext authorAddress3 = AddressContextImpl.noFixedAddress();

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

        SharedHealthSummaryAuthorImpl author =
                new SharedHealthSummaryAuthorImpl(
                        occupation,
                        now,
                        Collections.singletonList(authorHPII),
                        Arrays.asList(authorAddress, authorAddress2, authorAddress3),
                        Arrays.asList(authorTelephone, authorFax),
                        Arrays.asList(authorLegalName, authorAlias),
                        employmentDetails);

        AsEntityIdentifier authorEntitlementNumber1 = new MedicarePrescriberNumber("9919123A");
        Entitlement authorEntitlement1 =
                new EntitlementImpl(authorEntitlementNumber1,
                        EntitlementType.MEDICARE_PRESCRIBER_NUMBER);
        authorEntitlement1.setEntitlementValidityDuration(
                RestrictedTimeInterval.getLowWidthInstance(
                        // From today (day only precision) for two weeks
                        new PrecisionDate(Precision.DAY, ZonedDateTime.now()),
                        new TimeQuantity(2, TimeUnitOfMeasure.WEEK)));

        AsEntityIdentifier authorEntitlementNumber2 = new MedicarePrescriberNumber("2919123A");
        Entitlement authorEntitlement2 =
                new EntitlementImpl(
                        authorEntitlementNumber2, EntitlementType.MEDICARE_PHARMACY_APPROVAL_NUMBER);

        author.setEntitlements(Arrays.asList(authorEntitlement1, authorEntitlement2));

        // Build the context
        SharedHealthSummaryContext context =
                new SharedHealthSummaryContextImpl(subjectParticipant, author);

        // *********************************
        // ***** CDA Document Content  *****
        // *********************************

        AdverseReactions reactions = AdverseReactionsImpl.noneKnown();

        // Alternative for above
        // AdverseReactions reactions = new AdverseReactionsImpl(NCTISGlobalStatement.NONE_KNOWN);

        Medications meds = MedicationsImpl.noneKnown();

        // Alternative for above
        // Medications meds = new MedicationsImpl(NCTISGlobalStatement.NONE_KNOWN);

        ProblemDiagnoses problems = ProblemDiagnosesImpl.noneKnown();

        // Alternative for above
        // ProblemDiagnoses problems = new ProblemDiagnosesImpl(NCTISGlobalStatement.NONE_KNOWN);

        Procedures procedures = ProceduresImpl.noneKnown();

        // Alternative for above
        // Procedures procedures = new ProceduresImplImpl(NCTISGlobalStatement.NONE_KNOWN);

        MedicalHistory history = new MedicalHistoryImpl(problems, procedures, null);

        // Immunisations
        Immunisations immunisations = ImmunisationsImpl.noneSupplied();

        SharedHealthSummaryContent content =
                new SharedHealthSummaryContentImpl(reactions, meds, history, immunisations);

        // ***********************************
        // ***** Clinical Document Setup *****
        // ***********************************

        ClinicalDocument cdaClinicalDocument = ClinicalDocumentFactory.getSharedHealthSummary();
        cdaClinicalDocument.setLanguageCode("en-AU");
        cdaClinicalDocument.setVersionNumber(1);

        // ClinicalDocumentFactory sets that standard template for a SharedHealthSummary
        // as an example we can add another template if needed.
        cdaClinicalDocument.addTemplateId(
                TemplateIdImpl.getInstance("1.0", "1.2.36.1.2001.1001.100.149"));
        cdaClinicalDocument.setCompletionCode(DocumentStatusCode.FINAL);

        // You can also use the conversion tool to create an OID from a UUID
        String documentUUID = UUID.randomUUID().toString();
        String shsDocumentId = UUIDTool.uuidToOid(documentUUID);

        cdaClinicalDocument.setClinicalDocumentId(shsDocumentId);

        SharedHealthSummaryCDAModel cdaModel =
                new SharedHealthSummaryCDAModel(
                        cdaClinicalDocument, cdaLegalAuthenticator, cdaCustodian, null, now);

        SharedHealthSummary clinicalModel = new SharedHealthSummaryImpl(context, content);
        SharedHealthSummaryCreator shsCreator = new SharedHealthSummaryCreator(cdaModel,
                clinicalModel);
        // shsCreator.useStrict();

        Document clinicalDocument = shsCreator.create();

        String cdaString = TestHelper.documentToXML(clinicalDocument);
        TestHelper.printToFile(cdaString, MAX_EXCLUDED_DOCUMENT_FILE_NAME);
    }

    private void generateMax() throws Exception {
        ZonedDateTime now = ZonedDateTime.now();
        LegalAuthenticator cdaLegalAuthenticator = getLegalAuthenticator(now);
        Custodian cdaCustodian = getCustodian();
        SubjectOfCareParticipant subjectParticipant = getSubjectOfCareParticipant();
        SharedHealthSummaryAuthor author = getSharedHealthSummaryAuthor(now);

        // Build the context
        SharedHealthSummaryContext context =
                new SharedHealthSummaryContextImpl(subjectParticipant, author);

        // ******************************
        // ***** Adverse Reactions  *****
        // ******************************

        Coded substance = new SNOMED_AU_Code("75247008", "Benzathine benzylpenicillin");
        List<? extends Manifestation> manifestations =
                Arrays.asList(
                        new ManifestationImpl(
                                new SNOMED_AU_Code("57054005", "Acute myocardial infarction")),
                        new ManifestationImpl(
                                new SNOMED_AU_Code("241938005", "Penicillin-induced anaphylaxis")),
                        new ManifestationImpl(new SNOMED_AU_Code("95580006", "Renal artery embolism")),
                        new ManifestationImpl(
                                new SNOMED_AU_Code("233927002",
                                        "Cardiac arrest with successful resuscitation")));

        AdverseReaction reaction1 = new AdverseReactionImpl(substance, manifestations);

        AdverseReaction reaction2 =
                new AdverseReactionImpl(
                        new SNOMED_AU_Code("372756006", "Warfarin"),
                        Arrays.asList(
                                new ManifestationImpl(
                                        new SNOMED_AU_Code("72189003", "Haemorrhagic nasal discharge")),
                                new ManifestationImpl(new SNOMED_AU_Code("95347000", "Skin necrosis")),
                                new ManifestationImpl(new SNOMED_AU_Code("84229001", "Fatigue")),
                                new ManifestationImpl(new SNOMED_AU_Code("22253000", "Pain"))));

        AdverseReactions reactions = new AdverseReactionsImpl(Arrays.asList(reaction1, reaction2));

        // *************************
        // *****  Medications  *****
        // *************************

        KnownMedication med1 =
                new KnownMedicationImpl(
                        new AMTv3Code("925344011000036101", "Pemzo 20 mg capsule, 100, bottle"),
                        "Directions",
                        "A reason for ordering the medicine, vaccine or other therapeutic good.",
                        "Any additional information that may be needed to ensure the continuity of supply, rationale for current dose and timing, or safe and appropriate use.");

        KnownMedication med2 =
                new KnownMedicationImpl(
                        new AMTv3Code("925344011000036101", "Pemzo 20 mg capsule, 100, bottle"),
                        "Directions",
                        "A reason for ordering the medicine, vaccine or other therapeutic good.",
                        "Any additional information that may be needed to ensure the continuity of supply, rationale for current dose and timing, or safe and appropriate use.");

        Medications meds = new MedicationsImpl(Arrays.asList(med1, med2));

        // Alternate for the case when there is no medications
        // Medications meds = MedicationsImpl.noneKnown();

        // ******************************
        // *****   Medical History  *****
        // ******************************

        // Problem/diagnoses
        ProblemDiagnosis problem1 =
                new ProblemDiagnosisImpl(
                        new SNOMED_AU_Code("75148009", "Employment problem"), null, null, null);
        ProblemDiagnosis problem2 =
                new ProblemDiagnosisImpl(
                        new SNOMED_AU_Code("65118005", "Marital problems"),
                        new PrecisionDate(Precision.DAY, LocalDate.of(2000, 2, 28).atStartOfDay(ZoneId.systemDefault())),
                        null,
                        null);

        ProblemDiagnosis problem3 =
                new ProblemDiagnosisImpl(
                        new SNOMED_AU_Code("5015009", "Economic problem"),
                        new PrecisionDate(Precision.DAY, LocalDate.of(2000, 2, 28).atStartOfDay(ZoneId.systemDefault())),
                        new PrecisionDate(Precision.DAY, LocalDate.of(2014, 5, 30).atStartOfDay(ZoneId.systemDefault())),
                        null);

        ProblemDiagnosis problem4 =
                new ProblemDiagnosisImpl(
                        new SNOMED_AU_Code("105525002", "Foreign travel problem"),
                        new PrecisionDate(Precision.DAY, LocalDate.of(2014, 5, 30).atStartOfDay(ZoneId.systemDefault())),
                        new PrecisionDate(Precision.DAY, LocalDate.of(2014, 6, 30).atStartOfDay(ZoneId.systemDefault())),
                        "patient took a holiday and the problem was resolved");
        ProblemDiagnoses problems =
                new ProblemDiagnosesImpl(Arrays.asList(problem1, problem2, problem3, problem4));

        // Procedures

        Procedure proc1 =
                new ProcedureImpl(
                        new SNOMED_AU_Code("58715004", "Moving a patient to a stretcher"),
                        PrecisionDate.today(),
                        "Patient was moved to a stretcher");
        Procedure proc2 =
                new ProcedureImpl(
                        new SNOMED_AU_Code("165995007", "Hepatitis A test"),
                        PrecisionDate.today(),
                        "Patient was tested for Hepatitis A");

        Procedure proc3 =
                new ProcedureImpl(
                        new SNOMED_AU_Code("441783000", "Conformal radiotherapy"), PrecisionDate.today(),
                        null);

        Procedures procedures = new ProceduresImpl(Arrays.asList(proc1, proc2, proc3));

        // Uncategorised Medical History Items

        // Create a new time interval with a low and a high
        RestrictedTimeInterval time =
                RestrictedTimeInterval.getLowHighInstance(
                        new PrecisionDate(Precision.DAY, LocalDate.of(2003, 1, 1).atStartOfDay(ZoneId.systemDefault())), PrecisionDate.today());
        // Set the explicit narrative form of this time interval
        time.setNarrative("since 1 Jan 2003, (ongoing)");

        // Create a new time interval with a low and a high
        RestrictedTimeInterval time2 =
                RestrictedTimeInterval.getLowHighInstance(
                        new PrecisionDate(Precision.YEAR, LocalDate.of(2003, 1, 1).atStartOfDay(ZoneId.systemDefault())),
                        new PrecisionDate(Precision.YEAR, LocalDate.of(2013, 1, 1).atStartOfDay(ZoneId.systemDefault())));

        // Create a new time interval with a different time zone
        ZonedDateTime aLocalTime = ZonedDateTime.of(LocalDate.of(2013, 1, 1), LocalTime.of(11, 34), ZoneId.systemDefault());
        ZonedDateTime aUTCTime = aLocalTime.withZoneSameLocal(ZoneOffset.UTC.normalized());

        RestrictedTimeInterval time3 =
                RestrictedTimeInterval.getLowInstance(new PrecisionDate(Precision.MINUTE, aUTCTime));

        UncatagorisedMedicalHistoryItem item1 =
                new UncatagorisedMedicalHistoryItemImpl(
                        "A description of another medical history item",
                        time,
                        "additional comment supporting the description");

        UncatagorisedMedicalHistoryItem item2 =
                new UncatagorisedMedicalHistoryItemImpl("Chronic inability to concentrate", time2,
                        null);

        UncatagorisedMedicalHistoryItem item3 =
                new UncatagorisedMedicalHistoryItemImpl("Lost Appetite", time3, null);

        UncatagorisedMedicalHistoryItem item4 =
                new UncatagorisedMedicalHistoryItemImpl("Vitamin C dietary supplement", null, null);

        MedicalHistory history =
                new MedicalHistoryImpl(problems, procedures, Arrays.asList(item1, item2, item3, item4));

        Immunisation im1 =
                new ImmunisationImpl(
                        new AMTv3Code(
                                "74993011000036102",
                                "measles virus (Schwarz) live attenuated vaccine + mumps virus (Jeryl Lynn, strain RIT 4385) live attenuated vaccine + rubella virus (Wistar RA 27/3) live attenuated vaccine"),
                        new PrecisionDate(Precision.DAY, LocalDate.of(2013, 1, 1).atStartOfDay(ZoneId.systemDefault())), 1);

        Immunisation im2 =
                new ImmunisationImpl(
                        new AMTv3Code(
                                "74993011000036102",
                                "measles virus (Schwarz) live attenuated vaccine + mumps virus (Jeryl Lynn, strain RIT 4385) live attenuated vaccine + rubella virus (Wistar RA 27/3) live attenuated vaccine"),
                        new PrecisionDate(Precision.DAY, LocalDate.of(2013, 6, 1).atStartOfDay(ZoneId.systemDefault())),
                        null);

        Immunisations immunisations = new ImmunisationsImpl(Arrays.asList(im1, im2));

        SharedHealthSummaryContent content =
                new SharedHealthSummaryContentImpl(reactions, meds, history, immunisations);

        // ***********************************
        // ***** Clinical Document Setup *****
        // ***********************************

        ClinicalDocument cdaClinicalDocument = ClinicalDocumentFactory.getSharedHealthSummary();
        cdaClinicalDocument.setLanguageCode("en-AU");
        cdaClinicalDocument.setVersionNumber(1);

        // ClinicalDocumentFactory sets that standard template for a SharedHealthSummary
        // as an example we can add another template if needed.
        cdaClinicalDocument.addTemplateId(
                TemplateIdImpl.getInstance("1.0", "1.2.36.1.2001.1001.100.149"));
        cdaClinicalDocument.setCompletionCode(DocumentStatusCode.FINAL);

        // You can also use the conversion tool to create an OID from a UUID
        String documentUUID = UUID.randomUUID().toString();
        String documentIdAsAnOid = UUIDTool.uuidToOid(documentUUID);

        cdaClinicalDocument.setClinicalDocumentId(documentIdAsAnOid);

        SharedHealthSummaryCDAModel cdaModel =
                new SharedHealthSummaryCDAModel(
                        cdaClinicalDocument, cdaLegalAuthenticator, cdaCustodian, null, now);

        SharedHealthSummary clinicalModel = new SharedHealthSummaryImpl(context, content);
        SharedHealthSummaryCreator shsCreator = new SharedHealthSummaryCreator(cdaModel,
                clinicalModel);
        // shsCreator.useStrict();

        Document clinicalDocument = shsCreator.create();

        // Add the generic stylesheet XML directive.
        // CCA does not like this for production
        // but it's useful to debug the narrative
        // shsCreator.addStyleSheet(clinicalDocument);

        String cdaString = TestHelper.documentToXML(clinicalDocument);
        TestHelper.printToFile(cdaString, DOCUMENT_FILE_NAME);
    }
}
