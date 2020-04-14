package au.gov.nehta.model.cda.common.address;

import au.gov.nehta.model.clinical.common.participation.Address;

public class PostalAddressImpl implements PostalAddress {

	private PostalAddressUseEnum use;
    private Address address;
	public PostalAddressImpl(Address address, PostalAddressUseEnum use ){
	    this.address=address;
	    this.use=use;
	}
	
    /**
     * @return the use
     */
    public PostalAddressUseEnum getUse() {
        return use;
    }
    /**
     * @return the address
     */
    public Address getAddress() {
        return address;
    }
    /**
     * @param use the use to set
     */
    public void setUse( PostalAddressUseEnum use ) {
        this.use = use;
    }
    /**
     * @param address the address to set
     */
    public void setAddress( Address address ) {
        this.address = address;
    }
}
