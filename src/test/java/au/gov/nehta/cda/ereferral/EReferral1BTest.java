package nehta.cda.ereferral;

import au.gov.nehta.builder.ereferral.EReferral3ACreator;
import au.gov.nehta.builder.util.UUIDTool;
import au.gov.nehta.cda.test.Base;
import au.gov.nehta.cda.test.TestHelper;
import au.gov.nehta.model.cda.common.code.DocumentStatusCode;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocumentFactory;
import au.gov.nehta.model.cda.common.time.Precision;
import au.gov.nehta.model.cda.common.time.PrecisionDate;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.cda.ereferral.EReferralCDAModel;
import au.gov.nehta.model.clinical.common.participation.ANZSCO_1ED_2006;
import au.gov.nehta.model.clinical.ereferral.*;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProviderImpl;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.gov.nehta.schematron.Schematron;
import au.gov.nehta.schematron.SchematronCheckResult;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import junit.framework.Assert;
import org.joda.time.DateTime;
import org.junit.Test;
import org.w3c.dom.Document;

import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import java.io.File;
import java.util.UUID;

import static au.gov.nehta.cda.test.TestHelper.*;
import static au.gov.nehta.model.schematron.SchematronResource.SchematronResources.SERVICE_REFERRAL_1B;

public class EReferral1BTest extends Base {

  private static final String SCHEMATRON = SERVICE_REFERRAL_1B.resource().getSchematron();
  private static String SCHEMATRON_TEMPLATE_PATH = "resources/e-Referral";
  private static final String DOCUMENT_FILE_NAME =
      TEST_GENERATION + "eReferral/eReferral-1B.xml";

  @Test
  public void test_E_REFERRAL_1B_Creation()
      throws ParserConfigurationException, JAXBException, SchematronValidationException {
    if (!new File(SCHEMATRON_TEMPLATE_PATH
        + "/schematron/schematron-Validator-report.xsl").exists()) {
      SCHEMATRON_TEMPLATE_PATH = "src/" + SCHEMATRON_TEMPLATE_PATH;
    }
    generate1B();
    SchematronCheckResult check = Schematron
        .check(SCHEMATRON_TEMPLATE_PATH, SCHEMATRON, DOCUMENT_FILE_NAME);
    show(check);
    Assert.assertEquals(0, check.schemaErrors.size());
    Assert.assertEquals(0, check.schematronErrors.size());
  }


  private void generate1B()
      throws ParserConfigurationException, JAXBException, SchematronValidationException {
    EReferral eReferral = new EReferralImpl();
    EReferralContext context = new EReferralContextImpl();
    DateTime now = new DateTime();
    context.setDateTimeAuthored(new PrecisionDate(Precision.DAY, now));
    context.setDateTimeAttested(new PrecisionDate(Precision.DAY, now.minusHours(4)));
    context.setDocumentAuthor(getDocumentAuthor(now));
    context.setSubjectOfCare(getSubjectOfCareParticipant());
    eReferral.setContext(context);
    EReferralContent content = new EReferralContentImpl();
    content.setCustomNarrativeTitle("Title for Narrative");
    content.setReferralDetail(getReferralDetail());
    content.setCustomNarrative(new StrucDocText() {{
      getContent().add("************************* Custom Narrative ************************\n");
    }});
    eReferral.setContent(content);
    EReferralCDAModel eReferralCDAModel = new EReferralCDAModel(getCDAClinicalDocument(),
        getInformationRecipients(), now);
    eReferralCDAModel.setCustodian(getCustodian());
    EReferral3ACreator eReferralCreator = new EReferral3ACreator(eReferralCDAModel, eReferral);
    Document clinicalDocument = eReferralCreator.create1BFormatCDADocument();
    String cdaString = TestHelper.documentToXML(clinicalDocument);
    TestHelper.printToFile(cdaString, DOCUMENT_FILE_NAME);
    System.out.println(cdaString);
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

  private ClinicalDocument getCDAClinicalDocument() {
    ClinicalDocument cdaClinicalDocument = ClinicalDocumentFactory.getEReferral();
    cdaClinicalDocument.setClinicalDocumentId(UUIDTool.uuidToOid(UUID.randomUUID().toString()));
    cdaClinicalDocument.setLanguageCode("en-AU");
    cdaClinicalDocument.setVersionNumber(1);
    cdaClinicalDocument.setCompletionCode(DocumentStatusCode.FINAL);
    return cdaClinicalDocument;
  }


}
