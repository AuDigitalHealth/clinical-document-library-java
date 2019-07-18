package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.clinical.common.participation.AddressPurpose;
import au.gov.nehta.model.clinical.common.participation.AustralianAddress;

public class ProviderAddressImpl implements ProviderAddress {
	private Boolean noFixedAddressIndicator;
	private AustralianAddress australianAddress;
	private AddressPurpose addressPurpose;

	public ProviderAddressImpl( boolean noFixedAddressIndicator, AustralianAddress australianAddress, AddressPurpose addressPurpose ) {
		ArgumentUtils.checkNotNull( australianAddress, "australianAddress" );
		ArgumentUtils.checkNotNull( addressPurpose, "addressPurpose" );
		this.noFixedAddressIndicator = noFixedAddressIndicator;
		this.australianAddress = australianAddress;
		this.addressPurpose = addressPurpose;
	}

	public Boolean getNoFixedAddressIndicator() {
		return noFixedAddressIndicator;
	}

	public AustralianAddress getAddress() {
		return australianAddress;
	}

	public AddressPurpose getAddressPurpose() {
		return addressPurpose;
	}
}
