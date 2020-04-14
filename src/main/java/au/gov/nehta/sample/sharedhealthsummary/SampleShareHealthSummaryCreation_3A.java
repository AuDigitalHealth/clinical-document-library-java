package au.gov.nehta.sample.sharedhealthsummary;

import au.gov.nehta.builder.shs.SharedHealthSummaryCreator;
import au.gov.nehta.builder.util.UUIDTool;
import au.gov.nehta.model.cda.common.address.PostalAddress;
import au.gov.nehta.model.cda.common.address.PostalAddressImpl;
import au.gov.nehta.model.cda.common.address.PostalAddressUseEnum;
import au.gov.nehta.model.cda.common.code.*;
import au.gov.nehta.model.cda.common.custodian.*;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocumentFactory;
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
import org.joda.time.DateTime;
import org.joda.time.LocalDate;
import org.w3c.dom.Document;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

/**
 * This sample class shows usage of the SharedHealthSummary CDA Document creator to
 * produce a 3A level SharedHealthSummary document.
 */
public class SampleShareHealthSummaryCreation_3A {
    public static void main(String[] args) throws Exception {
        DateTime now = new DateTime();

        // *******************************
        // ***** Legal Authenticator *****
        // *******************************

        List<PersonName> legalAuthenticatorsNames = new ArrayList<PersonName>(2);

        legalAuthenticatorsNames.add(PersonNameImpl.getInstance("Black", "Jane", NameTitle.MRS.getDescriptor(), NameSuffix.JUNIOR.getDescriptor(), PersonNameUsage.REGISTERED_NAME_OR_LEGAL_NAME));
        legalAuthenticatorsNames.add(PersonNameImpl.getInstance("Alias", "other", NameTitle.MISS.getDescriptor(), PersonNameUsage.MAIDEN_NAME_OR_NAME_AT_BIRTH));

        HPII authenticatorHPII = new HPII("8003610000001145");
        Person legalAuthenticatorPerson = PersonImpl.getInstance(authenticatorHPII, legalAuthenticatorsNames);

        // This is an alternate way of doing a HPIO, HPII or other identifier
        // AsEntityIdentifier hpioTheHardWay =
        // AsEntityIdentifierImpl.getInstance(
        // "1.2.36.1.2001.1003.0.800362555555" );
        // hpioTheHardWay.setAssigningAuthorityName( "HPI-O" );
        // hpioTheHardWay.setAssigningGeographicAreaName( "National Identifier"
        // );

        HPIO authenticatorHPIO = new HPIO("8003621231167886");

        Organization legalAuthenticatorOrganisation = OrganizationImpl.getInstance(authenticatorHPIO, "Pathology Lab Name");


        String legalAuthenticatorID = UUID.randomUUID().toString();
        AssignedEntity cdaLegalAuthenticatorAssignedEntity = AssignedEntityImpl.getInstance(legalAuthenticatorID, legalAuthenticatorPerson, legalAuthenticatorOrganisation);

        // You can also create a code the hard way...
        Code cdaLegalAuthenticatorAssignedEntityCode = new CodeImpl("253111");
        cdaLegalAuthenticatorAssignedEntityCode.setCodeSystem("2.16.840.1.113883.13.62");
        cdaLegalAuthenticatorAssignedEntityCode.setCodeSystemName("1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, 2006");
        cdaLegalAuthenticatorAssignedEntityCode.setDisplayName("General Medical Practitioner");

        // ...or use a pre-baked version
        cdaLegalAuthenticatorAssignedEntity.setCode(ANZSCO_1ED_2006.SURGEON_GENERAL);

        AustralianAddress authenticatorAddress = new AustralianAddressImpl();
        authenticatorAddress.addUnstructuredAddressLine("101 Browning Street");
        authenticatorAddress.setState("QLD");
        authenticatorAddress.setPostcode("4101");
        authenticatorAddress.setCity("Brisbane");
        PostalAddress authenticatorPostalAddress = new PostalAddressImpl(authenticatorAddress, PostalAddressUseEnum.WORKPLACE);

        cdaLegalAuthenticatorAssignedEntity.setAddress(Arrays.asList(authenticatorPostalAddress));

        Telecom authenticatorEmail = new TelecomImpl(TelecomMedium.EMAIL, "example@sample.com", TelecomUse.BUSINESS_AND_PERSONAL);
        cdaLegalAuthenticatorAssignedEntity.setTelecom(Arrays.asList(authenticatorEmail));

        LegalAuthenticator cdaLegalAuthenticator = LegalAuthenticatorImpl.getInstance(now, cdaLegalAuthenticatorAssignedEntity);


        // *********************
        // ***** Custodian *****
        // *********************

        AsEntityIdentifier custodianIdentifier = new HPIO("8003621231167886");
        Telecom contact = new TelecomImpl(TelecomMedium.EMAIL, "example@custodian.com.au", TelecomUse.BUSINESS);

        AustralianAddress custodianAddress = new AustralianAddressImpl();
        custodianAddress.addUnstructuredAddressLine("99 Clinician Street");
        custodianAddress.setCity("Nehtaville");
        custodianAddress.setState("QLD");
        custodianAddress.setPostcode("5555");
        custodianAddress.setAdditionalLocator("32568931");


        String documentID = "1.1.1.123456";
        UniqueIdentifier typedDocumentID = new UniqueIdentifierImpl(documentID);

        // you can also use additional identifiers
        UniqueIdentifier otherId = new UniqueIdentifierImpl(UUID.randomUUID().toString());
        CustodianOrganization custodianOrganization = CustodianOrganizationImpl.getInstance(Arrays.asList(typedDocumentID, otherId), custodianIdentifier);

        OrganizationName custodianOrganizationName = new OrganizationNameImpl("Custodian organisation");

        custodianOrganization.setName(custodianOrganizationName);
        custodianOrganization.setTelecom(contact);
        custodianOrganization.setAddress(new PostalAddressImpl(custodianAddress, PostalAddressUseEnum.POSTAL_ADDRESS));

        AssignedCustodian assignedCustodian = AssignedCustodianImpl.getInstance(custodianOrganization);
        Custodian cdaCustodian = CustodianImpl.getInstance(assignedCustodian);


        //***************************
        //***** Subject Of Care *****
        //***************************

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
                        //from today(day only precision) for two weeks
                        new PrecisionDate(Precision.DAY, new DateTime()),
                        new TimeQuantity(2, TimeUnitOfMeasure.WEEK))
        );


        List<Entitlement> subjectOfCareEntitlementList = new ArrayList<Entitlement>();
        subjectOfCareEntitlementList.add(subjectEntitlement);
        subjectParticipant.setEntitlements(subjectOfCareEntitlementList);


        //****************** 
        //***** AUTHOR *****
        //******************


        Coded occupation = ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER;

        AsEntityIdentifier authorHPII = new HPII("8003610000001145");
        //AsEntityIdentifier prescriberNumber = new MedicarePrescriberNumber("1234567A");

        PersonName authorLegalName = PersonNameImpl.getInstance("Smith", "Sarah", "Dr", "III", PersonNameUsage.REGISTERED_NAME_OR_LEGAL_NAME);
        PersonName authorAlias = PersonNameImpl.getInstance("Jones", "Sarah", PersonNameUsage.MAIDEN_NAME_OR_NAME_AT_BIRTH);


        AustralianAddress authorStreetAddress1 = new AustralianAddressImpl();
        authorStreetAddress1.addUnstructuredAddressLine("The Public");
        authorStreetAddress1.addUnstructuredAddressLine("400 George Street");
        authorStreetAddress1.setPostcode("4000");
        authorStreetAddress1.setCity("Brisbane");
        authorStreetAddress1.setState("QLD");
        AddressContext authorAddress1 = new AddressContextImpl(authorStreetAddress1, AddressPurpose.BUSINESS);

        AustralianAddress authorStreetAddress2 = new AustralianAddressImpl();
        authorStreetAddress2.addUnstructuredAddressLine("Level 31");
        authorStreetAddress2.addUnstructuredAddressLine("400 Pitt Street");
        authorStreetAddress2.setPostcode("2000");
        authorStreetAddress2.setCity("Syndey");
        authorStreetAddress2.setState("QLD");
        AddressContext authorAddress2 = new AddressContextImpl(authorStreetAddress2, AddressPurpose.BUSINESS);

        //a second address for the organisation
        AustralianAddress authorOrgStreetAddress = new AustralianAddressImpl();
        authorOrgStreetAddress.addUnstructuredAddressLine("Author Organisation Address");
        authorOrgStreetAddress.addUnstructuredAddressLine("400 Pitt Street");
        authorOrgStreetAddress.setPostcode("2000");
        authorOrgStreetAddress.setCity("Syndey");
        authorOrgStreetAddress.setState("QLD");
        AddressContext authorOrgAddress = new AddressContextImpl(authorOrgStreetAddress, AddressPurpose.BUSINESS);


        Telecom authorTelephone =
                new TelecomImpl(
                        TelecomMedium.TELEPHONE,
                        "0712345678",
                        TelecomUse.BUSINESS);

        Telecom authorFax =
                new TelecomImpl(
                        TelecomMedium.FAX,
                        "0712345678",
                        TelecomUse.BUSINESS);


        Telecom authorOrgTelephone =
                new TelecomImpl(
                        TelecomMedium.TELEPHONE,
                        "0212345678",
                        TelecomUse.BUSINESS);

        Telecom authorOrgFax =
                new TelecomImpl(
                        TelecomMedium.TELEPHONE,
                        "0212345678",
                        TelecomUse.BUSINESS);


        HPIO authorHPIO = new HPIO("8003621231167886");
        ExtendedEmploymentOrganisationImpl employmentDetails = new ExtendedEmploymentOrganisationImpl(
                Arrays.asList(authorHPIO), Arrays.asList(authorOrgAddress), Arrays.asList(authorOrgTelephone, authorOrgFax), "Sarahs Clinic");


        employmentDetails.setOrganisationNameUsage(OrganisationNameUsage.BUSINESS_NAME);
        employmentDetails.setEmploymentType(CodeImpl.fromOriginalText("Permanent/Full Time"));
        employmentDetails.setDepartmentUnit("Front Office");
        employmentDetails.setPositionInOrganisation(CodeImpl.fromOriginalText("Staff Doctor"));
        employmentDetails.setOccupation(ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER);


        SharedHealthSummaryAuthor author = new SharedHealthSummaryAuthorImpl(
                occupation,
                now,
                Arrays.asList(authorHPII),
                Arrays.asList(authorAddress2, authorAddress1),
                Arrays.asList(authorTelephone, authorFax),
                Arrays.asList(authorLegalName, authorAlias),
                employmentDetails
        );


        //build the context
        SharedHealthSummaryContext context = new SharedHealthSummaryContextImpl(subjectParticipant, author);


        // ******************************
        // ***** Adverse Reactions  *****
        // ******************************

        Coded substance = new SNOMED_AU_Code("75247008", "Penicillin G benzathine");
        List<? extends Manifestation> manifestations = Arrays.asList(
                new ManifestationImpl(new SNOMED_AU_Code("57054005", "Acute myocardial infarction")),
                new ManifestationImpl(new SNOMED_AU_Code("241938005", "Penicillin-induced anaphylaxis")),
                new ManifestationImpl(new SNOMED_AU_Code("95580006", "Renal artery embolism")),
                new ManifestationImpl(new SNOMED_AU_Code("233927002", "Cardiac arrest with successful resuscitation"))
        );


        AdverseReaction reaction1 = new AdverseReactionImpl(substance, manifestations);


        AdverseReaction reaction2 = new AdverseReactionImpl(
                new SNOMED_AU_Code("372756006", "Warfarin"),
                Arrays.asList(
                        new ManifestationImpl(new SNOMED_AU_Code("72189003", "Hemorrhagic nasal discharge")),
                        new ManifestationImpl(new SNOMED_AU_Code("95347000", "Skin necrosis")),
                        new ManifestationImpl(new SNOMED_AU_Code("84229001", "Fatigue")),
                        new ManifestationImpl(new SNOMED_AU_Code("22253000", "Pain"))));


        AdverseReactions reactions = new AdverseReactionsImpl(Arrays.asList(reaction1, reaction2));


        // *************************
        // *****  Medications  *****
        // *************************

        KnownMedication med1 = new KnownMedicationImpl(
                new AMTCode("999999009", "Test Medication only, not real"),
                "Directions",
                "A reason for ordering the medicine, vaccine or othertherapeutic good.",
                "Any additional information that may be needed to ensure the continuity of supply, rationale for current dose and timing, or safe and appropriate use.");


        KnownMedication med2 = new KnownMedicationImpl(
                new AMTCode("999999009", "Test Medication only, not real"),
                "Directions",
                "A reason for ordering the medicine, vaccine or othertherapeutic good.",
                "Any additional information that may be needed to ensure the continuity of supply, rationale for current dose and timing, or safe and appropriate use.");


        Medications meds = new MedicationsImpl(Arrays.asList(med1, med2));

        //alternate for the case when there is no medications
        //Medications meds = MedicationsImpl.noneKnown();


        // ******************************
        // *****   Medical History  *****
        // ******************************


        //problem/diagnoses
        ProblemDiagnosis problem1 = new ProblemDiagnosisImpl(new SNOMED_AU_Code("75148009", "Employment problem"), null, null, null);
        ProblemDiagnosis problem2 = new ProblemDiagnosisImpl(
                new SNOMED_AU_Code("65118005", "Marital problems"),
                new PrecisionDate(Precision.DAY, new DateTime("2000-02-28")), null, null);

        ProblemDiagnosis problem3 = new ProblemDiagnosisImpl(
                new SNOMED_AU_Code("5015009", "Economic problem "),
                new PrecisionDate(Precision.DAY, new DateTime("2000-02-28")),
                new PrecisionDate(Precision.DAY, new DateTime("2014-05-30")), null);

        ProblemDiagnosis problem4 = new ProblemDiagnosisImpl(
                new SNOMED_AU_Code("105525002", " Foreign travel problem"),
                new PrecisionDate(Precision.DAY, new DateTime("2014-05-30")),
                new PrecisionDate(Precision.DAY, new DateTime("2014-06-30")), "patient took a holiday and the problem was resolved");
        ProblemDiagnoses problems = new ProblemDiagnosesImpl(Arrays.asList(problem1, problem2, problem3, problem4));


        //procedures

        Procedure proc1 = new ProcedureImpl(
                new SNOMED_AU_Code("58715004", "Moving a patient to a stretcher "),
                PrecisionDate.today(), "Patient was moved to a stretcher");
        Procedure proc2 = new ProcedureImpl(
                new SNOMED_AU_Code("165995007", "Hepatitis A test "), PrecisionDate.today(), "Patient was tested for Hepatitis A");

        Procedure proc3 = new ProcedureImpl(
                new SNOMED_AU_Code("441783000", "Conformal radiotherapy"), PrecisionDate.today(), null);

        Procedures procedures = new ProceduresImpl(Arrays.asList(proc1, proc2, proc3));


        //Other Medical History Items

        //create a new time interval with a low and a high
        RestrictedTimeInterval time = RestrictedTimeInterval.getLowHighInstance(new PrecisionDate(Precision.DAY, new DateTime("2003-01-1")), PrecisionDate.today());
        //set the explicit narrative form of this time interval
        time.setNarrative("since 1 Jan 2003, ongoing");

        UncatagorisedMedicalHistoryItem item1 = new UncatagorisedMedicalHistoryItemImpl("Descripition",
                time,
                "addtional comment supporting the description");

        UncatagorisedMedicalHistoryItem item2 = new UncatagorisedMedicalHistoryItemImpl("Chronic inability to concentrate",
                time,
                null
        );

        UncatagorisedMedicalHistoryItem item3 = new UncatagorisedMedicalHistoryItemImpl("Vitamin C dietary suplement", null, null);


        MedicalHistory history = new MedicalHistoryImpl(problems, procedures, Arrays.asList(item1, item2, item3));


        Immunisation im1 = new ImmunisationImpl(
                new AMTCode("74993011000036102", "measles virus (Schwarz) live attenuated vaccine + mumps virus (Jeryl Lynn, strain RIT 4385) live attenuated vaccine + rubella virus (Wistar RA 27/3) live attenuated vaccine"),
                new PrecisionDate(Precision.DAY, new DateTime("2013-01-01")),
                new Integer(1)
        );


        Immunisation im2 = new ImmunisationImpl(
                new AMTCode("74993011000036102", "measles virus (Schwarz) live attenuated vaccine + mumps virus (Jeryl Lynn, strain RIT 4385) live attenuated vaccine + rubella virus (Wistar RA 27/3) live attenuated vaccine"),
                new PrecisionDate(Precision.DAY, new DateTime("2013-06-01")),
                null
        );


        Immunisations immunisations = new ImmunisationsImpl(Arrays.asList(im1, im2));


        SharedHealthSummaryContent content = new SharedHealthSummaryContentImpl(reactions, meds, history, immunisations);


        // ***********************************
        // ***** Clinical Document Setup *****
        // ***********************************


        ClinicalDocument cdaClinicalDocument = ClinicalDocumentFactory.getSharedHealthSummary();
        cdaClinicalDocument.setLanguageCode("en-AU");
        cdaClinicalDocument.setVersionNumber(1);


        //ClinicalDocumentFactory sets that standard template for a SharedhealthSummary
        // as an example we can add another template if needed.
        cdaClinicalDocument.addTemplateId(TemplateIdImpl.getInstance("1.0", "1.2.36.1.2001.1001.100.149"));
        cdaClinicalDocument.setCompletionCode(DocumentStatusCode.FINAL);


        // You can also use the conversion tool to create an OID from a UUID
        String doucmentUUID = UUID.randomUUID().toString();
        String documentIdAsAnOid = UUIDTool.uuidToOid(doucmentUUID);
        String shsDocumentId = documentIdAsAnOid;

        cdaClinicalDocument.setClinicalDocumentId(shsDocumentId);


        SharedHealthSummaryCDAModel cdaModel = new SharedHealthSummaryCDAModel(cdaClinicalDocument, cdaLegalAuthenticator, cdaCustodian, null, now);


        SharedHealthSummary clinicalModel = new SharedHealthSummaryImpl(context, content);
        SharedHealthSummaryCreator shsCreator = new SharedHealthSummaryCreator(cdaModel, clinicalModel);
        //shsCreator.useStrict();

        Document clinicalDocument = shsCreator.create();


//        String cdaString = TestHelper.documentToXML(clinicalDocument);
//        System.out.println(cdaString);
    }
}
