package nehta.cda.shs;

import au.gov.nehta.builder.shs.SharedHealthSummaryCreator;
import au.gov.nehta.builder.util.UUIDTool;
import au.gov.nehta.cda.test.Base;
import au.gov.nehta.cda.test.TestHelper;
import au.gov.nehta.model.cda.common.code.AMTCode;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.code.DocumentStatusCode;
import au.gov.nehta.model.cda.common.code.SNOMED_AU_Code;
import au.gov.nehta.model.cda.common.custodian.*;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocumentFactory;
import au.gov.nehta.model.cda.common.id.*;
import au.gov.nehta.model.cda.common.org.OrganizationNameImpl;
import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.cda.common.telecom.TelecomImpl;
import au.gov.nehta.model.cda.common.telecom.TelecomMedium;
import au.gov.nehta.model.cda.common.telecom.TelecomUse;
import au.gov.nehta.model.cda.common.time.Precision;
import au.gov.nehta.model.cda.common.time.PrecisionDate;
import au.gov.nehta.model.cda.shs.SharedHealthSummaryCDAModel;
import au.gov.nehta.model.clinical.common.*;
import au.gov.nehta.model.clinical.common.participation.*;
import au.gov.nehta.model.clinical.common.types.AdverseReaction;
import au.gov.nehta.model.clinical.common.types.AdverseReactionImpl;
import au.gov.nehta.model.clinical.common.types.*;
import au.gov.nehta.model.clinical.diagnostic.pathology.ExtendedEmploymentOrganisationImpl;
import au.gov.nehta.model.clinical.etp.common.participation.AddressContext;
import au.gov.nehta.model.clinical.shs.MedicalHistory;
import au.gov.nehta.model.clinical.shs.*;
import au.gov.nehta.schematron.Schematron;
import au.gov.nehta.schematron.SchematronCheckResult;
import junit.framework.Assert;
import org.joda.time.DateTime;
import org.joda.time.LocalDate;
import org.junit.Test;
import org.w3c.dom.Document;

import java.io.File;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.UUID;

import static au.gov.nehta.model.schematron.SchematronResource.SchematronResources.SHARED_HEALTH_SUMMARY_3B;


public class SharedHealthSummaryMinTest extends Base {

  private static final String SCHEMATRON = SHARED_HEALTH_SUMMARY_3B.resource().getSchematron();
  private static String SCHEMATRON_TEMPLATE_PATH = "resources/SharedHealthSummary";

  private static final String DOCUMENT_FILE_NAME = TEST_GENERATION + "/shs/shs-min-java.xml";
  private static final String MIN_EXCLUDED_DOCUMENT_FILE_NAME =
      TEST_GENERATION + "/shs/shs-min-excluded-java.xml";


  @Test
  public void test_MIN_shsCreation() throws Exception {
    if (!new File(SCHEMATRON_TEMPLATE_PATH
        + "/schematron/schematron-Validator-report.xsl").exists()) {
      SCHEMATRON_TEMPLATE_PATH = "src/" + SCHEMATRON_TEMPLATE_PATH;
    }
    generateMin();

    SchematronCheckResult check = Schematron
        .check(SCHEMATRON_TEMPLATE_PATH, SCHEMATRON, DOCUMENT_FILE_NAME);

    show(check);

    Assert.assertEquals(0, check.schemaErrors.size());
    Assert.assertEquals(0, check.schematronErrors.size());


  }


  @Test
  public void test_MIN_excludedall_shsCreation() throws Exception {
    if (!new File(SCHEMATRON_TEMPLATE_PATH
        + "/schematron/schematron-Validator-report.xsl").exists()) {
      SCHEMATRON_TEMPLATE_PATH = "src/" + SCHEMATRON_TEMPLATE_PATH;
    }
    if (!new File(DOCUMENT_FILE_NAME).exists()) {
      generateMin();
    }
    generateMinExcluded();

    SchematronCheckResult check = Schematron
        .check(SCHEMATRON_TEMPLATE_PATH, SCHEMATRON, DOCUMENT_FILE_NAME);

    show(check);

    Assert.assertEquals(0, check.schemaErrors.size());
    Assert.assertEquals(0, check.schematronErrors.size());
  }


