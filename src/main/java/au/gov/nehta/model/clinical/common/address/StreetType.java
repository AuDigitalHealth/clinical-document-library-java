package au.gov.nehta.model.clinical.common.address;

import java.util.StringJoiner;

public enum StreetType {
    Undefined(null, null),

    Access("Accs", "Access"),

    Alley("Ally", "Alley"),

    Alleyway("Alwy", "Alleyway"),

    Amble("Ambl", "Amble"),

    Anchorage("Ancg", "Anchorage"),

    Approach("App", "Approach"),

    Arcade("Arc", "Arcade"),

    Artery("Art", "Artery"),

    Avenue("Ave", "Avenue"),

    Basin("Basn", "Basin"),

    Beach("Bch", "Beach"),

    Bend("Bend", "Bend"),

    Block("Blk", "Block"),

    Boulevard("Bvd", "Boulevard"),

    Brace("Brce", "Brace"),

    Brae("Brae", "Brae"),

    Break("Brk", "Break"),

    Bridge("Bdge", "Bridge"),

    Broadway("Bdwy", "Broadway"),

    Brow("Brow", "Brow"),

    Bypass("Bypa", "Bypass"),

    Byway("Bywy", "Byway"),

    Causeway("Caus", "Causeway"),

    Centre("Ctr", "Centre"),

    Centreway("Cnwy", "Centreway"),

    Chase("Ch", "Chase"),

    Circle("Cir", "Circle"),

    Circlet("Clt", "Circlet"),

    Circuit("Cct", "Circuit"),

    Circus("Crcs", "Circus"),

    Close("Cl", "Close"),

    Colonnade("Clde", "Colonnade"),

    Common("Cmmn", "Common"),

    Concourse("Con", "Concourse"),

    Copse("Cps", "Copse"),
    /// Corner
    /// The code "Crn" is specified in the Australian Standards document.  However, most of the other street type codes come
    /// from the Australia Post site and this is the only value that is different. The code for Corner from Australia Post is
    /// "Cnr"
    Corner("Crn", "Corner"),

    Corso("Cso", "Corso"),

    Court("Ct", "Court"),

    Courtyard("Ctyd", "Courtyard"),

    Cove("Cove", "Cove"),

    Crescent("Cres", "Crescent"),

    Crest("Crst", "Crest"),

    Cross("Crss", "Cross"),

    Crossing("Crsg", "Crossing"),

    Crossroad("Crd", "Crossroad"),

    Crossway("Cowy", "Crossway"),

    Cruiseway("Cuwy", "Cruiseway"),

    CulDeSac("Cds", "Cul-De-Sac"),

    Cutting("Cttg", "Cutting"),

    Dale("Dale", "Dale"),

    Dell("Dell", "Dell"),

    Deviation("Devn", "Deviation"),

    Dip("Dip", "Dip"),

    Distributor("Dstr", "Distributor"),

    Drive("Dr", "Drive"),


    Driveway("Drwy", "Driveway"),

    Edge("Edge", "Edge"),

    Elbow("Elb", "Elbow"),

    End("End", "End"),

    Entrance("Ent", "Entrance"),

    Esplanade("Esp", "Esplanade"),

    Estate("Est", "Estate"),

    Expressway("Exp", "Expressway"),

    Extension("Extn", "Extension"),

    Fairway("Fawy", "Fairway"),

    FireTrack("Ftrk", "Fire Track"),

    Firetrail("Fitr", "Firetrail"),

    Flat("Flat", "Flat"),

    Follow("Folw", "Follow"),

    Footway("Ftwy", "Footway"),

    Foreshore("Fshr", "Foreshore"),

    Formation("Form", "Formation"),

    Freeway("Fwy", "Freeway"),

    Front("Frnt", "Front"),

    Frontage("Frtg", "Frontage"),

    Gap("Gap", "Gap"),

    Garden("Gdn", "Garden"),

    Gardens("Gdns", "Gardens"),

    Gate("Gte", "Gate"),

    Gates("Gtes", "Gates"),

    Glade("Gld", "Glade"),

    Glen("Glen", "Glen"),

    Grange("Gra", "Grange"),

    Green("Grn", "Green"),

    Ground("Grnd", "Ground"),

    Grove("Gr", "Grove"),

    Gully("Gly", "Gully"),

    Heights("Hts", "Heights"),

    Highroad("Hrd", "Highroad"),

    Highway("Hwy", "Highway"),

    Hill("Hill", "Hill"),

    Interchange("Intg", "Interchange"),

    Intersection("Intn", "Intersection"),

    Junction("Jnc", "Junction"),

    Key("Key", "Key"),

