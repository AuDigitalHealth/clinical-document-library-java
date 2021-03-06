package au.gov.nehta.cda.sr;

import au.gov.nehta.builder.sr.ServiceReferralCreator;
import au.gov.nehta.builder.util.CDATypeUtil;
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
import au.gov.nehta.model.cda.sr.ServiceReferralCDAModel;
import au.gov.nehta.model.clinical.common.*;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;
import au.gov.nehta.model.clinical.es.AdverseReaction;
import au.gov.nehta.model.clinical.es.AdverseReactionImpl;
import au.gov.nehta.model.clinical.es.Medications;
import au.gov.nehta.model.clinical.es.Procedure;
import au.gov.nehta.model.clinical.es.ProcedureImpl;
import au.gov.nehta.model.clinical.es.ReactionEvent;
import au.gov.nehta.model.clinical.es.ReactionEventImpl;
import au.gov.nehta.model.clinical.es.*;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProviderImpl;
import au.gov.nehta.model.clinical.sr.AdverseReactions;
import au.gov.nehta.model.clinical.sr.AdverseReactionsImpl;
import au.gov.nehta.model.clinical.sr.RequestedService;
import au.gov.nehta.model.clinical.sr.RequestedServiceImpl;
import au.gov.nehta.model.clinical.sr.*;
import au.gov.nehta.model.schematron.SchematronValidationException;
import org.junit.Assert;
import org.junit.Test;
import org.w3c.dom.Document;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;

import static au.gov.nehta.cda.test.TestHelper.*;
import static au.gov.nehta.model.schematron.SchematronResource.SchematronResources.SERVICE_REFERRAL_3A;

public class ServiceReferralMaxTest extends Base {

    private static final String SCHEMATRON = SERVICE_REFERRAL_3A.resource().getSchematron();
    private static final String SCHEMATRON_TEMPLATE_PATH = "src/test/resources/ServiceReferral";
    private static final String DOCUMENT_FILE_NAME = "src/test/resources/generated_xml/service_referral/sr-max-java.xml";

    @Test
    public void test_MAX_Discharge_Summary_Creation() {
        try {
            generateMax();
//            SchematronCheckResult check =
//                    Schematron.check(SCHEMATRON_TEMPLATE_PATH, SCHEMATRON, DOCUMENT_FILE_NAME);
//            show(check);
//            assertEquals(0, check.schemaErrors.size());
//            assertEquals(0, check.schematronErrors.size());
            File f = new File(DOCUMENT_FILE_NAME);
            Assert.assertTrue(f.exists());
            Assert.assertTrue(f.length() > 0L);
        } catch (SchematronValidationException | ParserConfigurationException | JAXBException | IOException e) {
            e.printStackTrace();
        }
    }

    private void generateMax()
        throws SchematronValidationException, JAXBException, ParserConfigurationException, IOException {
        ZonedDateTime now = ZonedDateTime.now();
        PreciseDate dateTimeAttested = new PrecisionDate(Precision.DAY, now.minusHours(6));
        DocumentAuthor documentAuthor = TestHelper.getDocumentAuthor(now);
        ServiceReferral serviceReferral = new ServiceReferralImpl();
        serviceReferral.setContext(getContext(dateTimeAttested, documentAuthor));
        serviceReferral.setContent(getContent());

        ServiceReferralCDAModel serviceReferralCDAModel = new ServiceReferralCDAModel(
                getClinicalDocument(), getInformationRecipients(), getCustodian(),
                getLegalAuthenticator(now),
                now);

        ServiceReferralCreator serviceReferralCreator =
                new ServiceReferralCreator(serviceReferralCDAModel, serviceReferral);

        Document clinicalDocument = serviceReferralCreator.create();
        String cdaString = TestHelper.documentToXML(clinicalDocument);
        TestHelper.printToFile(cdaString, DOCUMENT_FILE_NAME);

    }

