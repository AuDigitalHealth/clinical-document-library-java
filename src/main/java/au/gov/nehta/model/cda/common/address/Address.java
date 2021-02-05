package au.gov.nehta.model.cda.common.address;

import au.gov.nehta.model.clinical.common.address.AddressAbsentIndicator;
import au.gov.nehta.model.clinical.common.participation.AustralianAddress;
import au.gov.nehta.model.clinical.common.participation.InternationalAddress;

public interface Address extends AustralianAddress, InternationalAddress {

    AddressAbsentIndicator getAddressAbsentIndicator();

    AustralianAddress getAustralianAddress();

    InternationalAddress getInternationalAddress();
}
