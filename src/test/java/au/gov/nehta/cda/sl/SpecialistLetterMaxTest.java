package nehta.cda.sl;

import au.gov.nehta.builder.common.NCTISChanceTypeValues;
import au.gov.nehta.builder.common.NCTISRecommendationOrChangeValues;
import au.gov.nehta.builder.sl.SpecialistLetterCreator;
import au.gov.nehta.builder.util.UUIDTool;
import au.gov.nehta.cda.es.EventSummaryTestHelper;
import au.gov.nehta.cda.test.Base;
import au.gov.nehta.cda.test.TestHelper;
import au.gov.nehta.model.cda.common.ElectronicCommunicationDetail;
import au.gov.nehta.model.cda.common.ElectronicCommunicationMedium;
import au.gov.nehta.model.cda.common.ElectronicCommunicationUsage;
import au.gov.nehta.model.cda.common.code.*;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocumentFactory;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifierImpl;
import au.gov.nehta.model.cda.common.participant.EmploymentOrganization;
import au.gov.nehta.model.cda.common.participant.EmploymentOrganizationImpl;
import au.gov.nehta.model.cda.common.person_org.PersonHealthcareProvider;
import au.gov.nehta.model.cda.common.person_org.PersonImpl;
import au.gov.nehta.model.cda.common.time.*;
import au.gov.nehta.model.cda.sl.SpecialistLetterCDAModel;
import au.gov.nehta.model.clinical.common.DocumentAuthor;
import au.gov.nehta.model.clinical.common.EventTypes;
import au.gov.nehta.model.clinical.common.address.Address;
import au.gov.nehta.model.clinical.common.address.AustralianAddress;
import au.gov.nehta.model.clinical.common.address.*;
import au.gov.nehta.model.clinical.common.participation.*;
import au.gov.nehta.model.clinical.common.types.*;
import au.gov.nehta.model.clinical.es.AdverseReaction;
import au.gov.nehta.model.clinical.es.AdverseReactionImpl;
import au.gov.nehta.model.clinical.es.*;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.gov.nehta.model.clinical.etp.common.participation.EntitlementType;
import au.gov.nehta.model.clinical.etp.common.participation.*;
import au.gov.nehta.model.clinical.shs.ExclusionStatement;
import au.gov.nehta.model.clinical.shs.ExclusionStatementImpl;
import au.gov.nehta.model.clinical.sl.Procedure;
import au.gov.nehta.model.clinical.sl.*;
import au.gov.nehta.model.clinical.sr.ServiceReferral;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.gov.nehta.schematron.Schematron;
import au.gov.nehta.schematron.SchematronCheckResult;
import junit.framework.Assert;
import org.joda.time.DateTime;
import org.junit.Test;
import org.w3c.dom.Document;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.util.*;

import static au.gov.nehta.cda.es.EventSummaryTestHelper.getAttachedMedia;
import static au.gov.nehta.cda.test.TestHelper.*;
import static au.gov.nehta.model.schematron.SchematronResource.SchematronResources.SPECIALIST_LETTER_3A;

public class SpecialistLetterMaxTest extends Base {

  private static final String SCHEMATRON = SPECIALIST_LETTER_3A.resource().getSchematron();
  //  private static final String SCHEMATRON = SPECIALIST_LETTER_3B.resource().getSchematron();
  private static String SCHEMATRON_TEMPLATE_PATH = "resources/SpecialistLetter";
  private static final String DOCUMENT_FILE_NAME = TEST_GENERATION + "/sl/sl-max-java.xml";
  private DateTime now = new DateTime();

  @Test
  public void test_MAX_Specialist_Letter_Creation() {
    try {
      if (!new File(SCHEMATRON_TEMPLATE_PATH + "/schematron/schematron-Validator-report.xsl").exists()) {
        SCHEMATRON_TEMPLATE_PATH = "src/" + SCHEMATRON_TEMPLATE_PATH;
      }
      generateMax();
      SchematronCheckResult check =
          Schematron.check(SCHEMATRON_TEMPLATE_PATH, SCHEMATRON, DOCUMENT_FILE_NAME);
      show(check);
      Assert.assertEquals(0, check.schemaErrors.size());
      Assert.assertEquals(0, check.schematronErrors.size());
    } catch (SchematronValidationException | ParserConfigurationException | JAXBException e) {
      e.printStackTrace();
    }
  }

