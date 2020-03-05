package au.gov.nehta.cda.ds;

import static au.gov.nehta.cda.test.TestHelper.getAddress;
import static au.gov.nehta.cda.test.TestHelper.getCustodian;
import static au.gov.nehta.cda.test.TestHelper.getDiagnosticInvestigations;
import static au.gov.nehta.cda.test.TestHelper.getElectronicCommunicationDetail;
import static au.gov.nehta.cda.test.TestHelper.getEmploymentOrganization;
import static au.gov.nehta.cda.test.TestHelper.getInformationRecipients;
import static au.gov.nehta.cda.test.TestHelper.getLegalAuthenticator;
import static au.gov.nehta.cda.test.TestHelper.getServiceProviderOrganization;
import static au.gov.nehta.cda.test.TestHelper.getSubjectOfCareParticipant;
import static au.gov.nehta.model.schematron.SchematronResource.SchematronResources.DISCHARGE_SUMMARY_3B;

import au.gov.nehta.builder.ds.DischargeSummaryCreator;
import au.gov.nehta.builder.util.UUIDTool;
import au.gov.nehta.cda.test.Base;
import au.gov.nehta.cda.test.TestHelper;
import au.gov.nehta.model.cda.common.ElectronicCommunicationDetail;
import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.cda.common.code.CodeImpl;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.code.DocumentStatusCode;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocumentFactory;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.person_org.PersonHealthcareProvider;
import au.gov.nehta.model.cda.common.person_org.PersonImpl;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.cda.common.time.Precision;
import au.gov.nehta.model.cda.common.time.PrecisionDate;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.cda.ds.DischargeSummaryCDAModel;
import au.gov.nehta.model.clinical.common.DocumentAuthor;
import au.gov.nehta.model.clinical.common.EventTypes;
import au.gov.nehta.model.clinical.common.address.Address;
import au.gov.nehta.model.clinical.common.participation.OrganisationImpl;
import au.gov.nehta.model.clinical.common.participation.OrganisationNameUsage;
import au.gov.nehta.model.clinical.common.participation.PersonName;
import au.gov.nehta.model.clinical.common.participation.PersonNameImpl;
import au.gov.nehta.model.clinical.common.participation.PersonNameUsage;
import au.gov.nehta.model.clinical.common.types.HPII;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;
import au.gov.nehta.model.clinical.ds.AdverseReaction;
import au.gov.nehta.model.clinical.ds.AdverseReactions;
import au.gov.nehta.model.clinical.ds.AdverseReactionsImpl;
import au.gov.nehta.model.clinical.ds.Alert;
import au.gov.nehta.model.clinical.ds.Alerts;
import au.gov.nehta.model.clinical.ds.ArrangedService;
import au.gov.nehta.model.clinical.ds.ArrangedServiceImpl;
import au.gov.nehta.model.clinical.ds.ArrangedServices;
import au.gov.nehta.model.clinical.ds.CeasedMedications;
import au.gov.nehta.model.clinical.ds.CeasedMedicationsImpl;
import au.gov.nehta.model.clinical.ds.ChangeDetail;
import au.gov.nehta.model.clinical.ds.ClinicalIntervention;
import au.gov.nehta.model.clinical.ds.ClinicalInterventionsPerformedThisVisit;
import au.gov.nehta.model.clinical.ds.ClinicalInterventionsPerformedThisVisitImpl;
import au.gov.nehta.model.clinical.ds.ClinicalSynopsis;
import au.gov.nehta.model.clinical.ds.CurrentMedicationsOnDischarge;
import au.gov.nehta.model.clinical.ds.CurrentMedicationsOnDischargeImpl;
import au.gov.nehta.model.clinical.ds.DischargeSummary;
import au.gov.nehta.model.clinical.ds.DischargeSummaryContent;
import au.gov.nehta.model.clinical.ds.DischargeSummaryContentImpl;
import au.gov.nehta.model.clinical.ds.DischargeSummaryContext;
import au.gov.nehta.model.clinical.ds.DischargeSummaryContextImpl;
import au.gov.nehta.model.clinical.ds.DischargeSummaryImpl;
import au.gov.nehta.model.clinical.ds.Dosage;
import au.gov.nehta.model.clinical.ds.Encounter;
import au.gov.nehta.model.clinical.ds.EncounterImpl;
import au.gov.nehta.model.clinical.ds.Event;
import au.gov.nehta.model.clinical.ds.EventImpl;
import au.gov.nehta.model.clinical.ds.HealthCareProviders;
import au.gov.nehta.model.clinical.ds.HealthProfile;
import au.gov.nehta.model.clinical.ds.HealthProfileImpl;
import au.gov.nehta.model.clinical.ds.InformationProvided;
import au.gov.nehta.model.clinical.ds.MedicationHistory;
import au.gov.nehta.model.clinical.ds.MedicationHistoryImpl;
import au.gov.nehta.model.clinical.ds.Medications;
import au.gov.nehta.model.clinical.ds.MedicationsImpl;
import au.gov.nehta.model.clinical.ds.Plan;
import au.gov.nehta.model.clinical.ds.PlanImpl;
import au.gov.nehta.model.clinical.ds.ProblemDiagnosesThisVisit;
import au.gov.nehta.model.clinical.ds.ProblemDiagnosesThisVisitImpl;
import au.gov.nehta.model.clinical.ds.ProblemDiagnosis;
import au.gov.nehta.model.clinical.ds.ProblemDiagnosisImpl;
import au.gov.nehta.model.clinical.ds.Protocol;
import au.gov.nehta.model.clinical.ds.ReactionDetail;
import au.gov.nehta.model.clinical.ds.RecommendationsProvided;
import au.gov.nehta.model.clinical.ds.RecordOfRecommendationsAndInfoProvided;
import au.gov.nehta.model.clinical.ds.RecordOfRecommendationsAndInfoProvidedImpl;
import au.gov.nehta.model.clinical.ds.TherapeuticGood;
import au.gov.nehta.model.clinical.ds.TherapeuticGoodImpl;
import au.gov.nehta.model.clinical.es.DiagnosticInvestigations;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProviderImpl;
import au.gov.nehta.model.clinical.etp.common.participation.ServiceProvider;
import au.gov.nehta.model.clinical.etp.common.participation.ServiceProviderImpl;
import au.gov.nehta.model.clinical.shs.ExclusionStatement;
import au.gov.nehta.model.clinical.shs.ExclusionStatementImpl;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.gov.nehta.schematron.Schematron;
import au.gov.nehta.schematron.SchematronCheckResult;
import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import junit.framework.Assert;
import org.joda.time.DateTime;
import org.junit.Test;
import org.w3c.dom.Document;

