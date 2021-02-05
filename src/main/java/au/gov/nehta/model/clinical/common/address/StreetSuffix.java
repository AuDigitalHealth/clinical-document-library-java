package au.gov.nehta.model.clinical.common.address;

import java.util.StringJoiner;

public enum StreetSuffix {

    Undefined(null, null),

    Central("Cn", "Central"),

    East("E", "East"),

    Extension("Ex", "Extension"),

    Lower("Lr", "Lower"),

    North("N", "North"),

    NorthEast("Ne", "North East"),

    NorthWest("Nw", "North West"),

    South("S", "South"),

    SouthEast("Se", "South East"),

    SouthWest("Sw", "South West"),

    Upper("Up", "Upper"),

    West("W", "West");

    private String code;
    private String name;

    StreetSuffix(String code, String name) {
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
        return new StringJoiner(", ", StreetType.class.getSimpleName() + "[", "")
                .add("code='" + code + "'")
                .add("name='" + name + "'")
                .toString();
    }
}
