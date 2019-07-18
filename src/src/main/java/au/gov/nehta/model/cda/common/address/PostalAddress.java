package au.gov.nehta.model.cda.common.address;

import au.gov.nehta.model.clinical.common.participation.Address;

/**
 * The description of a location where an entity is located or can be otherwise
 * reached or found and a description of the purpose for which that address is
 * primarily used by that entity.
 * 
 */
public interface PostalAddress {
	/**
	 * The description of a location where an entity is located or can be
	 * otherwise reached or found and a description of the purpose for which
	 * that address is primarily used by that entity.
	 **/
	public Address getAddress();

	/**
	 * The description of a location where an entity is located or can be
	 * otherwise reached or found and a description of the purpose for which
	 * that address is primarily used by that entity.
	 **/
	public void setAddress(Address address);

	/**
	 * The purpose for which the address is being used by the entity.
	 */
	public PostalAddressUseEnum getUse();

	/**
	 * The purpose for which the address is being used by the entity.
	 */
	public void setUse(PostalAddressUseEnum use);
	
}
