package au.gov.nehta.cda.es;

import au.gov.nehta.builder.es.EventSummaryCreator;
import au.gov.nehta.builder.util.UUIDTool;
import au.gov.nehta.cda.test.Base;
import au.gov.nehta.cda.test.TestHelper;
import au.gov.nehta.model.cda.common.ElectronicCommunicationDetail;
import au.gov.nehta.model.cda.common.ElectronicCommunicationMedium;
import au.gov.nehta.model.cda.common.ElectronicCommunicationUsage;
import au.gov.nehta.model.cda.common.code.AMTv3Code;
import au.gov.nehta.model.cda.common.code.CodeImpl;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.code.DocumentStatusCode;
import au.gov.nehta.model.cda.common.code.HL7ObservationInterpretationNormality;
import au.gov.nehta.model.cda.common.code.SNOMED_AU_Code;
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
import au.gov.nehta.model.clinical.common.EventTypes;
import au.gov.nehta.model.clinical.common.Immunisation;
import au.gov.nehta.model.clinical.common.ImmunisationImpl;
import au.gov.nehta.model.clinical.common.ProblemDiagnosis;
import au.gov.nehta.model.clinical.common.ProblemDiagnosisImpl;
import au.gov.nehta.model.clinical.common.UncatagorisedMedicalHistoryItem;
import au.gov.nehta.model.clinical.common.UncatagorisedMedicalHistoryItemImpl;
import au.gov.nehta.model.clinical.common.address.Address;
import au.gov.nehta.model.clinical.common.address.AddressImpl;
import au.gov.nehta.model.clinical.common.address.AustralianAddress;
import au.gov.nehta.model.clinical.common.address.AustralianAddressLevelType;
import au.gov.nehta.model.clinical.common.address.PostalDeliveryType;
import au.gov.nehta.model.clinical.common.address.StreetSuffix;
import au.gov.nehta.model.clinical.common.address.StreetType;
import au.gov.nehta.model.clinical.common.address.UnitType;
import au.gov.nehta.model.clinical.common.participation.AddressPurpose;
import au.gov.nehta.model.clinical.common.participation.AustralianStateTerritory;
import au.gov.nehta.model.clinical.common.participation.Organisation;
import au.gov.nehta.model.clinical.common.participation.OrganisationImpl;
import au.gov.nehta.model.clinical.common.participation.OrganisationNameUsage;
import au.gov.nehta.model.clinical.common.participation.PersonName;
import au.gov.nehta.model.clinical.common.participation.PersonNameImpl;
import au.gov.nehta.model.clinical.common.participation.PersonNameUsage;
import au.gov.nehta.model.clinical.common.types.HPII;
import au.gov.nehta.model.clinical.common.types.HPIO;
import au.gov.nehta.model.clinical.common.types.Quantity;
import au.gov.nehta.model.clinical.common.types.QuantityRange;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;
import au.gov.nehta.model.clinical.es.AdverseReaction;
import au.gov.nehta.model.clinical.es.AdverseReactionImpl;
import au.gov.nehta.model.clinical.es.AnatomicalSite;
import au.gov.nehta.model.clinical.es.AnatomicalSiteImpl;
import au.gov.nehta.model.clinical.es.CollectionAndHandling;
import au.gov.nehta.model.clinical.es.DiagnosesInterventions;
import au.gov.nehta.model.clinical.es.DiagnosticInvestigations;
import au.gov.nehta.model.clinical.es.DiagnosticInvestigationsImpl;
import au.gov.nehta.model.clinical.es.EventDetails;
import au.gov.nehta.model.clinical.es.EventSummary;
import au.gov.nehta.model.clinical.es.EventSummaryAuthor;
import au.gov.nehta.model.clinical.es.EventSummaryContent;
import au.gov.nehta.model.clinical.es.EventSummaryContentImpl;
import au.gov.nehta.model.clinical.es.EventSummaryContext;
import au.gov.nehta.model.clinical.es.EventSummaryContextImpl;
import au.gov.nehta.model.clinical.es.EventSummaryImpl;
import au.gov.nehta.model.clinical.es.ExaminationRequestDetails;
import au.gov.nehta.model.clinical.es.ExaminationRequestDetailsImpl;
import au.gov.nehta.model.clinical.es.HandlingAndProcessing;
import au.gov.nehta.model.clinical.es.IdentifiersImpl;
import au.gov.nehta.model.clinical.es.ImageDetails;
import au.gov.nehta.model.clinical.es.ImageDetailsImpl;
import au.gov.nehta.model.clinical.es.ImagingExaminationResult;
import au.gov.nehta.model.clinical.es.ImagingExaminationResultGroup;
import au.gov.nehta.model.clinical.es.ImagingExaminationResultGroupImpl;
import au.gov.nehta.model.clinical.es.ImagingExaminationResultImpl;
import au.gov.nehta.model.clinical.es.ImagingResult;
import au.gov.nehta.model.clinical.es.ImagingResultImpl;
import au.gov.nehta.model.clinical.es.Immunisations;
import au.gov.nehta.model.clinical.es.ImmunisationsImpl;
import au.gov.nehta.model.clinical.es.KnownMedication;
import au.gov.nehta.model.clinical.es.KnownMedicationImpl;
import au.gov.nehta.model.clinical.es.Medications;
import au.gov.nehta.model.clinical.es.MedicationsImpl;
import au.gov.nehta.model.clinical.es.NewlyIdentifiedAdverseReactions;
import au.gov.nehta.model.clinical.es.NewlyIdentifiedAdverseReactionsImpl;
import au.gov.nehta.model.clinical.es.OtherTestResult;
import au.gov.nehta.model.clinical.es.OtherTestResultImpl;
import au.gov.nehta.model.clinical.es.PathologyTestResult;
import au.gov.nehta.model.clinical.es.Procedure;
import au.gov.nehta.model.clinical.es.ProcedureImpl;
import au.gov.nehta.model.clinical.es.ReactionEvent;
import au.gov.nehta.model.clinical.es.ReactionEventImpl;
import au.gov.nehta.model.clinical.es.ReferenceRange;
import au.gov.nehta.model.clinical.es.ReferenceRangeDetails;
import au.gov.nehta.model.clinical.es.RequestedService;
import au.gov.nehta.model.clinical.es.RequestedServiceImpl;
import au.gov.nehta.model.clinical.es.ResultValue;
import au.gov.nehta.model.clinical.es.SpecificLocation;
import au.gov.nehta.model.clinical.es.TestSpecimenDetail;
import au.gov.nehta.model.clinical.es.TestSpecimenDetailImpl;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;
import au.gov.nehta.model.clinical.etp.common.participation.EntitlementImpl;
import au.gov.nehta.model.clinical.etp.common.participation.EntitlementType;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProviderImpl;
import au.gov.nehta.model.clinical.etp.common.participation.ServiceProvider;
import au.gov.nehta.model.clinical.etp.common.participation.ServiceProviderImpl;
import au.gov.nehta.model.schematron.SchematronValidationException;
import org.joda.time.DateTime;
import org.junit.Test;
import org.w3c.dom.Document;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;

