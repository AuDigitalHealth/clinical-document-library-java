package au.gov.nehta.cda.diagnostic.pathology;

import au.gov.nehta.builder.diagnostic.pathology.PathologyReportCreator;
import au.gov.nehta.builder.util.UUIDTool;
import au.gov.nehta.cda.test.Base;
import au.gov.nehta.cda.test.TestHelper;
import au.gov.nehta.model.cda.common.code.*;
import au.gov.nehta.model.cda.common.custodian.*;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocumentFactory;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifierImpl;
import au.gov.nehta.model.cda.common.id.MedicareCardIdentifier;
import au.gov.nehta.model.cda.common.id.TemplateIdImpl;
import au.gov.nehta.model.cda.common.org.OrganizationName;
import au.gov.nehta.model.cda.common.org.OrganizationNameImpl;
import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.cda.common.telecom.TelecomImpl;
import au.gov.nehta.model.cda.common.telecom.TelecomMedium;
import au.gov.nehta.model.cda.common.telecom.TelecomUse;
import au.gov.nehta.model.cda.common.time.Precision;
import au.gov.nehta.model.cda.common.time.PrecisionDate;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.cda.diagnostic.PathologyReportCdaModel;
import au.gov.nehta.model.clinical.common.*;
import au.gov.nehta.model.clinical.common.participation.*;
import au.gov.nehta.model.clinical.common.types.*;
import au.gov.nehta.model.clinical.diagnostic.pathology.*;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.gov.nehta.model.clinical.etp.common.participation.EntitlementType;
import au.gov.nehta.model.clinical.etp.common.participation.*;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.gov.nehta.schematron.Schematron;
import au.gov.nehta.schematron.SchematronCheckResult;
import junit.framework.Assert;
import org.joda.time.DateTime;
import org.joda.time.LocalDate;
import org.junit.Test;
import org.w3c.dom.Document;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;

public class PathologyReportMinAuthorPathologistTest extends Base {

  private static final String SCHEMATRON = "ccd-3B.sch";
  private static String SCHEMATRON_TEMPLATE_PATH = "src/test/resources/PathologyReport";

  private static final String DOCUMENT_FILE_NAME = "src/test/resources/generated_xml/pathology/epathology-person-min.xml";

  @Test
  public void test_MIN_PathologyReportCreation()
      throws ParserConfigurationException, JAXBException, SchematronValidationException, IOException, ParseException {
    generateMin();
    SchematronCheckResult check = Schematron.check(
        SCHEMATRON_TEMPLATE_PATH, SCHEMATRON, DOCUMENT_FILE_NAME);

    show(check);
    System.out.println("schema errors:" + check.schemaErrors.size());
    System.out.println("schematronErrors errors:" + check.schematronErrors.size());
    Assert.assertTrue("Schema errors found", check.schemaErrors.size() == 0);
    Assert.assertTrue("Schematron errors found", check.schematronErrors.size() == 0);
  }

