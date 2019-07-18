package au.gov.nehta.cda.test;

import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;
import au.gov.nehta.schematron.SchemaError;
import au.gov.nehta.schematron.SchematronCheckResult;
import au.gov.nehta.schematron.SchematronError;
import java.util.UUID;

public class Base {

  protected static final String TEST_GENERATION = "src/test/generation/";

  /**
   * little helper method to generate a Unique ID with a random UUID as the root.
   *
   * @param id - the extension
   */
  protected UniqueIdentifier uuidRoot(String id) {
    return UniqueIdentifierImpl.createSimpleIdentifier(UUID.randomUUID().toString(), id);
  }


  public void show(SchematronCheckResult results) {

    System.out.println("#Schema errors#");
    for (SchemaError issue : results.schemaErrors) {
      System.out.println(issue);
    }

    System.out.println("#Schemtron errors#");
    for (SchematronError issue : results.schematronErrors) {
      System.out.println(issue.context + "\t" + issue);
    }


  }

}
