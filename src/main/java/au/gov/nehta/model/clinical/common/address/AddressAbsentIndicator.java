package au.gov.nehta.model.clinical.common.address;

public enum AddressAbsentIndicator {

    Masked("MSK"),

    NoFixedAddressIndicator("NA"),

    NotKnown("UNK"),

    NotIndicated("NI");

    private String code;

    AddressAbsentIndicator(String code) {
        this.code = code;
    }

    public String getCode() {
        return code;
    }

    public String value() {
        return name();
    }

    public static AddressAbsentIndicator fromValue(String v) {
        return valueOf(v);
    }
}
