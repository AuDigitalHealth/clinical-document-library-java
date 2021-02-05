package au.gov.nehta.cda.test;

import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;

import java.io.File;
import java.util.UUID;

public class Base {

    protected static String TEST_GENERATION = "src/test/generation/";
    public static final String ATTACHMENTS_DIR = "src/test/resources/";

    static {
        if (!new File(TEST_GENERATION).exists()) {
            TEST_GENERATION = "src/" + TEST_GENERATION;
        }
    }

    /**
     * Little helper method to generate a Unique ID with a random UUID as the root.
     *
     * @param id - the extension
     */
    protected UniqueIdentifier uuidRoot(String id) {
        return UniqueIdentifierImpl.createSimpleIdentifier(UUID.randomUUID().toString(), id);
    }

//  public void show(SchematronCheckResult results) {
//    System.out.println("#Schema errors#");
//    if (null != results.schemaErrors) {
//      results.schemaErrors.stream().filter(Objects::nonNull).forEach(schemaError -> System.out
//          .println(String.format("%s, at line# : %s, position: %s", schemaError.message,
//              schemaError.line, schemaError.position)));
//    }
//    System.out.println("#Schemtron errors#");
//    if (null != results.schematronErrors) {
//      results.schematronErrors.stream().filter(Objects::nonNull)
//          .forEach(schematronError -> System.out
//              .println(String.format("%s, Context: %s, Test: %s", schematronError.message,
//                  schematronError.context, schematronError.test)));
//    }
//  }
}