  private void generateMax()
      throws SchematronValidationException, JAXBException, ParserConfigurationException {

    // Prepare Specialist Letter Context
    ParticipationServiceProvider referrer = getCurrentServiceProviderIndividual();
    DocumentAuthor documentAuthor = getDocumentAuthor(now);
    SpecialistLetterContext specialistLetterContext =
        new SpecialistLetterContextImpl(getSubjectOfCareParticipant(), documentAuthor,
            getUsualGP(), referrer);
    specialistLetterContext
        .setDateTimeSubjectOfCareSeen(new PrecisionDate(Precision.DAY, now.minusDays(1)));
    specialistLetterContext
        .setDateTimeAuthored(new PrecisionDate(Precision.DAY, now.minusHours(6)));
    specialistLetterContext
        .setDateTimeAttested(new PrecisionDate(Precision.DAY, now.minusHours(4)));

    // Prepare Specialist Letter Content
    SpecialistLetterContent specialistLetterContent = new SpecialistLetterContentImpl(
        getResponseDetails(), getRecommendations(), getMedications(),
        getNewlyIdentifiedAdverseReactions(), getDiagnosticInvestigations(true, true, true, true));

    SpecialistLetter specialistLetter = new SpecialistLetterImpl();
    specialistLetter.setContext(specialistLetterContext);
    specialistLetter.setContent(specialistLetterContent);

    ClinicalDocument cdaClinicalDocument = ClinicalDocumentFactory.getSpecialistLetter();
    cdaClinicalDocument.setClinicalDocumentId(UUIDTool.uuidToOid(UUID.randomUUID().toString()));

    cdaClinicalDocument.setLanguageCode("en-AU");
    cdaClinicalDocument.setVersionNumber(1);
    cdaClinicalDocument.setCompletionCode(DocumentStatusCode.FINAL);

    SpecialistLetterCDAModel specialistLetterCDAModel = new SpecialistLetterCDAModel(
        cdaClinicalDocument, getInformationRecipients(), now);
    specialistLetterCDAModel.setUsualGP(getUsualGP());
    specialistLetterCDAModel.setReferrer(referrer);
    specialistLetterCDAModel.setCustodian(getCustodian());

    specialistLetterCDAModel.setLegalAuthenticator(getLegalAuthenticator(now));
    SpecialistLetterCreator specialistLetterCreator = new SpecialistLetterCreator(
        specialistLetterCDAModel,
        specialistLetter);

    Document clinicalDocument = specialistLetterCreator.create();
    String cdaString = TestHelper.documentToXML(clinicalDocument);
    TestHelper.printToFile(cdaString, DOCUMENT_FILE_NAME);
    System.out.println(cdaString);

  }

  private ParticipationServiceProvider getUsualGP() {
    ParticipationServiceProvider usualGP = new ParticipationServiceProviderImpl();
    usualGP.setRole(new CodeImpl("253111", "2.16.840.1.113883.13.62",
        "1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, 2006",
        "General Medical Practitioner"));
    usualGP.setParticipant(getServiceProviderIndividual());
    return usualGP;
  }

  private Recommendations getRecommendations() {
    Recommendations recommendations = new RecommendationsImpl();
    ParticipationServiceProvider addressee = new ParticipationServiceProviderImpl();
    addressee.setRole(new CodeImpl("252511", "2.16.840.1.113883.13.62",
        "1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, 2006",
        "Physiotherapist", "Physiotherapist"));
    addressee.setParticipationPeriod(RestrictedTimeInterval.getLowHighInstance(
        new PrecisionDate(Precision.DAY, now.plusHours(4)),
        new PrecisionDate(Precision.DAY, now.plusDays(1))));
    addressee.setParticipant(getServiceProviderIndividual());
    recommendations.setRecommendations(new ArrayList<Recommendation>() {{
      add(new Recommendation() {{
        setAddressee(addressee);
        setRecommendationNarrative(
            "Please arrange a follow up appointment with a community physiotherapist in one week to ensure that post-surgical mobility outcomes are being met.");

        /* There are basically three possibilities for setting the time frame below:
          1.	A DateTime. E.g. <effectiveTime value="20190901" />
              Recommendations should be done by this date "20190901".
          2.	A duration. E.g.<effectiveTime> <width unit="d" value="5"/> </effectiveTime>
              Recommendations should be done for 5 days, it doesn't matter when you should do it.
          3.	A duration with a date. E.g.<effectiveTime value="20190901"><width unit="d" value="5"/></effectiveTime>
              This means the recommendations should be done for 5 days by the date "20190901".*/
        setTimeFrame(RestrictedTimeInterval.getLowWidthInstance(
            new PrecisionDate(Precision.DAY, new DateTime("2019-09-26")),
            new TimeQuantity(4, TimeUnitOfMeasure.MONTH)));
      }});
    }});
    /*RecommendationsExclusion recommendationsExclusion = new RecommendationsExclusion();
    recommendationsExclusion.setGeneralStatement("Write recommendations exclusion statement here");
    recommendations.setRecommendationsExclusion(recommendationsExclusion);*/
    return recommendations;
  }

