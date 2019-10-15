package au.gov.nehta.cda.ds;

import static au.gov.nehta.builder.DocumentCreatorUtil.HL7_TEXT_MEDIA_TYPE;
import static au.gov.nehta.builder.DocumentCreatorUtil.addTable;
import static au.gov.nehta.builder.DocumentCreatorUtil.addTableBodyRow;
import static au.gov.nehta.builder.DocumentCreatorUtil.addTableHeaderRow;
import static au.gov.nehta.builder.DocumentCreatorUtil.createComplexTD;
import static au.gov.nehta.builder.DocumentCreatorUtil.createHtmlLink;
import static au.gov.nehta.builder.DocumentCreatorUtil.createStrucDocListUnordered;
import static au.gov.nehta.builder.DocumentCreatorUtil.createStrucDocParagraph;
import static au.gov.nehta.builder.DocumentCreatorUtil.createTableWithCaption;
import static au.gov.nehta.builder.common.NarrativeUtilCommon.EVENT_SECTION_TEXT;
import static au.gov.nehta.builder.common.NarrativeUtilCommon.HEALTH_PROFILE_SECTION_TEXT;
import static au.gov.nehta.builder.common.NarrativeUtilCommon.PLAN_SECTION_TEXT;
import static au.gov.nehta.cda.test.TestHelper.getCustodian;
import static au.gov.nehta.cda.test.TestHelper.getInformationRecipients;
import static au.gov.nehta.cda.test.TestHelper.getLegalAuthenticator;
import static au.gov.nehta.cda.test.TestHelper.getServiceProviderIndividual;
import static au.gov.nehta.cda.test.TestHelper.getServiceProviderOrganization;
import static au.gov.nehta.cda.test.TestHelper.getSubjectOfCareParticipant;

import au.gov.nehta.builder.ds.DischargeSummaryCreator;
import au.gov.nehta.builder.util.UUIDTool;
import au.gov.nehta.cda.test.Base;
import au.gov.nehta.cda.test.TestHelper;
import au.gov.nehta.model.cda.common.code.CodeImpl;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.code.DocumentStatusCode;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocumentFactory;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.cda.common.time.Precision;
import au.gov.nehta.model.cda.common.time.PrecisionDate;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.cda.ds.DischargeSummaryCDAModel;
import au.gov.nehta.model.clinical.common.DocumentAuthor;
import au.gov.nehta.model.clinical.ds.AdverseReactions;
import au.gov.nehta.model.clinical.ds.AdverseReactionsImpl;
import au.gov.nehta.model.clinical.ds.Alerts;
import au.gov.nehta.model.clinical.ds.ArrangedServices;
import au.gov.nehta.model.clinical.ds.CeasedMedications;
import au.gov.nehta.model.clinical.ds.CeasedMedicationsImpl;
import au.gov.nehta.model.clinical.ds.ClinicalSynopsis;
import au.gov.nehta.model.clinical.ds.CurrentMedicationsOnDischarge;
import au.gov.nehta.model.clinical.ds.CurrentMedicationsOnDischargeImpl;
import au.gov.nehta.model.clinical.ds.DischargeSummary;
import au.gov.nehta.model.clinical.ds.DischargeSummaryContent;
import au.gov.nehta.model.clinical.ds.DischargeSummaryContentImpl;
import au.gov.nehta.model.clinical.ds.DischargeSummaryContext;
import au.gov.nehta.model.clinical.ds.DischargeSummaryContextImpl;
import au.gov.nehta.model.clinical.ds.DischargeSummaryImpl;
import au.gov.nehta.model.clinical.ds.Encounter;
import au.gov.nehta.model.clinical.ds.EncounterImpl;
import au.gov.nehta.model.clinical.ds.Event;
import au.gov.nehta.model.clinical.ds.EventImpl;
import au.gov.nehta.model.clinical.ds.HealthProfile;
import au.gov.nehta.model.clinical.ds.HealthProfileImpl;
import au.gov.nehta.model.clinical.ds.Medications;
import au.gov.nehta.model.clinical.ds.MedicationsImpl;
import au.gov.nehta.model.clinical.ds.Plan;
import au.gov.nehta.model.clinical.ds.PlanImpl;
import au.gov.nehta.model.clinical.ds.ProblemDiagnosesThisVisit;
import au.gov.nehta.model.clinical.ds.ProblemDiagnosesThisVisitImpl;
import au.gov.nehta.model.clinical.ds.RecordOfRecommendationsAndInfoProvided;
import au.gov.nehta.model.clinical.ds.RecordOfRecommendationsAndInfoProvidedImpl;
import au.gov.nehta.model.clinical.es.DiagnosticInvestigations;
import au.gov.nehta.model.clinical.es.DiagnosticInvestigationsImpl;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProviderImpl;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.StrucDocList;
import au.net.electronichealth.ns.cda._2_0.StrucDocParagraph;
import au.net.electronichealth.ns.cda._2_0.StrucDocTable;
import au.net.electronichealth.ns.cda._2_0.StrucDocTbody;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import au.net.electronichealth.ns.cda._2_0.StrucDocThead;
import java.util.ArrayList;
import java.util.UUID;
import javax.xml.bind.JAXBElement;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import org.joda.time.DateTime;
import org.junit.Test;
import org.w3c.dom.Document;

