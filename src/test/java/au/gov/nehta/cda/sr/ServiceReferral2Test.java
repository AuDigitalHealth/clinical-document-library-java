package au.gov.nehta.cda.sr;

import au.gov.nehta.builder.sr.ServiceReferralCreator;
import au.gov.nehta.builder.util.CDATypeUtil;
import au.gov.nehta.builder.util.UUIDTool;
import au.gov.nehta.cda.test.Base;
import au.gov.nehta.cda.test.TestHelper;
import au.gov.nehta.model.cda.common.code.CodeImpl;
import au.gov.nehta.model.cda.common.code.DocumentStatusCode;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocumentFactory;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.cda.common.time.Precision;
import au.gov.nehta.model.cda.common.time.PrecisionDate;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.cda.sr.ServiceReferralCDAModel;
import au.gov.nehta.model.clinical.common.DocumentAuthor;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;
import au.gov.nehta.model.clinical.es.DiagnosticInvestigations;
import au.gov.nehta.model.clinical.es.DiagnosticInvestigationsImpl;
import au.gov.nehta.model.clinical.es.Medications;
import au.gov.nehta.model.clinical.es.MedicationsImpl;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProviderImpl;
import au.gov.nehta.model.clinical.sr.*;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.net.electronichealth.ns.cda._2_0.*;
import org.junit.Assert;
import org.junit.Test;
import org.w3c.dom.Document;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.ZoneId;
import java.time.ZonedDateTime;
import java.util.LinkedList;
import java.util.List;
import java.util.UUID;

import static au.gov.nehta.builder.DocumentCreatorUtil.*;
import static au.gov.nehta.cda.test.TestHelper.*;
import static au.gov.nehta.model.schematron.SchematronResource.SchematronResources.SERVICE_REFERRAL_2;

public class ServiceReferral2Test extends Base {

    private static final String SCHEMATRON = SERVICE_REFERRAL_2.resource().getSchematron();
    private static final String DOCUMENT_FILE_NAME = "src/test/resources/generated_xml/service_referral/ServiceReferral_format_2.xml";

    private static final ObjectFactory objectFactory = new ObjectFactory();
    private final ZonedDateTime now = ZonedDateTime.now();

    @Test
    public void test_2_Service_Referral_Creation() {
        try {
            generate2();
            String SCHEMATRON_TEMPLATE_PATH = "src/test/resources/ServiceReferral";
//            SchematronCheckResult check =
//                    Schematron.check(SCHEMATRON_TEMPLATE_PATH, SCHEMATRON, DOCUMENT_FILE_NAME);
//            show(check);
//            Assert.assertEquals(0, check.schemaErrors.size());
//            Assert.assertEquals(0, check.schematronErrors.size());
            File f = new File(DOCUMENT_FILE_NAME);
            Assert.assertTrue(f.exists());
            Assert.assertTrue(f.length() > 0L);
        } catch (SchematronValidationException | ParserConfigurationException | JAXBException | IOException e) {
            e.printStackTrace();
        }
    }

    public void generate2()
        throws SchematronValidationException, JAXBException, ParserConfigurationException, IOException {

        DocumentAuthor documentAuthor = TestHelper.getDocumentAuthor(now);
        PreciseDate dateTimeAttested = new PrecisionDate(Precision.DAY, now.minusHours(6));
        ServiceReferral serviceReferral = new ServiceReferralImpl();

        // Prepare Discharge Summary Context
        serviceReferral.setContext(getContext(dateTimeAttested, documentAuthor));

        // Prepare Discharge Summary Content
        serviceReferral.setContent(getContent());

        ClinicalDocument cdaClinicalDocument = ClinicalDocumentFactory.getServiceReferral();
        cdaClinicalDocument.setClinicalDocumentId(UUIDTool.uuidToOid(UUID.randomUUID().toString()));
        cdaClinicalDocument.setLanguageCode("en-AU");
        cdaClinicalDocument.setVersionNumber(1);
        cdaClinicalDocument.setCompletionCode(DocumentStatusCode.FINAL);

        ServiceReferralCDAModel serviceReferralCDAModel = new ServiceReferralCDAModel(
                cdaClinicalDocument,
                getInformationRecipients(), getCustodian(), getLegalAuthenticator(now), now);
        ServiceReferralCreator serviceReferralCreator =
                new ServiceReferralCreator(serviceReferralCDAModel, serviceReferral, true);

        Document clinicalDocument = serviceReferralCreator.create();
        String cdaString = TestHelper.documentToXML(clinicalDocument);
        TestHelper.printToFile(cdaString, DOCUMENT_FILE_NAME);
    }