import static au.gov.nehta.cda.es.EventSummaryTestHelper.getAttachedMedia;
import static au.gov.nehta.cda.test.TestHelper.getCustodian;
import static au.gov.nehta.cda.test.TestHelper.getEventSummaryAuthor;
import static au.gov.nehta.cda.test.TestHelper.getLegalAuthenticator;
import static au.gov.nehta.cda.test.TestHelper.getSubjectOfCareParticipant;

public class EventSummaryMaxTest extends Base {

  private static final String SCHEMATRON = "ccd-3B.sch";
  private static final String SCHEMATRON_TEMPLATE_PATH = "resources/EventSummary";
  private static final String DOCUMENT_FILE_NAME = TEST_GENERATION + "es-max-java.xml";


  @Test
  public void test_MAX_Event_Summary_Creation() {
    try {
      generateMax();
    } catch (SchematronValidationException e) {
      e.printStackTrace();
    } catch (JAXBException e) {
      e.printStackTrace();
    } catch (ParserConfigurationException e) {
      e.printStackTrace();
    }
  }

  private void generateMax()
      throws SchematronValidationException, JAXBException, ParserConfigurationException {
    DateTime now = new DateTime();
    EventSummaryAuthor eventSummaryAuthor = getEventSummaryAuthor(now);
    RestrictedTimeInterval encounterPeriod =
        RestrictedTimeInterval.getLowHighInstance(
            new PrecisionDate(Precision.DAY, new DateTime("2019-03-1")),
            new PrecisionDate(Precision.DAY, new DateTime("2019-04-1")));
    // Prepare Event Summary Context
    EventSummaryContext eventSummaryContext =
        new EventSummaryContextImpl(
            getSubjectOfCareParticipant(), eventSummaryAuthor, encounterPeriod);

    // Prepare Event Summary Content
    EventSummaryContent eventSummaryContent =
        new EventSummaryContentImpl(
            null,
            null,
            getMedications(),
            null,
            getEventDetails(),
            getNewlyIdentifiedAdverseReactions(),
            getDiagnosesOrInterventions(),
            getImmunisations(),
            null,
            getDiagnosticInvestigations(true, true, true, true));

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
      pathologyTestResults.add(EventSummaryTestHelper.CreatePathologyResults(true));
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
      requestedServices.add(getRequestedService(getServiceProviderIndidvidual(), EventTypes.EVENT)); //Ind
      requestedServices.add(getRequestedService(getServiceProviderOrganization(), EventTypes.INTENT)); //Org
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
    AttachedMedia reportFile = new AttachedMedia(
            new File("src/test/resources/radiologyreport.pdf"));
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
    OtherTestResult otherTestResult = new OtherTestResultImpl(new CodeImpl() {{
      setOriginalText("Report Name");
    }}, new CodeImpl("3", "1.2.36.1.2001.1001.101.104.16501", "NCTIS Result Status Values",
        "Final"), new PrecisionDate(Precision.DAY, new DateTime("2017-1-1")), reportContent);
    return otherTestResult;
  }