public class DischargeSummaryMaxTest extends Base {

  private static final String SCHEMATRON = DISCHARGE_SUMMARY_3B.resource().getSchematron();
  private static String SCHEMATRON_TEMPLATE_PATH = "resources/DischargeSummary";
  private static final String DOCUMENT_FILE_NAME = TEST_GENERATION + "/ds/ds-max-java.xml";

  @Test
  public void test_MAX_Discharge_Summary_Creation() {
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
    } catch (SchematronValidationException | ParserConfigurationException | JAXBException e) {
      e.printStackTrace();
    }
  }

  private void generateMax()
      throws SchematronValidationException, JAXBException, ParserConfigurationException {
    DateTime now = new DateTime();
    DocumentAuthor documentAuthor = TestHelper.getDocumentAuthor(now);

    // Prepare Discharge Summary Context
    ParticipationServiceProvider facility = new ParticipationServiceProviderImpl();
    PreciseDate dateTimeAttested = new PrecisionDate(Precision.DAY, now.minusHours(6));
    RestrictedTimeInterval encounterPeriod =
        RestrictedTimeInterval.getLowHighInstance(
            new PrecisionDate(Precision.DAY, new DateTime("2019-03-01")),
            new PrecisionDate(Precision.DAY, new DateTime("2019-04-01")));
    facility.setParticipationPeriod(encounterPeriod);
    facility.setParticipant(getServiceProviderOrganization());
    facility.setRole(
        new CodeImpl("HOSP", "2.16.840.1.113883.1.11.17660", "HL7 ServiceDeliveryLocationRoleType",
            "Hospital"));

    DischargeSummaryContext dischargeSummaryContext = new DischargeSummaryContextImpl(
        documentAuthor,
        getSubjectOfCareParticipant(), facility, encounterPeriod, dateTimeAttested,
        "Some care setting");

    DischargeSummaryContent dischargeSummaryContent = new DischargeSummaryContentImpl(getEvent(),
        getMedications(), getHealthProfile(), getPlan());

    DischargeSummary dischargeSummary = new DischargeSummaryImpl();
    dischargeSummary.setContext(dischargeSummaryContext);
    dischargeSummary.setContent(dischargeSummaryContent);

    ClinicalDocument cdaClinicalDocument = ClinicalDocumentFactory.getDischargeSummary();
    cdaClinicalDocument.setClinicalDocumentId(UUIDTool.uuidToOid(UUID.randomUUID().toString()));

    cdaClinicalDocument.setLanguageCode("en-AU");
    cdaClinicalDocument.setVersionNumber(1);
    cdaClinicalDocument.setCompletionCode(DocumentStatusCode.FINAL);

    DischargeSummaryCDAModel dischargeSummaryCDAModel = new DischargeSummaryCDAModel(
        cdaClinicalDocument, getInformationRecipients(), getCustodian(), getLegalAuthenticator(now),
        now);

    DischargeSummaryCreator dischargeSummaryCreator =
        new DischargeSummaryCreator(dischargeSummaryCDAModel, dischargeSummary);

    Document clinicalDocument = dischargeSummaryCreator.create();
    String cdaString = TestHelper.documentToXML(clinicalDocument);
    TestHelper.printToFile(cdaString, DOCUMENT_FILE_NAME);
    System.out.println(cdaString);

  }


  private Event getEvent() {
    DiagnosticInvestigations diagnosticInvestigations = getDiagnosticInvestigations(true, true,
        true, true);
    diagnosticInvestigations.setRequestedServices(null);
    diagnosticInvestigations.setRequestedServicesServiceReferral(null);
    return new EventImpl(getEncounter(), getProblemDiagnosisThisVisit(),
        getClinicalInterventionsPerformedThisVisit(), getClinicalSynopsis(),
        diagnosticInvestigations);
  }


  private ClinicalSynopsis getClinicalSynopsis() {
    ClinicalSynopsis clinicalSynopsis = new ClinicalSynopsis();
    clinicalSynopsis.setClinicalSynopsisDesc(
        "This 61yo female was admitted for elective, right, total knee replacement. Past history of mild\n"
            + "COPD, mild anaemia, and radiation cystitis. A cemented prosthesis was inserted without difficulty\n"
            + "under combined lumbar epidural and general anaesthetic. On day 2, she developed bilateral basal\n"
            + "atelectasis. Ongoing problems with inadequate pain management because of persistent hypotension\n"
            + "secondary to the epidural. The epidural was ceased and the patient was switched to a morphine PCA\n"
            + "regime. Due to concern about the potential for pneumonia in the presence of COPD she was commenced on\n"
            + "oral antibiotics and given regular chest physiotherapy. Due to mild anaemia prior to surgery and\n"
            + "subsequent operative blood loss she required a blood transfusion of three units. She was given regular\n"
            + "enoxaparin (Clexane) to reduce the risk of DVT. The patient subsequently makes steady progress,\n"
            + "regaining good mobility in her knee and is able to mobilise with the aid of a stick. She is on\n"
            + "regular paracetamol and codeine for pain relief, as well as her usual medications for COPD. The Celecoxib was ceased. Aspirin is to be recommenced at the discretion of the GP. Discharged with\n"
            + "post-op analgesics and oral antibiotics.");

    return clinicalSynopsis;
  }

  private ClinicalInterventionsPerformedThisVisit getClinicalInterventionsPerformedThisVisit() {
    ClinicalInterventionsPerformedThisVisit clinicalInterventionsPerformedThisVisit = new ClinicalInterventionsPerformedThisVisitImpl();
    clinicalInterventionsPerformedThisVisit
        .setClinicalInterventions((new ArrayList<ClinicalIntervention>() {{
          Code code = new CodeImpl("443682009", "2.16.840.1.113883.6.96", "SNOMED-CT",
              "Total right knee joint replacement");
          ClinicalIntervention clinicalIntervention = new ClinicalIntervention();
          clinicalIntervention.setClinicalInterventionDesc(code);
          add(clinicalIntervention);
        }}));

    return clinicalInterventionsPerformedThisVisit;
  }

  private ProblemDiagnosesThisVisit getProblemDiagnosisThisVisit() {
    ProblemDiagnosesThisVisit problemDiagnosesThisVisit = new ProblemDiagnosesThisVisitImpl();
    //Exclusion Statement
    ExclusionStatement pdxclusionStatement = new ExclusionStatementImpl();
    pdxclusionStatement.setGlobalStatement(
        new CodeImpl("01", "1.2.36.1.2001.1001.101.104.16299", "NCTIS Global Statement Values",
            "None known"));
    //Exclusion statement and problem-diagnoses are mutually exclusive
//    problemDiagnosesThisVisit.setExclusionStatement(pdxclusionStatement);
    //Problem Diagnosis
    problemDiagnosesThisVisit.setProblemDiagnoses((new ArrayList<ProblemDiagnosis>() {{
      ProblemDiagnosis problemDiagnosis = new ProblemDiagnosisImpl();
      problemDiagnosis.setProblemDiagnosisType(
          new CodeImpl("116223007", "2.16.840.1.113883.6.96", "SNOMED-CT", "Complication"));
      problemDiagnosis.setProblemDiagnosisDesc(
          new CodeImpl("236629009", "2.16.840.1.113883.6.96", "SNOMED-CT",
              "Chronic radiation cystitis"));
      add(problemDiagnosis);
    }}));

    return problemDiagnosesThisVisit;
  }

  private Encounter getEncounter() {
    Encounter encounter = new EncounterImpl();
    encounter.setLocationOfDischarge("Ward B");
    RestrictedTimeInterval encounterPeriod =
        RestrictedTimeInterval.getLowHighInstance(
            new PrecisionDate(Precision.DAY, new DateTime("2019-03-02")),
            new PrecisionDate(Precision.DAY, new DateTime("2022-03-30")));
    encounter.setEncounterPeriod(encounterPeriod);
    encounter.setSeparationMode(new CodeImpl("8", "2.16.840.1.113883.13.65",
        "AIHW Mode of Separation",
        "Deceased"));
    encounter.setSpecialtyList(
        new ArrayList<Coded>() {{
          add(new CodeImpl("103.16028", "1.2.36.1.2001.1001.101", "NCTIS Data Components",
              "Specialty"));
        }});

    //Responsible Health Professional at discharge
    ParticipationServiceProvider participantServiceProvider =
        new ParticipationServiceProviderImpl();
    participantServiceProvider.setParticipant(getServiceProviderIndividual());
    participantServiceProvider.setRole(
        new CodeImpl(
            "309964003",
            "2.16.840.1.113883.6.96",
            "SNOMED CT",
            "Radiology Department",
            "Radiology Department"));
    participantServiceProvider.setParticipationPeriod(
        RestrictedTimeInterval.getLowHighInstance(
            new PrecisionDate(Precision.DAY, new DateTime("2019-03-03")),
            new PrecisionDate(Precision.DAY, new DateTime("2019-03-29"))));
    encounter.setResponsibleHealthProfessionalAtDischarge(participantServiceProvider);

    //Other Participant
    encounter.setOtherParticipant(new ArrayList<ParticipationServiceProvider>() {{
      ParticipationServiceProvider participantServiceProvider =
          new ParticipationServiceProviderImpl();
      participantServiceProvider.setParticipant(getServiceProviderIndividual());
      participantServiceProvider.setRole(
          new CodeImpl(
              "309964003",
              "2.16.840.1.113883.6.96",
              "SNOMED CT",
              "Radiology Department",
              "Radiology Department"));
      participantServiceProvider.setParticipationPeriod(
          RestrictedTimeInterval.getLowHighInstance(
              new PrecisionDate(Precision.DAY, new DateTime("2019-03-04")),
              new PrecisionDate(Precision.DAY, new DateTime("2019-03-28"))));
      add(participantServiceProvider);
    }});
    return encounter;
  }

  private Medications getMedications() {
    return new MedicationsImpl(getCurrentMedicationsOnDischarge(), getCeasedMedications());
  }

  private CeasedMedications getCeasedMedications() {
    //Ceased Medications
    CeasedMedications ceasedMedications = new CeasedMedicationsImpl();

    //Ceased Medications -> Exclusion Statement
    ExclusionStatement cmExclusionStatement = new ExclusionStatementImpl();
    cmExclusionStatement.setGlobalStatement(
        new CodeImpl("02", "1.2.36.1.2001.1001.101.104.16299", "NCTIS Global Statement Values",
            "Not asked"));
    // If a Medication statement is present, then an Exclusion statement cannot exits. Same applies for the reverse.
    // ceasedMedications.setExclusionStatement(cmExclusionStatement);

    //Ceased Medications -> Therapeutic Good
    ceasedMedications.setTherapeuticGoods(
        new ArrayList<TherapeuticGood>() {{
          TherapeuticGood therapeuticGood = new TherapeuticGoodImpl();
          therapeuticGood.setTherapeuticGoodIdentification(
              new CodeImpl("79115011000036100", "2.16.840.1.113883.6.96",
                  "Australian Medicines Terminology module",
                  "paracetamol 500 mg + codeine phosphate hemihydrate 30 mg tablet"));
          MedicationHistory medicationHistory = new MedicationHistoryImpl();
          medicationHistory.setItemStatus(
              new CodeImpl("105691000036103", "2.16.840.1.113883.6.96", "SNOMED-CT",
                  "Changed"));
          ChangeDetail changeDetail = new ChangeDetail();
          changeDetail.setChangesMade(
              new CodeImpl("274512008", "2.16.840.1.113883.6.96", "SNOMED-CT",
                  "Medication discontinued"));
          changeDetail.setReasonForChange("Side effect");
          medicationHistory.setChangeDetail(changeDetail);
          therapeuticGood.setMedicationHistory(medicationHistory);
          add(therapeuticGood);
        }});

    return ceasedMedications;
  }

  private CurrentMedicationsOnDischarge getCurrentMedicationsOnDischarge() {
    //Current Medications on Discharge
    CurrentMedicationsOnDischarge currentMedications = new CurrentMedicationsOnDischargeImpl();
    //Current Medications on Discharge -> Exclusion Statement
    ExclusionStatement cmodExclusionStatement = new ExclusionStatementImpl();
    cmodExclusionStatement.setGlobalStatement(
        new CodeImpl("03", "1.2.36.1.2001.1001.101.104.16299", "NCTIS Global Statement Values",
            "None supplied"));
    //Person can either have exclusion statement or medications
    //currentMedications.setExclusionStatement(cmodExclusionStatement);

    //Current Medications on Discharge -> Therapeutic Good
    currentMedications.setTherapeuticGoods(
        new ArrayList<TherapeuticGood>() {{
          TherapeuticGood therapeuticGood = new TherapeuticGoodImpl();
          therapeuticGood.setDosage(new Dosage("2 tablets daily after breakfast"));
          therapeuticGood.setUnitOfUseQuantityDispensed("25 tablets");
          therapeuticGood.setReasonForTherapeuticGood("Pain control");
          therapeuticGood.setAdditionalComments("Dosage to be reviewed in 10 days");
          therapeuticGood.setTherapeuticGoodIdentification(
              new CodeImpl("79115011000036100", "2.16.840.1.113883.6.96",
                  "Australian Medicines Terminology module",
                  "paracetamol 500 mg + codeine phosphate hemihydrate 30 mg tablet"));
          MedicationHistory medicationHistory = new MedicationHistoryImpl();

          Code medicationHistoryCode = new CodeImpl("105681000036100", "2.16.840.1.113883.6.96",
              "SNOMED-CT",
              "Prescribed");
          medicationHistoryCode.setCodeSystemVersion("20110531");
          medicationHistory.setItemStatus(medicationHistoryCode);

          ChangeDetail changeDetail = new ChangeDetail();
          changeDetail.setChangesMade(
              new CodeImpl("182877009", "2.16.840.1.113883.6.96", "SNOMED-CT",
                  "Drug dosage altered"));
          changeDetail.setReasonForChange("Optimise drug therapy.");
          medicationHistory.setChangeDetail(changeDetail);
          medicationHistory.setMedicationDuration(RestrictedTimeInterval.getLowHighInstance(
              new PrecisionDate(Precision.DAY, new DateTime("2019-03-05")),
              new PrecisionDate(Precision.DAY, new DateTime("2022-04-27"))));
          therapeuticGood.setMedicationHistory(medicationHistory);
          add(therapeuticGood);
        }});

    return currentMedications;
  }

  private HealthProfile getHealthProfile() {
    HealthProfile healthProfile = new HealthProfileImpl();
    //Health Profile -> Healthcare Providers
    HealthCareProviders healthCareProviders = new HealthCareProviders();
    healthCareProviders
        .setNominatedPrimaryHealthcareProviders(new ArrayList<ParticipationServiceProvider>() {{
          ParticipationServiceProvider nominatedProvider = new ParticipationServiceProviderImpl();
          nominatedProvider.setRole(new CodeImpl("252511", "2.16.840.1.113883.13.62",
              "1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, 2006",
              "Physiotherapist", "Physiotherapist"));
          nominatedProvider.setParticipationPeriod(RestrictedTimeInterval.getLowHighInstance(
              new PrecisionDate(Precision.DAY, new DateTime("2019-03-26")),
              new PrecisionDate(Precision.DAY, new DateTime("2019-03-06"))));
          nominatedProvider.setParticipant(getServiceProviderIndividual());
          add(nominatedProvider);
        }});
    healthProfile.setHealthCareProviders(healthCareProviders);

    //Adverse Reactions Begin
    AdverseReactions adverseReactions = new AdverseReactionsImpl();
    //Adverse Reactions -> Exclusion Statement
    ExclusionStatement cmodExclusionStatement = new ExclusionStatementImpl();
    cmodExclusionStatement.setGlobalStatement(
        new CodeImpl("103.16302.4.3.4", "1.2.36.1.2001.1001.101", "NCTIS Data Components",
            "Global Statement"));
    // If a Medication statement is present, then an Exclusion statement cannot exits. Same applies for the reverse.
    //adverseReactions.setExclusionStatement(cmodExclusionStatement);

    //Adverse Reaction
    adverseReactions.setAdverseReactionList(new ArrayList<AdverseReaction>() {{
      AdverseReaction adverseReaction = new AdverseReaction();
      adverseReaction
          .setAgentDesc(new CodeImpl("735029006", "2.16.840.1.113883.6.96", "SNOMED CT-AU",
              "Shellfish")); //Correct code is 735029006 (substance) and 54787006 (invalid - for test purposes. )
      adverseReaction
          .setAdverseReactionType(
              new CodeImpl("419076005", "2.16.840.1.113883.6.96", "SNOMED CT-AU",
                  "Allergic reaction"));

      adverseReaction.setReactionDetail(new ArrayList<ReactionDetail>() {{
        ReactionDetail reactionDetail = new ReactionDetail();
        reactionDetail
            .setReactionDesc(new CodeImpl("271807003", "2.16.840.1.113883.6.96", "SNOMED CT-AU",
                "Rash"));
        add(reactionDetail);
        add(reactionDetail);
      }});

      add(adverseReaction);
    }});
    healthProfile.setAdverseReactions(adverseReactions);

    //Health Profile -> Alerts
    Alerts alerts = new Alerts();
    alerts.setAlertList(new ArrayList<Alert>() {{
      Alert alert = new Alert();
      alert.setAlertType(new CodeImpl("78648007", "2.16.840.1.113883.6.96", "SNOMED-CT",
          "At risk for infection", "At risk for infection"));
      alert.setAlertDesc(new CodeImpl("78648007", "2.16.840.1.113883.6.96", "SNOMED-CT",
          "At risk for infection", "At risk for infection"));
      add(alert);
    }});
    healthProfile.setAlerts(alerts);
    return healthProfile;
  }

  private Plan getPlan() {
    Plan plan = new PlanImpl();
    //Arranged Services
    ArrangedServices arrangedServices = new ArrangedServices();
    arrangedServices.setArrangedServiceList(new ArrayList<ArrangedService>() {{
      ArrangedService arrangedService = new ArrangedServiceImpl();
      arrangedService.setArrangedServiceDesc(
          new CodeImpl() {{
            setOriginalText("Orthopaedic outpatient clinic appointment");
          }});
      arrangedService.setServiceCommencementWindow(RestrictedTimeInterval.getLowHighInstance(
          new PrecisionDate(Precision.DAY, new DateTime("2019-03-07")),
          new PrecisionDate(Precision.DAY, new DateTime("2019-03-15"))));
      arrangedService.setServiceBookingStatus(EventTypes.INTENT);
      Protocol protocol = new Protocol();
      ParticipationServiceProvider serviceProvider = new ParticipationServiceProviderImpl();
      serviceProvider.setRole(new CodeImpl("252511", "2.16.840.1.113883.13.62",
          "1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, 2006",
          "Physiotherapist", "Physiotherapist"));
      serviceProvider.setParticipationPeriod(RestrictedTimeInterval.getLowHighInstance(
          new PrecisionDate(Precision.DAY, new DateTime("2019-03-08")),
          new PrecisionDate(Precision.DAY, new DateTime("2019-03-24"))));
      serviceProvider.setParticipant(getServiceProviderIndividual());
      protocol.setServiceProvider(serviceProvider);
      arrangedService.setProtocol(protocol);
      add(arrangedService);
    }});
    plan.setArrangedServices(arrangedServices);

    //Record of recommendations and information provided
    RecordOfRecommendationsAndInfoProvided recordOfRecommendationsAndInfoProvided = new RecordOfRecommendationsAndInfoProvidedImpl();
    recordOfRecommendationsAndInfoProvided
        .setRecommendationsProvidedList(new ArrayList<RecommendationsProvided>() {{
          RecommendationsProvided recommendationsProvided = new RecommendationsProvided();
          ParticipationServiceProvider recommendationRecipient = new ParticipationServiceProviderImpl();
          recommendationRecipient.setRole(new CodeImpl("252511", "2.16.840.1.113883.13.62",
              "1220.0 - ANZSCO - Australian and New Zealand Standard Classification of Occupations, First Edition, 2006",
              "Physiotherapist", "Physiotherapist"));
          recommendationRecipient.setParticipationPeriod(RestrictedTimeInterval.getLowHighInstance(
              new PrecisionDate(Precision.DAY, new DateTime("2019-03-09")),
              new PrecisionDate(Precision.DAY, new DateTime("2019-03-23"))));
          recommendationRecipient.setParticipant(getServiceProviderIndividual());
          recommendationsProvided.setRecommendationRecipient(recommendationRecipient);
          recommendationsProvided.setRecommendationNote("Recommendation Note");
          add(recommendationsProvided);
        }});
    plan.setRecordOfRecommendationsAndInfoProvided(recordOfRecommendationsAndInfoProvided);

    //Information Provided
    recordOfRecommendationsAndInfoProvided
        .setInformationProvided(new InformationProvided(
            "Information Provided To Subject Of Care and/or "
                + "Relevant Parties"));
    plan.setArrangedServices(arrangedServices);
    return plan;
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

    personHealthcareProvider.setIdentifiers(new ArrayList<UniqueIdentifier>() {{
      add(new UniqueIdentifierImpl("2.16.840.1.113883.19", "123A45"));
    }});

    entityIdentifiers.add(hpii);
    serviceProvider.setEntityIdentifiers(entityIdentifiers);
    serviceProvider.setOrganisation(
        new OrganisationImpl("Acme Hospital", OrganisationNameUsage.BUSINESS_NAME));
    return serviceProvider;
  }
}
