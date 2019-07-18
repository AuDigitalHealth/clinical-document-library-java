package au.gov.nehta.model.clinical.common.address;

import au.gov.nehta.model.clinical.common.participation.AddressPurpose;

public interface BaseAddress {
    AddressAbsentIndicator getAddressAbsentIndicator();

    AddressPurpose getAddressPurpose();
}