  private ResponseDetails getResponseDetails() {
    ResponseDetails responseDetails = new ResponseDetailsImpl();
    responseDetails.setDiagnoses(new ArrayList<Diagnosis>() {{
      add(new Diagnosis() {{
        setDiagnosisName(new CodeImpl("236629009", "2.16.840.1.113883.6.96", "SNOMED-CT",
            "Chronic radiation cystitis", "Chronic radiation cystitis") {{
          setCodeSystemVersion("20090731");
        }});
      }});
    }});
    responseDetails
        .setOtherDiagnosisProcedureEntries(new ArrayList<OtherDiagnosisProcedureEntry>() {{
          add(new OtherDiagnosisProcedureEntry() {{
            setOtherDiagnosisOrProcedureName("Text description of first Diagnosis Procedure Entry");
          }});
        }});
    responseDetails.setProcedures(new ArrayList<Procedure>() {{
      add(new Procedure() {{
        setProcedureName(
            new CodeImpl("397956004", "2.16.840.1.113883.6.96", "SNOMED-CT",
                "Prosthetic arthroplasty of the hip"));
      }});
    }});
    responseDetails.setResponseNarrative(new ResponseNarrative() {{
      setNarrative("Response Narrative Text");
    }});
    return responseDetails;
  }

  private NewlyIdentifiedAdverseReactions getNewlyIdentifiedAdverseReactions() {
    List<AdverseReaction> adverseReactions = new ArrayList<>();
    AdverseReaction adverseReaction = new AdverseReactionImpl();
    ReactionEvent reactionEvent = new ReactionEventImpl();
    List<Coded> manifestations = new ArrayList<>();
    Coded manifestation =
        new CodeImpl("39579001", "2.16.840.1.113883.6.96", "SNOMED CT",
            "Anaphylaxis", "Anaphylaxis");
    manifestations.add(manifestation);

    reactionEvent.setManifestations(manifestations);

    Coded reactionType =
        new CodeImpl("419076005", "2.16.840.1.113883.6.96", "SNOMED CT",
            "Allergic reaction", "Allergic reaction");
    reactionEvent.setReactionType(reactionType);

    adverseReaction.setSubstanceOrAgent(
        new CodeImpl("385420005", "2.16.840.1.113883.6.96", "SNOMED CT",
            "Contrast media", "Contrast media"));
    adverseReaction.setReactionEvent(reactionEvent);
    adverseReactions.add(adverseReaction);
    return new NewlyIdentifiedAdverseReactionsImpl(adverseReactions, null);
  }

  private DiagnosticInvestigations getDiagnosticInvestigations(boolean showPathologyTestResults,
                                                               boolean showImagingExaminationResults, boolean showRequestedServices,
                                                               boolean showOtherTestResults) {
    DiagnosticInvestigations diagnosticInvestigations = new DiagnosticInvestigationsImpl();
    //Pathology Test Results
    if (showPathologyTestResults) {
      List<PathologyTestResult> pathologyTestResults = new ArrayList<>();
      pathologyTestResults.add(EventSummaryTestHelper.createPathologyResults(true));
      diagnosticInvestigations.setPathologyTestResults(pathologyTestResults);
    }
    //Imaging Examination Results
    if (showImagingExaminationResults) {
      List<ImagingExaminationResult> imagingExaminationResults = new ArrayList<>();
      imagingExaminationResults.add(getImagingExaminationResult());
      diagnosticInvestigations.setImagingExaminationResults(imagingExaminationResults);
    }
    //Requested Services
    if (showRequestedServices) {
      List<RequestedService> requestedServices = new ArrayList<>();
      requestedServices
          .add(getRequestedService(getServiceProviderIndividual(), EventTypes.EVENT)); //Ind
      requestedServices
          .add(getRequestedService(getServiceProviderOrganization(), EventTypes.INTENT)); //Org
      diagnosticInvestigations.setRequestedServices(requestedServices);
    }
    //Other test results
    if (showOtherTestResults) {
      List<OtherTestResult> otherTestResults = new ArrayList<>();
      otherTestResults.add(getOtherTestResultWithContent());
      otherTestResults.add(getOtherTestResultWithReportFile());
      diagnosticInvestigations.setOtherTestResults(otherTestResults);
    }
    return diagnosticInvestigations;
  }