  //test the exclusion statements
  private void generateMinExcluded() throws Exception {
    DateTime now = new DateTime();

    // *******************************
    // ***** Legal Authenticator *****
    // *******************************

    String legalAuthenticatorID = UUID.randomUUID().toString();
    AssignedEntityImpl cdaLegalAuthenticatorAssignedEntity = new AssignedEntityImpl(
        legalAuthenticatorID);
    LegalAuthenticator cdaLegalAuthenticator = LegalAuthenticatorImpl
        .getInstance(now, cdaLegalAuthenticatorAssignedEntity);

    // *********************
    // ***** Custodian *****
    // *********************

    AsEntityIdentifier custodianIdentifier = new HPIO("8003621231167886");

    UniqueIdentifier scopingId = UniqueIdentifierImpl.random();
    CustodianOrganizationImpl custodianOrganization = CustodianOrganizationImpl
        .getInstance(Collections.singletonList(scopingId), custodianIdentifier);
    custodianOrganization.setName(new OrganizationNameImpl("Clinical Documents R Us"));
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
    subjectFullAddress.setCity("West End");
    subjectFullAddress.setState(AustralianStateTerritory.QUEENSLAND.getAbbreviation());
    subjectFullAddress.setPostcode("4101");

    AddressContext subjectOfCareAddress = new AddressContextImpl(subjectFullAddress,
        AddressPurpose.RESIDENTIAL_PERMANENT);
    PersonName subjectPersonName = new PersonNameImpl(subjectFamilyName);

    DateOfBirthDetail subjectDOB = new DateOfBirthDetailImpl(dob);
    SubjectOfCareDemographicData subjectDemographicData = new SubjectOfCareDemographicDataImpl(
        Sex.MALE, subjectDOB);
    subjectDemographicData
        .setIndigenousStatus(IndigenousStatus.NOT_STATED_OR_INADEQUATELY_DESCRIBED);
    SubjectOfCarePerson subjectOfCarePerson = new SubjectOfCarePersonImpl(subjectPersonName,
        subjectDemographicData);
    SubjectOfCareParticipant subjectParticipant = new SubjectOfCareParticipantImpl(
        Arrays.asList(subjectIHI, mcCard),
        subjectOfCareAddress, subjectOfCarePerson);

    //******************
    //***** AUTHOR *****
    //******************

    Coded occupationRole = ANZSCO_1ED_2006.CLINICAL_PSYCHOLOGIST;

    AsEntityIdentifier authorHPII = new HPII("8003610000001145");
    PersonName authorLegalName = new PersonNameImpl("Smith");

    HPIO authorHPIO = new HPIO("8003621231167886");

    AddressContext authorOrgAddress = AddressContextImpl.noFixedAddress();

    Telecom authorOrgTelephone =
        new TelecomImpl(
            TelecomMedium.TELEPHONE,
            "0212345678",
            TelecomUse.BUSINESS);

    ExtendedEmploymentOrganisationImpl employmentDetails = new ExtendedEmploymentOrganisationImpl(
        Collections.singletonList(authorHPIO), Collections.singletonList(authorOrgAddress),
        Collections.singletonList(authorOrgTelephone), "Sarahs Clinic");

    SharedHealthSummaryAuthor author = new SharedHealthSummaryAuthorImpl(
        occupationRole,
        Collections.singletonList(authorHPII),
        Collections.singletonList(authorLegalName),
        employmentDetails
    );

    //build the context
    SharedHealthSummaryContext context = new SharedHealthSummaryContextImpl(subjectParticipant,
        author);

    // *********************************
    // ***** CDA Document Content  *****
    // *********************************

    AdverseReactions reactions = AdverseReactionsImpl.noneKnown();

    //alternative for above
    //AdverseReactions reactions = new AdverseReactionsImpl(NCTISGlobalStatement.NONE_KNOWN);

    Medications meds = MedicationsImpl.noneKnown();

    //alternative for above
    //Medications meds = new MedicationsImpl(NCTISGlobalStatement.NONE_KNOWN);

    ProblemDiagnoses problems = ProblemDiagnosesImpl.noneKnown();

    //alternative for above
    //ProblemDiagnoses problems = new ProblemDiagnosesImpl(NCTISGlobalStatement.NONE_KNOWN);

    Procedures procedures = ProceduresImpl.noneKnown();

    //alternative for above
    //Procedures procedures = new ProceduresImplImpl(NCTISGlobalStatement.NONE_KNOWN);

    MedicalHistory history = new MedicalHistoryImpl(problems, procedures, null);

    //Immunisations
    Immunisations immunisations = ImmunisationsImpl.noneSupplied();

    SharedHealthSummaryContent content = new SharedHealthSummaryContentImpl(reactions, meds,
        history, immunisations);

    // ***********************************
    // ***** Clinical Document Setup *****
    // ***********************************

    ClinicalDocument cdaClinicalDocument = ClinicalDocumentFactory.getSharedHealthSummary();
    cdaClinicalDocument.setLanguageCode("en-AU");
    cdaClinicalDocument.setVersionNumber(1);

    //ClinicalDocumentFactory sets that standard template for a SharedhealthSummary
    // as an example we can add another template if needed.
    cdaClinicalDocument
        .addTemplateId(TemplateIdImpl.getInstance("1.0", "1.2.36.1.2001.1001.100.149"));
    cdaClinicalDocument.setCompletionCode(DocumentStatusCode.FINAL);

    // You can also use the conversion tool to create an OID from a UUID
    String doucmentUUID = UUID.randomUUID().toString();
    cdaClinicalDocument.setClinicalDocumentId(doucmentUUID);

    SharedHealthSummaryCDAModel cdaModel = new SharedHealthSummaryCDAModel(cdaClinicalDocument,
        cdaLegalAuthenticator, cdaCustodian, null, now);

    SharedHealthSummary clinicalModel = new SharedHealthSummaryImpl(context, content);
    SharedHealthSummaryCreator shsCreator = new SharedHealthSummaryCreator(cdaModel, clinicalModel);
    //shsCreator.useStrict();

    Document clinicalDocument = shsCreator.create();

    String cdaString = TestHelper.documentToXML(clinicalDocument);
    TestHelper.printToFile(cdaString, MIN_EXCLUDED_DOCUMENT_FILE_NAME);
    System.out.println(cdaString);

  }


