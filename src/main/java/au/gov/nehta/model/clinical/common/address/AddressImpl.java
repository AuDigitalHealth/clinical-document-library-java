package au.gov.nehta.model.clinical.common.address;

import au.gov.nehta.model.clinical.common.participation.AddressPurpose;

public class AddressImpl implements Address {

  private AustralianAddress australianAddress;

  private InternationalAddress internationalAddress;

  private AddressAbsentIndicator addressAbsentIndicator;

  @Override
  public AddressAbsentIndicator getAddressAbsentIndicator() {
    return addressAbsentIndicator;
  }

  @Override
  public void setAddressAbsentIndicator(
      AddressAbsentIndicator addressAbsentIndicator) {
    this.addressAbsentIndicator = addressAbsentIndicator;
  }

  @Override
  public AddressPurpose getAddressPurpose() {
    return null;
  }

  @Override
  public AustralianAddress getAustralianAddress() {
    return australianAddress;
  }

  @Override
  public void setAustralianAddress(
      AustralianAddress australianAddress) {
    this.australianAddress = australianAddress;
  }

  @Override
  public InternationalAddress getInternationalAddress() {
    return internationalAddress;
  }

  @Override
  public void setInternationalAddress(
      InternationalAddress internationalAddress) {
    this.internationalAddress = internationalAddress;
  }

}