public class DischargeSummary2Test extends Base {

  private static final String DOCUMENT_FILE_NAME =
      TEST_GENERATION + "/ds/DischargeSummary_format_2.xml";

  private static ObjectFactory objectFactory = new ObjectFactory();
  private DateTime now = new DateTime();

  @Test
  public void test_Discharge_Summary_Format_2_Creation()
      throws SchematronValidationException, JAXBException, ParserConfigurationException {

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

    //Prepare Discharge Summary Content
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
        cdaClinicalDocument,
        getInformationRecipients(), getCustodian(), getLegalAuthenticator(now), now);
    DischargeSummaryCreator dischargeSummaryCreator = new DischargeSummaryCreator(
        dischargeSummaryCDAModel, dischargeSummary, true);

    Document clinicalDocument = dischargeSummaryCreator.create();
    String cdaString = TestHelper.documentToXML(clinicalDocument);
    TestHelper.printToFile(cdaString, DOCUMENT_FILE_NAME);
    System.out.println(cdaString);

  }

  private HealthProfile getHealthProfile() {
    HealthProfile healthProfile = new HealthProfileImpl();
    StrucDocText narrative = objectFactory.createStrucDocText();
    narrative.getContent().add(createTitleDescription(HEALTH_PROFILE_SECTION_TEXT));

    //Adverse Reactions
    healthProfile.setAdverseReactions(getAdverseReactionsNarrative());

    //Alerts
    healthProfile.setAlerts(getAlerts());

    narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
    healthProfile.setCustomNarrative(narrative);
    return healthProfile;
  }

  private Event getEvent() {
    Event event = new EventImpl();
    StrucDocText narrative = objectFactory.createStrucDocText();
    narrative.getContent().add(createTitleDescription(EVENT_SECTION_TEXT));

    //Encompassing Encounter
    event.setEncounter(getEncounter());

    //Problem Diagnosis The Visit
    event.setProblemDiagnosesThisVisit(getProblemDiagnosisThisVisit());

    //Diagnostic Investigations
    event.setDiagnosticInvestigations(getDiagnosticInvestigations());

    //Clinical Summary / Synopsis
    event.setClinicalSynopsis(getClinicalSynopsis());

    narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
    event.setCustomNarrative(narrative);
    return event;
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

  private ProblemDiagnosesThisVisit getProblemDiagnosisThisVisit() {
    ProblemDiagnosesThisVisit problemDiagnosesThisVisit = new ProblemDiagnosesThisVisitImpl();
    StrucDocText narrative = objectFactory.createStrucDocText();
    StrucDocTable strucDocTable = createTableWithCaption("");
    //thead
    StrucDocThead strucDocThead = objectFactory.createStrucDocThead();
    strucDocThead.getTr().add(addTableHeaderRow("Type", "Description"));
    strucDocTable.setThead(strucDocThead);
    //tbody
    StrucDocTbody strucDocTbody = objectFactory.createStrucDocTbody();
    //row1
    strucDocTbody.getTr().add(addTableBodyRow(
        "Accidental bisacodyl overdose", "Infection caused by Spirura"));
    strucDocTbody.getTr().add(addTableBodyRow(
        "Principal diagnosis", "Systemic aspergillosis"));
    strucDocTable.getTbody().add(strucDocTbody);
    addTable(narrative, strucDocTable);
    narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
    problemDiagnosesThisVisit.setCustomNarrative(narrative);
    return problemDiagnosesThisVisit;
  }


  private ClinicalSynopsis getClinicalSynopsis() {
    ClinicalSynopsis clinicalSynopsis = new ClinicalSynopsis();
    StrucDocText narrative = objectFactory.createStrucDocText();
    StrucDocTable strucDocTable = createTableWithCaption("Clinical Summary");
    //thead
    StrucDocThead strucDocThead = objectFactory.createStrucDocThead();
    strucDocThead.getTr().add(addTableHeaderRow("Description"));
    strucDocTable.setThead(strucDocThead);
    //tbody
    StrucDocTbody strucDocTbody = objectFactory.createStrucDocTbody();
    //row1
    strucDocTbody.getTr().add(addTableBodyRow(
        "Admitted for elective, right Total Knee Replacement (cemented prosthesis)."
            + " Day 3, developed bilateral basal atelectasis. The FBC showed high WCC (20.0) and "
            + "high neutrophils (16.0). Commenced on doxycycline and chest physio. Due to mild "
            + "anaemia prior to surgery and subsequent operative blood loss, required a blood "
            + "transfusion of three units. Subsequently made steady progress, regaining good "
            + "mobility in his knee and is able to mobilise with the aid of a stick. Right knee "
            + "Xray showed no fracture or dislocation, with the total knee prosthesis well "
            + "positioned post surgery."));
    strucDocTable.getTbody().add(strucDocTbody);
    addTable(narrative, strucDocTable);
    narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
    clinicalSynopsis.setCustomNarrative(narrative);
    return clinicalSynopsis;
  }

  private Medications getMedications() {
    Medications medications = new MedicationsImpl();
    StrucDocText narrative = objectFactory.createStrucDocText();
    //narrative.getContent().add(createTitleDescription(MEDICATIONS_SECTION_TEXT));

    //Current Medications on Discharge
    medications.setCurrentMedicationsOnDischarge(getCurrentMedicationsOnDischargeNarrative());

    //Ceased Medications
    medications.setCeasedMedications(getCeasedMedicationsNarrative());

    narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
    /*medications
        .addCurrentMedicationsOnDischargeAsNarrative(getCurrentMedicationsOnDischargeNarrative())
        .addCeasedMedicationsOnDischargeAsNarrative(getCeasedMedicationsNarrative());*/
    medications.setCustomNarrative(narrative);
    return medications;
  }

  private CurrentMedicationsOnDischarge getCurrentMedicationsOnDischargeNarrative() {
    CurrentMedicationsOnDischarge currentMedicationsOnDischarge = new CurrentMedicationsOnDischargeImpl();
    StrucDocText narrative = objectFactory.createStrucDocText();
    StrucDocTable strucDocTable = createTableWithCaption("Current Medications on Discharge");
    //thead
    StrucDocThead strucDocThead = objectFactory.createStrucDocThead();
    strucDocThead.getTr().add(addTableHeaderRow("Medicine", "Directions",
        "Duration", "Status", "Clinical Indication", "Change Description", "Change Reason",
        "Quantity Supplied", "Comments"));
    strucDocTable.setThead(strucDocThead);
    //tbody
    StrucDocTbody strucDocTbody = objectFactory.createStrucDocTbody();
    //row1
    strucDocTbody.getTr().add(addTableBodyRow(
        "paracetamol 500 mg + codeine phosphate 30 mg tablet",
        "Dose:1, Frequency: 3 times daily",
        "12 Jul 2019 09:05:05+1000 -> 17 Jul 2019 09:05:05+1000",
        "New",
        "Pneumonia",
        "Dose decreased from 2 tablet 4 a day ",
        "Due to hypotension",
        "2 tablets",
        "Additional Comments"));
    strucDocTable.getTbody().add(strucDocTbody);
    addTable(narrative, strucDocTable);
    narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
    currentMedicationsOnDischarge.setCustomNarrative(narrative);
    return currentMedicationsOnDischarge;
  }

  private AdverseReactions getAdverseReactionsNarrative() {
    AdverseReactions adverseReactions = new AdverseReactionsImpl();
    StrucDocText narrative = objectFactory.createStrucDocText();
    StrucDocTable strucDocTable = createTableWithCaption("Adverse Reactions");
    //thead
    StrucDocThead strucDocThead = objectFactory.createStrucDocThead();
    strucDocThead.getTr().add(addTableHeaderRow(
        "Substance/Agent", "Manifestations", "Reaction Type"));
    strucDocTable.setThead(strucDocThead);

    StrucDocTbody strucDocTbody = objectFactory.createStrucDocTbody();

    StrucDocList sdList = createStrucDocListUnordered("",
        "Urticaria", "Trunk structure", "Entire lower limb", "Nausea and vomiting");
    StrucDocList sdList2 = createStrucDocListUnordered("",
        "Chronic obstructive airways disease NOS");

    //tbody
    strucDocTbody.getTr().add(addTableBodyRow(
        "Penicillin -class of antibiotic-", sdList, "Urticaria"));
    strucDocTbody.getTr().add(addTableBodyRow(
        "Metoprolol", sdList2, "Urticaria"));

    strucDocTable.getTbody().add(strucDocTbody);
    addTable(narrative, strucDocTable);
    narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
    adverseReactions.setCustomNarrative(narrative);
    return adverseReactions;
  }

  private Alerts getAlerts() {
    Alerts alerts = new Alerts();
    StrucDocText narrative = objectFactory.createStrucDocText();
    StrucDocTable strucDocTable = createTableWithCaption("");
    StrucDocTbody strucDocTbody = objectFactory.createStrucDocTbody();

    StrucDocList alertList = createStrucDocListUnordered("",
        "At risk for infection (Medical)", "At risk for infection (Medical)");

    //tbody
    strucDocTbody.getTr().add(addTableBodyRow(
        alertList));

    strucDocTable.getTbody().add(strucDocTbody);
    addTable(narrative, strucDocTable);
    narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
    alerts.setCustomNarrative(narrative);

    return alerts;
  }

  private CeasedMedications getCeasedMedicationsNarrative() {
    CeasedMedications ceasedMedications = new CeasedMedicationsImpl();
    StrucDocText narrative = objectFactory.createStrucDocText();
    StrucDocTable strucDocTable = createTableWithCaption("Ceased Medications");
    //thead
    StrucDocThead strucDocThead = objectFactory.createStrucDocThead();
    strucDocThead.getTr().add(addTableHeaderRow("Medication", "Change Made",
        "Change Status", "Change Reason"));
    strucDocTable.setThead(strucDocThead);
    //tbody
    StrucDocTbody strucDocTbody = objectFactory.createStrucDocTbody();
    //row1
    strucDocTbody.getTr().add(addTableBodyRow(
        "paracetamol 500 mg + codeine phosphate 30 mg tablet",
        "Changes Made",
        "Ceased",
        "No longer required"));
    strucDocTable.getTbody().add(strucDocTbody);
    addTable(narrative, strucDocTable);
    narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
    ceasedMedications.setCustomNarrative(narrative);
    return ceasedMedications;
  }

  private Plan getPlan() {
    Plan plan = new PlanImpl();
    StrucDocText narrative = objectFactory.createStrucDocText();
    narrative.getContent().add(createTitleDescription(PLAN_SECTION_TEXT));

    //Follow-Up Appointments / Arranged Services
    plan.setArrangedServices(getArrangedServices());

    //Record of Recommendations and Information Provided
    plan.setRecordOfRecommendationsAndInfoProvided(getRecordOfRecommendationsAndInfoProvided());

    narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
    plan.setCustomNarrative(narrative);
    return plan;
  }

  private ArrangedServices getArrangedServices() {
    ArrangedServices arrangedServices = new ArrangedServices();
    StrucDocText narrative = objectFactory.createStrucDocText();

    //Appointments
    StrucDocTable strucDocTable = createTableWithCaption("Follow-up Appointments");
    //thead
    StrucDocThead strucDocThead = objectFactory.createStrucDocThead();
    strucDocThead.getTr()
        .add(addTableHeaderRow("Description", "Commencement", "Status", "Name", "Details", "Phone",
            "Email"));
    //tbody
    StrucDocTbody strucDocTbody = objectFactory.createStrucDocTbody();
    strucDocTbody.getTr().add(addTableBodyRow("Orthopaedic outpatient clinic appointment "
            + "for 4 weeks post-discharge progress review",
        "12 Jul 2019 09:05:05+1000 -> 1 Aug 2019 09:05:05+1000", "Appointment", "Dr Jane ANDERSON",
        "Super Healthy Hospital", "0345754566 (WorkPlace), 0414754566 (WorkPlace)",
        createComplexTD(createHtmlLink("Jane@Anderson.com.au"))));
    strucDocTbody.getTr().add(addTableBodyRow("Orthopaedic outpatient clinic appointment "
            + "for 4 weeks post-discharge progress review",
        "12 Jul 2019 09:05:05+1000 -> 10 Sep 2019 09:05:05+1000", "Appointment",
        "Bay Hill Hospital", "Hospital", "0345754566 (WorkPlace)",
        createComplexTD(createHtmlLink("BayHill@BayHill.com.au"))));
    strucDocTable.getTbody().add(strucDocTbody);
    strucDocTable.setThead(strucDocThead);
    addTable(narrative, strucDocTable);

    arrangedServices.setCustomNarrative(narrative);
    return arrangedServices;
  }

  private RecordOfRecommendationsAndInfoProvided getRecordOfRecommendationsAndInfoProvided() {
    RecordOfRecommendationsAndInfoProvided recordOfRecommendationsAndInfoProvided
        = new RecordOfRecommendationsAndInfoProvidedImpl();
    StrucDocText narrative = objectFactory.createStrucDocText();

    //Recommendations Table
    StrucDocTable strucDocTable = createTableWithCaption("Recommendations");
    //thead
    StrucDocThead strucDocThead = objectFactory.createStrucDocThead();
    strucDocThead.getTr().add(addTableHeaderRow("Recommendation", "Person responsible"));
    //tbody
    StrucDocTbody strucDocTbody = objectFactory.createStrucDocTbody();
    strucDocTbody.getTr().add(addTableBodyRow("Please remove the staples on Aug 24 2010. "
            + "Please ensure aspirin is recommenced 3 days post discharge. Please follow-up anaemia.",
        "Dr Alison HODGERS"));
    strucDocTbody.getTr().add(addTableBodyRow("Please remove from waiting list", ""));
    strucDocTable.getTbody().add(strucDocTbody);
    strucDocTable.setThead(strucDocThead);
    addTable(narrative, strucDocTable);

    //Information Provided Table
    StrucDocTable strucDocTable2 = createTableWithCaption("Information Provided");
    //thead
    StrucDocThead strucDocThead2 = objectFactory.createStrucDocThead();
    strucDocThead2.getTr().add(addTableHeaderRow("Description"));
    //tbody
    StrucDocTbody strucDocTbody2 = objectFactory.createStrucDocTbody();
    strucDocTbody2.getTr().add(addTableBodyRow("Patient was given a brochure explaining"
        + " the expected post-op recovery following a total knee replacement. The physiotherapist "
        + "provided a list of home exercises. The good prognosis for return to activity was "
        + "discussed with the patient - likely to be able to walk with a stick at six weeks."));
    strucDocTable2.getTbody().add(strucDocTbody2);
    strucDocTable2.setThead(strucDocThead2);
    addTable(narrative, strucDocTable2);

    recordOfRecommendationsAndInfoProvided.setCustomNarrative(narrative);
    return recordOfRecommendationsAndInfoProvided;
  }

  private DiagnosticInvestigations getDiagnosticInvestigations() {
    DiagnosticInvestigations diagnosticInvestigations = new DiagnosticInvestigationsImpl();
    StrucDocText narrative = objectFactory.createStrucDocText();
    narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
    diagnosticInvestigations
        .addOtherTestResultsAsNarrative(getOtherTestResultSectionNarrative())
        .addRequestedServicesSectionAsNarrative(getRequestedServiceSectionNarrative())
        .addPathologySectionAsNarrative(getPathologySectionNarrative())
        .addImagingExaminationSectionAsNarrative(getImagingExaminationSectionNarrative());

    diagnosticInvestigations.setCustomNarrative(narrative);
    return diagnosticInvestigations;
  }

  private StrucDocText getOtherTestResultSectionNarrative() {
    StrucDocText narrative = objectFactory.createStrucDocText();
    StrucDocTable strucDocTable = createTableWithCaption("Other Test Result");
    //thead
    StrucDocThead strucDocThead = objectFactory.createStrucDocThead();
    strucDocThead.getTr().add(addTableHeaderRow("Field, Value"));
    //tbody
    StrucDocTbody strucDocTbody = objectFactory.createStrucDocTbody();
    strucDocTbody.getTr().add(addTableBodyRow("Report Date", "10 Jul 2019 09:05:05+1000"));
    strucDocTbody.getTr().add(addTableBodyRow("Report Name", "Report with Attachment"));
    strucDocTbody.getTr().add(addTableBodyRow("Report Status", "Final"));
    strucDocTbody.getTr().add(addTableBodyRow("Report Content", ""));

    strucDocTable.getTbody().add(strucDocTbody);
    strucDocTable.setThead(strucDocThead);
    addTable(narrative, strucDocTable);
    narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);

    return narrative;
  }

  private StrucDocText getRequestedServiceSectionNarrative() {
    StrucDocText narrative = objectFactory.createStrucDocText();
    StrucDocTable strucDocTable = createTableWithCaption("Requested Service");
    //thead
    StrucDocThead strucDocThead = objectFactory.createStrucDocThead();
    strucDocThead.getTr().add(addTableHeaderRow("Field", "Value"));
    //tbody
    StrucDocTbody strucDocTbody = objectFactory.createStrucDocTbody();
    strucDocTbody.getTr()
        .add(addTableBodyRow("Requested Service Description", "Plain chest X-ray"));
    strucDocTbody.getTr()
        .add(addTableBodyRow("Service Requested DateTime", " 16 Jul 2019 09:05:05+1000 "));
    strucDocTbody.getTr()
        .add(addTableBodyRow("Service Commencement Window", "12 Jul 2019 -> 12 Jan 2020"));
    strucDocTbody.getTr().add(addTableBodyRow("Provider Organisation", " DR JANE ANDERSON "));
    strucDocTbody.getTr().add(addTableBodyRow("Provider Person Name", " DR JANE ANDERSON "));
    strucDocTbody.getTr().add(addTableBodyRow("Address / Contact",
        createComplexTD("Business: 1 Clinician Street, Nehtaville, QLD, 5555",
            "Business: 1 Clinician Street, Nehtaville, QLD, 5555",
            "0345754566 (WorkPlace),",
            createHtmlLink("Jane@Anderson.com.au"))));
    strucDocTbody.getTr().add(addTableBodyRow("Booking Status", "Definition"));
    strucDocTbody.getTr().add(addTableBodyRow("Subject of Care Instruction Description",
        " Subject Of Care Instruction Description"));

    strucDocTable.getTbody().add(strucDocTbody);
    strucDocTable.setThead(strucDocThead);
    addTable(narrative, strucDocTable);

    narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
    return narrative;
  }

  public StrucDocText getPathologySectionNarrative() {
    StrucDocText narrative = objectFactory.createStrucDocText();

    //Pathology Test Result Table ****************************************
    StrucDocTable ptrTable = createTableWithCaption("Pathology Test Results");
    //thead
    StrucDocThead ptrTHead = objectFactory.createStrucDocThead();
    ptrTHead.getTr().add(addTableHeaderRow("Field", "Value"));
    //tbody
    StrucDocTbody ptrBody = objectFactory.createStrucDocTbody();
    ptrBody.getTr().add(addTableBodyRow("Test Name", "Chemistry studies (set)"));
    ptrBody.getTr().add(addTableBodyRow("Result Status", " Final "));
    ptrBody.getTr().add(addTableBodyRow("Date Time", "10 Jul 2019 09:05:05+1000"));
    ptrBody.getTr().add(addTableBodyRow("Comment", " test "));
    ptrTable.getTbody().add(ptrBody);
    ptrTable.setThead(ptrTHead);
    addTable(narrative, ptrTable);

    //Paragraph Table *****************************************************
    StrucDocTable pTable = objectFactory.createStrucDocTable();
    //tbody
    StrucDocTbody pBody = objectFactory.createStrucDocTbody();
    pBody.getTr().add(addTableBodyRow(createComplexTD(createStrucDocParagraph(
        "xPre",
        "    GLUCOSE - FASTING\n"
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
            + "    BLOOD GLUCOSE   : 10.8 *     mmol/L     (3.9-6.0)"))));
    pTable.getTbody().add(pBody);
    addTable(narrative, pTable);

    narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);

    return narrative;
  }

  private StrucDocText getImagingExaminationSectionNarrative() {
    StrucDocText narrative = objectFactory.createStrucDocText();
    narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);

    //Anatomical Sites Table *****************************************
    StrucDocTable asTable = createTableWithCaption("Anatomical Sites");
    //thead
    StrucDocThead asTHead = objectFactory.createStrucDocThead();
    asTHead.getTr().add(addTableHeaderRow("Location", "Side"));
    //tbody
    StrucDocTbody asTBody = objectFactory.createStrucDocTbody();
    asTBody.getTr().add(addTableBodyRow(
        "Subcutaneous tissue structure of lateral surface of index finger", "Left"));
    asTable.getTbody().add(asTBody);
    asTable.setThead(asTHead);
    addTable(narrative, asTable);

    //Imaging Examination Result Details Table ***********************
    StrucDocTable ieTable = createTableWithCaption("Imaging Examination Result Details");
    //thead
    StrucDocThead ieTHead = objectFactory.createStrucDocThead();
    ieTHead.getTr().add(addTableHeaderRow("Field", "Value"));
    //tbody
    StrucDocTbody ieTbody = objectFactory.createStrucDocTbody();
    ieTbody.getTr()
        .add(addTableBodyRow("Imaging Examination Result Date Time", "10 Jul 2019 09:05:05+1000"));
    ieTbody.getTr().add(addTableBodyRow("Result name", "Leg Image"));
    ieTbody.getTr().add(addTableBodyRow("Modality", " X-ray "));
    ieTbody.getTr().add(addTableBodyRow("Result Status", " Final "));
    ieTbody.getTr().add(addTableBodyRow("Clinical Information",
        " Patient pregnant. Confirm dates. Estimate from LNMP 18 weeks. "));
    ieTbody.getTr().add(addTableBodyRow("Findings",
        "Normal obstetric ultrasound with foetal biometry indicating getational age of 18W0D."));
    ieTbody.getTr().add(addTableBodyRow("Result Representation",
        " Result Representation - Rich text representation of the entire result as issued by the diagnostic service "));
    ieTable.getTbody().add(ieTbody);
    ieTable.setThead(ieTHead);
    addTable(narrative, ieTable);

    //Result Groups Table ***********************
    StrucDocTable rgTable = createTableWithCaption("Result Groups");
    //thead
    StrucDocThead rgTHead = objectFactory.createStrucDocThead();
    rgTHead.getTr()
        .add(addTableHeaderRow("Result Group", "Name", "Value", "Status", "Range", "Comment"));
    //tbody
    StrucDocList sdListValue = createStrucDocListUnordered("", "Ultrasonography");
    StrucDocList sdListRange = createStrucDocListUnordered("",
        "High: 17ml Low: 13ml (Normal range)", "High: 50ml Low: 100ml (High)");
    StrucDocList sdListComment = createStrucDocListUnordered("", "Femur measured during",
        "•Legs measured during ultrasound scan");

    StrucDocTbody rgTBody = objectFactory.createStrucDocTbody();
    rgTBody.getTr().add(
        addTableBodyRow("ultrasound scan - obstetric", "Serum Creatinine", sdListValue, "Normal",
            sdListRange, sdListComment));
    rgTable.getTbody().add(rgTBody);
    rgTable.setThead(rgTHead);
    addTable(narrative, rgTable);

    //Anatomical Sites 2 ***********************
    StrucDocTable asTable2 = createTableWithCaption("Anatomical Sites");
    //thead
    StrucDocThead asTHead2 = objectFactory.createStrucDocThead();
    asTHead2.getTr().add(addTableHeaderRow("Location", "Side", "Image / File"));
    //tbody
    StrucDocTbody asTBody2 = objectFactory.createStrucDocTbody();
    asTBody2.getTr().add(
        addTableBodyRow("Subcutaneous tissue structure of lateral surface of index finger", "Left",
            ""));

    asTable2.getTbody().add(asTBody2);
    asTable2.setThead(asTHead2);
    addTable(narrative, asTable2);

    //Examination Requests - Image Details ***********************
    StrucDocTable eridTable2 = createTableWithCaption("Examination Requests - Image Details");
    //thead
    StrucDocThead eridTHead2 = objectFactory.createStrucDocThead();
    eridTHead2.getTr().add(
        addTableHeaderRow("Requested Examination Name", "Image Date", "Identifiers",
            "Subject Position", "Image / File"));
    //tbody
    StrucDocList sdListREN = createStrucDocListUnordered("", "A/U Obstetric - Dating",
        "another name");
    StrucDocList sdListID = createStrucDocListUnordered("",
        "DICOM Study ID: Accession Number Group: 0008 Element: 0050", "Report ID: 3355552BHU-23.3",
        "DICOM Series ID: Series Identifier");
    StrucDocTbody eridTBody2 = objectFactory.createStrucDocTbody();
    eridTBody2.getTr()
        .add(addTableBodyRow(sdListREN, "12 Jul 2019 09:05:05+1000", sdListID, "Sublime", ""));

    eridTable2.getTbody().add(eridTBody2);
    eridTable2.setThead(eridTHead2);
    addTable(narrative, eridTable2);

    return narrative;
  }

  private JAXBElement<StrucDocParagraph> createTitleDescription(String description) {
    StrucDocParagraph strucDocParagraph = new StrucDocParagraph();
    strucDocParagraph.getContent().add(description);
    return objectFactory
        .createStrucDocTextParagraph(strucDocParagraph);
  }


  /*  private StrucDocText getClinicalInterventionsPerformedThisVisit() {
    StrucDocText narrative = objectFactory.createStrucDocText();
    //TODO MS : Event - > Clinical Interventions Performed This Visit
    narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
    return narrative;
  }*/

}
