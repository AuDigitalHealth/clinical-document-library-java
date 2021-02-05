package au.gov.nehta.model.clinical.common.types;

/**
 * created for the common case where A Unique UUID is used
 * - usually random.
 * <p>
 * The purpose of this class is to be extended by more complex objects
 * that require a UUID
 */
public interface Identifiable {

    /**
     * set the Identifier
     */
    void setID(UniqueIdentifier id);


    /**
     * get the Identifier
     * <p>
     * UUID This is a technical identifier that is used for system purposes such
     * as matching. If a suitable internal key is not available, a UUID MAY be
     * used.
     */
    UniqueIdentifier getID();
}
