package au.gov.nehta.cda.acd;

import static au.gov.nehta.cda.test.TestHelper.getCustodian;
import static au.gov.nehta.cda.test.TestHelper.getDocumentAuthor;
import static au.gov.nehta.cda.test.TestHelper.getLegalAuthenticator;
import static au.gov.nehta.cda.test.TestHelper.getServiceProviderIndividual;
import static au.gov.nehta.cda.test.TestHelper.getServiceProviderOrganization;
import static au.gov.nehta.cda.test.TestHelper.getSubjectOfCareParticipant;

import au.gov.nehta.builder.acd.AdvanceCareDirectiveCreator;
import au.gov.nehta.cda.test.Base;
import au.gov.nehta.cda.test.TestHelper;
import au.gov.nehta.model.cda.acd.AdvanceCareDirectiveCDAModel;
import au.gov.nehta.model.cda.common.code.CodeImpl;
import au.gov.nehta.model.cda.common.code.DocumentStatusCode;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocumentFactory;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.cda.common.time.Precision;
import au.gov.nehta.model.cda.common.time.PrecisionDate;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;
import au.gov.nehta.model.clinical.acd.AdvanceCareDirective;
import au.gov.nehta.model.clinical.acd.AdvanceCareDirectiveContent;
import au.gov.nehta.model.clinical.acd.AdvanceCareDirectiveContentImpl;
import au.gov.nehta.model.clinical.acd.AdvanceCareDirectiveContext;
import au.gov.nehta.model.clinical.acd.AdvanceCareDirectiveContextImpl;
import au.gov.nehta.model.clinical.acd.AdvanceCareDirectiveImpl;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProvider;
import au.gov.nehta.model.clinical.etp.common.participation.ParticipationServiceProviderImpl;
import au.gov.nehta.model.schematron.SchematronValidationException;
import java.util.LinkedList;
import java.util.List;
import javax.xml.bind.JAXBException;
import javax.xml.parsers.ParserConfigurationException;
import org.joda.time.DateTime;
import org.junit.Test;
import org.w3c.dom.Document;

public class AdvanceCareDirectiveMaxTest extends Base {

  private static final String SCHEMATRON = "ccd-3B.sch";
  private static final String SCHEMATRON_TEMPLATE_PATH = "resources/AdvanceCareDirective";
  private static final String DOCUMENT_FILE_NAME = TEST_GENERATION + "/acd/acd-max-java.xml";

  @Test
  public void test_MAX_Advance_Care_Directive_Creation() {
    try {
      generateMax();
    } catch (SchematronValidationException | JAXBException | ParserConfigurationException e) {
      e.printStackTrace();
    }
  }

  private void generateMax()
      throws SchematronValidationException, JAXBException, ParserConfigurationException {
    DateTime now = new DateTime();
    PreciseDate dateTimeAttested = new PrecisionDate(Precision.DAY, now.plusHours(6));
    AdvanceCareDirective advanceCareDirective = new AdvanceCareDirectiveImpl();
    AdvanceCareDirectiveContext context = new AdvanceCareDirectiveContextImpl();
    PreciseDate dateTimeAuthored = new PrecisionDate(Precision.DAY, now.minusDays(1));
    context.setDateTimeAttested(dateTimeAttested);
    context.setDateTimeAuthored(dateTimeAuthored);
    context.setDocumentAuthor(getDocumentAuthor(now));
    context.setSubjectOfCare(getSubjectOfCareParticipant());
    AdvanceCareDirectiveContent content = new AdvanceCareDirectiveContentImpl();
    List<ParticipationServiceProvider> acdCustodians = new LinkedList<ParticipationServiceProvider>() {{
      add(getIndividualCustodian());
      add(getOrgCustodian());
    }};
    content.setACDCustodians(acdCustodians);
    advanceCareDirective.setContext(context);
    advanceCareDirective.setContent(content);
    ClinicalDocument cdaClinicalDocument = ClinicalDocumentFactory.getAdvanceCareDirective();
    cdaClinicalDocument.setVersionNumber(1);
    cdaClinicalDocument.setLanguageCode("en-AU");
    cdaClinicalDocument.setCompletionCode(DocumentStatusCode.FINAL);
    AdvanceCareDirectiveCDAModel advanceCareDirectiveCDAModel = new AdvanceCareDirectiveCDAModel(
        cdaClinicalDocument, getCustodian(), now);
    advanceCareDirectiveCDAModel.setLegalAuthenticator(getLegalAuthenticator(now));
    AdvanceCareDirectiveCreator creator = new AdvanceCareDirectiveCreator(
        advanceCareDirectiveCDAModel, advanceCareDirective);
    Document clinicalDocument = creator.create();
    String cdaString = TestHelper.documentToXML(clinicalDocument);
    TestHelper.printToFile(cdaString, DOCUMENT_FILE_NAME);
    System.out.println(cdaString);
  }

  private ParticipationServiceProvider getIndividualCustodian() {
    ParticipationServiceProvider individualCustodian = new ParticipationServiceProviderImpl();
    individualCustodian.setParticipationPeriod(RestrictedTimeInterval.getLowHighInstance(
        new PrecisionDate(Precision.DAY, new DateTime("2013-01-1")),
        new PrecisionDate(Precision.DAY, new DateTime("2019-04-1"))));
    individualCustodian.setRole(new CodeImpl() {{
      setCode("MTH");
      setCodeSystem("2.16.840.1.113883.5.111");
      setDisplayName("Mother");
      setOriginalText("Mother");
    }});
    individualCustodian.setParticipant(getServiceProviderIndividual());
    return individualCustodian;
  }

  private ParticipationServiceProvider getOrgCustodian() {
    ParticipationServiceProvider orgCustodian = new ParticipationServiceProviderImpl();
    orgCustodian.setParticipant(getServiceProviderOrganization());
    orgCustodian.setParticipationPeriod(RestrictedTimeInterval.getLowHighInstance(
        new PrecisionDate(Precision.DAY, new DateTime("2016-05-2")),
        new PrecisionDate(Precision.DAY, new DateTime("2018-06-3"))));
    orgCustodian.setRole(new CodeImpl(
        "309964003",
        "2.16.840.1.113883.6.96",
        "SNOMED CT",
        "Radiology Department",
        "Radiology Department"));
    return orgCustodian;
  }
}
