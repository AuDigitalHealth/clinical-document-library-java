package nehta.cda.sr;

import au.gov.nehta.builder.sr.ServiceReferralCreator;
import au.gov.nehta.builder.util.UUIDTool;
import au.gov.nehta.cda.test.Base;
import au.gov.nehta.cda.test.TestHelper;
import au.gov.nehta.model.cda.common.code.DocumentStatusCode;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocumentFactory;
import au.gov.nehta.model.cda.common.time.Precision;
import au.gov.nehta.model.cda.common.time.PrecisionDate;
import au.gov.nehta.model.cda.sr.ServiceReferralCDAModel;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.gov.nehta.model.clinical.sr.*;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.gov.nehta.schematron.Schematron;
import au.gov.nehta.schematron.SchematronCheckResult;
import junit.framework.Assert;
import org.joda.time.DateTime;
import org.junit.Test;
import org.w3c.dom.Document;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.util.UUID;

import static au.gov.nehta.cda.test.TestHelper.*;
import static au.gov.nehta.model.schematron.SchematronResource.SchematronResources.SERVICE_REFERRAL_1A;

public class ServiceReferral1ATest extends Base {
  private static final String SCHEMATRON = SERVICE_REFERRAL_1A.resource().getSchematron();
  private static String SCHEMATRON_TEMPLATE_PATH = "resources/ServiceReferral";
  private static final String DOCUMENT_FILE_NAME =
      TEST_GENERATION + "/sr/ServiceReferral_format_1A.xml";
  private DateTime now = new DateTime();

  @Test
  public void test_1A_Service_Referral_Creation() {
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

  public void generate1A() {
    ServiceReferralContext serviceReferralContext = new ServiceReferralContextImpl();
    serviceReferralContext.setDocumentAuthor(getDocumentAuthor(now));
    serviceReferralContext.setSubjectOfCare(getSubjectOfCareParticipant());
    serviceReferralContext
        .setDateTimeAttested(new PrecisionDate(Precision.DAY, now.minusDays(1)));
    AttachedMedia reportFile = TestHelper.getAttachedMediaPDF("radiologyreport.pdf");
    ServiceReferralContent serviceReferralContent = new ServiceReferralContentImpl(reportFile);
    ServiceReferral ServiceReferral = new ServiceReferralImpl();
    ServiceReferral.setContext(serviceReferralContext);
    ServiceReferral.setContent(serviceReferralContent);
    ServiceReferralCDAModel serviceReferralCDAModel = new ServiceReferralCDAModel(
        getCDAClinicalDocument(), now);
    serviceReferralCDAModel.setInformationRecipients(getInformationRecipients());
    serviceReferralCDAModel.setCustodian(getCustodian());
    serviceReferralCDAModel.setLegalAuthenticator(getLegalAuthenticator(now));
    ServiceReferralCreator ServiceReferralCreator = new ServiceReferralCreator(
        serviceReferralCDAModel,
        ServiceReferral);
    try {
      Document clinicalDocument = ServiceReferralCreator.create1AFormatCDADocument();
      String cdaString = TestHelper.documentToXML(clinicalDocument);
      TestHelper.printToFile(cdaString, DOCUMENT_FILE_NAME);
      System.out.println(cdaString);
    } catch (SchematronValidationException | ParserConfigurationException | JAXBException e) {
      e.printStackTrace();
    }
  }


  private ClinicalDocument getCDAClinicalDocument() {
    ClinicalDocument cdaClinicalDocument = ClinicalDocumentFactory.getServiceReferral();
    cdaClinicalDocument.setClinicalDocumentId(UUIDTool.uuidToOid(UUID.randomUUID().toString()));
    cdaClinicalDocument.setLanguageCode("en-AU");
    cdaClinicalDocument.setVersionNumber(1);
    cdaClinicalDocument.setCompletionCode(DocumentStatusCode.FINAL);
    return cdaClinicalDocument;
  }

}