  private OtherTestResult getOtherTestResultWithReportFile() {
    AttachedMedia reportFile = TestHelper.getAttachedMediaPDF("radiologyreport.pdf");
    return new OtherTestResultImpl(new CodeImpl() {{
      setOriginalText("Report Name (with attachment)");
    }},
        new CodeImpl("3", "1.2.36.1.2001.1001.101.104.16501", "NCTIS Result Status Values",
            "Final"), new PrecisionDate(Precision.DAY, new DateTime("2018-1-1")),
        reportFile);
  }

  private OtherTestResult getOtherTestResultWithContent() {
    String reportContent = "    GLUCOSE - FASTING\n"
        + "\n"
        + "         BLOOD GLUCOSE                 10.8 * mmol/L         (3.9-6.0)\n"
        + "\n"
        + "      Values for Diagnosis of Diabetes Mellitus and other Hyperglycaemia\n"
        + "\n"
        + "       DIABETES MELLITUS (DM)\n"
        + "         Fasting                & > 6.9  mmol/L\n"
        + "         or 2 hrs post load     & > 11.0 mmol/L\n"
        + "\n"
        + "       IMPAIRED FASTING GLYCAEMIA (IFG)\n"
        + "         Fasting                & > 6.0 mmol/L and & < 7.0 mmol/L\n"
        + "\n"
        + "\n"
        + "\n"
        + "    Date Collected  : 07/07/2005\n"
        + "    Time Collected  : 12:15                 Reference\n"
        + "    Episode         : 1    Units      Range\n"
        + "    ==============    ==========\n"
        + "\n"
        + "\n"
        + "    GLUCOSE - FASTING\n"
        + "    BLOOD GLUCOSE   : 10.8 *     mmol/L     (3.9-6.0)";
    return new OtherTestResultImpl(new CodeImpl() {{
      setOriginalText("Report Name");
    }}, new CodeImpl("3", "1.2.36.1.2001.1001.101.104.16501", "NCTIS Result Status Values",
        "Final"), new PrecisionDate(Precision.DAY, now.plusHours(4)), reportContent);
  }

