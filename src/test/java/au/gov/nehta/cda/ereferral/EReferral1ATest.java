package au.gov.nehta.cda.ereferral;

import static au.gov.nehta.model.schematron.SchematronResource.SchematronResources.SERVICE_REFERRAL_1A;
import static org.junit.Assert.assertEquals;

import au.gov.nehta.builder.ereferral.EReferralCreator;
import au.gov.nehta.builder.ereferral.ReferralAuthor;
import au.gov.nehta.builder.ereferral.ReferralAuthorImpl;
import au.gov.nehta.builder.ereferral.ReferralDocument;
import au.gov.nehta.builder.ereferral.ReferralDocumentImpl;
import au.gov.nehta.builder.ereferral.ReferralModel;
import au.gov.nehta.builder.ereferral.ReferralModelImpl;
import au.gov.nehta.builder.ereferral.ReferralParticipant;
import au.gov.nehta.builder.ereferral.ReferralParticipantImpl;
import au.gov.nehta.builder.util.UUIDTool;
import au.gov.nehta.cda.test.Base;
import au.gov.nehta.cda.test.TestHelper;
import au.gov.nehta.model.cda.common.address.PostalAddressImpl;
import au.gov.nehta.model.cda.common.address.PostalAddressUseEnum;
import au.gov.nehta.model.cda.common.code.CodeImpl;
import au.gov.nehta.model.cda.common.code.DocumentStatusCode;
import au.gov.nehta.model.cda.common.custodian.AssignedCustodian;
import au.gov.nehta.model.cda.common.custodian.AssignedCustodianImpl;
import au.gov.nehta.model.cda.common.custodian.Custodian;
import au.gov.nehta.model.cda.common.custodian.CustodianImpl;
import au.gov.nehta.model.cda.common.custodian.CustodianOrganization;
import au.gov.nehta.model.cda.common.custodian.CustodianOrganizationImpl;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocumentFactory;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.id.MedicareCardIdentifier;
import au.gov.nehta.model.cda.common.id.TemplateIdImpl;
import au.gov.nehta.model.cda.common.org.OrganizationName;
import au.gov.nehta.model.cda.common.org.OrganizationNameImpl;
import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.cda.common.telecom.TelecomImpl;
import au.gov.nehta.model.cda.common.telecom.TelecomMedium;
import au.gov.nehta.model.cda.common.telecom.TelecomUse;
import au.gov.nehta.model.clinical.common.SubjectOfCareDemographicData;
import au.gov.nehta.model.clinical.common.SubjectOfCareDemographicDataImpl;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipantImpl;
import au.gov.nehta.model.clinical.common.SubjectOfCarePerson;
import au.gov.nehta.model.clinical.common.SubjectOfCarePersonImpl;
import au.gov.nehta.model.clinical.common.participation.ANZSCO_1ED_2006;
import au.gov.nehta.model.clinical.common.participation.ANZSCO_1ED_REV1;
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
import au.gov.nehta.model.clinical.common.participation.OccupationImpl;
import au.gov.nehta.model.clinical.common.participation.Organisation;
import au.gov.nehta.model.clinical.common.participation.OrganisationImpl;
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
import au.gov.nehta.model.clinical.diagnostic.pathology.EmploymentOrganisationImpl;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.gov.nehta.model.clinical.etp.common.participation.AddressContext;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderAddress;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderAddressImpl;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderEmploymentDetail;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderEmploymentDetailImpl;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderPerson;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderPersonImpl;
import au.gov.nehta.model.schematron.SchematronResource.SchematronResources;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.gov.nehta.schematron.Schematron;
import au.gov.nehta.schematron.SchematronCheckResult;
import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import org.joda.time.DateTime;
import org.joda.time.LocalDate;
import org.junit.Test;
import org.w3c.dom.Document;

public class EReferral1ATest extends Base {

  private static final String SCHEMATRON = SERVICE_REFERRAL_1A.resource().getSchematron();
  private static String SCHEMATRON_TEMPLATE_PATH = "src/test/resources/e-Referral";
  private static final String DOCUMENT_FILE_NAME = "src/test/resources/generated_xml/eReferral/ereferral-1A.xml";


