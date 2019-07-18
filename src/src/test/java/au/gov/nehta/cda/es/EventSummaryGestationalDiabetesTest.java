package au.gov.nehta.cda.es;

import static au.gov.nehta.cda.es.EventSummaryTestHelper.getAttachedMedia;
import static au.gov.nehta.cda.test.TestHelper.getCustodian;
import static au.gov.nehta.cda.test.TestHelper.getEventSummaryAuthor;
import static au.gov.nehta.cda.test.TestHelper.getLegalAuthenticator;
import static au.gov.nehta.cda.test.TestHelper.getSubjectOfCareParticipantFemale;

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
import au.gov.nehta.model.cda.common.participant.EmploymentOrganization;
import au.gov.nehta.model.cda.common.participant.EmploymentOrganizationImpl;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.cda.common.time.Precision;
import au.gov.nehta.model.cda.common.time.PrecisionDate;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.cda.es.EventSummaryCDAModel;
import au.gov.nehta.model.clinical.common.Immunisation;
import au.gov.nehta.model.clinical.common.ImmunisationImpl;
import au.gov.nehta.model.clinical.common.ProblemDiagnosis;
import au.gov.nehta.model.clinical.common.ProblemDiagnosisImpl;
import au.gov.nehta.model.clinical.common.UncatagorisedMedicalHistoryItem;
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
import au.gov.nehta.model.clinical.common.participation.OrganisationNameUsage;
import au.gov.nehta.model.clinical.common.types.HPIO;
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
import au.gov.nehta.model.clinical.es.ReactionEvent;
import au.gov.nehta.model.clinical.es.ReactionEventImpl;
import au.gov.nehta.model.clinical.es.ReferenceRange;
import au.gov.nehta.model.clinical.es.ReferenceRangeDetails;
import au.gov.nehta.model.clinical.es.SpecificLocation;
import au.gov.nehta.model.clinical.es.TestSpecimenDetail;
import au.gov.nehta.model.clinical.es.TestSpecimenDetailImpl;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.gov.nehta.model.schematron.SchematronValidationException;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import org.joda.time.DateTime;
import org.junit.Test;
import org.w3c.dom.Document;

public class EventSummaryGestationalDiabetesTest extends Base {

