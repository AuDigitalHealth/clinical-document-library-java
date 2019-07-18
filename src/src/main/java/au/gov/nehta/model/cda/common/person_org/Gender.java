package au.gov.nehta.model.cda.common.person_org;

import java.util.StringJoiner;

public enum Gender {

    Undefined(null, null),

    NotStated("N", "Not stated/inadequately described"),

    Male("M", "Male"),

    Female("F", "Female"),

    IntersexOrIndeterminate("I", "Intersex or Indeterminate");

    private String code;
    private String name;

    Gender(String code, String name) {
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
        return new StringJoiner(", ", RelationshipRoleType.class.getSimpleName() + "[", "")
                .add("code='" + code + "'")
                .add("name='" + name + "'")
                .toString();
    }

}