  private void generateMin() throws Exception {
    DateTime now = new DateTime();

    // *******************************
    // ***** Legal Authenticator *****
    // *******************************

    String legalAuthenticatorID = UUID.randomUUID().toString();
    AssignedEntityImpl cdaLegalAuthenticatorAssignedEntity = new AssignedEntityImpl(
        legalAuthenticatorID);
    LegalAuthenticator cdaLegalAuthenticator = LegalAuthenticatorImpl
        .getInstance(now, cdaLegalAuthenticatorAssignedEntity);

    // *********************
    // ***** Custodian *****
    // *********************
    AsEntityIdentifier custodianIdentifier = new HPIO("8003621231167886");

    UniqueIdentifier scopingId = UniqueIdentifierImpl.random();
    CustodianOrganization custodianOrganization = CustodianOrganizationImpl
        .getInstance(Collections.singletonList(scopingId), custodianIdentifier);
    custodianOrganization.setName(new OrganizationNameImpl("Clinical Documents R Us"));

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
    subjectFullAddress.setCity("West End");
    subjectFullAddress.setState(AustralianStateTerritory.QUEENSLAND.getAbbreviation());
    subjectFullAddress.setPostcode("4101");

    AddressContext subjectOfCareAddress = new AddressContextImpl(subjectFullAddress,
        AddressPurpose.RESIDENTIAL_PERMANENT);
    PersonName subjectPersonName = new PersonNameImpl(subjectFamilyName);

    DateOfBirthDetail subjectDOB = new DateOfBirthDetailImpl(dob);
    SubjectOfCareDemographicData subjectDemographicData = new SubjectOfCareDemographicDataImpl(
        Sex.MALE, subjectDOB);
    subjectDemographicData
        .setIndigenousStatus(IndigenousStatus.NOT_STATED_OR_INADEQUATELY_DESCRIBED);
    SubjectOfCarePerson subjectOfCarePerson = new SubjectOfCarePersonImpl(subjectPersonName,
        subjectDemographicData);
    SubjectOfCareParticipant subjectParticipant = new SubjectOfCareParticipantImpl(
        Arrays.asList(subjectIHI, mcCard),
        subjectOfCareAddress, subjectOfCarePerson);

    //******************
    //***** AUTHOR *****
    //******************

    Coded occupationRole = ANZSCO_1ED_2006.CLINICAL_PSYCHOLOGIST;

    AsEntityIdentifier authorHPII = new HPII("8003610000001145");
    PersonName authorLegalName = new PersonNameImpl("Smith");

    //a second address for the organisation
    AustralianAddress authorOrgStreetAddress = new AustralianAddressImpl();
    authorOrgStreetAddress.addUnstructuredAddressLine("Author Organisation Address");
    authorOrgStreetAddress.addUnstructuredAddressLine("400 Pitt Street");
    authorOrgStreetAddress.setPostcode("2000");
    authorOrgStreetAddress.setCity("Syndey");
    authorOrgStreetAddress.setState("QLD");
    AddressContext authorOrgAddress = new AddressContextImpl(authorOrgStreetAddress,
        AddressPurpose.BUSINESS);

    Telecom authorOrgTelephone =
        new TelecomImpl(
            TelecomMedium.TELEPHONE,
            "0212345678",
            TelecomUse.BUSINESS);

    HPIO authorHPIO = new HPIO("8003621231167886");
    ExtendedEmploymentOrganisationImpl employmentDetails = new ExtendedEmploymentOrganisationImpl(
        Collections.singletonList(authorHPIO), Collections.singletonList(authorOrgAddress),
        Collections.singletonList(authorOrgTelephone), "Sarahs Clinic");

    SharedHealthSummaryAuthor author = new SharedHealthSummaryAuthorImpl(
        occupationRole,
        Collections.singletonList(authorHPII),
        Collections.singletonList(authorLegalName),
        employmentDetails
    );

    //build the context
    SharedHealthSummaryContext context = new SharedHealthSummaryContextImpl(subjectParticipant,
        author);

    // ******************************
    // ***** Adverse Reactions  *****
    // ******************************

    Coded substance = new SNOMED_AU_Code("75247008", "Benzathine benzylpenicillin");
    List<? extends Manifestation> manifestations = Arrays.asList(
        new ManifestationImpl(new SNOMED_AU_Code("57054005", "Acute myocardial infarction")),
        new ManifestationImpl(new SNOMED_AU_Code("241938005", "Penicillin-induced anaphylaxis")),
        new ManifestationImpl(new SNOMED_AU_Code("95580006", "Renal artery embolism")),
        new ManifestationImpl(
            new SNOMED_AU_Code("233927002", "Cardiac arrest with successful resuscitation"))
    );

    AdverseReaction reaction1 = new AdverseReactionImpl(substance, manifestations);

    AdverseReaction reaction2 = new AdverseReactionImpl(
        new SNOMED_AU_Code("372756006", "Warfarin"),
        Arrays.asList(
            new ManifestationImpl(new SNOMED_AU_Code("72189003", "Haemorrhagic nasal discharge")),
            new ManifestationImpl(new SNOMED_AU_Code("95347000", "Skin necrosis")),
            new ManifestationImpl(new SNOMED_AU_Code("84229001", "Fatigue")),
            new ManifestationImpl(new SNOMED_AU_Code("22253000", "Pain")))
    );

    AdverseReactions reactions = new AdverseReactionsImpl(Arrays.asList(reaction1, reaction2));

    // *************************
    // *****  Medications  *****
    // *************************

    KnownMedication med1 = new KnownMedicationImpl(
        new AMTCode("925344011000036101", "Pemzo 20 mg capsule, 100, bottle"),
        "Directions",
        "A reason for ordering the medicine, vaccine or othertherapeutic good.",
        "Any additional information that may be needed to ensure the continuity of supply, rationale for current dose and timing, or safe and appropriate use.");

    KnownMedication med2 = new KnownMedicationImpl(
        new AMTCode("925344011000036101", "Pemzo 20 mg capsule, 100, bottle"),
        "Directions");

    Medications meds = new MedicationsImpl(Arrays.asList(med1, med2));

    // ******************************
    // *****   Medical History  *****
    // ******************************

    //problem/diagnoses
    ProblemDiagnosis problem1 = new ProblemDiagnosisImpl(
        new SNOMED_AU_Code("75148009", "Employment problem"), null, null, null);
    ProblemDiagnoses problems = new ProblemDiagnosesImpl(Collections.singletonList(problem1));

    //procedures
    Procedure proc3 = new ProcedureImpl(
        new SNOMED_AU_Code("441783000", "Conformal radiotherapy"), PrecisionDate.today(), null);
    Procedures procedures = new ProceduresImpl(Collections.singletonList(proc3));

    //medical history
    UncatagorisedMedicalHistoryItem item4 = new UncatagorisedMedicalHistoryItemImpl(
        "Vitamin C dietary suplement", null, null);

    MedicalHistory history = new MedicalHistoryImpl(problems, procedures,
        Collections.singletonList(item4));

    Immunisation im1 = new ImmunisationImpl(
        new AMTCode("74993011000036102",
            "measles virus (Schwarz) live attenuated vaccine + mumps virus (Jeryl Lynn, strain RIT 4385) live attenuated vaccine + rubella virus (Wistar RA 27/3) live attenuated vaccine"),
        new PrecisionDate(Precision.DAY, new DateTime("2013-01-01")), 1);

    Immunisation im2 = new ImmunisationImpl(
        new AMTCode("74993011000036102",
            "measles virus (Schwarz) live attenuated vaccine + mumps virus (Jeryl Lynn, strain RIT 4385) live attenuated vaccine + rubella virus (Wistar RA 27/3) live attenuated vaccine"),
        new PrecisionDate(Precision.DAY, new DateTime("2013-06-01")),
        null
    );

    Immunisations immunisations = new ImmunisationsImpl(Arrays.asList(im1, im2));

    SharedHealthSummaryContent content = new SharedHealthSummaryContentImpl(reactions, meds,
        history, immunisations);

    // ***********************************
    // ***** Clinical Document Setup *****
    // ***********************************

    ClinicalDocument cdaClinicalDocument = ClinicalDocumentFactory.getSharedHealthSummary();
    cdaClinicalDocument.setLanguageCode("en-AU");
    cdaClinicalDocument.setVersionNumber(1);

    //ClinicalDocumentFactory sets that standard template for a SharedhealthSummary
    // as an example we can add another template if needed.
    cdaClinicalDocument
        .addTemplateId(TemplateIdImpl.getInstance("1.0", "1.2.36.1.2001.1001.100.149"));
    cdaClinicalDocument.setCompletionCode(DocumentStatusCode.FINAL);

    // You can also use the conversion tool to create an OID from a UUID
    String doucmentUUID = UUID.randomUUID().toString();
    String shsDocumentId = UUIDTool.uuidToOid(doucmentUUID);

    cdaClinicalDocument.setClinicalDocumentId(shsDocumentId);

    SharedHealthSummaryCDAModel cdaModel = new SharedHealthSummaryCDAModel(cdaClinicalDocument,
        cdaLegalAuthenticator, cdaCustodian, null, now);

    SharedHealthSummary clinicalModel = new SharedHealthSummaryImpl(context, content);
    SharedHealthSummaryCreator shsCreator = new SharedHealthSummaryCreator(cdaModel, clinicalModel);
    //shsCreator.useStrict();

    Document clinicalDocument = shsCreator.create();

    //add the generic stylesheet XML directive.
    //CCA does not like this for production
    //but it's useful to debug the narrative
    //shsCreator.addStyleSheet(clinicalDocument);

    String cdaString = TestHelper.documentToXML(clinicalDocument);
    TestHelper.printToFile(cdaString, DOCUMENT_FILE_NAME);
    System.out.println(cdaString);

  }


}


