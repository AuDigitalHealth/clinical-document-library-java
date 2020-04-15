package au.gov.nehta.cda.es;

import au.gov.nehta.builder.es.EventSummaryCreator;
import au.gov.nehta.builder.util.UUIDTool;
import au.gov.nehta.cda.test.Base;
import au.gov.nehta.cda.test.TestHelper;
import au.gov.nehta.model.cda.common.code.*;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocumentFactory;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.cda.common.time.Precision;
import au.gov.nehta.model.cda.common.time.PrecisionDate;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.cda.es.EventSummaryCDAModel;
import au.gov.nehta.model.clinical.common.*;
import au.gov.nehta.model.clinical.es.AdverseReaction;
import au.gov.nehta.model.clinical.es.AdverseReactionImpl;
import au.gov.nehta.model.clinical.es.KnownMedication;
import au.gov.nehta.model.clinical.es.KnownMedicationImpl;
import au.gov.nehta.model.clinical.es.ReactionEvent;
import au.gov.nehta.model.clinical.es.ReactionEventImpl;
import au.gov.nehta.model.clinical.es.*;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.gov.nehta.schematron.Schematron;
import au.gov.nehta.schematron.SchematronCheckResult;
import org.joda.time.DateTime;
import org.junit.Test;
import org.w3c.dom.Document;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import static au.gov.nehta.cda.test.TestHelper.*;

public class EventSummaryGestationalDiabetesTest extends Base {

  private static final String SCHEMATRON = "ccd-3B.sch";
  private static String SCHEMATRON_TEMPLATE_PATH = "src/test/resources/EventSummary";
  private static final String DOCUMENT_FILE_NAME = "src/test/resources/generated_xml/event_summary/es-Gestational-Diabetes-java.xml";


  @Test
  public void test_MAX_Event_Summary_Creation() {
    try {
      generateMax();
      SchematronCheckResult check =
          Schematron.check(SCHEMATRON_TEMPLATE_PATH, SCHEMATRON, DOCUMENT_FILE_NAME);
      show(check);
    } catch (SchematronValidationException | JAXBException | ParserConfigurationException e) {
      e.printStackTrace();
    }
  }

  private void generateMax()
      throws SchematronValidationException, JAXBException, ParserConfigurationException {
    DateTime now = new DateTime();
    DocumentAuthor documentAuthor = getDocumentAuthor(now);
    RestrictedTimeInterval encounterPeriod =
        RestrictedTimeInterval.getLowHighInstance(
            new PrecisionDate(Precision.DAY, new DateTime("2019-07-15")),
            new PrecisionDate(Precision.DAY, new DateTime("2019-07-15")));
    // Prepare Event Summary Context
    EventSummaryContext eventSummaryContext =
        new EventSummaryContextImpl(
            getSubjectOfCareParticipantFemale(), documentAuthor, encounterPeriod);

    // Prepare Event Summary Content
    EventSummaryContent eventSummaryContent =
        new EventSummaryContentImpl();
    eventSummaryContent.setCustomNarrativeMedications(null);
    eventSummaryContent.setCustomNarrativeAdministrativeObservations(null);
    eventSummaryContent.setDiagnosticInvestigations(getDiagnosticInvestigations());
    eventSummaryContent.setImmunisations(getImmunisations());
    eventSummaryContent.setMedicalHistory(getDiagnosesOrInterventions());
    eventSummaryContent.setEventDetails(getEventDetails());
    eventSummaryContent.setNewlyIdentifiedAdverseReactions(getNewlyIdentifiedAdverseReactions());
    eventSummaryContent.setMedications(getMedications());
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
    return new OtherTestResultImpl(new CodeImpl() {{
      setOriginalText("Report Name");
    }}, new CodeImpl("3", "1.2.36.1.2001.1001.101.104.16501", "NCTIS Result Status Values",
        "Final"), new PrecisionDate(Precision.DAY, new DateTime("2017-1-1")), reportContent);
  }


  private OtherTestResult getOtherTestResultOralGlucoseToleranceWithContent() {
    String reportContent = "75mg OGTT (Oral Glucose Tolerance Test): (week 24) \nClinical Indication: Previous Hyperglycemia presence of risk factors to confirm gestational diabetes \nSerum/ Plasma Glucose: Sample collected at 0 hour, 1 hour post glucose administration and at 2 hours. Sample collected in Oxalate tube x3 from right cubital vein. \nDate Collected: 15 July 2019 \nTime Collected: \t\t\n8:00am\t\tFasting: 6mmol/l (<5.1 mmol/L) \n9:00am\t\t1hour: 11 mmol/l (<10 mmol/L) \n10:00am \t2 hour: 8.9 mmol/l (<8.5 mmol/L) \n\nRecommendation: Impaired glucose tolerance consistent with Gestational Diabetes.";
    return new OtherTestResultImpl(new CodeImpl() {{
      setOriginalText("Report Name");
    }}, new CodeImpl("3", "1.2.36.1.2001.1001.101.104.16501", "NCTIS Result Status Values",
        "Final"), new PrecisionDate(Precision.DAY, new DateTime("2017-1-1")), reportContent);
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

  private MedicalHistory getDiagnosesOrInterventions() {
    MedicalHistory medicalHistory = new MedicalHistory();
    medicalHistory.setCustomNarrative(null);
    List<ProblemDiagnosis> problemDiagnoses = new ArrayList<>();

    SNOMED_AU_Code identification = new SNOMED_AU_Code("11687002",
        "Gestational diabetes mellitus");

    PreciseDate dateOfOnset = new PrecisionDate(Precision.DAY, new DateTime("2019-07-15"));

    ProblemDiagnosis problemDiagnosis =
        new ProblemDiagnosisImpl(
            identification, dateOfOnset, null, "test");
    problemDiagnoses.add(problemDiagnosis);
    medicalHistory.setProblemDiagnoses(problemDiagnoses);
    List<UncategorisedMedicalHistoryItem> uncategorisedMedicalHistoryItems = new ArrayList<>();

    medicalHistory.setUncategorisedMedicalHistoryItems(uncategorisedMedicalHistoryItems);
    return medicalHistory;
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
    return new EventDetails() {{
      setClinicalSynopsisDesc(
          "Mrs Sharma 43 years old G2 P1, currently 24 weeks gestation.  She had hyperglycaemia in her screening test and followed up by OGTT which has confirmed Gestational Diabetes. She has been prescribed Insulin pre meal and before bed.  She needs to monitor her blood sugar before taking insulin.  She has been counselled in diet and exercise requirements to help manage her diabetes as well as referrals were made to a dietician and diabetes educator.");
    }};
  }


}