    private ServiceReferralContent getContent() {
        return new ServiceReferralContentImpl(getServiceReferralDetail(), getCurrentServices(),
                getAdverseReactions(), getMedications(), getDiagnosticInvestigations());
    }

    private ServiceReferralDetail getServiceReferralDetail() {
        ServiceReferralDetail serviceReferralDetail = new ServiceReferralDetailImpl();
        StrucDocText narrative = objectFactory.createStrucDocText();

        // Referral Detail -> Requested Service
        StrucDocTable strucDocTable = createTableWithCaption("Requested Service");
        // thead
        StrucDocThead strucDocThead = objectFactory.createStrucDocThead();
        strucDocThead.getTr().add(addTableHeaderRow("Field", "Value"));
        strucDocTable.setThead(strucDocThead);
        // tbody
        StrucDocTbody strucDocTbody = objectFactory.createStrucDocTbody();
        // row1
        strucDocTbody.getTr().add(addTableBodyRow(
                "Reason for Service", "X-ray of right ankle"));
        strucDocTbody.getTr().add(addTableBodyRow(
                "Reason for Service Description", "Reason For Service Description"));
        strucDocTbody.getTr().add(addTableBodyRow(
                "Service Category", "Requested Service"));
        strucDocTbody.getTr().add(addTableBodyRow(
                "Service Description", "MRI of cervical spine"));
        strucDocTbody.getTr().add(addTableBodyRow(
                "Request Urgency", "True"));
        strucDocTbody.getTr().add(addTableBodyRow(
                "Request Urgency Notes", "This is urgent because the patient has had sudden onset "
                        + "of severe headache, with minor neurological impairment and is at risk of "
                        + "quick deterioration."));
        strucDocTbody.getTr().add(addTableBodyRow(
                "Service Commencement Window", " 12 Jun 2019 -> 12 Dec 2019 "));
        strucDocTbody.getTr().add(addTableBodyRow(
                "Service Booking Status", "Appointment Request"));
        strucDocTbody.getTr().add(addTableBodyRow(
                "Request Validity Period", "12 Jun 2019 -> 12 Dec 2019"));
        strucDocTbody.getTr().add(addTableBodyRow(
                "Requested Service DateTime", "16 Jun 2019"));
        strucDocTbody.getTr().add(addTableBodyRow(
                "Service Provider", "Organisation\n"
                        + "Business: 1 Clinician Street, Nehtaville, QLD, 5555\n"
                        + "Business: 1 Clinician Street, Nehtaville, QLD, 5555\n"
                        + "0345754566 (WorkPlace), 0345754566 (WorkPlace)"));
        strucDocTable.getTbody().add(strucDocTbody);
        addTable(narrative, strucDocTable);

        // Other Alert
        StrucDocTable strucDocTable2 = createTableWithCaption("Other Alert");
        // thead
        StrucDocThead strucDocThead2 = objectFactory.createStrucDocThead();
        strucDocThead2.getTr().add(addTableHeaderRow("Field", "Value"));
        strucDocTable.setThead(strucDocThead2);
        // tbody
        StrucDocTbody strucDocTbody2 = objectFactory.createStrucDocTbody();
        // row1
        strucDocTbody2.getTr().add(addTableBodyRow(
                "Alert Type", "Clinical alert"));
        strucDocTbody2.getTr().add(addTableBodyRow(
                "Alert Description", " X-ray of right ankle"));
        strucDocTable2.getTbody().add(strucDocTbody2);
        addTable(narrative, strucDocTable2);

        narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
        serviceReferralDetail.setCustomNarrative(narrative);
        return serviceReferralDetail;
    }

