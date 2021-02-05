package au.gov.nehta.model.clinical.common.address;

/**
 * Address  - Unit type codes
 */
public enum UnitType {

    Undefined(null, null), // TODO - confirm code and name

    /**
     * Antenna
     */
    ANT("Ant", "Antenna"),

    /**
     * Apartment
     */
    APT("Apt", "Apartment"),

    /**
     * Automated Teller Machine
     */
    ATM("Atm", "Automated Teller Machine"),

    /**
     * Barbeque
     */
    BBQ("Bbq", "Barbeque"),

    /**
     * Boatshed
     */
    BTSD("Btsd", "Boatshed"),

    /**
     * Building
     */
    BLDG("Bldg", "Building"),

    /**
     * Bungalow
     */
    BNGW("Bngw", "Bungalow"),

    /**
     * Cage
     */
    CAGE("Cage", "Cage"),

    /**
     * Carpark
     */
    CARP("Carp", "Carpark"),

    /**
     * Carspace
     */
    CARS("Cars", "Carspace"),

    /**
     * Club
     */
    CLUB("Club", "Club"),

    /**
     * Coolroom
     */
    COOL("Cool", "Coolroom"),

    /**
     * Cottage
     */
    CTGE("Ctge", "Cottage"),

    /**
     * Duplex
     */
    DUP("Dup", "Duplex"),

    /**
     * Factory
     */
    FY("Fy", "Factory"),

    /**
     * Flat
     */
    F("F", "Flat"),

    /**
     * Garage
     */
    GRGE("GRGE", "Garage"),

    /**
     * Hall
     */
    HALL("Hall", "Hall"),

    /**
     * House
     */
    HSE("Hse", "House"),

    /**
     * Kiosk
     */
    KSK("Ksk", "Kiosk"),

    /**
     * Lease
     */
    LSE("Lse", "Lease"),

    /**
     * Lobby
     */
    LBBY("Lbby", "Lobby"),

    /**
     * Loft
     */
    LOFT("Loft", "Loft"),

    /**
     * Lot
     */
    LOT("Lot", "Lot"),

    /**
     * Maisonette
     */
    MSNT("Msnt", "Maisonette"),

    /**
     * Marine berth
     */
    MB("Mb", "Marine berth"),

    /**
     * Office
     */
    OFF("Off", "Office"),

    /**
     * Penthouse
     */
    PTHS("Pths", "Penthouse"),

    /**
     * Reserve
     */
    RESV("Resv", "Reserve"),

    /**
     * Room
     */
    RM("Rm", "Room"),

    /**
     * Shed
     */
    SHED("Shed", "Shed"),

    /**
     * Shop
     */
    SHOP("Shop", "Shop"),

    /**
     * Sign
     */
    SIGN("Sign", "Sign"),

    /**
     * Site
     */
    SITE("Site", "Site"),

    /**
     * Stall
     */
    SL("Sl", "Stall"),

    /**
     * Store
     */
    STOR("Stor", "Store"),

    /**
     * Strata Unit
     */
    STR("Str", "Strata Unit"),

    /**
     * Studio
     */
    STU("Stu", "Studio"),

    /**
     * Substation
     */
    SUBS("Subs", "Substation"),

    /**
     * Suite
     */
    SE("Se", "Suite"),

    /**
     * Tenancy
     */
    TNCY("Tncy", "Tenancy"),

    /**
     * Tower
     */
    TWR("Twr", "Tower"),

    /**
     * Townhouse
     */
    TNHS("Tnhs", "Townhouse"),

    /**
     * Unit
     */
    U("U", "Unit"),

    /**
     * Villa
     */
    VLLA("Villa", "Villa"),

    /**
     * Ward
     */
    WARD("Ward", "Ward"),

    /**
     * Warehouse
     */
    WE("We", "Warehouse"),

    /**
     * Workshop
     */
    WKSH("Wksh", "Workshop");

    String code;
    String name;

    UnitType(String code, String name) {
        this.code = code;
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public String getName() {
        return name;
    }

    public String value() {
        return name();
    }

    public static UnitType fromValue(String v) {
        return valueOf(v);
    }
}