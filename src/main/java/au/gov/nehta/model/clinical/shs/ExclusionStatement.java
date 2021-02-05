package au.gov.nehta.model.clinical.shs;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

/**
 * Statements that positively assert that the patient does not have the
 * problem or diagnosis.
 */
public interface ExclusionStatement {

    /*
     * Used for Specialist Letter implementation.
     */
    Coded getGlobalStatement();

    /*
     * Used for Specialist Letter implementation.
     */
    void setGlobalStatement(Coded globalStatement);

    /*
     * The statement about the absence or exclusion of a data item.
     * Usually an NCTISGlobalStatement code.
     */
    Coded getExclusionStatement();

    void setExclusionStatement(Coded exclusionStatement);

    /*
     * UUID This is a technical identifier that is used for system purposes such
     * as matching. If a suitable internal key is not available, a UUID may be
     * used.
     */
    UniqueIdentifier getID();
}
