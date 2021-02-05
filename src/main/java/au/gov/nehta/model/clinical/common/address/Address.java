package au.gov.nehta.model.clinical.common.address;

import au.gov.nehta.model.clinical.common.participation.AddressPurpose;

public interface Address {

    AustralianAddress getAustralianAddress();

    void setAustralianAddress(AustralianAddress australianAddress);

    InternationalAddress getInternationalAddress();

    void setInternationalAddress(InternationalAddress internationalAddress);

    AddressAbsentIndicator getAddressAbsentIndicator();

    void setAddressAbsentIndicator(AddressAbsentIndicator addressAbsentIndicator);

    AddressPurpose getAddressPurpose();
}
