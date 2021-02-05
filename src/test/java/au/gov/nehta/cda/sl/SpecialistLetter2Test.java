package au.gov.nehta.cda.sl;

import au.gov.nehta.builder.sl.SpecialistLetterCreator;
import au.gov.nehta.builder.util.UUIDTool;
import au.gov.nehta.cda.test.Base;
import au.gov.nehta.cda.test.TestHelper;
import au.gov.nehta.model.cda.common.code.DocumentStatusCode;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocumentFactory;
import au.gov.nehta.model.cda.common.time.Precision;
import au.gov.nehta.model.cda.common.time.PrecisionDate;
import au.gov.nehta.model.cda.sl.SpecialistLetterCDAModel;
import au.gov.nehta.model.clinical.common.DocumentAuthor;
import au.gov.nehta.model.clinical.es.*;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProviderImpl;
import au.gov.nehta.model.clinical.sl.*;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.net.electronichealth.ns.cda._2_0.*;
import org.junit.Assert;
import org.junit.Test;
import org.w3c.dom.Document;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.time.ZonedDateTime;
import java.util.UUID;

import static au.gov.nehta.builder.DocumentCreatorUtil.*;
import static au.gov.nehta.cda.test.TestHelper.*;
import static au.gov.nehta.model.schematron.SchematronResource.SchematronResources.SPECIALIST_LETTER_2;

public class SpecialistLetter2Test extends Base {

    private static final String SCHEMATRON = SPECIALIST_LETTER_2.resource().getSchematron();

    private static final String DOCUMENT_FILE_NAME = "src/test/resources/generated_xml/specialist_letter/SpecialistLetter_format_2.xml";

    private static final ObjectFactory objectFactory = new ObjectFactory();
    private final ZonedDateTime now = ZonedDateTime.now();

    @Test
    public void test_2_Specialist_Letter_Creation() {
        try {
            generate2();
            String SCHEMATRON_TEMPLATE_PATH = "src/test/resources/SpecialistLetter";
//            SchematronCheckResult check =
//                    Schematron.check(SCHEMATRON_TEMPLATE_PATH, SCHEMATRON, DOCUMENT_FILE_NAME);
//            show(check);
//            assertEquals(0, check.schemaErrors.size());
//            assertEquals(0, check.schematronErrors.size());
            File f = new File(DOCUMENT_FILE_NAME);
            Assert.assertTrue(f.exists());
            Assert.assertTrue(f.length() > 0L);
        } catch (SchematronValidationException | ParserConfigurationException | JAXBException e) {
            e.printStackTrace();
        }
    }

    public void generate2()
            throws SchematronValidationException, JAXBException, ParserConfigurationException {
        // Prepare Specialist Letter Context
        ParticipationServiceProvider usualGP = new ParticipationServiceProviderImpl();
        ParticipationServiceProvider referrer = new ParticipationServiceProviderImpl();

        DocumentAuthor documentAuthor = getDocumentAuthor(now);
        SpecialistLetterContext specialistLetterContext =
                new SpecialistLetterContextImpl(getSubjectOfCareParticipant(), documentAuthor,
                        usualGP, referrer);
        specialistLetterContext
                .setDateTimeSubjectOfCareSeen(new PrecisionDate(Precision.DAY, now.minusDays(1)));
        specialistLetterContext
                .setDateTimeAuthored(new PrecisionDate(Precision.DAY, now.minusHours(6)));
        specialistLetterContext
                .setDateTimeAttested(new PrecisionDate(Precision.DAY, now.minusHours(4)));

        // Prepare Specialist Letter Content
        SpecialistLetterContent specialistLetterContent = new SpecialistLetterContentImpl(
                getResponseDetails(), getRecommendations(), getMedications(),
                getNewlyIdentifiedAdverseReactions(), getDiagnosticInvestigations());

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
        specialistLetterCDAModel.setCustodian(getCustodian());

        specialistLetterCDAModel.setLegalAuthenticator(getLegalAuthenticator(now));
        SpecialistLetterCreator specialistLetterCreator = new SpecialistLetterCreator(
                specialistLetterCDAModel,
                specialistLetter);

        Document clinicalDocument = specialistLetterCreator.create();
        String cdaString = TestHelper.documentToXML(clinicalDocument);
        TestHelper.printToFile(cdaString, DOCUMENT_FILE_NAME);
    }