  @Test
  public void test_E_REFERRAL_1A_Creation()
      throws ParserConfigurationException, JAXBException, SchematronValidationException {
    generate1A();
    SchematronCheckResult check = Schematron
        .check(SCHEMATRON_TEMPLATE_PATH, SCHEMATRON, DOCUMENT_FILE_NAME);
    show(check);
    assertEquals(0, check.schemaErrors.size());
    // RDS disabled Assert.assertTrue( check.schematronErrors.size() == 0 );
  }


  private void generate1A()
      throws ParserConfigurationException, JAXBException, SchematronValidationException {
    String documentID = UUID.randomUUID().toString();

    // ***************************
    // ***** Subject Of Care *****
    // ***************************

    IHI subjectIHI = new IHI("8003600300001283");

    String subjectFamilyName = "Harding";
    DateTime dob = new LocalDate(1982, 11, 28).toDateTimeAtStartOfDay();

    AustralianAddress patientAddress = new AustralianAddressImpl();
    patientAddress.addUnstructuredAddressLine("10 browning st");
    patientAddress.setCity("West End");
    patientAddress.setState(AustralianStateTerritory.QUEENSLAND.getAbbreviation());
    patientAddress.setPostcode("4101");
    AddressContext subjectOfCareAddresses = new AddressContextImpl(patientAddress,
        AddressPurpose.RESIDENTIAL_PERMANENT);

    PersonName subjectPersonName = new PersonNameImpl(subjectFamilyName);
    subjectPersonName.addGivenName("Frank");
    subjectPersonName.addNameTitle(NameTitle.MISTER.getDescriptor());
    subjectPersonName.addNameSuffix(NameSuffix.JUNIOR.getDescriptor());
    subjectPersonName.addPersonNameUsage(PersonNameUsage.REGISTERED_NAME_OR_LEGAL_NAME);

    DateAccuracy dobAccuracy = new DateAccuracyImpl(
        /* Day Accuracy*/ true,
        /* Month Accuracy*/ true,
        /* Year Accuracy*/true);

    DateOfBirthDetail subjectDOB = new DateOfBirthDetailImpl(dob, dobAccuracy);
    subjectDOB.setDateOfBirthAccuracyIndicator(dobAccuracy);
    subjectDOB.setDateOfBirthIsCalculatedFromAge(true);

    SubjectOfCareDemographicData demoData = new SubjectOfCareDemographicDataImpl(Sex.MALE,
        subjectDOB);

    demoData.setBirthPlurality(5);
    demoData.setBirthOrder(2);
    int age = 31;
    demoData.setAgeInYears(age);
    demoData.setAgeAccurate(true);
    demoData.setIndigenousStatus(IndigenousStatus.NOT_STATED_OR_INADEQUATELY_DESCRIBED);

    SubjectOfCarePerson subjectOfCarePerson = new SubjectOfCarePersonImpl(subjectPersonName,
        demoData);
    MedicareCardIdentifier medicareCard = new MedicareCardIdentifier("4324567871");
    SubjectOfCareParticipant subject = new SubjectOfCareParticipantImpl(
        Arrays.asList(subjectIHI, medicareCard), subjectOfCareAddresses, subjectOfCarePerson);

    Telecom subjectTelephone = new TelecomImpl(TelecomMedium.TELEPHONE, "0712345678",
        TelecomUse.PERSONAL);
    Telecom subjectEmail = new TelecomImpl(TelecomMedium.EMAIL,
        "frank.harding@electronichealth.net.au", TelecomUse.PERSONAL);

    List<Telecom> subjectOfCareElectronicCommunicationDetails = new ArrayList<Telecom>();
    subjectOfCareElectronicCommunicationDetails.add(subjectTelephone);
    subjectOfCareElectronicCommunicationDetails.add(subjectEmail);

    subject.setElectronicCommunicationDetails(subjectOfCareElectronicCommunicationDetails);

    // ************************
    // ***** Author *****
    // ************************
    HPII authorHPII = new HPII("8003610000001145");

    //AsEntityIdentifierImpl authorHPII = new AsEntityIdentifierImpl();

    PersonName authorName = new PersonNameImpl("Practicioner");
    authorName.addGivenName("Gerry");
    authorName.addGivenName("Medical");
    authorName.addNameTitle(NameTitle.MISTER.getDescriptor());
    authorName.addNameTitle(NameTitle.PROFESSOR.getDescriptor());
    authorName.addNameSuffix(NameSuffix.MEMBER_OF_PARLIAMENT.getDescriptor());
    authorName.addNameSuffix(NameSuffix.FIRST.getDescriptor());

    ProviderPerson authorPerson = new ProviderPersonImpl(authorName);

    ProviderEmploymentDetail authorsEmploymentDetail = new ProviderEmploymentDetailImpl(
        new OccupationImpl(ANZSCO_1ED_2006.ADMISSIONS_CLERK));

    authorPerson.setEmploymentDetail(authorsEmploymentDetail);

    AustralianAddress address = new AustralianAddressImpl();
    address.addUnstructuredAddressLine("Level 1, 10 Browning street");
    address.setCity("West End");
    address.setState(AustralianStateTerritory.QUEENSLAND.getAbbreviation());
    address.setPostcode("4101");
    ProviderAddress authorOrganisationAddress = new ProviderAddressImpl(false, address,
        AddressPurpose.BUSINESS);

    Telecom authorEmail = new TelecomImpl(TelecomMedium.EMAIL, "info@some-gp.com.au",
        TelecomUse.BUSINESS);
    Telecom authorFax = new TelecomImpl(TelecomMedium.FAX, "0212345678", TelecomUse.BUSINESS);
    Telecom authorTelephone = new TelecomImpl(TelecomMedium.TELEPHONE, "0212345679",
        TelecomUse.BUSINESS);

    EmploymentOrganisationImpl clinicalCoderJob = new EmploymentOrganisationImpl(
        Arrays.asList(new HPIO("8003621231167886")), "Pete's Pathologies");
    clinicalCoderJob.setOrganisationNameUsage(OrganisationNameUsage.BUSINESS_NAME);
    clinicalCoderJob.setEmploymentType(CodeImpl.fromOriginalText("Permanent/Full Time"));
    clinicalCoderJob.setDepartmentUnit("Front Office");
    clinicalCoderJob.setPositionInOrganisation(CodeImpl.fromOriginalText("Counter Staff"));
    clinicalCoderJob.setOccupation(new ANZSCO_1ED_REV1("599915", "Clinical Coder"));

    List<Telecom> electronicCommunicationDetailList = Arrays
        .asList(authorEmail, authorFax, authorTelephone);

    ReferralAuthor author = new ReferralAuthorImpl(authorHPII, authorPerson,
        ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER, clinicalCoderJob);

    author.setQualifications("M.B.B.S., F.R.A.C.S.");
    author.setAddress(authorOrganisationAddress);
    author.setElectronicCommunicationDetail(electronicCommunicationDetailList);

    // ************************
    // ******  Referee  *******
    // ************************
    HPII refereeHPII = new HPII("8003610000001145");
    HPIO refereeHPIO = new HPIO("8003620000045562");

    PersonName referrName = new PersonNameImpl("SpecialistSurname");
    referrName.addPersonNameUsage(PersonNameUsage.REGISTERED_NAME_OR_LEGAL_NAME);
    ProviderPerson particpantPerson = new ProviderPersonImpl(referrName);

    ProviderEmploymentDetail employmentDetails = new ProviderEmploymentDetailImpl(
        ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER);
    particpantPerson.setEmploymentDetail(employmentDetails);

    AustralianAddress refereeAddress = new AustralianAddressImpl();
    refereeAddress.addUnstructuredAddressLine("The Lodge");
    refereeAddress.addUnstructuredAddressLine("10 Browning St");
    refereeAddress.setCity("West End");
    refereeAddress.setState(AustralianStateTerritory.QUEENSLAND.getAbbreviation());
    refereeAddress.setPostcode("4101");
    ProviderAddress refereeProviderAddress = new ProviderAddressImpl(false, refereeAddress,
        AddressPurpose.BUSINESS);

    Telecom participantFax = new TelecomImpl(TelecomMedium.FAX, "0212345678", TelecomUse.BUSINESS);
    Telecom participantTelephone = new TelecomImpl(TelecomMedium.TELEPHONE, "0212345678",
        TelecomUse.BUSINESS);
    List<Telecom> refereeTelecoms = Arrays.asList(participantFax, participantTelephone);

    Organisation refereeOrg = new OrganisationImpl("Sam's Specialist Clinic");
    ReferralParticipant referee = new ReferralParticipantImpl(
        refereeHPII,
        referrName,
        refereeProviderAddress,
        refereeTelecoms,
        refereeHPIO,
        refereeOrg
    );

    // *********************
    // ***** Custodian *****
    // *********************

    AsEntityIdentifier custodianIdentifier = new HPIO("8003621231167886");
    Telecom contact = new TelecomImpl(TelecomMedium.EMAIL, "example@custodian.com.au",
        TelecomUse.BUSINESS);

    AustralianAddress custodianAddress = new AustralianAddressImpl();
    custodianAddress.addUnstructuredAddressLine("99 Clinician Street");
    custodianAddress.setCity("Nehtaville");
    custodianAddress.setState("QLD");
    custodianAddress.setPostcode("5555");
    custodianAddress.setAdditionalLocator("32568931");

    UniqueIdentifier typedDocumentID = new UniqueIdentifierImpl(documentID);

    // you can also use additional identifiers
    UniqueIdentifier otherId = new UniqueIdentifierImpl(UUID.randomUUID().toString());
    CustodianOrganization custodianOrganization = CustodianOrganizationImpl
        .getInstance(Arrays.asList(typedDocumentID, otherId), custodianIdentifier);

    OrganizationName custodianOrganizationName = new OrganizationNameImpl("Custodian organisation");

    custodianOrganization.setName(custodianOrganizationName);
    custodianOrganization.setTelecom(contact);
    custodianOrganization
        .setAddress(new PostalAddressImpl(custodianAddress, PostalAddressUseEnum.POSTAL_ADDRESS));

    AssignedCustodian assignedCustodian = AssignedCustodianImpl.getInstance(custodianOrganization);
    Custodian custodian = CustodianImpl.getInstance(assignedCustodian);

    // *****************************
    // ***** Attached Referral *****
    // *****************************

    AttachedMedia attachment = new AttachedMedia(new File("ReferralDocument.pdf"));
    ReferralDocument refDocument = new ReferralDocumentImpl(attachment);

    // *****************************
    // ***** Clinical Document *****
    // *****************************

    ClinicalDocument document = ClinicalDocumentFactory.getEReferral();
    document.setSetId(documentID);

    // we can set the document number to something other than 1 if required
    document.setVersionNumber(1);

    // as an example we can add another template if needed.
    document.addTemplateId(TemplateIdImpl.getInstance("1.0", "1.2.36.1.2001.1001.100.149"));
    document.setCompletionCode(DocumentStatusCode.FINAL);

    // String documentId =
    // "2.25.36901752580752676809846395044082807160";
    //must be an OID to pass into PCEHR

    // You can also use the conversion tool
    String doucmentUUID = UUID.randomUUID().toString();
    String documentIdAsAnOid = UUIDTool.uuidToOid(doucmentUUID);

    document.setClinicalDocumentId(documentIdAsAnOid);

    ReferralModel model = new ReferralModelImpl(document, subject, author, referee, custodian);

    EReferralCreator eReferralCreator = new EReferralCreator(model, refDocument);
    eReferralCreator.setSchematronResource(SchematronResources.E_REFERRAL_1A.resource());
    //   eReferralCreator.useStrict();
    Document clinicalDocument = eReferralCreator.create();

    String cdaString = TestHelper.documentToXML(clinicalDocument);
    TestHelper.printToFile(cdaString, DOCUMENT_FILE_NAME);
    System.out.println(cdaString);
  }

}
