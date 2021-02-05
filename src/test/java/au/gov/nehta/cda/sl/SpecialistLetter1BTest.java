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
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProviderImpl;
import au.gov.nehta.model.clinical.sl.*;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import org.junit.Assert;
import org.junit.Test;
import org.w3c.dom.Document;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.time.ZonedDateTime;
import java.util.UUID;

import static au.gov.nehta.builder.DocumentCreatorUtil.HL7_TEXT_MEDIA_TYPE;
import static au.gov.nehta.cda.test.TestHelper.*;
import static au.gov.nehta.model.schematron.SchematronResource.SchematronResources.SPECIALIST_LETTER_1B;

public class SpecialistLetter1BTest extends Base {

    private static final String SCHEMATRON = SPECIALIST_LETTER_1B.resource().getSchematron();
    private static final String DOCUMENT_FILE_NAME = "src/test/resources/generated_xml/specialist_letter/SpecialistLetter_format_1B.xml";

    private static final ObjectFactory objectFactory = new ObjectFactory();
    private final ZonedDateTime now = ZonedDateTime.now();

    @Test
    public void test_1B_Specialist_Letter_Creation() {
        generate1B();
        String SCHEMATRON_TEMPLATE_PATH = "src/test/resources/SpecialistLetter";
//        SchematronCheckResult check =
//                Schematron.check(SCHEMATRON_TEMPLATE_PATH, SCHEMATRON, DOCUMENT_FILE_NAME);
//        show(check);
//        assertEquals(0, check.schemaErrors.size());
//        assertEquals(0, check.schematronErrors.size());
        File f = new File(DOCUMENT_FILE_NAME);
        Assert.assertTrue(f.exists());
        Assert.assertTrue(f.length() > 0L);
    }

    public void generate1B() {
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

        StrucDocText narrativeSdt = objectFactory.createStrucDocText();
        narrativeSdt.getContent().add("Custom Narrative");
        narrativeSdt.setMediaType(HL7_TEXT_MEDIA_TYPE);

        SpecialistLetterContent specialistLetterContent = new SpecialistLetterContentImpl(
                "Custom Title", narrativeSdt);

        SpecialistLetter specialistLetter = new SpecialistLetterImpl();
        specialistLetter.setContext(specialistLetterContext);
        specialistLetter.setContent(specialistLetterContent);
        SpecialistLetterCDAModel specialistLetterCDAModel = new SpecialistLetterCDAModel(
                getCDAClinicalDocument(), getInformationRecipients(), now);

        specialistLetterCDAModel.setCustodian(getCustodian());

        specialistLetterCDAModel.setLegalAuthenticator(getLegalAuthenticator(now));
        SpecialistLetterCreator specialistLetterCreator = new SpecialistLetterCreator(
                specialistLetterCDAModel,
                specialistLetter);
        try {
            Document clinicalDocument = specialistLetterCreator.create1BFormatCDADocument();
            String cdaString = TestHelper.documentToXML(clinicalDocument);
            TestHelper.printToFile(cdaString, DOCUMENT_FILE_NAME);

        } catch (SchematronValidationException | ParserConfigurationException | JAXBException e) {
            e.printStackTrace();
        }
    }

    private ClinicalDocument getCDAClinicalDocument() {
        ClinicalDocument cdaClinicalDocument = ClinicalDocumentFactory.getSpecialistLetter();
        cdaClinicalDocument.setClinicalDocumentId(UUIDTool.uuidToOid(UUID.randomUUID().toString()));
        cdaClinicalDocument.setLanguageCode("en-AU");
        cdaClinicalDocument.setVersionNumber(1);
        cdaClinicalDocument.setCompletionCode(DocumentStatusCode.FINAL);
        return cdaClinicalDocument;
    }
}
