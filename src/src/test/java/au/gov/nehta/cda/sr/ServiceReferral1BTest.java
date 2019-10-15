package au.gov.nehta.cda.sr;


import static au.gov.nehta.builder.DocumentCreatorUtil.HL7_TEXT_MEDIA_TYPE;
import static au.gov.nehta.cda.test.TestHelper.getCustodian;
import static au.gov.nehta.cda.test.TestHelper.getDocumentAuthor;
import static au.gov.nehta.cda.test.TestHelper.getInformationRecipients;
import static au.gov.nehta.cda.test.TestHelper.getLegalAuthenticator;
import static au.gov.nehta.cda.test.TestHelper.getSubjectOfCareParticipant;

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
import au.gov.nehta.model.clinical.sr.ServiceReferral;
import au.gov.nehta.model.clinical.sr.ServiceReferralContent;
import au.gov.nehta.model.clinical.sr.ServiceReferralContentImpl;
import au.gov.nehta.model.clinical.sr.ServiceReferralContext;
import au.gov.nehta.model.clinical.sr.ServiceReferralContextImpl;
import au.gov.nehta.model.clinical.sr.ServiceReferralImpl;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import java.util.UUID;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import org.joda.time.DateTime;
import org.junit.Test;
import org.w3c.dom.Document;

public class ServiceReferral1BTest extends Base {

  private static final String DOCUMENT_FILE_NAME =
      TEST_GENERATION + "/sr/ServiceReferral_format_1B.xml";

  private static ObjectFactory objectFactory = new ObjectFactory();
  private DateTime now = new DateTime();

  @Test
  public void test_Service_Referral_Format_1B_Creation() {
    ServiceReferralContext serviceReferralContext =
        new ServiceReferralContextImpl();
    serviceReferralContext
        .setDateTimeAttested(new PrecisionDate(Precision.DAY, now.minusDays(1)));
    serviceReferralContext.setDocumentAuthor(getDocumentAuthor(now));
    serviceReferralContext.setSubjectOfCare(getSubjectOfCareParticipant());
    StrucDocText narrativeSdt = objectFactory.createStrucDocText();
    narrativeSdt.getContent().add("Custom Narrative");
    narrativeSdt.setMediaType(HL7_TEXT_MEDIA_TYPE);
    ServiceReferralContent ServiceReferralContent = new ServiceReferralContentImpl("Custom Title",
        narrativeSdt);
    ServiceReferral serviceReferral = new ServiceReferralImpl();
    serviceReferral.setContext(serviceReferralContext);
    serviceReferral.setContent(ServiceReferralContent);
    ServiceReferralCDAModel serviceReferralCDAModel = new ServiceReferralCDAModel(
        getCDAClinicalDocument(), now);
    serviceReferralCDAModel.setCustodian(getCustodian());
    serviceReferralCDAModel.setInformationRecipients(getInformationRecipients());
    serviceReferralCDAModel.setLegalAuthenticator(getLegalAuthenticator(now));
    ServiceReferralCreator serviceReferralCreator = new ServiceReferralCreator(
        serviceReferralCDAModel, serviceReferral);
    try {
      Document clinicalDocument = serviceReferralCreator.create1BFormatCDADocument();
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
