package au.gov.nehta.model.clinical.common.types;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifierImpl;


/**
 * A wrapper around AsEntityIdentifier for convenience.
 * This implementation will automatically fill all fields except the 16 digit PAI-D number
 */
public class PAI_D extends AsEntityIdentifierImpl implements AsEntityIdentifier {

    private static final String ROOT_OID = "1.2.36.1.2001.1007.20.";

    private static final String IDENTIFIER_NAME = "PAI-D";
    private static final int PAI_D_PARAMETER_LENGTH = 16;

    public PAI_D(String id) {
        ArgumentUtils.checkNotNull(id, "PAI-D");

        if (id.length() != PAI_D_PARAMETER_LENGTH) {
            throw new IllegalArgumentException("the PAI-D parameter needs to be a " + PAI_D_PARAMETER_LENGTH + " character string");
        }

        try {
            Long.parseLong(id);
        } catch (NumberFormatException exception) {
            throw new IllegalArgumentException("the PAI-D parameter needs to be a " + PAI_D_PARAMETER_LENGTH + " digit number");
        }

        setRoot(ROOT_OID + id);
        setAssigningAuthorityName(IDENTIFIER_NAME);
    }

    public String getNarrativeForm() {
        String number = getRoot().substring(ROOT_OID.length() + 1);
        return number.substring(0, 4) + " " + number.substring(4, 8) + " " + number.substring(8, 12) + " " + number.substring(12, 16);
    }
}
