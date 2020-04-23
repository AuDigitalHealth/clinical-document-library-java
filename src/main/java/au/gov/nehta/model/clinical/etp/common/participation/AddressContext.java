package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.model.clinical.common.participation.Address;
import au.gov.nehta.model.clinical.common.participation.AddressPurpose;

/**
 * Combines an address and the context it's used in. 
 */
public interface AddressContext {
    /** indicates that there is no address */
    Boolean getNoFixedAddressIndicator();
    
    /** An address not restricted to any continent */
    Address getAddress();
    
    /** The purpose of this Address, for example buisness or residential accomodation */
    AddressPurpose getAddressPurpose();
}