  private RequestedService getRequestedService(ServiceProvider serviceProvider,
                                               EventTypes eventType) {
    RequestedService requestedService = new RequestedServiceImpl();
    requestedService.setCustomNarrative(null);
    ParticipationServiceProvider participantServiceProvider =
        new ParticipationServiceProviderImpl();

    participantServiceProvider.setParticipant(serviceProvider);
    participantServiceProvider.setRole(
        new CodeImpl(
            "309964003",
            "2.16.840.1.113883.6.96",
            "SNOMED-CT",
            "Radiology Department",
            "Radiology Department"));
    participantServiceProvider.setParticipationPeriod(
        RestrictedTimeInterval.getLowHighInstance(
            new PrecisionDate(Precision.DAY, now.plusHours(4)),
            new PrecisionDate(Precision.DAY, now.plusDays(1))));
    requestedService.setParticipant(participantServiceProvider);
    if (eventType == EventTypes.EVENT) {
      requestedService.setRequestedDateTime(
          new PrecisionDate(Precision.DAY, now.plusHours(4)));
    } else {
      requestedService.setServiceCommencementWindow(RestrictedTimeInterval.getLowHighInstance(
          new PrecisionDate(Precision.DAY, now.plusHours(4)),
          new PrecisionDate(Precision.DAY, now.plusDays(1))));
    }
    requestedService.setRequestedServiceDateTime(
        new PrecisionDate(Precision.DAY, now.plusHours(1)));

    //Healthcare provider will have a commencement window, Organization will have a service scheduled date
   /* if(null != serviceProvider.getHealthCareProvider()){
      requestedService.setServiceCommencementWindow(RestrictedTimeInterval.getLowHighInstance(
              new PrecisionDate(Precision.DAY, new DateTime("2015-03-1")),
              new PrecisionDate(Precision.DAY, new DateTime("2015-06-1"))));
    }else{
      requestedService.setServiceScheduled(
              new PrecisionDate(Precision.DAY, new DateTime("2015-02-3")));
    }*/
    requestedService.setServiceBookingStatus(eventType);
    /*requestedService
        .setServiceScheduled(new PrecisionDate(Precision.DAY, new DateTime("2015-06-1")));*/
    requestedService.setSubjectOfCareInstructionDesc("Drip dry");
    requestedService.setRequestedServiceDescription(
        new CodeImpl("399208008", "2.16.840.1.113883.6.96", "SNOMED CT",
            "chest x-ray", "chest x-ray"));

    List<Entitlement> entitlements = new ArrayList<>();

    AsEntityIdentifier entityIdentifier = new AsEntityIdentifierImpl();
    entityIdentifier.setRoot("1.2.36.174030967.0.3");
    //entityIdentifier.setRoot("2.999.52");
    entityIdentifier.setExtension("123456AF");
    entityIdentifier.setCode(new CodeImpl() {{
      setCode(EntitlementType.MEDICARE_PRESCRIBER_NUMBER.getCode());
      setCodeSystemName(EntitlementType.MEDICARE_PRESCRIBER_NUMBER.getCodeSystemName());
      setCodeSystem(EntitlementType.MEDICARE_PRESCRIBER_NUMBER.getCodeSystem());
    }});

    Entitlement entitlement = new EntitlementImpl(entityIdentifier,
        EntitlementType.MEDICARE_PRESCRIBER_NUMBER);
    entitlement.setEntitlementValidityDuration(RestrictedTimeInterval.getLowHighInstance(
        new PrecisionDate(Precision.DAY, now.plusHours(1)),
        new PrecisionDate(Precision.DAY, now.plusDays(1))));
    entitlements.add(entitlement);

    if (null != requestedService.getParticipant().getParticipant().getHealthCareProvider()) {
      requestedService.getParticipant().getParticipant().getHealthCareProvider()
          .setEntitlements(entitlements);
    }

    return requestedService;
  }

  private ServiceProvider getServiceProviderIndividual() {
    ServiceProvider serviceProvider = new ServiceProviderImpl();
    List<Address> addresses = new ArrayList<>();
    addresses.add(getAddress());
    //addresses.add(getAddress());
    serviceProvider.setAddresses(addresses);
    List<ElectronicCommunicationDetail> electronicCommunicationDetails = new ArrayList<>();
    electronicCommunicationDetails.add(getElectronicCommunicationDetail());
    serviceProvider.setElectronicCommunicationDetails(electronicCommunicationDetails);
    PersonHealthcareProvider personHealthcareProvider = new PersonImpl();
    PersonName personName = new PersonNameImpl("Smith");
    personName.addGivenName("John");
    personName.addNameTitle("Dr");
    personName.addNameSuffix("Snr");
    personName.addPersonNameUsage(PersonNameUsage.REGISTERED_NAME_OR_LEGAL_NAME);
    personHealthcareProvider.setPersonNames(new ArrayList<PersonName>() {{
      add(personName);
    }});
    personHealthcareProvider.setQualifications("MBBS MS");
    personHealthcareProvider.setEmploymentOrganisation(getEmploymentOrganization());
    serviceProvider.setHealthCareProvider(personHealthcareProvider);
    List<AsEntityIdentifier> entityIdentifiers = new ArrayList<>();
    HPII hpii = new HPII("8003610000001145");
    entityIdentifiers.add(hpii);
    serviceProvider.setEntityIdentifiers(entityIdentifiers);
    serviceProvider.setOrganisation(
        new OrganisationImpl("Acme Hospital", OrganisationNameUsage.BUSINESS_NAME));
    return serviceProvider;
  }

