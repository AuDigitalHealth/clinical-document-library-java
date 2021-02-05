package au.gov.nehta.model.cda.common.address;

public enum PostalAddressUseEnum {
    WORKPLACE("WP", "Work Place"),
    POSTAL_ADDRESS("PST", "Postal Address"),
    TEMPORARY_ADDRESS("TMP", "Temporary Address"),
    HOME_ADDRESS("H", "Home Address");

    private String code;
    private String descriptor;

    PostalAddressUseEnum(String code, String descriptor) {
        this.code = code;
        this.descriptor = descriptor;
    }

    public String getCode() {
        return this.code;
    }

    public String getDescriptor() {
        return descriptor;
    }
}
