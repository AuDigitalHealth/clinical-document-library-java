package nehta.cda.goc;

import au.gov.nehta.builder.goc.GoalsOfCareCreator;
import au.gov.nehta.builder.util.CDATypeUtil;
import au.gov.nehta.cda.test.Base;
import au.gov.nehta.cda.test.TestHelper;
import au.gov.nehta.model.cda.acp.AdvanceCarePlanningCDAModel;
import au.gov.nehta.model.cda.common.code.CodeImpl;
import au.gov.nehta.model.cda.common.code.DocumentStatusCode;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocumentFactory;
import au.gov.nehta.model.clinical.acp.*;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;
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

import static au.gov.nehta.cda.test.TestHelper.*;

public class GoalsOfCareMaxTest extends Base {

  private static final String SCHEMATRON = "ccd-3A.sch";
  private static String SCHEMATRON_TEMPLATE_PATH = "resources/GoalsOfCare";
  private static final String DOCUMENT_FILE_NAME = TEST_GENERATION + "/goc/goc-max-java.xml";

  @Test
  public void test_MAX_Advance_Care_Planning_Creation() {
    try {

      if (!new File(SCHEMATRON_TEMPLATE_PATH + "/schematron/schematron-Validator-report.xsl").exists()) {
        SCHEMATRON_TEMPLATE_PATH = "src/" + SCHEMATRON_TEMPLATE_PATH;
      }
      generateMax();
      SchematronCheckResult check =
          Schematron.check(SCHEMATRON_TEMPLATE_PATH, SCHEMATRON, DOCUMENT_FILE_NAME);
      show(check);
      Assert.assertEquals(0, check.schemaErrors.size());
      Assert.assertEquals(0, check.schematronErrors.size());
    } catch (SchematronValidationException | JAXBException | ParserConfigurationException e) {
      e.printStackTrace();
    }
  }

  private void generateMax()
      throws SchematronValidationException, JAXBException, ParserConfigurationException {
    DateTime now = new DateTime();
    AdvanceCarePlanning advanceCarePlanning = new AdvanceCarePlanningImpl();
    AdvanceCarePlanningContext context = new AdvanceCarePlanningContextImpl();
    context.setDocumentAuthor(getDocumentAuthor(now));
    context.setDocumentTitle("Goals of Care Document");
    context.setSubjectOfCare(TestHelper.getSubjectOfCareParticipant());
    advanceCarePlanning.setContext(context);

    AdvanceCarePlanningContent content = new AdvanceCarePlanningContentImpl();
    AdvanceCareInformationSection advanceCareInformationSection = new AdvanceCareInformationSectionImpl();
    RelatedDocument relatedDocument = new RelatedDocument();
    DocumentDetails documentDetails = new DocumentDetails();
    documentDetails.setDocumentAuthor(getDocumentAuthor(now));
    documentDetails
        .setDocumentIdentifier(new UniqueIdentifierImpl(CDATypeUtil.getUUID(), "123A45"));
    documentDetails.setDocumentType(new CodeImpl("100.32016", "1.2.36.1.2001.1001.101",
        "NCTIS Data Components",
        "Goals of Care Document"));
    documentDetails.setDocumentTitle("Substitute Decision Maker");
//    documentDetails.setDocumentType();
    relatedDocument.setDocumentDetails(documentDetails);
    relatedDocument.setDocumentTarget(getAttachedMediaPDF("radiologyreport.pdf"));
//    relatedDocument.setLinkNature();
    advanceCareInformationSection.setRelatedDocument(relatedDocument);
    content.setAdvanceCareInformationSection(advanceCareInformationSection);
    advanceCarePlanning.setContent(content);
    ClinicalDocument cdaClinicalDocument = ClinicalDocumentFactory.getGoalsOfCare();
    cdaClinicalDocument.setLanguageCode("en-AU");
    cdaClinicalDocument.setCompletionCode(DocumentStatusCode.FINAL);
    AdvanceCarePlanningCDAModel advanceCarePlanningCDAModel = new AdvanceCarePlanningCDAModel(
        cdaClinicalDocument, getCustodian(), now);
    advanceCarePlanningCDAModel.setLegalAuthenticator(getLegalAuthenticator(now));
    GoalsOfCareCreator creator = new GoalsOfCareCreator(
        advanceCarePlanningCDAModel, advanceCarePlanning);
    Document clinicalDocument = creator.create();
    String cdaString = TestHelper.documentToXML(clinicalDocument);
    TestHelper.printToFile(cdaString, DOCUMENT_FILE_NAME);
    System.out.println(cdaString);
  }

}
