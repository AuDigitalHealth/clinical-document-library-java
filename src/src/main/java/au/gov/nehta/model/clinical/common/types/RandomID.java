package au.gov.nehta.model.clinical.common.types;

/**
 * created for the common case where A Unique UUID is used
 * - usually random.
 * 
 *   The purpose of this class is to be extended by more complex objects
 *   that require a UUID
 *   
 *   This implementation will have a random UUID by default that 
	can be explicitly set if need be.
 *
 */
public class RandomID implements Identifiable {

	private UniqueIdentifier id = UniqueIdentifierImpl.random();
	

	/**
	 * Set the Identifier making it non-random
	 */
	@Override
	public void setID(UniqueIdentifier id) {
		this.id =id;
	}

	
	/**
	 * get the Identifier
	 * <p>
	 * <strong>This will be a random UUID unless explicitly set</strong>
	 * </p>
	 * 
	 * UUID This is a technical identifier that is used for system purposes such
	 * as matching. If a suitable internal key is not available, a UUID MAY be
	 * used.
	 */
	@Override
	public UniqueIdentifier getID() {
		return id;
	}

}
