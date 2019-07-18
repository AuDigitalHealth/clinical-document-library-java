package au.gov.nehta.builder.util;

import au.gov.nehta.model.schematron.SchematronResource;
import au.gov.nehta.model.schematron.SchematronValidationException;
import au.gov.nehta.schematron.Schematron;
import au.gov.nehta.schematron.SchematronCheckResult;
import org.w3c.dom.Document;
import org.w3c.dom.Node;
import org.w3c.dom.ProcessingInstruction;

public class ClinicalDocumentCreator {

  protected SchematronResource resource;
  private boolean isStrictChecking;

  /**
   * Do strict checking with the default schematron for this document type This will throw
   * SchematronValidation errors on invalid CDA documents
   */
  public void useStrict() {
    if (resource == null) {
      throw new IllegalArgumentException(
          "useStrict was requested but no schematron files were specified. Try useStrict(SchematronResource resource) instead ");
    }

    isStrictChecking = true;
  }

  /**
   * Do strict checking with the supplied schematron files for this document type This will throw
   * SchematronValidation errors on invalid CDA documents
   *
   * @param resource - The file location of the schematron files used to check the document eg:
   * "resources/schematron/PCEHR-DispenseRecord/schematron/ccd-3B.sch"
   */
  public void useStrict(SchematronResource resource) {
    this.resource = resource;
    useStrict();
  }

  protected boolean isStrict() {
    return isStrictChecking;
  }

  /**
   * Check a clinical document using the defaults schematron for this document type.
   *
   * @throws SchematronValidationException on schematron errors
   * @throws RuntimeException on invalid xml
   */
  public void check(Document d) throws SchematronValidationException {
    SchematronCheckResult check =
        Schematron.check(resource.getTemplatePath(), resource.getSchematron(), d);
    if (check.schematronErrors.size() > 0) {
      throw new SchematronValidationException(check);
    }
  }

  public void addStylesheet(String stylesheetName, Document doc) {
    if (stylesheetName != null) {
      ProcessingInstruction pi =
          doc.createProcessingInstruction(
              "xml-stylesheet", "type=\"text/xsl\" href=\"" + stylesheetName + "\"");
      Node root = doc.getDocumentElement();
      doc.setXmlStandalone(true);
      doc.insertBefore(pi, root);
    }
  }
}