  private static final String SCHEMATRON = "ccd-3B.sch";
  private static final String SCHEMATRON_TEMPLATE_PATH = "resources/EventSummary";
  private static final String DOCUMENT_FILE_NAME =
      TEST_GENERATION + "es-Gestational-Diabetes-java.xml";


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
            new PrecisionDate(Precision.DAY, new DateTime("2019-07-15")),
            new PrecisionDate(Precision.DAY, new DateTime("2019-07-15")));
    // Prepare Event Summary Context
    EventSummaryContext eventSummaryContext =
        new EventSummaryContextImpl(
            getSubjectOfCareParticipantFemale(), eventSummaryAuthor, encounterPeriod);

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
            getDiagnosticInvestigations());

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
    adverseReaction.setSubstanceOrAgent(
        new CodeImpl("256259004", "2.16.840.1.113883.6.96", "SNOMED CT",
            "Pollen", "Pollen"));
    Coded manifestation =
        new CodeImpl("74776002", "2.16.840.1.113883.6.96", "SNOMED CT",
            "Itching of eye", "Itching of eye");
    manifestations.add(manifestation);

    reactionEvent.setManifestations(manifestations);

    Coded reactionType =
        new CodeImpl("419076005", "2.16.840.1.113883.6.96", "SNOMED CT",
            "Allergic reaction", "Allergic reaction");
    reactionEvent.setReactionType(reactionType);

    adverseReaction.setReactionEvent(reactionEvent);
    adverseReactions.add(adverseReaction);
    return new NewlyIdentifiedAdverseReactionsImpl(adverseReactions, null);
  }

  private DiagnosticInvestigations getDiagnosticInvestigations() {
    DiagnosticInvestigations diagnosticInvestigations = new DiagnosticInvestigationsImpl();
    List<OtherTestResult> otherTestResults = new ArrayList<>();
    otherTestResults.add(getOtherTestResultBloodGlucoseWithContent());
    otherTestResults.add(getOtherTestResultOralGlucoseToleranceWithContent());

    diagnosticInvestigations.setOtherTestResults(otherTestResults);
    return diagnosticInvestigations;
  }

  private OtherTestResult getOtherTestResultBloodGlucoseWithContent() {
    String reportContent = "Blood Glucose: Fasting: 6.2 mmol/L (week 23)\n Clinical Indication: Screening for Hyperglycemia in pregnancy (presence of risk factors)\n Serum/ Plasma Glucose: Sample collected on SST tube from left cubital vein\n Date collected:\t\t\t24 Oct 16\t\t7 March 18\t\t10 July 19\n Time collected:\t\t\t10:50am\t\t\t08:55am\t\t\t09:10am\n Fasting status:\t\t\tRandom\t\t\tFasting\t\t\tFasting\n Serum (3.4-5.4) mmol/l\t\t\t5.3\t\t\t5.2\t\t\t6.2\n \n\nRecommendation: Glucose level above the normal range, consider Oral Glucose tolerance test and / or HbA1c to confirm Gestational Diabetes.";
    OtherTestResult otherTestResult = new OtherTestResultImpl(new CodeImpl() {{
      setOriginalText("Report Name");
    }}, new CodeImpl("3", "1.2.36.1.2001.1001.101.104.16501", "NCTIS Result Status Values",
        "Final"), new PrecisionDate(Precision.DAY, new DateTime("2017-1-1")), reportContent);
    return otherTestResult;
  }


  private OtherTestResult getOtherTestResultOralGlucoseToleranceWithContent() {
    String reportContent = "75mg OGTT (Oral Glucose Tolerance Test): (week 24) \nClinical Indication: Previous Hyperglycemia presence of risk factors to confirm gestational diabetes \nSerum/ Plasma Glucose: Sample collected at 0 hour, 1 hour post glucose administration and at 2 hours. Sample collected in Oxalate tube x3 from right cubital vein. \nDate Collected: 15 July 2019 \nTime Collected: \t\t\n8:00am\t\tFasting: 6mmol/l (<5.1 mmol/L) \n9:00am\t\t1hour: 11 mmol/l (<10 mmol/L) \n10:00am \t2 hour: 8.9 mmol/l (<8.5 mmol/L) \n\nRecommendation: Impaired glucose tolerance consistent with Gestational Diabetes.";
    OtherTestResult otherTestResult = new OtherTestResultImpl(new CodeImpl() {{
      setOriginalText("Report Name");
    }}, new CodeImpl("3", "1.2.36.1.2001.1001.101.104.16501", "NCTIS Result Status Values",
        "Final"), new PrecisionDate(Precision.DAY, new DateTime("2017-1-1")), reportContent);
    return otherTestResult;
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
    australianAddress.setAddressSiteName("Address Site Name");
    australianAddress.setAustralianStateTerritory(
        AustralianStateTerritory.AUSTRALIAN_CAPITAL_TERRITORY);
    australianAddress.setDeliveryPointId(1);
    australianAddress.setLevelNumber("1");
    australianAddress.setLotNumber("2");
    australianAddress.setPostalDeliveryType(PostalDeliveryType.GeneralPostOfficeBox);
    australianAddress.setPostCode("4000");
    australianAddress.setStreetName("Eagle St");
    australianAddress.setStreetNumber(1);
    australianAddress.setStreetSuffix(StreetSuffix.Extension);
    australianAddress.setStreetType(StreetType.Street);
    australianAddress.setSuburbTownLocality("Brisbane City");
    australianAddress.setUnitNumber("2");
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


  private Immunisations getImmunisations() {
    List<Immunisation> immunisationList = new ArrayList<>();
    AMTv3Code therapeuticGood =
        new AMTv3Code("1294151000168108",
            "Afluria Quad 2019 Needle Free injection, 10 x 0.5 mL syringes");

    PreciseDate actionDateTime = new PrecisionDate(Precision.DAY, new DateTime("2019-07-15"));
    Immunisation immunisation = new ImmunisationImpl(therapeuticGood, actionDateTime);
    immunisationList.add(immunisation);
    return new ImmunisationsImpl(immunisationList);
  }

  private DiagnosesInterventions getDiagnosesOrInterventions() {
    DiagnosesInterventions diagnosesInterventions = new DiagnosesInterventions();
    diagnosesInterventions.setCustomNarrativeDiagnosesIntervention(null);
    List<ProblemDiagnosis> problemDiagnoses = new ArrayList<>();

    SNOMED_AU_Code identification = new SNOMED_AU_Code("11687002",
        "Gestational diabetes mellitus");

    PreciseDate dateOfOnset = new PrecisionDate(Precision.DAY, new DateTime("2019-07-15"));

    ProblemDiagnosis problemDiagnosis =
        new ProblemDiagnosisImpl(
            identification, dateOfOnset, null, "test");
    problemDiagnoses.add(problemDiagnosis);
    diagnosesInterventions.setProblemDiagnoses(problemDiagnoses);
    List<UncatagorisedMedicalHistoryItem> uncatagorisedMedicalHistoryItems = new ArrayList<>();

    RestrictedTimeInterval timeInterval =
        RestrictedTimeInterval.getLowHighInstance(
            new PrecisionDate(Precision.DAY, new DateTime("1991-01-1")),
            new PrecisionDate(Precision.DAY, new DateTime("1991-04-1")));
    diagnosesInterventions.setUncatagorisedMedicalHistoryItems(uncatagorisedMedicalHistoryItems);
    return diagnosesInterventions;
  }

  private Medications getMedications() {
    Medications medications = new MedicationsImpl();
    List<KnownMedication> knownMedications = new ArrayList<>();
    KnownMedication knownMedicationNovorapid = new KnownMedicationImpl();
    knownMedicationNovorapid.setChangeDesc("New - prescribed");
    knownMedicationNovorapid.setChangeOrRecommendationReason("New - prescribed");
    knownMedicationNovorapid.setChangeStatus(
        new CodeImpl("703465008", "2.16.840.1.113883.6.96", "SNOMED CT",
            "Change made", "Change made"));
    knownMedicationNovorapid.setChangeType(
        new CodeImpl("105681000036100", "2.16.840.1.113883.6.96", "SNOMED CT",
            "Prescribed", "Prescribed"));
    knownMedicationNovorapid.setClinicalIndication("Gestational Diabetes");
    knownMedicationNovorapid.setDirections("4-6 Units before meals");

    knownMedicationNovorapid.setMedicationInstructionComment("Dosage to be reviewed in 10 days");
    knownMedicationNovorapid.setTherapeuticGoodIdentification(
        new CodeImpl(
            "20044011000036106", "2.16.840.1.113883.6.96", "SNOMED CT",
            "Novorapid 100 units/mL injection, 1 x 10 mL vial",
            "Novorapid 100 units/mL injection"));

    KnownMedication knownMedicationProtaphane = new KnownMedicationImpl();
    knownMedicationProtaphane.setChangeDesc("New - prescribed");
    knownMedicationProtaphane.setChangeOrRecommendationReason("New - prescribed");
    knownMedicationProtaphane.setChangeStatus(
        new CodeImpl("703465008", "2.16.840.1.113883.6.96", "SNOMED CT",
            "Change made", "Change made"));
    knownMedicationProtaphane.setChangeType(
        new CodeImpl("105681000036100", "2.16.840.1.113883.6.96", "SNOMED CT",
            "Prescribed", "Prescribed"));
    knownMedicationProtaphane.setClinicalIndication("Gestational Diabetes");
    knownMedicationProtaphane.setDirections("4-8 Units before bed");

    knownMedicationProtaphane.setMedicationInstructionComment("Dosage to be reviewed in 10 days");
    knownMedicationProtaphane.setTherapeuticGoodIdentification(
        new CodeImpl(
            "1241711000168100", "2.16.840.1.113883.6.96", "SNOMED CT",
            "Protaphane Novolet 100 units/mL injection, 3 mL pen device",
            "Protaphane Novolet 100 units/mL injection, 3 mL pen device"));

    knownMedications.add(knownMedicationNovorapid);
    knownMedications.add(knownMedicationProtaphane);
    medications.setKnownMedications(knownMedications);
    return medications;
  }

  private EventDetails getEventDetails() {
    return new EventDetails(
        "Mrs Sharma has been diagnosed with gestational diabetes as demonstrated by her Blood Glucose levels. Mrs Sharma has been prescribed insulin for premeal and before bed. As well as counselled in diet and exercise requirements to help manage the diabetes.",
        null);
  }


}