  private ServiceProvider getServiceProviderOrganization() {
    ServiceProvider serviceProvider = new ServiceProviderImpl();
    List<Address> addresses = new ArrayList<>();
    addresses.add(getAddress());
    //addresses.add(getAddress());
    serviceProvider.setAddresses(addresses);
    List<ElectronicCommunicationDetail> electronicCommunicationDetails = new ArrayList<>();
    electronicCommunicationDetails.add(getElectronicCommunicationDetail());
    serviceProvider.setElectronicCommunicationDetails(electronicCommunicationDetails);
    Organisation organisation = new OrganisationImpl("Warner Bros Hospital",
        OrganisationNameUsage.BUSINESS_NAME);
    organisation.setDepartmentUnit("112");
    //organisation.setOrganisationNameUsage();
    List<AsEntityIdentifier> entityIdentifiers = new ArrayList<>();
    HPIO hpio = new HPIO("8003621566695741");
    entityIdentifiers.add(hpio);
    serviceProvider.setEntityIdentifiers(entityIdentifiers);
    serviceProvider.setOrganisation(organisation);
    return serviceProvider;
  }

  private EmploymentOrganization getEmploymentOrganization() {
    EmploymentOrganization employmentOrganization = new EmploymentOrganizationImpl();
    employmentOrganization.setAddresses(new ArrayList<Address>() {
      {
        add(getAddress());
      }
    });
    employmentOrganization.setDepartment("Some department service provider");
    employmentOrganization.setElectronicCommunicationDetails(
        new ArrayList<ElectronicCommunicationDetail>() {
          {
            add(getElectronicCommunicationDetail());
          }
        });
    employmentOrganization.setEmploymentType(
        new CodeImpl("1", "2.16.840.1.113883.3.879.314867", "Employment type", "Permanent"));
    employmentOrganization.setName("John Smith");
    employmentOrganization.setOccupation(
        new CodeImpl(
            "253314", "2.16.840.1.113883.13.62",
            "1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, 2006",
            "Medical Oncologist", "Medical Oncologist"));
    employmentOrganization.setOrganisationNameUsage(OrganisationNameUsage.BUSINESS_NAME);
    employmentOrganization.setPositionInOrganization(
        new CodeImpl(
            "253314", "2.16.840.1.113883.13.62",
            "1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, 2006",
            "Medical Oncologist",
            "Medical Oncologist"));

    List<AsEntityIdentifier> entityIdentifiers = new ArrayList<>();
    HPIO hpio = new HPIO("8003620000045562");
    entityIdentifiers.add(hpio);
    employmentOrganization.setIdentifiers(entityIdentifiers);

    return employmentOrganization;
  }

  private ElectronicCommunicationDetail getElectronicCommunicationDetail() {
    ElectronicCommunicationDetail electronicCommunicationDetail =
        new ElectronicCommunicationDetail();
    electronicCommunicationDetail.setAddress("mail@blah.com");
    electronicCommunicationDetail.setMedium(ElectronicCommunicationMedium.EMAIL);
    electronicCommunicationDetail.setUsage(ElectronicCommunicationUsage.WORKPLACE);
    return electronicCommunicationDetail;
  }

  private Address getAddress() {
    Address address = new AddressImpl();
    AustralianAddress australianAddress = new AustralianAddress();
    australianAddress.setAddressPurpose(AddressPurpose.BUSINESS);
    australianAddress.setAustralianAddressLevelType(AustralianAddressLevelType.Ground);
    australianAddress.setAddressSiteName("Nehtaville Site");
    australianAddress.setAustralianStateTerritory(AustralianStateTerritory.QUEENSLAND);
    australianAddress.setDeliveryPointId(69);
    australianAddress.setLevelNumber("1");
    australianAddress.setLotNumber("2");
    australianAddress.setPostalDeliveryType(PostalDeliveryType.GeneralPostOfficeBox);
    australianAddress.setPostCode("5555");
    australianAddress.setStreetName("Clinician Street");
    australianAddress.setStreetNumber(1);
    australianAddress.setStreetSuffix(StreetSuffix.Extension);
    australianAddress.setStreetType(StreetType.Street);
    australianAddress.setSuburbTownLocality("Nehtaville");
    australianAddress.setUnitNumber("123");
    australianAddress.setUnitType(UnitType.HALL);
    address.setAustralianAddress(australianAddress);
    return address;
  }