    private ServiceReferralContent getContent() throws IOException {
        AttachedMedia reportFile = TestHelper.getAttachedMediaPDF("radiologyreport.pdf");
        ServiceReferralContent content = new ServiceReferralContentImpl(reportFile);
        content.setCurrentServices(getCurrentServices());
        TestHelper.executingClass = ServiceReferral.class;
        DiagnosticInvestigations diagnosticInvestigations = getDiagnosticInvestigations(true,
                true, true, true);

        diagnosticInvestigations.setRequestedServices(null);
        diagnosticInvestigations.setRequestedServicesServiceReferral(getRequestedServiceDiagNInv());
        content.setDiagnosticInvestigations(diagnosticInvestigations);

        Medications medicationsObj = getMedications();

        //KnownMedication and Exclusion Statement are mutually exclusive
        //If you wish to test the mutual exclusion requirement between medicatons and excluion statmement.
        // Uncomment the follwing code
    /*    ExclusionStatement exclusionStatement = new ExclusionStatementImpl();
       exclusionStatement.setGlobalStatement(
           new CodeImpl("01", "1.2.36.1.2001.1001.101.104.16299", "NCTIS Global Statement Values",
               "None known"));
       medicationsObj.setExclusionStatement(exclusionStatement);
    */

        content.setMedications(medicationsObj);
        content.setPastAndCurrentMedicalHistory(
                getPastAndCurrentMedicalHistory());
        content.setServiceReferralDetail(getServiceReferralDetail());
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

    private ServiceReferralDetail getServiceReferralDetail() {
        ServiceReferralDetail serviceReferralDetail = new ServiceReferralDetailImpl();
        serviceReferralDetail.setInterpreterRequiredAlert(getInterpreterRequiredAlert());
        serviceReferralDetail.setRequestedServices(getRequestedServices());
        serviceReferralDetail.setOtherAlert(getOtherAlerts());
        return serviceReferralDetail;
    }

    private List<OtherAlert> getOtherAlerts() {

        return new LinkedList<OtherAlert>() {{
            OtherAlert alert = new OtherAlert();
            alert.setAlertType(new CodeImpl("78648007", "2.16.840.1.113883.6.96",
                    "SNOMED-CT", "At risk for infection",
                    "At risk for infection"));
            alert.setAlertDesc(new CodeImpl("78648007", "2.16.840.1.113883.6.96",
                    "SNOMED-CT", "At risk for infection",
                    "At risk for infection"));
            add(alert);
        }};
    }

    private InterpreterRequiredAlert getInterpreterRequiredAlert() {
        InterpreterRequiredAlert interpreterRequiredAlert = new InterpreterRequiredAlert();
        interpreterRequiredAlert.setAlertDescription(new CodeImpl("102.17040",
                "1.2.36.1.2001.1001.101", "Interpreter Required",
                "Interpreter Required"));
        interpreterRequiredAlert.setPreferredLanguages(new LinkedList<Coded>() {{
            add(new CodeImpl("fr-CN", "", "", ""));
            add(new CodeImpl("fr-CN", "", "", ""));
        }});
        return interpreterRequiredAlert;
    }

    private List<RequestedService> getRequestedServices() {
        List<RequestedService> requestedServices = new LinkedList<>();
        requestedServices.add(getRequestedService());
        return requestedServices;
    }

    private RequestedService getRequestedService() {
        RequestedService requestedService = new RequestedServiceImpl();
        requestedService
                .setRequestedServiceDateTime(new PrecisionDate(Precision.DAY,
                        LocalDate.of(2018, 1, 12).atStartOfDay(ZoneId.systemDefault())));
        requestedService.setServiceCommencementWindow((RestrictedTimeInterval.getLowHighInstance(
                new PrecisionDate(Precision.DAY, LocalDate.of(2013, 6, 1).atStartOfDay(ZoneId.systemDefault())),
                new PrecisionDate(Precision.DAY, LocalDate.of(2019, 6, 23).atStartOfDay(ZoneId.systemDefault())))));
        Code reasonForServiceCode = new CodeImpl("426721006", "2.16.840.1.113883.6.96",
                "SNOMED-CT", "X-ray of right ankle",
                "X-ray of right ankle");
        reasonForServiceCode
                .setCodeSystemVersion("http://snomed.info/sct/32506021000036107/version/20190831");
        requestedService.setReasonForService(reasonForServiceCode);
        requestedService.setReasonForServiceDesc("Thank you for seeing this 14-year-old schoolboy "
                + "who fell whilst playing football at\n"
                + "school yesterday. On examination he has a swollen painful R ankle and cannot weight\n"
                + "bear on it today. I suspect he has a fracture of his right tibia and fibula.");
        requestedService.setServiceProvider(getCurrentServiceProviderIndividual());
        requestedService.setServiceComment("Requested Service Comment");
        requestedService.setServiceDesc(new CodeImpl("241646009",
                "2.16.840.1.113883.6.96", "SNOMED CT",
                "MRI of cervical spine"));
        requestedService.setServiceBookingStatus(EventTypes.APPOINTMENT);
        requestedService.setRequestUrgency(new CodeImpl("103.17022",
                "1.2.36.1.2001.1001.101", "NCTIS Data Components",
                "Request Urgency Notes"));
        requestedService.setRequestUrgencyNotes("This is urgent because the patient has had "
                + "sudden onset of severe headache, with\n"
                + "minor neurological impairment and is at risk of quick deterioration.");
        new CodeImpl("241646009", "2.16.840.1.113883.6.96",
                "SNOMED CT", "MRI of cervical spine");
        requestedService.setServiceCategory(new CodeImpl("102.20158",
                "1.2.36.1.2001.1001.101", "NCTIS Data Components",
                "Requested Service"));
        requestedService.setRequestValidityPeriod((RestrictedTimeInterval.getLowHighInstance(
                new PrecisionDate(Precision.DAY, LocalDate.of(2013, 3, 13).atStartOfDay(ZoneId.systemDefault())),
                new PrecisionDate(Precision.DAY, LocalDate.of(2019, 9, 1).atStartOfDay(ZoneId.systemDefault())))));

        // Optional - will only include in CDA if set to true;
        requestedService.setIncludePrioriyCode(true);

        return requestedService;
    }

    private List<RequestedService> getRequestedServiceDiagNInv() {
        List<RequestedService> requestedServices = new LinkedList<>();
        RequestedService requestedService = new RequestedServiceImpl();
        requestedServices.add(requestedService);
        requestedService
                .setRequestedServiceDateTime(new PrecisionDate(Precision.DAY,
                        LocalDate.of(2018, 1, 12).atStartOfDay(ZoneId.systemDefault())));
        requestedService.setServiceCommencementWindow((RestrictedTimeInterval.getLowHighInstance(
                new PrecisionDate(Precision.DAY, LocalDate.of(2013, 2, 1).atStartOfDay(ZoneId.systemDefault())),
                new PrecisionDate(Precision.DAY, LocalDate.of(2019, 4, 15).atStartOfDay(ZoneId.systemDefault())))));
        requestedService.setReasonForService(new CodeImpl("426420006", "2.16.840.1.113883.6.96",
                "SNOMED-CT", "X-ray of left ankle",
                "X-ray of left ankle") {{
            setCodeSystemVersion("http://snomed.info/sct/32506021000036107/version/20190831");
        }});
        requestedService.setReasonForServiceDesc("Thank you for seeing this 14-year-old schoolboy "
                + "who fell whilst playing football at\n"
                + "school yesterday. On examination he has a swollen painful R ankle and cannot weight\n"
                + "bear on it today. I suspect he has a fracture of his left tibia and fibula.");
        requestedService.setServiceCategory(new CodeImpl("102.20158",
                "1.2.36.1.2001.1001.101", "NCTIS Data Components",
                "Requested Service"));
        requestedService.setServiceProvider(getCurrentServiceProviderIndividual());
        requestedService.setServiceComment("Requested Service Comment");
        requestedService.setServiceDesc(new CodeImpl("241646009",
                "2.16.840.1.113883.6.96", "SNOMED CT",
                "MRI of cervical spine"));
        requestedService.setSubjectOfCareInstructionDesc(new LinkedList<String>() {{
            add("Drip dry.");
            add("Something else.");
        }});
        requestedService.setDateTimeServiceScheduled(new PrecisionDate(Precision.DAY, LocalDate.of(2018, 9, 9).atStartOfDay(ZoneId.systemDefault())));
        requestedService.setServiceBookingStatus(EventTypes.APPOINTMENT);

        // Optional - will only include in CDA if set to true;
        requestedService.setIncludePrioriyCode(true);

        return requestedServices;
    }

    private MedicalHistory getPastAndCurrentMedicalHistory() {
        MedicalHistory pastAndCurrentMedicalHistory = new MedicalHistory();
        pastAndCurrentMedicalHistory.setProblemDiagnoses(getProblemDiagnoses());
        pastAndCurrentMedicalHistory.setProcedures(getProcedures());
        pastAndCurrentMedicalHistory
                .setUncategorisedMedicalHistoryItems(getUncategorisedMedicalHistoryItems());
        return pastAndCurrentMedicalHistory;
    }

    private List<UncategorisedMedicalHistoryItem> getUncategorisedMedicalHistoryItems() {
        List<UncategorisedMedicalHistoryItem> uncategorisedMedicalHistoryItems = new ArrayList<>();
        RestrictedTimeInterval timeInterval =
                RestrictedTimeInterval.getLowHighInstance(
                        new PrecisionDate(Precision.DAY, LocalDate.of(1991, 1, 1).atStartOfDay(ZoneId.systemDefault())),
                        new PrecisionDate(Precision.DAY, LocalDate.of(1991, 4, 1).atStartOfDay(ZoneId.systemDefault())));
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
                        new PrecisionDate(Precision.DAY, LocalDate.of(2013, 1, 1).atStartOfDay(ZoneId.systemDefault())),
                        new PrecisionDate(Precision.DAY, LocalDate.of(2013, 4, 1).atStartOfDay(ZoneId.systemDefault()))),
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
                LocalDate.of(2019, 7, 15).atStartOfDay(ZoneId.systemDefault()));
        PreciseDate remissionDate = new PrecisionDate(Precision.DAY,
                LocalDate.of(2019, 7, 16).atStartOfDay(ZoneId.systemDefault()));
        ProblemDiagnosis problemDiagnosis =
                new ProblemDiagnosisImpl(
                        identification, dateOfOnset, remissionDate,
                        "Problem/Diagnosis Comment goes here.");
        problemDiagnoses.add(problemDiagnosis);
        return problemDiagnoses;
    }

    private CurrentServices getCurrentServices() {
        CurrentServices currentServices = new CurrentServices();
        List<RequestedService> currentServicesList = new LinkedList<>();
        RequestedService currentService = new RequestedServiceImpl();
        currentService.setServiceCategory(new CodeImpl("102.20158",
                "1.2.36.1.2001.1001.101", "NCTIS Data Components",
                "Requested Service"));
        currentService.setServiceBookingStatus(EventTypes.APPOINTMENT);
        currentService.setServiceComment("Service comment goes here");
        currentService.setServiceDesc(
                new CodeImpl("241646009", "2.16.840.1.113883.6.96", "SNOMED CT", "MRI of cervical spine"));
        currentService.setServiceProvider(
                getCurrentServiceProviderOrganisation());
        currentService
                .setRequestedServiceDateTime(new PrecisionDate(Precision.DAY, LocalDate.of(2019, 3, 1).atStartOfDay(ZoneId.systemDefault())));

        // Optional - will only include in CDA if set to true;
        currentService.setIncludePrioriyCode(true);

        currentServicesList.add(currentService);
        currentServices.setCurrentServices(currentServicesList);

        return currentServices;
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
                        new PrecisionDate(Precision.DAY, LocalDate.of(2013, 1, 1).atStartOfDay(ZoneId.systemDefault())),
                        new PrecisionDate(Precision.DAY, LocalDate.of(2013, 4, 1).atStartOfDay(ZoneId.systemDefault()))));
        return serviceProvider;
    }

    private ParticipationServiceProvider getCurrentServiceProviderOrganisation() {
        ParticipationServiceProvider serviceProvider = new ParticipationServiceProviderImpl();
        serviceProvider.setParticipant(getServiceProviderOrganization());
        serviceProvider.getParticipant().setExecutingClass(ServiceReferral.class);
        serviceProvider.setRole(new CodeImpl(
                "309964003",
                "2.16.840.1.113883.6.96",
                "SNOMED CT",
                "Radiology Department",
                "Radiology Department"));
        serviceProvider.setParticipationPeriod(
                RestrictedTimeInterval.getLowHighInstance(
                        new PrecisionDate(Precision.DAY, LocalDate.of(2013, 1, 1).atStartOfDay(ZoneId.systemDefault())),
                        new PrecisionDate(Precision.DAY, LocalDate.of(2013, 4, 1).atStartOfDay(ZoneId.systemDefault()))));
        return serviceProvider;
    }

    private ServiceReferralContext getContext(PreciseDate dateTimeAttested,
                                              DocumentAuthor documentAuthor) throws IOException {
        ServiceReferralContext context = new ServiceReferralContextImpl();
        context.setDateTimeAttested(dateTimeAttested);
        context.setDocumentAuthor(documentAuthor);
        context.setDocumentTitle("Referral");
        context.setInterestedParties(getInterestedParties());
        context.setPatientNominatedContacts(getPatientNominatedContacts());
        context.setPrimaryCareGiver(getPrimaryCareGiver());
        context.setRelatedDocuments(getRelatedDocuments());
        context.setSubjectOfCare(getSubjectOfCareParticipant());
        return context;
    }

    private List<RelatedDocument> getRelatedDocuments() throws IOException {
        List<RelatedDocument> relatedDocuments = new LinkedList<>();
        RelatedDocument relatedDocument = new RelatedDocumentImpl();
        relatedDocument.setDocumentDetail(new DocumentDetail() {{
            setDocumentIdentifier(
                    new UniqueIdentifierImpl(CDATypeUtil.getUUID(), "123A45"));

            setDocumentTitle("Substitute Decision Maker");
            setDocumentType(new CodeImpl("100.16998", "1.2.36.1.2001.1001.101",
                    "NCTIS Data Components",
                    "Advance Care Planning Document"));
        }});

        relatedDocument.setDocumentTarget(getAttachedMediaPDF("radiologyreport.pdf"));
        // relatedDocument.setLinkNature(new CodeImpl(
        //    "100.16998","1.2.36.1.2001.1001.101","NCTIS Data Components","Advance Care Planning Document blah1"));
        relatedDocuments.add(relatedDocument);
        return relatedDocuments;
    }

    /**
     * Can be either - person/organization (mutually exclusive)
     */
    private ParticipationServiceProvider getPrimaryCareGiver() {
        ParticipationServiceProvider primaryCareGiver = new ParticipationServiceProviderImpl();
        // primaryCareGiver.setParticipant(getServiceProviderOrganization());
        primaryCareGiver.setParticipant(getServiceProviderIndividual());
        primaryCareGiver.setRole(new CodeImpl(
                "309964003",
                "2.16.840.1.113883.6.96",
                "SNOMED CT",
                "Radiology Department",
                "Radiology Department"));
        primaryCareGiver.setParticipationPeriod(
                RestrictedTimeInterval.getLowHighInstance(
                        new PrecisionDate(Precision.DAY, LocalDate.of(2013, 1, 1).atStartOfDay(ZoneId.systemDefault())),
                        new PrecisionDate(Precision.DAY, LocalDate.of(2013, 4, 1).atStartOfDay(ZoneId.systemDefault()))));
        return primaryCareGiver;
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
                        new PrecisionDate(Precision.DAY, LocalDate.of(2013, 1, 1).atStartOfDay(ZoneId.systemDefault())),
                        new PrecisionDate(Precision.DAY, LocalDate.of(2013, 4, 1).atStartOfDay(ZoneId.systemDefault()))));
        patientNominatedContacts.add(patientNominatedContact);

        // Organization
        ParticipationServiceProvider patientNominatedContactOrg = new ParticipationServiceProviderImpl();
        RestrictedTimeInterval encounterPeriod =
                RestrictedTimeInterval.getLowHighInstance(
                        new PrecisionDate(Precision.DAY, LocalDate.of(2019, 3, 1).atStartOfDay(ZoneId.systemDefault())),
                        new PrecisionDate(Precision.DAY, LocalDate.of(2019, 4, 1).atStartOfDay(ZoneId.systemDefault())));
        patientNominatedContactOrg.setParticipationPeriod(encounterPeriod);
        patientNominatedContactOrg.setParticipant(getServiceProviderOrganization());
        patientNominatedContactOrg.setRole(
                new CodeImpl("HOSP", "2.16.840.1.113883.1.11.17660", "HL7 ServiceDeliveryLocationRoleType",
                        "Hospital"));

        // patientNominatedContacts.add(patientNominatedContactOrg);
        patientNominatedContacts.add(patientNominatedContact);

        return patientNominatedContacts;
    }

    /**
     * Interested party can be either a person or an organization (mutually exclusive)
     */
    private List<ParticipationServiceProvider> getInterestedParties() {
        List<ParticipationServiceProvider> interestedParties = new LinkedList<>();

        // Individual
        ParticipationServiceProvider individual = new ParticipationServiceProviderImpl();
        individual.setParticipant(getServiceProviderIndividual());
        individual.setRole(new CodeImpl(
                "309964003",
                "2.16.840.1.113883.6.96",
                "SNOMED CT",
                "Radiology Department",
                "Radiology Department"));
        individual.setParticipationPeriod(
                RestrictedTimeInterval.getLowHighInstance(
                        new PrecisionDate(Precision.DAY, LocalDate.of(2013, 1, 1).atStartOfDay(ZoneId.systemDefault())),
                        new PrecisionDate(Precision.DAY, LocalDate.of(2013, 4, 1).atStartOfDay(ZoneId.systemDefault()))));

        // Organization
        ParticipationServiceProvider organization = new ParticipationServiceProviderImpl();
        RestrictedTimeInterval encounterPeriod =
                RestrictedTimeInterval.getLowHighInstance(
                        new PrecisionDate(Precision.DAY, LocalDate.of(2019, 3, 1).atStartOfDay(ZoneId.systemDefault())),
                        new PrecisionDate(Precision.DAY, LocalDate.of(2019, 4, 1).atStartOfDay(ZoneId.systemDefault())));
        organization.setParticipationPeriod(encounterPeriod);
        organization.setParticipant(getServiceProviderOrganization());
        organization.setRole(
                new CodeImpl("HOSP", "2.16.840.1.113883.1.11.17660", "HL7 ServiceDeliveryLocationRoleType",
                        "Hospital"));

        interestedParties.add(organization);
        // interestedParties.add(individual);

        return interestedParties;
    }

    private ClinicalDocument getClinicalDocument() {
        ClinicalDocument cdaClinicalDocument = ClinicalDocumentFactory.getServiceReferral();
        cdaClinicalDocument.setClinicalDocumentId(UUIDTool.uuidToOid(UUID.randomUUID().toString()));
        cdaClinicalDocument.setLanguageCode("en-AU");
        cdaClinicalDocument.setVersionNumber(1);
        cdaClinicalDocument.setCompletionCode(DocumentStatusCode.FINAL);
        return cdaClinicalDocument;
    }
}