  private RequestedService getRequestedService(ServiceProvider serviceProvider, EventTypes eventType) {
    RequestedService requestedService = new RequestedServiceImpl();
    requestedService.setCustomNarrativeRequestedService(null);
    ParticipationServiceProvider participantServiceProvider =
        new ParticipationServiceProviderImpl();
    participantServiceProvider.setParticipant(serviceProvider);
    participantServiceProvider.setRole(
        new CodeImpl(
            "253917",
            "2.16.840.1.113883.13.62",
            "1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, "
                +
                "First Edition, Revision 1",
            "Diagnostic and Interventional Radiologist",
            "Diagnostic and Interventional Radiologist"));
    participantServiceProvider.setParticipationPeriod(
        RestrictedTimeInterval.getLowHighInstance(
            new PrecisionDate(Precision.DAY, new DateTime("2013-01-1")),
            new PrecisionDate(Precision.DAY, new DateTime("2013-04-1"))));
    requestedService.setParticipant(participantServiceProvider);
    if (eventType == EventTypes.EVENT) {
      requestedService.setRequestedDateTime(
              new PrecisionDate(Precision.DAY, new DateTime("2012-12-1")));
    } else {
      requestedService.setServiceCommencementWindow(RestrictedTimeInterval.getLowHighInstance(
              new PrecisionDate(Precision.DAY, new DateTime("2013-01-1")),
              new PrecisionDate(Precision.DAY, new DateTime("2013-04-1"))));
    }
    requestedService.setRequestedServiceDateTime(
        new PrecisionDate(Precision.DAY, new DateTime("2015-02-1")));

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
    Organisation organisation = new OrganisationImpl("Warner Bros Hospital", OrganisationNameUsage.BUSINESS_NAME);
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
        new CodeImpl() {{
          setOriginalText("Full-Time");
        }});
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
      add(getAttachedMedia(s));
      add(getAttachedMedia(s));
    }});
    anatomicalSite.setSpecificLocation(
        new SpecificLocation(
            //Joshua's change
            new SNOMED_AU_Code("14975008", String.format("Forearm structure", s)),
            //Joshua's change    anatomicalSite.setAnatomicalLocationDesc("Left Forearm");
            new SNOMED_AU_Code("7771000", String.format("Left"))));
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
    imageDetail.setImage(getAttachedMedia(""));
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
    imagingExaminationResult.setCustomNarrativeImagingExaminationResult(null);
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

  private DiagnosesInterventions getDiagnosesOrInterventions() {
    DiagnosesInterventions diagnosesInterventions = new DiagnosesInterventions();
    diagnosesInterventions.setCustomNarrativeDiagnosesIntervention(null);
    List<ProblemDiagnosis> problemDiagnoses = new ArrayList<>();
    SNOMED_AU_Code identification = new SNOMED_AU_Code("85189001", "Acute appendicitis");
    PreciseDate dateOfOnset = new PrecisionDate(Precision.DAY,  new DateTime("2019-07-15"));
    PreciseDate remissionDate = new PrecisionDate(Precision.DAY, new DateTime("2019-07-16"));
    ProblemDiagnosis problemDiagnosis =
        new ProblemDiagnosisImpl(
            identification, dateOfOnset, remissionDate, "Problem/Diagnosis Comment goes here.");
    problemDiagnoses.add(problemDiagnosis);
    diagnosesInterventions.setProblemDiagnoses(problemDiagnoses);
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
    diagnosesInterventions.setProcedures(procedures);
    List<UncatagorisedMedicalHistoryItem> uncatagorisedMedicalHistoryItems = new ArrayList<>();

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
    UncatagorisedMedicalHistoryItem uncatagorisedMedicalHistoryItem =
        new UncatagorisedMedicalHistoryItemImpl(
            "Broken right arm.",
            timeInterval,
            "Childhood injury.");
    uncatagorisedMedicalHistoryItems.add(uncatagorisedMedicalHistoryItem);
    diagnosesInterventions.setUncatagorisedMedicalHistoryItems(uncatagorisedMedicalHistoryItems);
    return diagnosesInterventions;
  }

  private Medications getMedications() {
    Medications medications = new MedicationsImpl();
    List<KnownMedication> knownMedications = new ArrayList<>();
    KnownMedication knownMedication = new KnownMedicationImpl();
    knownMedication.setChangeDesc("New - prescribed");
    knownMedication.setChangeOrRecommendationReason("New - prescribed");
    knownMedication.setChangeStatus(
        new CodeImpl("703465008", "2.16.840.1.113883.6.96", "SNOMED CT",
            "Change made", "Change made"));
    knownMedication.setChangeType(
        new CodeImpl("105681000036100", "2.16.840.1.113883.6.96", "SNOMED CT",
            "Prescribed", "Prescribed"));
    knownMedication.setClinicalIndication("Pain control");
    knownMedication.setDirections("Directions Text");
    //todo check with John. Error:
    //'Warning: TC-Narr-09 step 7: The Medication Instruction Comment data element 'act/text' in  the Medications
    // section contains the text "Dosage to be reviewed in 10 days" but this does not seem to be present in the
    // narrative of the section.  The Medication Instruction Comment data element records clinical information and
    // all clinical information in entry elements must be present in the narrative.  (See requirements in Appendix A
    // 'CDA Narratives' in the Event Summary CDA Implementation Guide.)'

    //The narrative appears to be correct. I wonder if it is in the wrong sections, or an error with the IQ Rules.

    knownMedication.setMedicationInstructionComment("Dosage to be reviewed in 10 days");
    knownMedication.setTherapeuticGoodIdentification(
        new CodeImpl(
            "835831000168109", "2.16.840.1.113883.6.96", "SNOMED CT",
            "Panadeine Forte uncoated tablet", "Panadeine Forte tablet: uncoated"));
    knownMedications.add(knownMedication);
    medications.setKnownMedications(knownMedications);
    return medications;
  }

  private EventDetails getEventDetails() {
    return new EventDetails("Clinical Synopsis Desc",
        null);
  }


}
