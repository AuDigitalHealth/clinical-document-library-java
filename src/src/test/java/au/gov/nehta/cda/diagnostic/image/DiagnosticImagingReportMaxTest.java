package au.gov.nehta.cda.diagnostic.image;

import au.gov.nehta.builder.diagnostic.image.DiagnosticImageReportCreator;
import au.gov.nehta.builder.util.UUIDTool;
import au.gov.nehta.cda.test.Base;
import au.gov.nehta.cda.test.TestHelper;
import au.gov.nehta.model.cda.common.address.PostalAddress;
import au.gov.nehta.model.cda.common.address.PostalAddressImpl;
import au.gov.nehta.model.cda.common.address.PostalAddressUseEnum;
import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.cda.common.code.CodeImpl;
import au.gov.nehta.model.cda.common.code.DocumentStatusCode;
import au.gov.nehta.model.cda.common.code.SNOMEDCode;
import au.gov.nehta.model.cda.common.code.SNOMED_AU_Code;
import au.gov.nehta.model.cda.common.code.SNOMED_CT_ResultStatusCode;
import au.gov.nehta.model.cda.common.code.SourceOfDeathNotificationCode;
import au.gov.nehta.model.cda.common.custodian.AssignedCustodian;
import au.gov.nehta.model.cda.common.custodian.AssignedCustodianImpl;
import au.gov.nehta.model.cda.common.custodian.Custodian;
import au.gov.nehta.model.cda.common.custodian.CustodianImpl;
import au.gov.nehta.model.cda.common.custodian.CustodianOrganization;
import au.gov.nehta.model.cda.common.custodian.CustodianOrganizationImpl;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocumentFactory;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifierImpl;
import au.gov.nehta.model.cda.common.id.AssignedEntity;
import au.gov.nehta.model.cda.common.id.AssignedEntityImpl;
import au.gov.nehta.model.cda.common.id.LegalAuthenticator;
import au.gov.nehta.model.cda.common.id.LegalAuthenticatorImpl;
import au.gov.nehta.model.cda.common.id.MedicareCardIdentifier;
import au.gov.nehta.model.cda.common.id.MedicarePrescriberNumber;
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
import au.gov.nehta.model.cda.common.time.TimeQuantity;
import au.gov.nehta.model.cda.common.time.TimeUnitOfMeasure;
import au.gov.nehta.model.cda.diagnostic.DiagnosticImagingReportCdaModel;
import au.gov.nehta.model.clinical.common.ExtendedDemographicDataImpl;
import au.gov.nehta.model.clinical.common.ExtendedSubjectOfCarePerson;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipantImpl;
import au.gov.nehta.model.clinical.common.SubjectOfCarePerson;
import au.gov.nehta.model.clinical.common.participation.ANZSCO_1ED_REV1;
import au.gov.nehta.model.clinical.common.participation.AddressContextImpl;
import au.gov.nehta.model.clinical.common.participation.AddressPurpose;
import au.gov.nehta.model.clinical.common.participation.AustralianAddress;
import au.gov.nehta.model.clinical.common.participation.AustralianAddressImpl;
import au.gov.nehta.model.clinical.common.participation.AustralianStateTerritory;
import au.gov.nehta.model.clinical.common.participation.CountryEnum;
import au.gov.nehta.model.clinical.common.participation.CountryStateImpl;
import au.gov.nehta.model.clinical.common.participation.DateAccuracy;
import au.gov.nehta.model.clinical.common.participation.DateAccuracyImpl;
import au.gov.nehta.model.clinical.common.participation.DateOfBirthDetail;
import au.gov.nehta.model.clinical.common.participation.DateOfBirthDetailImpl;
import au.gov.nehta.model.clinical.common.participation.DateOfDeathImpl;
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
import au.gov.nehta.model.clinical.common.types.PathologyId;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;
import au.gov.nehta.model.clinical.diagnostic.imaging.AnatomicalSite;
import au.gov.nehta.model.clinical.diagnostic.imaging.AnatomicalSiteImpl;
import au.gov.nehta.model.clinical.diagnostic.imaging.DiagnosticImageOrderDetails;
import au.gov.nehta.model.clinical.diagnostic.imaging.DiagnosticImageOrderDetailsImpl;
import au.gov.nehta.model.clinical.diagnostic.imaging.DiagnosticImageReportContent;
import au.gov.nehta.model.clinical.diagnostic.imaging.DiagnosticImageReportContentImpl;
import au.gov.nehta.model.clinical.diagnostic.imaging.DiagnosticImageReportContext;
import au.gov.nehta.model.clinical.diagnostic.imaging.DiagnosticImageReportContextImpl;
import au.gov.nehta.model.clinical.diagnostic.imaging.DiagnosticImageResultReport;
import au.gov.nehta.model.clinical.diagnostic.imaging.DiagnosticImageResultReportImpl;
import au.gov.nehta.model.clinical.diagnostic.imaging.ImagingExaminationResult;
import au.gov.nehta.model.clinical.diagnostic.imaging.ImagingExaminationResultImpl;
import au.gov.nehta.model.clinical.diagnostic.pathology.DocumentParticipant;
import au.gov.nehta.model.clinical.diagnostic.pathology.DocumentParticipantImpl;
import au.gov.nehta.model.clinical.diagnostic.pathology.EmploymentOrganisationImpl;
import au.gov.nehta.model.clinical.diagnostic.pathology.PathologyParticipantImpl;
import au.gov.nehta.model.clinical.diagnostic.pathology.ReportDocument;
import au.gov.nehta.model.clinical.diagnostic.pathology.ReportDocumentImpl;
import au.gov.nehta.model.clinical.diagnostic.pathology.RequesterParticipant;
import au.gov.nehta.model.clinical.diagnostic.pathology.RequesterParticipantImpl;
import au.gov.nehta.model.clinical.diagnostic.pathology.RequesterParticipation;
import au.gov.nehta.model.clinical.diagnostic.pathology.RequesterParticipationImpl;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.gov.nehta.model.clinical.etp.common.participation.AddressContext;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;
import au.gov.nehta.model.clinical.etp.common.participation.EntitlementImpl;
import au.gov.nehta.model.clinical.etp.common.participation.EntitlementType;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderAddress;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderAddressImpl;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderEmploymentDetail;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderEmploymentDetailImpl;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderPerson;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderPersonImpl;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.gov.nehta.schematron.Schematron;
import au.gov.nehta.schematron.SchematronCheckResult;
import au.net.electronichealth.ns.cda._2_0.NullFlavor;
import java.io.File;
import java.io.IOException;
import java.net.URISyntaxException;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import junit.framework.Assert;
import org.joda.time.DateTime;
import org.joda.time.LocalDate;
import org.junit.Test;
import org.w3c.dom.Document;

