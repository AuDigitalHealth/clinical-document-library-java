package au.gov.nehta.cda.es;

import au.gov.nehta.builder.es.EventSummaryCreator;
import au.gov.nehta.builder.util.UUIDTool;
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
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.cda.common.time.Precision;
import au.gov.nehta.model.cda.common.time.PrecisionDate;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.cda.es.EventSummaryCDAModel;
import au.gov.nehta.model.clinical.common.*;
import au.gov.nehta.model.clinical.common.address.Address;
import au.gov.nehta.model.clinical.common.address.AustralianAddress;
import au.gov.nehta.model.clinical.common.address.*;
import au.gov.nehta.model.clinical.common.participation.*;
import au.gov.nehta.model.clinical.common.types.*;
import au.gov.nehta.model.clinical.es.AdverseReaction;
import au.gov.nehta.model.clinical.es.AdverseReactionImpl;
import au.gov.nehta.model.clinical.es.Procedure;
import au.gov.nehta.model.clinical.es.ProcedureImpl;
import au.gov.nehta.model.clinical.es.ReactionEvent;
import au.gov.nehta.model.clinical.es.ReactionEventImpl;
import au.gov.nehta.model.clinical.es.*;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.gov.nehta.model.clinical.etp.common.participation.EntitlementType;
import au.gov.nehta.model.clinical.etp.common.participation.*;
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
import static au.gov.nehta.model.schematron.SchematronResource.SchematronResources.EVENT_SUMMARY_3A;

public class EventSummaryMaxTest extends Base {

  private static final String SCHEMATRON = EVENT_SUMMARY_3A.resource().getSchematron();
  private static String SCHEMATRON_TEMPLATE_PATH = "resources/EventSummary";
  private static final String DOCUMENT_FILE_NAME = TEST_GENERATION + "/es/es-max-java.xml";

  @Test
  public void test_MAX_Event_Summary_Creation() {
    try {

      if (!new File(SCHEMATRON_TEMPLATE_PATH
          + "/schematron/schematron-Validator-report.xsl").exists()) {
        SCHEMATRON_TEMPLATE_PATH = "src/" + SCHEMATRON_TEMPLATE_PATH;
      }
      generateMax();
      SchematronCheckResult check =
          Schematron.check(SCHEMATRON_TEMPLATE_PATH, SCHEMATRON, DOCUMENT_FILE_NAME);
      show(check);
      Assert.assertEquals(0, check.schemaErrors.size());
      Assert.assertEquals(0, check.schematronErrors.size());
    } catch (SchematronValidationException | JAXBException | ParserConfigurationException e) {
      e.printStackTrace();
    }
  }

