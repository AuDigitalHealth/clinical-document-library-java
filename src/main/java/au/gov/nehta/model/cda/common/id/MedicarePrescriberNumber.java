package au.gov.nehta.model.cda.common.id;

import au.gov.nehta.common.utils.ArgumentUtils;

public class MedicarePrescriberNumber extends AsEntityIdentifierImpl implements AsEntityIdentifier {
    private static final String ROOT_OID = "1.2.36.174030967.0.3";
    private static final String IDENTIFIER_NAME = "Medicare Prescriber Number";
    private static final int VALID_PRESCRIBER_NUMBER_LENGTH = 8;
    private static final int ALPHA_CHARACTER_POSITION = 7;

    public MedicarePrescriberNumber(String number) {
        ArgumentUtils.checkNotNull(number, "MedicarePrescriberNumber");

        if (number.length() != VALID_PRESCRIBER_NUMBER_LENGTH) {
            throw new IllegalArgumentException("Prescriber Number should be " + VALID_PRESCRIBER_NUMBER_LENGTH + " characters");
        }

        if (!Character.isLetter(number.charAt(ALPHA_CHARACTER_POSITION))) {
            throw new IllegalArgumentException("Prescriber Number should have an alpha character at 8th position");
        }

        setRoot(ROOT_OID);
        setExtension(number);
        setAssigningAuthorityName(IDENTIFIER_NAME);
    }
}
