package au.gov.nehta.model.clinical.common.address;

import java.util.StringJoiner;

public enum AustralianAddressLevelType {

    Undefined(null, null),
            
    Basement("B", "Basement"),

    Floor("FL", "Floor"),

    Ground("G", "Ground"),

    Level("L", "Level"),

    LowerGround("G", "LowerGround"),

    Mezzanine("M", "Mezzanine"),

    UpperGround("UG", "UpperGround");

    private String code;
    private String name;

    AustralianAddressLevelType(String code, String name) {
        this.code = code;
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public String getName() {
        return name;
    }

    @Override
    public String toString() {
        return new StringJoiner(", ", AustralianAddressLevelType.class.getSimpleName() + "[", "")
                .add("code='" + code + "'")
                .add("name='" + name + "'")
                .toString();
    }
}
