package au.gov.nehta.cda.ds;

import static au.gov.nehta.cda.test.TestHelper.getCustodian;
import static au.gov.nehta.cda.test.TestHelper.getDocumentAuthor;
import static au.gov.nehta.cda.test.TestHelper.getInformationRecipients;
import static au.gov.nehta.cda.test.TestHelper.getLegalAuthenticator;
import static au.gov.nehta.cda.test.TestHelper.getSubjectOfCareParticipant;
import static au.gov.nehta.model.schematron.SchematronResource.SchematronResources.DISCHARGE_SUMMARY_1A;

import au.gov.nehta.builder.ds.DischargeSummaryCreator;
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
import au.gov.nehta.model.cda.ds.DischargeSummaryCDAModel;
import au.gov.nehta.model.clinical.common.DocumentAuthor;
import au.gov.nehta.model.clinical.ds.DischargeSummary;
import au.gov.nehta.model.clinical.ds.DischargeSummaryContent;
import au.gov.nehta.model.clinical.ds.DischargeSummaryContentImpl;
import au.gov.nehta.model.clinical.ds.DischargeSummaryContext;
import au.gov.nehta.model.clinical.ds.DischargeSummaryContextImpl;
import au.gov.nehta.model.clinical.ds.DischargeSummaryImpl;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProviderImpl;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.gov.nehta.schematron.Schematron;
import au.gov.nehta.schematron.SchematronCheckResult;
import java.io.File;
import java.util.UUID;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import junit.framework.Assert;
import org.joda.time.DateTime;
import org.junit.Test;
import org.w3c.dom.Document;

public class DischargeSummary1ATest extends Base {
  private static final String SCHEMATRON = DISCHARGE_SUMMARY_1A.resource().getSchematron();
  private static String SCHEMATRON_TEMPLATE_PATH = "resources/DischargeSummary";
  private static final String DOCUMENT_FILE_NAME =
      TEST_GENERATION + "/ds/DischargeSummary_1A_format.xml";


  @Test
  public void test_Discharge_Summary__Format_1A_Creation() {
    if (!new File(SCHEMATRON_TEMPLATE_PATH
        + "/schematron/schematron-Validator-report.xsl").exists()) {
      SCHEMATRON_TEMPLATE_PATH = "src/" + SCHEMATRON_TEMPLATE_PATH;
    }
    generate1A();
    SchematronCheckResult check =
        Schematron.check(SCHEMATRON_TEMPLATE_PATH, SCHEMATRON, DOCUMENT_FILE_NAME);
    show(check);
    Assert.assertEquals(0, check.schemaErrors.size());
    Assert.assertEquals(0, check.schematronErrors.size());
  }


  private void generate1A() {
    DateTime now = new DateTime();
    DocumentAuthor documentAuthor = getDocumentAuthor(now);

    ParticipationServiceProvider facility = new ParticipationServiceProviderImpl();
    PreciseDate dateTimeAttested = new PrecisionDate(Precision.DAY, now.minusHours(6));
    RestrictedTimeInterval encounterPeriod =
        RestrictedTimeInterval.getLowHighInstance(
            new PrecisionDate(Precision.DAY, new DateTime("2019-03-1")),
            new PrecisionDate(Precision.DAY, new DateTime("2019-04-1")));
    facility.setParticipationPeriod(encounterPeriod);
    //facility.setParticipant(getServiceProviderOrganization());
    facility.setRole(new CodeImpl("HOSP", "2.16.840.1.113883.1.11.17660",
        "HL7 ServiceDeliveryLocationRoleType", "Hospital"));

    //Context
    DischargeSummaryContext dischargeSummaryContext = new DischargeSummaryContextImpl(
        documentAuthor,
        getSubjectOfCareParticipant(), facility, encounterPeriod, dateTimeAttested,
        "Some care setting");

    AttachedMedia reportFile = new AttachedMedia(
        new File("radiologyreport.pdf"));

    //Content
    DischargeSummaryContent dischargeSummaryContent = new DischargeSummaryContentImpl(reportFile);

    DischargeSummary dischargeSummary = new DischargeSummaryImpl();
    dischargeSummary.setContext(dischargeSummaryContext);
    dischargeSummary.setContent(dischargeSummaryContent);

    DischargeSummaryCDAModel dischargeSummaryCDAModel = new DischargeSummaryCDAModel(
        getCDAClinicalDocument(), getInformationRecipients(), getCustodian(),
        getLegalAuthenticator(now), now);

    dischargeSummaryCDAModel.setLegalAuthenticator(getLegalAuthenticator(now));
    DischargeSummaryCreator dischargeSummaryCreator = new DischargeSummaryCreator(
        dischargeSummaryCDAModel,
        dischargeSummary);

    try {
      Document clinicalDocument = dischargeSummaryCreator.create1AFormatCDADocument();
      String cdaString = TestHelper.documentToXML(clinicalDocument);
      TestHelper.printToFile(cdaString, DOCUMENT_FILE_NAME);
      System.out.println(cdaString);
    } catch (SchematronValidationException | ParserConfigurationException | JAXBException e) {
      e.printStackTrace();
    }
  }


  private ClinicalDocument getCDAClinicalDocument() {
    ClinicalDocument cdaClinicalDocument = ClinicalDocumentFactory.getDischargeSummary();
    cdaClinicalDocument.setClinicalDocumentId(UUIDTool.uuidToOid(UUID.randomUUID().toString()));
    cdaClinicalDocument.setLanguageCode("en-AU");
    cdaClinicalDocument.setVersionNumber(1);
    cdaClinicalDocument.setCompletionCode(DocumentStatusCode.FINAL);
    return cdaClinicalDocument;
  }

}