    private CurrentServices getCurrentServices() {
        CurrentServices currentServices = new CurrentServices();
        StrucDocText narrative = objectFactory.createStrucDocText();
        StrucDocTable strucDocTable = createTableWithCaption("Requested Service");
        // thead
        StrucDocThead strucDocThead = objectFactory.createStrucDocThead();
        strucDocThead.getTr().add(addTableHeaderRow("Field", "Value"));
        strucDocTable.setThead(strucDocThead);
        // tbody
        StrucDocTbody strucDocTbody = objectFactory.createStrucDocTbody();
        // row1
        strucDocTbody.getTr().add(addTableBodyRow(
                "Service Category", " Requested Service "));
        strucDocTbody.getTr().add(addTableBodyRow(
                "Service Description", "MRI of cervical spine"));
        strucDocTbody.getTr().add(addTableBodyRow(
                "Service Comment", " Service Comment"));
        strucDocTbody.getTr().add(addTableBodyRow(
                "Service Booking Status", "Event"));
        strucDocTbody.getTr().add(addTableBodyRow(
                "Requested Service DateTime", "16 Jun 2019"));
        strucDocTbody.getTr().add(addTableBodyRow(
                "Service Provider", "  Organisation\n"
                        + "Business: 1 Clinician Street, Nehtaville, QLD, 5555\n"
                        + "Business: 1 Clinician Street, Nehtaville, QLD, 5555\n"
                        + "0345754566 (WorkPlace), 0345754566 (WorkPlace)"));
        strucDocTable.getTbody().add(strucDocTbody);
        addTable(narrative, strucDocTable);
        narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
        currentServices.setCustomNarrative(narrative);
        return currentServices;
    }

