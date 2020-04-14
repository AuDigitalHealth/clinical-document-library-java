package nehta.cda.ereferral;

import au.gov.nehta.builder.ereferral.EReferral3ACreator;
import au.gov.nehta.builder.util.UUIDTool;
import au.gov.nehta.cda.test.Base;
import au.gov.nehta.cda.test.TestHelper;
import au.gov.nehta.model.cda.common.code.CodeImpl;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.code.DocumentStatusCode;
import au.gov.nehta.model.cda.common.code.SNOMED_AU_Code;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocumentFactory;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.cda.common.time.Precision;
import au.gov.nehta.model.cda.common.time.PrecisionDate;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.cda.ereferral.EReferralCDAModel;
import au.gov.nehta.model.clinical.common.*;
import au.gov.nehta.model.clinical.common.participation.ANZSCO_1ED_2006;
import au.gov.nehta.model.clinical.ereferral.*;
import au.gov.nehta.model.clinical.es.AdverseReaction;
import au.gov.nehta.model.clinical.es.AdverseReactionImpl;
import au.gov.nehta.model.clinical.es.Procedure;
import au.gov.nehta.model.clinical.es.ProcedureImpl;
import au.gov.nehta.model.clinical.es.ReactionEvent;
import au.gov.nehta.model.clinical.es.ReactionEventImpl;
import au.gov.nehta.model.clinical.es.*;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProviderImpl;
import au.gov.nehta.model.clinical.sr.AdverseReactions;
import au.gov.nehta.model.clinical.sr.AdverseReactionsImpl;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.gov.nehta.schematron.Schematron;
import au.gov.nehta.schematron.SchematronCheckResult;
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

import static au.gov.nehta.cda.test.TestHelper.*;
import static au.gov.nehta.model.schematron.SchematronResource.SchematronResources.SERVICE_REFERRAL_3A;

public class EReferral3ATest extends Base {