    private ResponseDetails getResponseDetails() {
        ResponseDetails responseDetails = new ResponseDetailsImpl();

        // create list caption and items
        StrucDocList responseDetailsList = createStrucDocListUnordered("Diagnosis",
                "12 lead ECG (procedure)",
                "Anaesthesia for procedure on perineum (procedure)",
                "Chronic radiation cystitis (diagnoses)",
                "Abscess of forehead (diagnoses)",
                "Text description of first Diagnosis Procedure Entry (other entry)",
                "Text description of second Diagnosis Procedure Entry (other entry)");

        StrucDocTable sdTable = createTableWithCaption("Response Narrative Custom Table");
        StrucDocTbody sdTBody = objectFactory.createStrucDocTbody();
        StrucDocTr strucDocTr = objectFactory.createStrucDocTr();
        StrucDocTd strucDocTd = objectFactory.createStrucDocTd();
        strucDocTd.getContent().add("Response Narrative Custom Table Row ");
        strucDocTr.getThOrTd().add(strucDocTd);
        sdTBody.getTr().add(strucDocTr);
        sdTable.getTbody().add(sdTBody);

        responseDetails.setResponseNarrative(new ResponseNarrative());
        StrucDocText narrative = objectFactory.createStrucDocText();
        narrative.getContent().add(objectFactory.createStrucDocTdList(responseDetailsList));
        narrative.getContent().add(objectFactory.createStrucDocTextTable(sdTable));
        // narrativeSdt.getContent().add(responseDetails.getResponseNarrative().getNarrative());
        narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);
        responseDetails.setCustomNarrative(narrative);

        return responseDetails;
    }

    private Recommendations getRecommendations() {
        Recommendations recommendations = new RecommendationsImpl();
        StrucDocText narrative = objectFactory.createStrucDocText();
        StrucDocTable strucDocTable = createTableWithCaption("Recommendations");

        // thead
        StrucDocThead strucDocThead = objectFactory.createStrucDocThead();
        strucDocThead.getTr().add(addTableHeaderRow("Recommendation",
                "Time Frame", "Addressee"));
        strucDocTable.setThead(strucDocThead);

        // tbody
        StrucDocTbody strucDocTbody = objectFactory.createStrucDocTbody();
        strucDocTbody.getTr().add(addTableBodyRow("Recommendation Narrative Person",
                "4 month(s) after 12 Nov 2019",
                createComplexTD("Dr Tom SMITH (General Medical Practitioner) 134567891 (WorkPlace),",
                        createHtmlLink("dgdfg@optusnet.com.au"))));

        strucDocTable.getTbody().add(strucDocTbody);
        addTable(narrative, strucDocTable);
        narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);

        recommendations.setCustomNarrative(narrative);
        return recommendations;
    }

    private NewlyIdentifiedAdverseReactions getNewlyIdentifiedAdverseReactions() {
        NewlyIdentifiedAdverseReactions adverseReactions = new NewlyIdentifiedAdverseReactionsImpl();
        StrucDocText narrative = objectFactory.createStrucDocText();
        StrucDocTable strucDocTable = createTableWithCaption("Adverse Reactions");
        // thead
        StrucDocThead strucDocThead = objectFactory.createStrucDocThead();
        strucDocThead.getTr().add(addTableHeaderRow(
                "Substance/Agent", "Manifestations", "Reaction Type"));
        strucDocTable.setThead(strucDocThead);

        StrucDocTbody strucDocTbody = objectFactory.createStrucDocTbody();

        StrucDocList sdList = createStrucDocListUnordered("",
                "Under care of pathologist", "Understands diet - diabetes");

        // tbody
        strucDocTbody.getTr().add(addTableBodyRow(
                "Plant diterpene", sdList, "Allergic reaction"));
        strucDocTbody.getTr().add(addTableBodyRow(
                "trans-Nonachlor", sdList, "Allergic reaction"));

        strucDocTable.getTbody().add(strucDocTbody);
        addTable(narrative, strucDocTable);
        narrative.setMediaType(HL7_TEXT_MEDIA_TYPE);

        adverseReactions.setCustomNarrative(narrative);
        return adverseReactions;
    }

    private Medications getMedications() {

        Medications medications = new MedicationsImpl();
        StrucDocText narrative = objectFactory.createStrucDocText();
        StrucDocTable strucDocTable = createTableWithCaption("Medications");
        // thead
        StrucDocThead strucDocThead = objectFactory.createStrucDocThead();
        strucDocThead.getTr().add(addTableHeaderRow("Medication", "Directions",
                "Clinical Indication", "Change Status", "Change Description", "Change Reason", "Comment"));
        strucDocTable.setThead(strucDocThead);
        // tbody
        StrucDocTbody strucDocTbody = objectFactory.createStrucDocTbody();
        // row1
        strucDocTbody.getTr().add(addTableBodyRow(
                "paracetamol 500 mg + codeine phosphate 30 mg tablet",
                "Dose:1, Frequency: 3 times daily",
                "Clinical indication",
                "No Change",
                "Change Recommendation: Changed",
                "Change reason",
                "Some comment"));
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
}
