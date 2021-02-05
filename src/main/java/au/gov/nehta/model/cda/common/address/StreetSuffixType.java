package au.gov.nehta.model.cda.common.address;


public enum StreetSuffixType {

    /**
     * Central
     */
    CN,

    /**
     * East
     */
    E,

    /**
     * Extension
     */
    EX,

    /**
     * Lower
     */
    LR,

    /**
     * North
     */
    N,

    /**
     * North East
     */
    NE,

    /**
     * North West
     */
    NW,

    /**
     * South
     */
    S,

    /**
     * South East
     */
    SE,

    /**
     * South West
     */
    SW,

    /**
     * Upper
     */
    UP,

    /**
     * West
     */
    W;

    public String value() {
        return name();
    }

    public static StreetSuffixType fromValue(String v) {
        return valueOf(v);
    }
}