    Landing("Ldg", "Landing"),

    Lane("Lane", "Lane"),

    Laneway("Lnwy", "Laneway"),

    Lees("Lees", "Lees"),

    Line("Line", "Line"),

    Link("Link", "Link"),

    Little("Lt", "Little"),

    Lookout("Lkt", "Lookout"),

    Loop("Loop", "Loop"),

    Lower("Lwr", "Lower"),

    Mall("Mall", "Mall"),

    Meander("Mndr", "Meander"),

    Mew("Mew", "Mew"),

    Mews("Mews", "Mews"),

    Motorway("Mwy", "Motorway"),

    Mount("Mt", "Mount"),

    Nook("Nook", "Nook"),

    Outlook("Otlk", "Outlook"),

    Parade("Pde", "Parade"),

    Park("Park", "Park"),

    Parklands("Pkld", "Parklands"),

    Parkway("Pkwy", "Parkway"),

    Part("Part", "Part"),

    Pass("Pass", "Pass"),

    Path("Path", "Path"),

    Pathway("Phwy", "Pathway"),

    Piazza("Piaz", "Piazza"),

    Place("Pl", "Place"),

    Plateau("Plat", "Plateau"),

    Plaza("Plza", "Plaza"),

    Pocket("Pkt", "Pocket"),

    Point("Pnt", "Point"),

    Port("Port", "Port"),

    Promenade("Prom", "Promenade"),

    Quad("Quad", "Quad"),

    Quadrangle("Qdgl", "Quadrangle"),

    Quadrant("Qdrt", "Quadrant"),

    Quay("Qy", "Quay"),

    Quays("Qys", "Quays"),

    Ramble("Rmbl", "Ramble"),

    Ramp("Ramp", "Ramp"),

    Range("Rnge", "Range"),

    Reach("Rch", "Reach"),

    Reserve("Res", "Reserve"),

    Rest("Rest", "Rest"),

    Retreat("Rtt", "Retreat"),

    Ride("Ride", "Ride"),

    Ridge("Rdge", "Ridge"),

    Ridgeway("Rgwy", "Ridgeway"),

    RightOfWay("Rowy", "Right Of Way"),

    Ring("Ring", "Ring"),

    Rise("Rise", "Rise"),

    River("Rvr", "River"),

    Riverway("Rvwy", "Riverway"),

    Riviera("Rvra", "Riviera"),

    Road("Rd", "Road"),

    Roads("Rds", "Roads"),

    Roadside("Rdsd", "Roadside"),

    Roadway("Rdwy", "Roadway"),

    Ronde("Rnde", "Ronde"),

    Rosebowl("Rsbl", "Rosebowl"),

    Rotary("Rty", "Rotary"),

    Round("Rnd", "Round"),

    Route("Rte", "Route"),

    Row("Row", "Row"),

    Rue("Rue", "Rue"),

    Run("Run", "Run"),

    ServiceWay("Swy", "Service Way"),

    Siding("Sdng", "Siding"),

    Slope("Slpe", "Slope"),

    Sound("Snd", "Sound"),

    Spur("Spur", "Spur"),

    Square("Sq", "Square"),

    Stairs("Strs", "Stairs"),

    StateHighway("Shwy", "State Highway"),

    Steps("Stps", "Steps"),

    Strand("Stra", "Strand"),

    Street("St", "Street"),

    Strip("Strp", "Strip"),

    Subway("Sbwy", "Subway"),

    Tarn("Tarn", "Tarn"),

    Terrace("Tce", "Terrace"),

    Thoroughfare("Thor", "Thoroughfare"),

    Tollway("Tlwy", "Tollway"),

    Top("Top", "Top"),

    Tor("Tor", "Tor"),

    Towers("Twrs", "Towers"),

    Track("Trk", "Track"),

    Trail("Trl", "Trail"),

    Trailer("Trlr", "Trailer"),

    Triangle("Tri", "Triangle"),

    Trunkway("Tkwy", "Trunkway"),

    Turn("Turn", "Turn"),

    Underpass("Upas", "Underpass"),

    Upper("Upr", "Upper"),

    Vale("Vale", "Vale"),

    Viaduct("Vdct", "Viaduct"),

    View("View", "View"),

    Villas("Vlls", "Villas"),

    Vista("Vsta", "Vista"),

    Wade("Wade", "Wade"),

    Walk("Walk", "Walk"),

    Walkway("Wkwy", "Walkway"),

    Way("Way", "Way"),

    Wharf("Whrf", "Wharf"),

    Wynd("Wynd", "Wynd"),

    Yard("Yard", "Yard");

    private String code;
    private String name;

    StreetType(String code, String name) {
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