  private ReferenceRangeDetails getReferenceRangeDetails() {
    ReferenceRangeDetails referenceRangeDetails = new ReferenceRangeDetails();
    referenceRangeDetails
        .setNormalStatus(HL7ObservationInterpretationNormality.Normal.getAsCoded());
    List<ReferenceRange> referenceRangeList = new LinkedList<>();
    ReferenceRange referenceRange = new ReferenceRange();
    //These reference range high and low values need to be included in the narrative.
    // As ref ranges are rare in DI we'll remove them from the example when publish but leave it here until IQ
    // rule testing is complete.
    QuantityRange quantityRange = new QuantityRange(0.11, 0.04, "g/L");
    referenceRange.setReferenceRange(quantityRange);
    referenceRangeList.add(referenceRange);

    referenceRange.setReferenceRange(quantityRange);
    referenceRange.setReferenceRangeMeaning(
        new CodeImpl("260395002", "2.16.840.1.113883.6.96", "SNOMED CT",
            "normal range", "normal range"));

    referenceRangeDetails.setReferenceRange(referenceRangeList);
    return referenceRangeDetails;
  }

  private static AnatomicalSite getAnatomicalSite(String s) {
    AnatomicalSite anatomicalSite = new AnatomicalSiteImpl();
    anatomicalSite.setAnatomicalLocationImages(new ArrayList<AttachedMedia>() {{
      add(getAttachedMedia(s, Optional.of(ATTACHMENTS_DIR)));
      add(getAttachedMedia(s, Optional.of(ATTACHMENTS_DIR)));
    }});
    anatomicalSite.setSpecificLocation(
        new SpecificLocation(
            //Joshua's change
            new SNOMED_AU_Code("14975008", String.format("Forearm structure %s", s)),
            //Joshua's change    anatomicalSite.setAnatomicalLocationDesc("Left Forearm");
            new SNOMED_AU_Code("7771000", "Left")));
    anatomicalSite.setAnatomicalLocationDesc("Left Forearm");
    return anatomicalSite;
  }

  private ExaminationRequestDetails getExaminationRequestDetails() {
    //Image Details
    ImageDetails imageDetail = new ImageDetailsImpl();
    imageDetail.setSubjectPosition("Subject Pos");
    imageDetail.setImageViewName(
        new CodeImpl() {{
          setOriginalText("1 X-Ray - A/U Skin - Stuff");
        }});
    imageDetail.setSubjectPosition("Subject Position");
    imageDetail.setImage(getAttachedMedia("", Optional.of(ATTACHMENTS_DIR)));
    imageDetail.setImageDateTime(
        new PrecisionDate(Precision.DAY, now.minusDays(1)));
    imageDetail.setSeriesIdentifier(
        new UniqueIdentifierImpl("2.999.23",
            "Accession Number Group: 0008  Element: 0050"));
    imageDetail.setImageIdentifier(
        new UniqueIdentifierImpl(UUID.randomUUID().toString(), "Image Identifier"));
    List<ImageDetails> imageDetails = new LinkedList<>();
    imageDetails.add(imageDetail);
    ExaminationRequestDetails examinationRequestDetails = new ExaminationRequestDetailsImpl();
    List<String> names = new LinkedList<>();
    names.add("Chest X-ray");
    examinationRequestDetails.setExaminationRequestedNames(names);
    examinationRequestDetails.setImageDetails(imageDetails);
    examinationRequestDetails.setObservationDateTime(
        new PrecisionDate(Precision.DAY, now.plusHours(4)));
    examinationRequestDetails.setReportIdentifier(
        new UniqueIdentifierImpl(UUID.randomUUID().toString()));
    examinationRequestDetails.setSeriesIdentifier(
        new UniqueIdentifierImpl("2.999.24", "Series Identifier"));

    return examinationRequestDetails;
  }

