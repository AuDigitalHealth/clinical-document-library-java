package au.gov.nehta.model.clinical.common.address;

import au.gov.nehta.model.clinical.common.participation.AddressPurpose;

import java.util.ArrayList;
import java.util.List;
import java.util.StringJoiner;

public class InternationalAddress {

    private List<String> addressLines = new ArrayList<>(3);
    private String stateProvince;
    private String postcode;
    private String country;
    private String city;
    private AddressAbsentIndicator addressAbsentIndicator;
    private AddressPurpose addressPurpose;

    public void setAddressAbsentIndicator(AddressAbsentIndicator addressAbsentIndicator) {
        this.addressAbsentIndicator = addressAbsentIndicator;
    }

    public void setAddressPurpose(AddressPurpose addressPurpose) {
        this.addressPurpose = addressPurpose;
    }

    public List<String> getAddressLines() {
        return addressLines;
    }

    public void setAddressLines(List<String> addressLines) {
        this.addressLines = addressLines;
    }

    public String getStateProvince() {
        return stateProvince;
    }

    public void setStateProvince(String stateProvince) {
        this.stateProvince = stateProvince;
    }

    public String getPostcode() {
        return postcode;
    }

    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    @Override
    public String toString() {
        return new StringJoiner(", ", InternationalAddress.class.getSimpleName() + "[", "]")
                .add("addressLines=" + addressLines)
                .add("stateProvince='" + stateProvince + "'")
                .add("postcode='" + postcode + "'")
                .add("country='" + country + "'")
                .add("city='" + city + "'")
                .toString();
    }
}