  private void generateMax()
      throws SchematronValidationException, JAXBException, ParserConfigurationException {
    DateTime now = new DateTime();
    DocumentAuthor documentAuthor = getDocumentAuthor(now);

    //Encompassing Encounter (componentOf)
    RestrictedTimeInterval encounterPeriod =
        RestrictedTimeInterval.getLowHighInstance(
            new PrecisionDate(Precision.DAY, new DateTime("2011-03-03")),
            new PrecisionDate(Precision.DAY, new DateTime("2019-09-14")));
    // Prepare Event Summary Context
    EventSummaryContext eventSummaryContext =
        new EventSummaryContextImpl(
            getSubjectOfCareParticipant(), documentAuthor, encounterPeriod);

    // Prepare Event Summary Content
    EventSummaryContent eventSummaryContent = new EventSummaryContentImpl();
    eventSummaryContent.setMedications(getMedications());
    eventSummaryContent.setEventDetails(getEventDetails());
    eventSummaryContent.setNewlyIdentifiedAdverseReactions(getNewlyIdentifiedAdverseReactions());
    eventSummaryContent.setMedicalHistory(getDiagnosesOrInterventions());
    eventSummaryContent.setImmunisations(getImmunisations());
    eventSummaryContent
        .setDiagnosticInvestigations(getDiagnosticInvestigations(true, true, true, true));
    eventSummaryContent.setCustomNarrativeAdministrativeObservations(null);
    eventSummaryContent.setCustomNarrativeMedications(null);
    EventSummary eventSummary = new EventSummaryImpl();
    eventSummary.setEventSummaryContext(eventSummaryContext);
    eventSummary.setEventSummaryContent(eventSummaryContent);

    ClinicalDocument cdaClinicalDocument = ClinicalDocumentFactory.getEventSummary();
    cdaClinicalDocument.setClinicalDocumentId(UUIDTool.uuidToOid(UUID.randomUUID().toString()));

    cdaClinicalDocument.setLanguageCode("en-AU");
    cdaClinicalDocument.setVersionNumber(1);
    cdaClinicalDocument.setCompletionCode(DocumentStatusCode.FINAL);

    EventSummaryCDAModel eventSummaryCDAModel = new EventSummaryCDAModel(cdaClinicalDocument, now);
    eventSummaryCDAModel.setCustodian(getCustodian());

    eventSummaryCDAModel.setLegalAuthenticator(getLegalAuthenticator(now));
    EventSummaryCreator eventSummaryCreator = new EventSummaryCreator(eventSummaryCDAModel,
        eventSummary);

    Document clinicalDocument = eventSummaryCreator.create();
    String cdaString = TestHelper.documentToXML(clinicalDocument);
    TestHelper.printToFile(cdaString, DOCUMENT_FILE_NAME);
    System.out.println(cdaString);

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
          .add(getRequestedService(getServiceProviderIndidvidual(), EventTypes.EVENT)); //Ind
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
    AttachedMedia reportFile;
    if (!new File(ATTACHMENTS_DIR + "radiologyreport.pdf").exists()) {
      reportFile = new AttachedMedia(
          new File("src/" + ATTACHMENTS_DIR + "radiologyreport.pdf"));
    } else {
      reportFile = new AttachedMedia(
          new File(ATTACHMENTS_DIR + "radiologyreport.pdf"));
    }
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
        "Final"), new PrecisionDate(Precision.DAY, new DateTime("2017-1-1")), reportContent);
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
            "SNOMED CT",
            "Radiology Department",
            "Radiology Department"));
    participantServiceProvider.setParticipationPeriod(
        RestrictedTimeInterval.getLowHighInstance(
            new PrecisionDate(Precision.DAY, new DateTime("2013-02-12")),
            new PrecisionDate(Precision.DAY, new DateTime("2013-08-22"))));
    requestedService.setParticipant(participantServiceProvider);
    if (eventType == EventTypes.EVENT) {
      requestedService.setRequestedDateTime(
          new PrecisionDate(Precision.DAY, new DateTime("2013-01-23")));
    } else {
      requestedService.setServiceCommencementWindow(RestrictedTimeInterval.getLowHighInstance(
          new PrecisionDate(Precision.DAY, new DateTime("2015-02-2")),
          new PrecisionDate(Precision.DAY, new DateTime("2015-04-1"))));
    }
    requestedService.setRequestedServiceDateTime(
        new PrecisionDate(Precision.DAY, new DateTime("2013-01-22")));

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
            "Plain chest X-ray", "Plain chest X-ray"));

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
        new PrecisionDate(Precision.DAY, new DateTime("2013-01-1")),
        new PrecisionDate(Precision.DAY, new DateTime("2013-04-1"))));
    entitlements.add(entitlement);

    if (null != requestedService.getParticipant().getParticipant().getHealthCareProvider()) {
      requestedService.getParticipant().getParticipant().getHealthCareProvider()
          .setEntitlements(entitlements);
    }

    return requestedService;
  }

  private ServiceProvider getServiceProviderIndidvidual() {
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
            "1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, "
                +
                "First Edition, Revision 1", "Medical Oncologist", "Medical Oncologist"));
    employmentOrganization.setOrganisationNameUsage(OrganisationNameUsage.BUSINESS_NAME);
    employmentOrganization.setPositionInOrganization(
        new CodeImpl(
            "253314", "2.16.840.1.113883.13.62",
            "1220.0 - ANZSCO - Australian and New Zealand Standard Classification of " +
                "Occupations, First Edition, Revision 1", "Medical Oncologist",
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

  private TestSpecimenDetail getTestSpecimenDetail() {
    TestSpecimenDetail testSpecimenDetail = new TestSpecimenDetailImpl();
    List<AnatomicalSite> anatomicalSites = new ArrayList<>();

    //Angus's example doesn't have an applicable for test anatomical site (as it is a blood sample).
    // So we'll leave this in the test, but when we publish we'll rmeove it.
    anatomicalSites.add(getAnatomicalSite(""));

    testSpecimenDetail.setAnatomicalSites(anatomicalSites);
    CollectionAndHandling collectionAndHandling = new CollectionAndHandling();
    collectionAndHandling.setSamplingPreconditions(
        new CodeImpl("16985007", "2.16.840.1.113883.6.96", "SNOMED CT",
            "Fasting", "Fasting"));
    testSpecimenDetail.setIdentifiers(new IdentifiersImpl() {{
      setContainerSpecimenIdentifier(
          new UniqueIdentifierImpl("2.16.840.1.113883.19", "123A45"));
      setParentSpecimenIdentifier(
          new UniqueIdentifierImpl("1.2.36.45364", "122A45"));
      setSpecimenIdentifier(new UniqueIdentifierImpl("2.16.840.1.113883.11", "111A45"));
    }});
    testSpecimenDetail.setCollectionAndHandling(collectionAndHandling);
    testSpecimenDetail.setCollectionProcedure(
        new CodeImpl("48635004", "2.16.840.1.113883.6.96", "SNOMED CT",
            "Fine needle aspiration biopsy", "Fine needle aspiration biopsy"));
    HandlingAndProcessing handlingAndProcessing = new HandlingAndProcessing();
    handlingAndProcessing.setCollectionDateTime(
        new PrecisionDate(Precision.DAY, new DateTime("2013-01-1")));
    handlingAndProcessing.setCollectionSetting("Pathology Clinic");
    handlingAndProcessing.setReceiptDateTime(
        new PrecisionDate(Precision.DAY, new DateTime("2013-02-1")));
    testSpecimenDetail.setHandlingAndProcessing(handlingAndProcessing);
    testSpecimenDetail.setSpecimenTissueType(
        new CodeImpl("258442002", "2.16.840.1.113883.6.96",
            "SNOMED CT", "Fluid sample", "Fluid sample"));
    return testSpecimenDetail;
  }

  static AnatomicalSite getAnatomicalSite(String s) {
    AnatomicalSite anatomicalSite = new AnatomicalSiteImpl();
    anatomicalSite.setAnatomicalLocationImages(new ArrayList<AttachedMedia>() {{
      add(getAttachedMedia(s, Optional.empty()));
      add(getAttachedMedia(s, Optional.empty()));
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
    imageDetail.setImage(getAttachedMedia("", Optional.empty()));
    imageDetail.setImageDateTime(
        new PrecisionDate(Precision.DAY, new DateTime("2013-01-1")));
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
        new PrecisionDate(Precision.DAY, new DateTime("2013-01-1")));
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
        .setObservationDateTime(new PrecisionDate(Precision.DAY, new DateTime("2013-01-02")));
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


  private Immunisations getImmunisations() {
    List<Immunisation> immunisationList = new ArrayList<>();
    AMTv3Code therapeuticGood =
        new AMTv3Code("162551000036100",
            "Fluvax 2014 injection, 0.5 mL syringe");

    //'Error: TC-Types-18: According to the Structured Content Specification the Medication Action DateTime
    // 'substanceAdministration/effectiveTime' data element in  the Immunisations section has the DateTime data type
    // which is derived from the HL7 'TS' data type however an xsi:type attribute with the value 'IVL_TS' was  found.
    // This may be corrected by using an xsi:type attribute with the value 'TS'.  (See section 8.6 of Data Types in
    // NEHTA Specifications - A Profile of ISO 21090 Specification v1.0.)'

    //'Error: TC-Narr-09 step 4: The Medication Action DateTime data element 'substanceAdministration/effectiveTime'
    // in  the Immunisations section has the value '20190625173056+1000' and this date/time does not match any of the
    // date/time elements found in the narrative of  the section.  The Medication Action DateTime data element records
    // clinical information and all clinical information in entry elements must be present in the narrative.
    // See requirements in Appendix A 'CDA Narratives' in the Event Summary CDA Implementation Guide.)
    // Every section of a clinical document must be self-contained as health software systems need not display
    // every section.'

    PreciseDate actionDateTime = new PrecisionDate(Precision.DAY);
    Immunisation immunisation = new ImmunisationImpl(therapeuticGood, actionDateTime);
    immunisationList.add(immunisation);
    return new ImmunisationsImpl(immunisationList);
  }

  private MedicalHistory getDiagnosesOrInterventions() {
    MedicalHistory medicalHistory = new MedicalHistory();
    medicalHistory.setCustomNarrative(null);
    List<ProblemDiagnosis> problemDiagnoses = new ArrayList<>();
    SNOMED_AU_Code identification = new SNOMED_AU_Code("85189001", "Acute appendicitis");
    PreciseDate dateOfOnset = new PrecisionDate(Precision.DAY, new DateTime("2019-07-15"));
    PreciseDate remissionDate = new PrecisionDate(Precision.DAY, new DateTime("2019-07-16"));
    ProblemDiagnosis problemDiagnosis =
        new ProblemDiagnosisImpl(
            identification, dateOfOnset, remissionDate, "Problem/Diagnosis Comment goes here.");
    problemDiagnoses.add(problemDiagnosis);
    medicalHistory.setProblemDiagnoses(problemDiagnoses);
    Procedure procedure = new ProcedureImpl();
    RestrictedTimeInterval procedureDateTime =
        RestrictedTimeInterval.getLowHighInstance(
            new PrecisionDate(Precision.DAY, new DateTime("2013-01-1")),
            new PrecisionDate(Precision.DAY, new DateTime("2013-04-1")));
    procedure.setProcedureDateTime(procedureDateTime);
    procedure.setComment("Procedure Comment goes here.");
    procedure.setProcedureName(
        new CodeImpl("80146002", "2.16.840.1.113883.6.96", "SNOMED CT",
            "Appendicectomy", "Appendicectomy"));
    procedure.setShowOngoingNarrative(true);
    List<Procedure> procedures = new ArrayList<>();
    procedures.add(procedure);
    medicalHistory.setProcedures(procedures);
    List<UncategorisedMedicalHistoryItem> uncategorisedMedicalHistoryItems = new ArrayList<>();

    // I wonder if the narrative is being put in the wrong place.
    // 'Error: TC-Narr-09 step 4: The Medical History Item TimeInterval data element 'act/effectiveTime' in  the
    // Diagnoses/Interventions section has the low  value '1991' and this dateTime does not match any of the dateTime
    // elements found in the narrative of the section.  This date/time is the low boundary of a time interval.

    // The Medical History Item TimeInterval data element records clinical information and all clinical information in
    // entry elements must be present in the narrative.  (See requirements in Appendix A 'CDA Narratives' in the Event
    // Summary CDA Implementation Guide.)  Every section of a clinical document must be self-contained as health
    // software systems need not display every section.'

    RestrictedTimeInterval timeInterval =
        RestrictedTimeInterval.getLowHighInstance(
            new PrecisionDate(Precision.DAY, new DateTime("1991-01-1")),
            new PrecisionDate(Precision.DAY, new DateTime("1991-04-1")));
    UncategorisedMedicalHistoryItem uncategorisedMedicalHistoryItem =
        new UncategorisedMedicalHistoryItemImpl(
            "Broken right arm.",
            timeInterval,
            "Childhood injury.");
    uncategorisedMedicalHistoryItems.add(uncategorisedMedicalHistoryItem);
    medicalHistory.setUncategorisedMedicalHistoryItems(uncategorisedMedicalHistoryItems);
    return medicalHistory;
  }

  private EventDetails getEventDetails() {
    return new EventDetails() {{
      setClinicalSynopsisDesc("Clinical Synopsis Desc");
    }};
  }


}