  private ImagingExaminationResult getImagingExaminationResult() {

    List<AnatomicalSite> anatomicalSites = new ArrayList<>();
    anatomicalSites.add(getAnatomicalSite("ImagingExaminationResult"));
    ImagingExaminationResult imagingExaminationResult = new ImagingExaminationResultImpl();
    ImagingExaminationResultGroup imagingExaminationResultGroup = new ImagingExaminationResultGroupImpl();
    imagingExaminationResultGroup
        .setAnatomicalSite(getAnatomicalSite("imagingExaminationResultGroup"));
    imagingExaminationResultGroup.setImagingExaminationResultGroupName(new CodeImpl() {{
      setOriginalText("Result Group Name");
      setCode(UUID.randomUUID().toString());
      setCodeSystem("2.999.333");
    }});
    ImagingResult imagingResult = new ImagingResultImpl();
    imagingResult.setIndividualImagingExaminationResultName(new CodeImpl() {{
      setOriginalText("Imaging Result Name");
    }});
    ResultValue resultValue = new ResultValue();
    resultValue.setQuantityResultValue(new Quantity("2.2", "mL"));

    //Todo we'll remove reference range details in the final example.
    // But we'll leave it in while we are doing the IQ rules testing
    resultValue.setReferenceRangeDetails(getReferenceRangeDetails());
    imagingResult.setIndividualImagingExaminationResultValue(resultValue);
    imagingResult.setResultComment(new ArrayList<String>() {
      {
        add("Please");
        add("Add Comments");
      }
    });
    imagingExaminationResultGroup.setResults(new ArrayList<ImagingResult>() {{
      add(imagingResult);
    }});
    imagingExaminationResult.setResultGroups(new ArrayList<ImagingExaminationResultGroup>() {{
      add(imagingExaminationResultGroup);
    }});
    imagingExaminationResult.setImagingExaminationResultName(
        new CodeImpl() {{
          setOriginalText("Result Name");
        }});
    imagingExaminationResult
        .setObservationDateTime(new PrecisionDate(Precision.DAY, now.minusDays(1)));
    imagingExaminationResult.setFindings("xyz");
    imagingExaminationResult
        .setImagingModality(
            new CodeImpl("363680008", "2.16.840.1.113883.6.96",
                "SNOMED CT", "x-ray", "x-ray"));
    imagingExaminationResult.setImagingExaminationResultStatus(
        new CodeImpl("3", "1.2.36.1.2001.1001.101.104.16501",
            "NCTIS Result Status Values", "Final", "Final"));
    imagingExaminationResult.setAnatomicalSites(anatomicalSites);
    imagingExaminationResult.setClinicalInformationProvided("Fluid Retention.");
    imagingExaminationResult.setCustomNarrative(null);
    List<ExaminationRequestDetails> examinationRequestDetailsList = new ArrayList<>();
    examinationRequestDetailsList.add(getExaminationRequestDetails());
    imagingExaminationResult.setExaminationRequestDetails(examinationRequestDetailsList);
    imagingExaminationResult
        .setExaminationResultRepresentation("Rich Text Format");
    return imagingExaminationResult;
  }

  private Medications getMedications() {
    Medications medications = new MedicationsImpl();
    List<KnownMedication> knownMedications = new ArrayList<>();
    KnownMedication knownMedication = new KnownMedicationImpl();
    knownMedication.setChangeDesc("Something Else");
    knownMedication.setChangeOrRecommendationReason("New - prescribed");
    knownMedication
        .setChangeStatus(NCTISRecommendationOrChangeValues.CHANGE_HAS_BEEN_MADE.getCodeValue());
    knownMedication.setChangeType(NCTISChanceTypeValues.CEASED.getCodeValue());
    knownMedication.setClinicalIndication("Pain control");
    knownMedication.setDirections("Directions Text");
    knownMedication.setMedicationInstructionComment("Dosage to be reviewed in 10 days");
    knownMedication.setTherapeuticGoodIdentification(
        new CodeImpl(
            "835831000168109", "2.16.840.1.113883.6.96", "SNOMED CT",
            "Panadeine Forte uncoated tablet", "Panadeine Forte uncoated tablet"));
    knownMedications.add(knownMedication);
    medications.setKnownMedications(knownMedications);
    ExclusionStatement exclusionStatement = new ExclusionStatementImpl();
    exclusionStatement.setGlobalStatement(
        new CodeImpl("01", "1.2.36.1.2001.1001.101.104.16299", "NCTIS Global Statement Values",
            "None known"));
    medications.setExclusionStatement(exclusionStatement);
    return medications;
  }

  private ParticipationServiceProvider getCurrentServiceProviderIndividual() {
    ParticipationServiceProvider serviceProvider = new ParticipationServiceProviderImpl();
    serviceProvider.setParticipant(getServiceProviderIndividual());
    serviceProvider.getParticipant().setExecutingClass(ServiceReferral.class);
    serviceProvider.setRole(new CodeImpl(
        "309964003",
        "2.16.840.1.113883.6.96",
        "SNOMED CT",
        "Radiology Department",
        "Radiology Department"));
    serviceProvider.setParticipationPeriod(
        RestrictedTimeInterval.getLowHighInstance(
            new PrecisionDate(Precision.DAY, new DateTime("2013-01-1")),
            new PrecisionDate(Precision.DAY, new DateTime("2013-04-1"))));
    return serviceProvider;
  }

}