  private static final String SCHEMATRON = SERVICE_REFERRAL_3A.resource().getSchematron();
  private static String SCHEMATRON_TEMPLATE_PATH = "resources/e-Referral";
  private static final String DOCUMENT_FILE_NAME =
      TEST_GENERATION + "/eReferral/eReferral-3A-java.xml";

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
      //Assert.assertEquals(0, check.schemaErrors.size());
      //Assert.assertEquals(0, check.schematronErrors.size());
    } catch (SchematronValidationException | ParserConfigurationException | JAXBException e) {
      e.printStackTrace();
    }
  }

  private void generateMax()
      throws SchematronValidationException, JAXBException, ParserConfigurationException {
    DateTime now = new DateTime();
    PreciseDate dateTimeAttested = new PrecisionDate(Precision.DAY, now.minusHours(6));
    DocumentAuthor documentAuthor = TestHelper.getDocumentAuthor(now);
    EReferral eReferral = new EReferralImpl();
    eReferral.setContext(getContext(dateTimeAttested, documentAuthor));
    eReferral.setContent(getContent());

    EReferralCDAModel eReferralCDAModel = new EReferralCDAModel(
        getClinicalDocument(), getInformationRecipients(), now);
    eReferralCDAModel.setLegalAuthenticator(getLegalAuthenticator(now));
    eReferralCDAModel.setCustodian(getCustodian());
    EReferral3ACreator serviceReferralCreator = new EReferral3ACreator(eReferralCDAModel,
        eReferral);

    Document clinicalDocument = serviceReferralCreator.create();
    String cdaString = TestHelper.documentToXML(clinicalDocument);
    TestHelper.printToFile(cdaString, DOCUMENT_FILE_NAME);
    System.out.println(cdaString);
  }

  private EReferralContent getContent() {
    EReferralContent content = new EReferralContentImpl();
    TestHelper.executingClass = EReferral.class;
    DiagnosticInvestigations diagnosticInvestigations = getDiagnosticInvestigations(true,
        true, true, true);
    content.setDiagnosticInvestigations(diagnosticInvestigations);
    Medications medicationsObj = getMedications();
    content.setMedications(medicationsObj);
    content.setReferralDetail(getReferralDetail());
    content.setMedicalHistory(getMedicalHistory());
    content.setDiagnosticInvestigations(getDiagnosticInvestigations(true,
        true, true, true));
    content.setAdverseReactions(getAdverseReactions());
    return content;
  }

  private AdverseReactions getAdverseReactions() {
    AdverseReactions adverseReactions = new AdverseReactionsImpl();
    List<AdverseReaction> adverseReactionList = new ArrayList<>();
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
    adverseReactionList.add(adverseReaction);
    adverseReactions.setAdverseReactions(adverseReactionList);
    return adverseReactions;
  }

  private MedicalHistory getMedicalHistory() {
    MedicalHistory medicalHistory = new MedicalHistory();
    medicalHistory.setProblemDiagnoses(getProblemDiagnoses());
    medicalHistory.setProcedures(getProcedures());
    medicalHistory.setUncategorisedMedicalHistoryItems(getUncategorisedMedicalHistoryItems());
    return medicalHistory;
  }

  private ReferralDetail getReferralDetail() {
    ReferralDetail referralDetail = new ReferralDetail();
    referralDetail.setReferee(getReferee());
    referralDetail.setReferralDateTime(new PrecisionDate(Precision.DAY,
        new DateTime("2018-01-12")));
    referralDetail.setReferralReason("Referral Reason Here...");
    referralDetail.setUsualGP(getUsualGP());
    referralDetail.setReferralValidityDuration(RestrictedTimeInterval.getLowHighInstance(
        new PrecisionDate(Precision.DAY, new DateTime("2018-01-12")),
        new PrecisionDate(Precision.DAY, new DateTime("2019-08-22"))));
    return referralDetail;
  }

  private ParticipationServiceProvider getUsualGP() {
    ParticipationServiceProvider usualGP = new ParticipationServiceProviderImpl();
    usualGP.setRole(ANZSCO_1ED_2006.GENERAL_MEDICAL_PRACTITIONER);
    usualGP.setParticipant(getServiceProviderIndividual());
    return usualGP;
  }

  private ParticipationServiceProvider getReferee() {
    ParticipationServiceProvider referee = new ParticipationServiceProviderImpl();
    referee.setRole(ANZSCO_1ED_2006.SPECIALIST_PHYSICIANS_NEC);
    referee.setParticipant(getServiceProviderIndividual());
    return referee;
  }

  private List<UncategorisedMedicalHistoryItem> getUncategorisedMedicalHistoryItems() {
    List<UncategorisedMedicalHistoryItem> uncategorisedMedicalHistoryItems = new ArrayList<>();
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
    return uncategorisedMedicalHistoryItems;
  }

  private List<Procedure> getProcedures() {
    Procedure procedure = new ProcedureImpl(
        new CodeImpl("80146002", "2.16.840.1.113883.6.96",
            "SNOMED CT", "Appendicectomy"),
        RestrictedTimeInterval.getLowHighInstance(
            new PrecisionDate(Precision.DAY, new DateTime("2013-01-1")),
            new PrecisionDate(Precision.DAY, new DateTime("2013-04-1"))),
        "Comment goes here");
    List<Procedure> procedures = new ArrayList<>();
    procedures.add(procedure);
    return procedures;
  }

  private List<ProblemDiagnosis> getProblemDiagnoses() {
    List<ProblemDiagnosis> problemDiagnoses = new ArrayList<>();
    SNOMED_AU_Code identification = new SNOMED_AU_Code("85189001",
        "Acute appendicitis");
    PreciseDate dateOfOnset = new PrecisionDate(Precision.DAY,
        new DateTime("2019-07-15"));
    PreciseDate remissionDate = new PrecisionDate(Precision.DAY,
        new DateTime("2019-07-16"));
    ProblemDiagnosis problemDiagnosis =
        new ProblemDiagnosisImpl(
            identification, dateOfOnset, remissionDate,
            "Problem/Diagnosis Comment goes here.");
    problemDiagnoses.add(problemDiagnosis);
    return problemDiagnoses;
  }

  private EReferralContext getContext(PreciseDate dateTimeAttested,
                                      DocumentAuthor documentAuthor) {
    EReferralContext context = new EReferralContextImpl();
    context.setDateTimeAttested(dateTimeAttested);
    context.setDateTimeAuthored(
        new PrecisionDate(Precision.DAY, dateTimeAttested.getDateTime().minusHours(8)));
    context.setDocumentAuthor(documentAuthor);
    context.setPatientNominatedContacts(getPatientNominatedContacts());
    context.setSubjectOfCare(getSubjectOfCareParticipant());
    return context;
  }

  /**
   * Can be either a person or an organization (mutually exclusive)
   */
  private List<ParticipationServiceProvider> getPatientNominatedContacts() {
    List<ParticipationServiceProvider> patientNominatedContacts = new LinkedList<>();
    ParticipationServiceProvider patientNominatedContact = new ParticipationServiceProviderImpl();
    patientNominatedContact.setParticipant(getServiceProviderIndividual());
    patientNominatedContact.setRole(new CodeImpl(
        "309964003",
        "2.16.840.1.113883.6.96",
        "SNOMED CT",
        "Radiology Department",
        "Radiology Department"));
    patientNominatedContact.setParticipationPeriod(
        RestrictedTimeInterval.getLowHighInstance(
            new PrecisionDate(Precision.DAY, new DateTime("2013-01-1")),
            new PrecisionDate(Precision.DAY, new DateTime("2013-04-1"))));
    patientNominatedContacts.add(patientNominatedContact);

    //Organization
    ParticipationServiceProvider patientNominatedContactOrg = new ParticipationServiceProviderImpl();
    RestrictedTimeInterval encounterPeriod =
        RestrictedTimeInterval.getLowHighInstance(
            new PrecisionDate(Precision.DAY, new DateTime("2019-03-1")),
            new PrecisionDate(Precision.DAY, new DateTime("2019-04-1")));
    patientNominatedContactOrg.setParticipationPeriod(encounterPeriod);
    patientNominatedContactOrg.setParticipant(getServiceProviderOrganization());
    patientNominatedContactOrg.setRole(
        new CodeImpl("HOSP", "2.16.840.1.113883.1.11.17660", "HL7 ServiceDeliveryLocationRoleType",
            "Hospital"));

    //patientNominatedContacts.add(patientNominatedContactOrg);
    patientNominatedContacts.add(patientNominatedContact);

    return patientNominatedContacts;
  }

  private ClinicalDocument getClinicalDocument() {
    ClinicalDocument cdaClinicalDocument = ClinicalDocumentFactory.getEReferral3A();
    cdaClinicalDocument.setClinicalDocumentId(UUIDTool.uuidToOid(UUID.randomUUID().toString()));
    cdaClinicalDocument.setLanguageCode("en-AU");
    cdaClinicalDocument.setVersionNumber(1);
    cdaClinicalDocument.setCompletionCode(DocumentStatusCode.FINAL);
    return cdaClinicalDocument;
  }
}