public class DiagnosticImagingReportMaxTest extends Base {

  private static final String SCHEMATRON = "ccd-3B.sch";
  private static final String SCHEMATRON_TEMPLATE_PATH = "resources/DiagnosticImagingReport";

  private static final String DOCUMENT_FILE_NAME =
     TEST_GENERATION + "diagnosticImage-device-max.xml";

  @Test
  public void test_MAX_DiagnosticImageReportCreation()
      throws ParserConfigurationException, JAXBException, SchematronValidationException, IOException, ParseException,
      URISyntaxException {
    generateMax();
    SchematronCheckResult check = Schematron.check(
        SCHEMATRON_TEMPLATE_PATH, SCHEMATRON, DOCUMENT_FILE_NAME);

    show(check);
    System.out.println("schema errors:" + check.schemaErrors.size());
    System.out.println("schematronErrors errors:" + check.schematronErrors.size());
    Assert.assertTrue(check.schemaErrors.size() == 0);
    Assert.assertTrue(check.schematronErrors.size() == 0);
  }

  public void generateMax()
      throws ParserConfigurationException, JAXBException, SchematronValidationException {
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

    DateAccuracy dobAccuracy = new DateAccuracyImpl(true, true, true);
    DateOfBirthDetail subjectDOB = new DateOfBirthDetailImpl(dob, dobAccuracy);
    subjectDOB.setDateOfBirthAccuracyIndicator(dobAccuracy);
    subjectDOB.setDateOfBirthIsCalculatedFromAge(true);

    ExtendedDemographicDataImpl demoData = new ExtendedDemographicDataImpl(Sex.MALE, subjectDOB);
    demoData.setMothersOriginalFamilyName("O'Maiden");
    DateAccuracy deathDateAccuracy = new DateAccuracyImpl(true, true, true);
    DateTime deathDate = new DateTime(1980, 1, 1, 0, 0, 0, 0);
    demoData.setDateOfDeath(new DateOfDeathImpl(deathDate, deathDateAccuracy,
        SourceOfDeathNotificationCode.HEALTH_CARE_PROVIDER));

    demoData.setBirthPlurality(5);
    demoData.setBirthOrder(2);
    int age = 31;
    demoData.setAgeInYears(age);
    demoData.setAgeAccurate(true);
    demoData.setIndigenousStatus(IndigenousStatus.NOT_STATED_OR_INADEQUATELY_DESCRIBED);
    demoData.setBirthPlace(new CountryStateImpl(CountryEnum.AUSTRALIA.getDescriptor(),
        AustralianStateTerritory.NEW_SOUTH_WALES.getAbbreviation()));

    SubjectOfCarePerson subjectOfCarePerson = new ExtendedSubjectOfCarePerson(subjectPersonName,
        demoData);
    MedicareCardIdentifier medicareCard = new MedicareCardIdentifier("4324567871");
    SubjectOfCareParticipant subject = new SubjectOfCareParticipantImpl(
        Arrays.asList(subjectIHI, medicareCard), subjectOfCareAddress, subjectOfCarePerson);

    Telecom subjectTelephone = new TelecomImpl(TelecomMedium.TELEPHONE, "0712345678",
        TelecomUse.PERSONAL);

    Telecom subjectEmail = new TelecomImpl(TelecomMedium.EMAIL,
        "frank.harding@electronichealth.net.au", TelecomUse.PERSONAL);

    List<Telecom> subjectOfCareElectronicCommunicationDetailList = new ArrayList<>();
    subjectOfCareElectronicCommunicationDetailList.add(subjectTelephone);
    subjectOfCareElectronicCommunicationDetailList.add(subjectEmail);

    subject.setElectronicCommunicationDetails(subjectOfCareElectronicCommunicationDetailList);

    Entitlement subjectEntitlement = new EntitlementImpl(medicareCard,
        EntitlementType.MEDICARE_BENEFITS);

    subjectEntitlement.setEntitlementValidityDuration(RestrictedTimeInterval.getLowWidthInstance(
        // from today(day only precision) for two weeks
        new PrecisionDate(Precision.DAY, now), new TimeQuantity(2, TimeUnitOfMeasure.WEEK)));

    List<Entitlement> subjectOfCareEntitlementList = new ArrayList<>();
    subjectOfCareEntitlementList.add(subjectEntitlement);
    subject.setEntitlements(subjectOfCareEntitlementList);

    // ************************
    // ***** Author *****
    // ************************
    HPII authorHPII = new HPII("8003610000001145");

    PersonName authorPersonName = new PersonNameImpl("Patrick");
    authorPersonName.addGivenName("Pathologist");
    authorPersonName.addNameTitle(NameTitle.MISTER.getDescriptor());

    Occupation authorOccupation = new OccupationImpl(
        new ANZSCO_1ED_REV1("599915", "Clinical Coder"));
    ProviderEmploymentDetail providerEmploymentDetail = new ProviderEmploymentDetailImpl(
        authorOccupation);
    ProviderPerson authorPerson = new ProviderPersonImpl(authorPersonName);
    authorPerson.setEmploymentDetail(providerEmploymentDetail);

    /*AustralianAddress fullAddress = new AustralianAddressImpl();
    fullAddress.addUnstructuredAddressLine("Level 1, 10 Browning street");
    fullAddress.setCity("West End");
    fullAddress.setState(AustralianStateTerritory.QUEENSLAND.getAbbreviation());
    fullAddress.setPostcode("4101");
    ProviderAddress authorOrganisationAddress = new ProviderAddressImpl(false, fullAddress,
        AddressPurpose.BUSINESS);

    Telecom authorEmail = new TelecomImpl(TelecomMedium.EMAIL, "info@some-gp.com.au",
        TelecomUse.BUSINESS);
    Telecom authorFax = new TelecomImpl(TelecomMedium.FAX, "0212345678", TelecomUse.BUSINESS);
    Telecom authorTelephone = new TelecomImpl(TelecomMedium.TELEPHONE, "0212345678",
        TelecomUse.BUSINESS);*/

/*
    AsEntityIdentifier nataLabID = new AsEntityIdentifierImpl();
    nataLabID.setExtension("3715");
    nataLabID.setAssigningAuthorityName("NATA");
    nataLabID.setRoot("1.2.36.1.2001.1005.12");
*/

    /*CodeImpl nataLabCode = new CodeImpl();
    nataLabCode.setDisplayName("Organization identifier");
    nataLabCode.setCodeSystemName("Identifier Type (HL7)");
    nataLabCode.setCodeSystem("2.16.840.1.113883.12.203");
    nataLabCode.setCode("XX");
    nataLabID.setCode(nataLabCode);*/

    String hpioNumber = "8003621231167886";
    EmploymentOrganisationImpl pathologyLabEmployment = new EmploymentOrganisationImpl(

        Arrays.asList(new HPIO(hpioNumber)/*, nataLabID*/),
        "Pete's Pathologies");
    pathologyLabEmployment.setOrganisationNameUsage(OrganisationNameUsage.BUSINESS_NAME);
    pathologyLabEmployment.setEmploymentType(CodeImpl.fromOriginalText("Permanent/Full Time"));
    pathologyLabEmployment.setDepartmentUnit("Front Office");
    pathologyLabEmployment.setPositionInOrganisation(CodeImpl.fromOriginalText("Counter Staff"));
    pathologyLabEmployment.setOccupation(new ANZSCO_1ED_REV1("253915", "Pathologist"));

    /*List<Telecom> electronicCommunicationDetailList = Arrays
        .asList(authorEmail, authorFax, authorTelephone);*/

    PathologyParticipantImpl authorParticipant = new PathologyParticipantImpl(authorHPII,
        authorPerson, pathologyLabEmployment, null/*authorOrganisationAddress*/,
        null/*electronicCommunicationDetailList*/);

    Entitlement entitlement = new EntitlementImpl(new MedicarePrescriberNumber("1234567A"),
        EntitlementType.MEDICARE_PRESCRIBER_NUMBER);
    entitlement.setEntitlementValidityDuration(RestrictedTimeInterval.getLowInstance(
        // from today(day only precision)
        new PrecisionDate(Precision.DAY, now)));

    authorParticipant.addEntitlement(entitlement);

    Entitlement entitlement2 = new EntitlementImpl(new MedicarePrescriberNumber("1234567B"),
        EntitlementType.MEDICARE_PRESCRIBER_NUMBER);
    entitlement2.setEntitlementValidityDuration(RestrictedTimeInterval.getLowInstance(
        // from today(day only precision)
        new PrecisionDate(Precision.DAY, now)));

    authorParticipant.addEntitlement(entitlement2);
    authorParticipant.setQualifications("M.B.B.S., F.R.A.C.S.");

    DocumentParticipant author = new DocumentParticipantImpl(authorOccupation, authorParticipant);

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

    ProviderEmploymentDetail requesterEmploymentDetail = new ProviderEmploymentDetailImpl(
        requesterOccupation);
    PersonName requesterPersonName = new PersonNameImpl("Requester");
    ProviderPerson requesterPerson = new ProviderPersonImpl(requesterPersonName);
    requesterPerson.setEmploymentDetail(requesterEmploymentDetail);

    List<HPIO> organisationIds = Arrays.asList(new HPIO(hpioNumber));
    Organisation clinic = new OrganisationImpl("Cool CLinic", OrganisationNameUsage.BUSINESS_NAME);
    RequesterParticipant requesterParticipant = new RequesterParticipantImpl(
        null, null, clinic, requesterPerson);
    requesterParticipant.setAddress(requesterAddress);
    requesterParticipant.addEntitlement(requesterEntitlement);
    requesterParticipant.setElectronicCommunicationDetail(requesterComms);

    RequesterParticipation requester = new RequesterParticipationImpl(doctor, requesterParticipant,
        now);

    DiagnosticImageOrderDetails order = new DiagnosticImageOrderDetailsImpl(
        /*PathologyId.orderID(hpioNumber)*/null, PathologyId.diAccessionID(hpioNumber),
        new SNOMEDCode("26604007", "Complete blood count"));

    DiagnosticImageReportContext imageContext = new DiagnosticImageReportContextImpl(subject,
        requester, author, order);

    // DocumentAuthorOrDevice reportingPathologis DocumentAuthorOrDevice reportingPathologist =
    // DocumentAuthorOrDeviceImpl.getAuthorAsAPerson(
    // author.getParticipant(), authorOccupation );
    DocumentParticipant reportingPathologist = new DocumentParticipantImpl(authorOccupation,
        authorParticipant);

    UniqueIdentifier doucmentID = new UniqueIdentifierImpl("1.2.36.1.2001.1005.54.8003621231167886",
        "ABC");
    AttachedMedia testResult = new AttachedMedia(new File("test-result.pdf"));
    String title = "Serum and Glucose Report for Peter Patient";

    //add an original text without changing the static code for all users
    Code code = SNOMED_CT_ResultStatusCode.FINAL_RESULTS.copy();
    code.setOriginalText("Final Results");

    ReportDocument testResultDocument = new ReportDocumentImpl(title, testResult, doucmentID, code,
        now);

    AnatomicalSite leftThorax = new AnatomicalSiteImpl(
        new SNOMED_AU_Code("51185008", "thorax"),
        new SNOMED_AU_Code("7771000", "left")
    );

    AnatomicalSite anatomicalSiteWithNullFlavor = new AnatomicalSiteImpl(NullFlavor.NI);

    List<AnatomicalSite> sites = new ArrayList<>();
    sites.add(new AnatomicalSiteImpl("upper chest"));
    sites.add(leftThorax);
    sites.add(anatomicalSiteWithNullFlavor);

    ImagingExaminationResult result1 = ImagingExaminationResultImpl.base(
        new SNOMED_AU_Code("399208008", "chest x-ray"),
        new SNOMED_AU_Code("363680008", "x-ray"),
        SNOMED_CT_ResultStatusCode.FINAL_RESULTS,
        PrecisionDate.today(),
        "The examination was carried out using the particular procedure.",
        /*new AnatomicalRegionImpl(NCTISAnatomicalRegion.Region.CHEST, "Chest/Thorax")*/null
    );

    ImagingExaminationResult result2 = ImagingExaminationResultImpl.withRelatedImage(
        new SNOMED_AU_Code("241601008", "Magnetic resonance imaging of head (procedure)"),
        new SNOMED_AU_Code("113091000", "Magnetic resonance imaging (procedure)"),
        SNOMED_CT_ResultStatusCode.RESULTS_STORED,
        PrecisionDate.today(),
        "The examination was carried out using the particular procedure.",
        /*new AnatomicalRegionImpl(NCTISAnatomicalRegion.Region.HEAD, "Head/Cerebral cortex")*/null,
        "x-ray.png"
    );

    List<AnatomicalSite> sitesForResult3 = new ArrayList<>();
    sitesForResult3
        .add(new AnatomicalSiteImpl(new SNOMED_AU_Code("123850002", "Head part (body structure)")));
    sitesForResult3.add(leftThorax);

    ImagingExaminationResult result3 = ImagingExaminationResultImpl.withSites(
        new SNOMED_AU_Code("241601008", "Magnetic resonance imaging of head (procedure)"),
        new SNOMED_AU_Code("113091000", "Magnetic resonance imaging (procedure)"),
        SNOMED_CT_ResultStatusCode.CORRECTION_TO_RESULTS,
        PrecisionDate.today(),
        "The examination was carried out using the particular procedure.",
        /*new AnatomicalRegionImpl(NCTISAnatomicalRegion.Region.HEAD, "Head/Cerebral cortex")*/null,
        sitesForResult3
    );

    ImagingExaminationResult result4 = ImagingExaminationResultImpl.withSitesAndRelatedImage(
        new SNOMED_AU_Code("241601008", "Magnetic resonance imaging of head (procedure)"),
        new SNOMED_AU_Code("113091000", "Magnetic resonance imaging (procedure)"),
        SNOMED_CT_ResultStatusCode.SOME_BUT_NOT_ALL,
        PrecisionDate.today(),
        "The examination was carried out using the particular procedure.",
        /*new AnatomicalRegionImpl(NCTISAnatomicalRegion.Region.HEAD, "Head/Cerebral cortex")*/null,
        sites,
        "http://a.uri.for.this.image/id/3213131"
    );

    List<ImagingExaminationResult> imageResults = Arrays.asList(result1, result2, result3, result4);

    DiagnosticImageReportContent diagnosticImageContent = new DiagnosticImageReportContentImpl(
        imageResults, testResultDocument, reportingPathologist/*, authorisationToPost*/);

    // Create Pathology Report
    DiagnosticImageResultReport diagnosticImageReport = new DiagnosticImageResultReportImpl(
        imageContext, diagnosticImageContent);

    String documentID = UUID.randomUUID().toString();

    // *******************************
    // ***** Legal Authenticator *****
    // *******************************

    List<PersonName> legalAuthenticatorsNames = new ArrayList<>(2);

    legalAuthenticatorsNames.add(PersonNameImpl
        .getInstance("Black", "Jane", NameTitle.MRS.getDescriptor(),
            NameSuffix.JUNIOR.getDescriptor(), PersonNameUsage.REGISTERED_NAME_OR_LEGAL_NAME));
    legalAuthenticatorsNames.add(PersonNameImpl
        .getInstance("Alias", "other", NameTitle.MISS.getDescriptor(),
            PersonNameUsage.MAIDEN_NAME_OR_NAME_AT_BIRTH));

    AsEntityIdentifier authenticatorHPII = new HPII("8003610000001145");
    Person legalAuthenticatorPerson = PersonImpl
        .getInstance(authenticatorHPII, legalAuthenticatorsNames);

    // This is an alternate way of doing a HPIO, HPII or other identifier
    // AsEntityIdentifier hpioTheHardWay =
    // AsEntityIdentifierImpl.getInstance(
    // "1.2.36.1.2001.1003.0.800362555555" );
    // hpioTheHardWay.setAssigningAuthorityName( "HPI-O" );
    // hpioTheHardWay.setAssigningGeographicAreaName( "National Identifier"
    // );

    /*HPIO authenticatorHPIO = new HPIO(hpioNumber);*/

    Organization legalAuthenticatorOrganisation = OrganizationImpl
        .getInstance(null, null);

    AssignedEntity cdaLegalAuthenticatorAssignedEntity = AssignedEntityImpl
        .getInstance(documentID, legalAuthenticatorPerson, legalAuthenticatorOrganisation);

    // You can also create a code the hard way...
    Code cdaLegalAuthenticatorAssignedEntityCode = new CodeImpl("253111");
    cdaLegalAuthenticatorAssignedEntityCode.setCodeSystem("2.16.840.1.113883.13.62");
    cdaLegalAuthenticatorAssignedEntityCode.setCodeSystemName(
        "1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, Revision 1\"");
    cdaLegalAuthenticatorAssignedEntityCode.setDisplayName("General Medical Practitioner");

    // ...or use a pre-baked version
    cdaLegalAuthenticatorAssignedEntity
        .setCode(new ANZSCO_1ED_REV1("253111", "General Medical Practitioner"));

    AustralianAddress authenticatorAddress = new AustralianAddressImpl();
    authenticatorAddress.addUnstructuredAddressLine("101 Browning Street");
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
        .getInstance(now, cdaLegalAuthenticatorAssignedEntity);

    // *********************
    // ***** Custodian *****
    // *********************

    AsEntityIdentifier custodianIdentifier = new HPIO(hpioNumber);
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
    Custodian cdaCustodian = CustodianImpl.getInstance(assignedCustodian);

    ClinicalDocument document = ClinicalDocumentFactory.getDiagnosticImagingReport();
    document.setSetId(documentID);

    // we can set the document number to something other than 1 if required
    document.setVersionNumber(2);

    // as an example we can add another template if needed.
    document.addTemplateId(TemplateIdImpl.getInstance("1.0", "1.2.36.1.2001.1001.100.149"));
    document.setCompletionCode(DocumentStatusCode.FINAL);

    // prescriptionIdentifier
    // String prescriptionDocumentId =
    // "2.25.36901752580752676809846395044082807160"; //must be an OID to
    // pass into PCEHR

    // You can also use the conversion tool
    String doucmentUUID = UUID.randomUUID().toString();
    String documentIdAsAnOid = UUIDTool.uuidToOid(doucmentUUID);

    document.setClinicalDocumentId(documentIdAsAnOid);

    DiagnosticImagingReportCdaModel model = new DiagnosticImagingReportCdaModel(document,
        cdaLegalAuthenticator, cdaCustodian, now);
    DiagnosticImageReportCreator diCreator = new DiagnosticImageReportCreator(model,
        diagnosticImageReport);

    Document clinicalDocument = diCreator.create();

    String cdaString = TestHelper.documentToXML(clinicalDocument);
    TestHelper.printToFile(cdaString, DOCUMENT_FILE_NAME);
    System.out.println(cdaString);
  }


}

