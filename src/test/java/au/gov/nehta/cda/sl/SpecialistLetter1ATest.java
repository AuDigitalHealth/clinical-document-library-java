package au.gov.nehta.cda.sl;

import static au.gov.nehta.cda.test.TestHelper.getCustodian;
import static au.gov.nehta.cda.test.TestHelper.getDocumentAuthor;
import static au.gov.nehta.cda.test.TestHelper.getInformationRecipients;
import static au.gov.nehta.cda.test.TestHelper.getLegalAuthenticator;
import static au.gov.nehta.cda.test.TestHelper.getSubjectOfCareParticipant;
import static au.gov.nehta.model.schematron.SchematronResource.SchematronResources.SPECIALIST_LETTER_1A;
import static org.junit.Assert.assertEquals;

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
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProviderImpl;
import au.gov.nehta.model.clinical.sl.SpecialistLetter;
import au.gov.nehta.model.clinical.sl.SpecialistLetterContent;
import au.gov.nehta.model.clinical.sl.SpecialistLetterContentImpl;
import au.gov.nehta.model.clinical.sl.SpecialistLetterContext;
import au.gov.nehta.model.clinical.sl.SpecialistLetterContextImpl;
import au.gov.nehta.model.clinical.sl.SpecialistLetterImpl;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.gov.nehta.schematron.Schematron;
import au.gov.nehta.schematron.SchematronCheckResult;
import java.util.UUID;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import org.joda.time.DateTime;
import org.junit.Test;
import org.w3c.dom.Document;

public class SpecialistLetter1ATest extends Base {

  private static final String SCHEMATRON = SPECIALIST_LETTER_1A.resource().getSchematron();
  private static final String DOCUMENT_FILE_NAME = "src/test/resources/specialist_letter/SpecialistLetter_format_1A.xml";
  private final DateTime now = new DateTime();

  @Test
  public void test_1A_Specialist_Letter_Creation() {
    generate1A();
    String SCHEMATRON_TEMPLATE_PATH = "src/test/resources/SpecialistLetter";
    SchematronCheckResult check =
        Schematron.check(SCHEMATRON_TEMPLATE_PATH, SCHEMATRON, DOCUMENT_FILE_NAME);
    show(check);
    assertEquals(0, check.schemaErrors.size());
    assertEquals(0, check.schematronErrors.size());
  }

  public void generate1A() {

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

    AttachedMedia reportFile = TestHelper.getAttachedMediaPDF("radiologyreport.pdf");
    SpecialistLetterContent specialistLetterContent = new SpecialistLetterContentImpl(reportFile);

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
      Document clinicalDocument = specialistLetterCreator.create1AFormatCDADocument();
      String cdaString = TestHelper.documentToXML(clinicalDocument);
      TestHelper.printToFile(cdaString, DOCUMENT_FILE_NAME);
      System.out.println(cdaString);
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