  public void generateMin()
      throws IOException, ParserConfigurationException, JAXBException, ParseException, SchematronValidationException {
    DateTime now = new DateTime();

    // Setup context

    // ***************************
    // ***** Subject Of Care *****
    // ***************************

    IHI subjectIHI = new IHI("8003600300001283");

    String subjectFamilyName = "Harding";
    DateTime dob = new LocalDate(1982, 11, 28).toDateTimeAtStartOfDay();

    // this is the long way to create an address, it should only be used
    // if you have the address in the "structured" format. Otherwise use the
    // "Unstructured" which is quicker and simpler to create
    AustralianAddress patientAddress = new AustralianAddressImpl();
    patientAddress.addUnstructuredAddressLine("10 browning st");
    patientAddress.setCity("West End");
    patientAddress.setState(AustralianStateTerritory.QUEENSLAND.getAbbreviation());
    patientAddress.setPostcode("4101");

    // This is the easier "Unstructured" address style for reference
    // subjectFullAddress.addUnstructuredAustralianAddressLine(
    // "Unit 1234 / 10 MadeUp Lane" );

    AddressContext subjectOfCareAddress = new AddressContextImpl(patientAddress,
        AddressPurpose.RESIDENTIAL_PERMANENT);
    PersonName subjectPersonName = new PersonNameImpl(subjectFamilyName);
    subjectPersonName.addNameTitle(NameTitle.MISTER.getDescriptor());
    subjectPersonName.addNameSuffix(NameSuffix.JUNIOR.getDescriptor());
    subjectPersonName.addGivenName("Frank");
    subjectPersonName.addPersonNameUsage(PersonNameUsage.MAIDEN_NAME_OR_NAME_AT_BIRTH);

    DateOfBirthDetail subjectDOB = new DateOfBirthDetailImpl(dob);

    ExtendedDemographicDataImpl demoData = new ExtendedDemographicDataImpl(Sex.MALE, subjectDOB);

    demoData.setIndigenousStatus(IndigenousStatus.NOT_STATED_OR_INADEQUATELY_DESCRIBED);

    SubjectOfCarePerson subjectOfCarePerson = new ExtendedSubjectOfCarePerson(subjectPersonName,
        demoData);
    MedicareCardIdentifier medicareCard = new MedicareCardIdentifier("4324567871");
    SubjectOfCareParticipant subject = new SubjectOfCareParticipantImpl(
        Arrays.asList(subjectIHI, medicareCard), Arrays.asList(subjectOfCareAddress),
        subjectOfCarePerson);

    List<Entitlement> subjectOfCareEntitlementList = new ArrayList<>();
    subject.setEntitlements(subjectOfCareEntitlementList);

    // ************************
    // ***** Author *****
    // ************************
    HPII authorHPII = new HPII("8003610000001145");

    PersonName authorPersonName = new PersonNameImpl("Patrick");

    Occupation authorOccupation = new OccupationImpl(new ANZSCO_1ED_REV1("253915", "Pathologist"));
    ProviderEmploymentDetail providerEmploymentDetail = new ProviderEmploymentDetailImpl(
        authorOccupation);
    ProviderPerson authorPerson = new ProviderPersonImpl(authorPersonName);
    authorPerson.setEmploymentDetail(providerEmploymentDetail);

    AustralianAddress fullAddress = new AustralianAddressImpl();
    fullAddress.addUnstructuredAddressLine("Level 1, 10 Browning street");
    fullAddress.setCity("West End");
    fullAddress.setState(AustralianStateTerritory.QUEENSLAND.getAbbreviation());
    fullAddress.setPostcode("4101");
    ProviderAddress authorOrganisationAddress = new ProviderAddressImpl(false, fullAddress,
        AddressPurpose.BUSINESS);

    Telecom authorTelephone = new TelecomImpl(TelecomMedium.TELEPHONE, "0212345678",
        TelecomUse.BUSINESS);

    List<Telecom> electronicCommunicationDetailList = Arrays.asList(authorTelephone);

    AsEntityIdentifier nataLabID = new AsEntityIdentifierImpl();
    nataLabID.setExtension("3715");
    nataLabID.setAssigningAuthorityName("NATA");
    nataLabID.setRoot("1.2.36.1.2001.1005.12");

    CodeImpl nataLabCode = new CodeImpl();
    nataLabCode.setDisplayName("Organization identifier");
    nataLabCode.setCodeSystemName("Identifier Type (HL7)");
    nataLabCode.setCodeSystem("2.16.840.1.113883.12.203");
    nataLabCode.setCode("XX");
    nataLabID.setCode(nataLabCode);

    EmploymentOrganisationImpl authorEmployment = new EmploymentOrganisationImpl(
        Arrays.asList(new HPIO("8003621231167886"), nataLabID)
        , "Pete's Pathlab");

    AuthorParticipant authorParticipant = new PathologyParticipantImpl(
        authorHPII,
        authorPerson,
        authorEmployment,
        authorOrganisationAddress,
        electronicCommunicationDetailList);

    DocumentParticipant author =
        new DocumentParticipantImpl(authorOccupation, authorParticipant);

    // ************************
    // ***** Requester *****
    // ************************

    AsEntityIdentifier RequesterIdentifier = new AsEntityIdentifierImpl("1.22.333.4444.55555",
        "12345678");

    // this should probably be omitted if it's not a
    // MEDICARE_PRESCRIBER_NUMBER
    // for instance, a PENSIONER_CONCESSION makes no sense here
    Entitlement requesterEntitlement = new EntitlementImpl(RequesterIdentifier,
        EntitlementType.MEDICARE_PRESCRIBER_NUMBER);
    requesterEntitlement.setEntitlementValidityDuration(RestrictedTimeInterval.getLowInstance(
        // from today(day only precision)
        new PrecisionDate(Precision.DAY, now)));

    Telecom requesterTelephone = new TelecomImpl("0756781234");
    Telecom requesterFax = new TelecomImpl(TelecomMedium.FAX, "0756781234", TelecomUse.BUSINESS);

    List<Telecom> requesterComms = new ArrayList<>();
    requesterComms.add(requesterTelephone);
    requesterComms.add(requesterFax);

    // "Unstructured" address example
    AustralianAddress requesterFullAddress = new AustralianAddressImpl();
    requesterFullAddress.addUnstructuredAddressLine("level 2, 10 browning street");
    requesterFullAddress.setCity("West End");
    requesterFullAddress.setState(AustralianStateTerritory.QUEENSLAND.getAbbreviation());
    requesterFullAddress.setPostcode("4101");
    ProviderAddress requesterAddress = new ProviderAddressImpl(false, requesterFullAddress,
        AddressPurpose.BUSINESS);

    Occupation requesterOccupation = new OccupationImpl(
        new ANZSCO_1ED_REV1("253915", "Pathologist"));
    Role doctor = new RoleImpl(requesterOccupation);

    PersonName requesterPersonName = new PersonNameImpl("Requester");
    ProviderPerson requesterPerson = new ProviderPersonImpl(requesterPersonName);

    String hpioNumber = "8003621231167886";

    List<AsEntityIdentifier> organisationIds = Arrays
        .asList(new HPIO(hpioNumber));
    Organisation clinic = new OrganisationImpl("Cool CLinic", OrganisationNameUsage.BUSINESS_NAME);
    RequesterParticipant requesterParticipant = new RequesterParticipantImpl(
        new HPII("8003610000001145"), organisationIds, clinic, requesterPerson);
    requesterParticipant.setAddress(requesterAddress);
    requesterParticipant.setElectronicCommunicationDetail(requesterComms);

    RequesterParticipation requester = new RequesterParticipationImpl(doctor, requesterParticipant,
        now);

    OrderDetails order = new OrderDetailsImpl(PathologyId.orderID(hpioNumber),
        new SNOMEDCode("26604007", "Complete blood count"));

    PathologyReportContext pathologyContext = new PathologyReportContextImpl(subject, requester,
        author, order);

    UniqueIdentifierImpl myLabId = UniqueIdentifierImpl.random();
    SpecimenDetailImpl specimenDetails = new SpecimenDetailImpl(myLabId, now);

    // DocumentAuthorOrDevice reportingPathologis DocumentAuthorOrDevice reportingPathologist =
    // DocumentAuthorOrDeviceImpl.getAuthorAsAPerson(
    // author.getParticipant(), authorOccupation );
    DocumentParticipant reportingPathologist = new DocumentParticipantImpl(authorOccupation,
        authorParticipant);

    String internalDocumentNumber = "123456";
    UniqueIdentifier doucmentID = PathologyId.pathReportID(hpioNumber, internalDocumentNumber);
    AttachedMedia testResult = new AttachedMedia(new File("src/test/resources/test-result.pdf"));
    String title = "Hematology Report for Peter Patient";

    ReportDocument testResultDocument = new ReportDocumentImpl(title, testResult, doucmentID,
        SNOMED_CT_ResultStatusCode.PRELIMINARY, now);

    PathologyResult pathologyResult = new PathologyResultImpl(
        new SNOMED_AU_Code("275711006", "Serum Chemistry Test"),
        DiagnosticServiceCode.HEMATOLOGY,
        now,
        specimenDetails,
        SNOMED_CT_ResultStatusCode.FINAL_RESULTS
    );

    PathologyReportContent pathologyContent = new PathologyReportContentImpl(
        Arrays.asList(pathologyResult), testResultDocument, reportingPathologist);

    // Create Pathology Report
    PathologyResultReport pathologyReport = new PathologyResultReportImpl(pathologyContext,
        pathologyContent);

    String healthCareID = UUID.randomUUID().toString();
    String documentID = UUID.randomUUID().toString();

    // *********************
    // ***** Custodian *****
    // *********************

    AsEntityIdentifier custodianIdentifier = new HPIO("8003621231167886");
    UniqueIdentifier typedDocumentID = new UniqueIdentifierImpl(documentID);

    // you can also use additional identifiers
    UniqueIdentifier otherId = new UniqueIdentifierImpl(UUID.randomUUID().toString());
    CustodianOrganization custodianOrganization = CustodianOrganizationImpl
        .getInstance(Arrays.asList(typedDocumentID, otherId), custodianIdentifier);

    OrganizationName custodianOrganizationName = new OrganizationNameImpl("Custodian organisation");
    custodianOrganization.setName(custodianOrganizationName);
    AssignedCustodian assignedCustodian = AssignedCustodianImpl.getInstance(custodianOrganization);
    Custodian cdaCustodian = CustodianImpl.getInstance(assignedCustodian);

    ClinicalDocument document = ClinicalDocumentFactory.getPathologyReport();
    document.setSetId(documentID);

    // as an example we can add another template if needed.
    document.addTemplateId(TemplateIdImpl.getInstance("1.0", "1.2.36.1.2001.1001.100.149"));
    document.setCompletionCode(DocumentStatusCode.FINAL);
    document.setVersionNumber(1);
    // String documentIdAsAnOid =
    // "2.25.36901752580752676809846395044082807160";
    //must be an OID to pass into PCEHR
    // You can also use the conversion tool
    String doucmentUUID = UUID.randomUUID().toString();
    String documentIdAsAnOid = UUIDTool.uuidToOid(doucmentUUID);

    document.setClinicalDocumentId(documentIdAsAnOid);

    PathologyReportCdaModel model = new PathologyReportCdaModel(document, cdaCustodian,
        healthCareID, now);
    PathologyReportCreator pathCreator = new PathologyReportCreator(model, pathologyReport);

    Document clinicalDocument = pathCreator.create();

    String cdaString = TestHelper.documentToXML(clinicalDocument);
    TestHelper.printToFile(cdaString, DOCUMENT_FILE_NAME);
    System.out.println(cdaString);
  }


}

