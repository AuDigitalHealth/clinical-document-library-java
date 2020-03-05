package au.gov.nehta.model.clinical.common;

import java.util.StringJoiner;

public enum EventTypes {
    UNDEFINED(null, null),//TODO - confirm these details
    EVENT("EVN", "Event"),
    INTENT("INT", "Intent"),
    APPOINTMENT("APT", "Appointment"),
    APPOINTMENT_REQUEST("ARQ", "Appointment Request"),
    PROMISE("PRMS", "PROMISE"),
    PROPOSAL("PRP", "Proposal"),
    REQUEST("RQO", "Request"),
    DEFINITION("DEF", "Definition");

    private String code;
    private String name;

    EventTypes(String code, String name) {
        this.code = code;
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return new StringJoiner(", ", EventTypes.class.getSimpleName() + "[", "]")
                .add("code='" + code + "'")
                .add("name='" + name + "'")
                .toString();
    }
}