    private AdverseReactions getAdverseReactions() {
        AdverseReactions adverseReactions = new AdverseReactionsImpl();
        StrucDocText narrative = objectFactory.createStrucDocText();
        StrucDocTable strucDocTable = createTableWithCaption("Adverse Reactions");
        // thead
        StrucDocThead strucDocThead = objectFactory.createStrucDocThead();
        strucDocThead.getTr().add(addTableHeaderRow(
                "Substance/Agent", "Manifestations", "Reaction Type"));
        strucDocTable.setThead(strucDocThead);

        StrucDocTbody strucDocTbody = objectFactory.createStrucDocTbody();

        StrucDocList sdList = createStrucDocListUnordered("",
                "Ataxia", "Trunk nerve lesion");
        StrucDocList sdList2 = createStrucDocListUnordered("",
                "Ataxia", "Trunk nerve lesion");

        // tbody
        strucDocTbody.getTr().add(addTableBodyRow(
                "Aloe", sdList, "Allergic reaction"));
        strucDocTbody.getTr().add(addTableBodyRow(
                "Phenoxymethylpenicillin", sdList2, "Allergic reaction"));

        strucDocTable.getTbody().add(strucDocTbody);
        addTable(narrative, strucDocTable);
        narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
        adverseReactions.setCustomNarrative(narrative);
        return adverseReactions;
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

    private Medications getMedications() {

        Medications medications = new MedicationsImpl();
        StrucDocText narrative = objectFactory.createStrucDocText();
        StrucDocTable strucDocTable = createTableWithCaption("Medications");
        // thead
        StrucDocThead strucDocThead = objectFactory.createStrucDocThead();
        strucDocThead.getTr().add(addTableHeaderRow("Medication", "Directions",
                "Clinical Indication", "Comment"));
        strucDocTable.setThead(strucDocThead);
        // tbody
        StrucDocTbody strucDocTbody = objectFactory.createStrucDocTbody();
        // row1
        strucDocTbody.getTr().add(addTableBodyRow(
                "Span K 600 mg (potassium 8 mmol) modified release tablet",
                "2 tablets once daily oral",
                "Diuretic induced hypokalemia",
                " Taken with food"));
        strucDocTbody.getTr().add(addTableBodyRow(
                "Panadol Osteo 665 mg modified release tablet",
                "2 tablets three times per day",
                "Arthritis pain management",
                "Swallow whole"));
        strucDocTbody.getTr().add(addTableBodyRow(
                "Lasix 40 mg/4 mL injection, 4 mL ampoule",
                "1 tablet once daily oral",
                "Fluid retention",
                "Take in the morning "));
        strucDocTbody.getTr().add(addTableBodyRow(
                "Spiriva 18 microgram powder for inhalation, 1 capsule",
                "1 inhalation per day",
                " COPD ",
                ""));
        strucDocTbody.getTr().add(addTableBodyRow(
                "Exatrust 25 mg film-coated tablet",
                "Dose:1, Frequency: 3 times daily",
                "Depression",
                ""));
        strucDocTable.getTbody().add(strucDocTbody);
        addTable(narrative, strucDocTable);
        narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
        medications.setCustomNarrative(narrative);
        return medications;
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
        // thead
        StrucDocThead strucDocThead = objectFactory.createStrucDocThead();
        strucDocThead.getTr().add(addTableHeaderRow("Field, Value"));
        // tbody
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
        // thead
        StrucDocThead strucDocThead = objectFactory.createStrucDocThead();
        strucDocThead.getTr().add(addTableHeaderRow("Field", "Value"));
        // tbody
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

        // Pathology Test Result Table ****************************************
        StrucDocTable ptrTable = createTableWithCaption("Pathology Test Results");
        // thead
        StrucDocThead ptrTHead = objectFactory.createStrucDocThead();
        ptrTHead.getTr().add(addTableHeaderRow("Field", "Value"));
        // tbody
        StrucDocTbody ptrBody = objectFactory.createStrucDocTbody();
        ptrBody.getTr().add(addTableBodyRow("Test Name", "Chemistry studies (set)"));
        ptrBody.getTr().add(addTableBodyRow("Result Status", " Final "));
        ptrBody.getTr().add(addTableBodyRow("Date Time", "10 Jul 2019 09:05:05+1000"));
        ptrBody.getTr().add(addTableBodyRow("Comment", " test "));
        ptrTable.getTbody().add(ptrBody);
        ptrTable.setThead(ptrTHead);
        addTable(narrative, ptrTable);

        // Paragraph Table *****************************************************
        StrucDocTable pTable = objectFactory.createStrucDocTable();
        // tbody
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

        // Anatomical Sites Table *****************************************
        StrucDocTable asTable = createTableWithCaption("Anatomical Sites");
        // thead
        StrucDocThead asTHead = objectFactory.createStrucDocThead();
        asTHead.getTr().add(addTableHeaderRow("Location", "Side"));
        // tbody
        StrucDocTbody asTBody = objectFactory.createStrucDocTbody();
        asTBody.getTr().add(addTableBodyRow(
                "Subcutaneous tissue structure of lateral surface of index finger", "Left"));
        asTable.getTbody().add(asTBody);
        asTable.setThead(asTHead);
        addTable(narrative, asTable);

        // Imaging Examination Result Details Table ***********************
        StrucDocTable ieTable = createTableWithCaption("Imaging Examination Result Details");
        // thead
        StrucDocThead ieTHead = objectFactory.createStrucDocThead();
        ieTHead.getTr().add(addTableHeaderRow("Field", "Value"));
        // tbody
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

        // Result Groups Table ***********************
        StrucDocTable rgTable = createTableWithCaption("Result Groups");
        // thead
        StrucDocThead rgTHead = objectFactory.createStrucDocThead();
        rgTHead.getTr()
                .add(addTableHeaderRow("Result Group", "Name", "Value", "Status", "Range", "Comment"));
        // tbody
        StrucDocList sdListValue = createStrucDocListUnordered("", "Ultrasonography");
        StrucDocList sdListRange = createStrucDocListUnordered("",
                "High: 17ml Low: 13ml (Normal range)", "High: 50ml Low: 100ml (High)");
        StrucDocList sdListComment = createStrucDocListUnordered("", "Femur measured during",
                "Legs measured during ultrasound scan");

        StrucDocTbody rgTBody = objectFactory.createStrucDocTbody();
        rgTBody.getTr().add(
                addTableBodyRow("ultrasound scan - obstetric", "Serum Creatinine", sdListValue, "Normal",
                        sdListRange, sdListComment));
        rgTable.getTbody().add(rgTBody);
        rgTable.setThead(rgTHead);
        addTable(narrative, rgTable);

        // Anatomical Sites 2 ***********************
        StrucDocTable asTable2 = createTableWithCaption("Anatomical Sites");
        // thead
        StrucDocThead asTHead2 = objectFactory.createStrucDocThead();
        asTHead2.getTr().add(addTableHeaderRow("Location", "Side", "Image / File"));
        // tbody
        StrucDocTbody asTBody2 = objectFactory.createStrucDocTbody();
        asTBody2.getTr().add(
                addTableBodyRow("Subcutaneous tissue structure of lateral surface of index finger", "Left",
                        ""));

        asTable2.getTbody().add(asTBody2);
        asTable2.setThead(asTHead2);
        addTable(narrative, asTable2);

        // Examination Requests - Image Details ***********************
        StrucDocTable eridTable2 = createTableWithCaption("Examination Requests - Image Details");
        // thead
        StrucDocThead eridTHead2 = objectFactory.createStrucDocThead();
        eridTHead2.getTr().add(
                addTableHeaderRow("Requested Examination Name", "Image Date", "Identifiers",
                        "Subject Position", "Image / File"));
        // tbody
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
}
