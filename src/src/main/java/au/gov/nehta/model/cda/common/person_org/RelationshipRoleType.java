package au.gov.nehta.model.cda.common.person_org;

import java.util.StringJoiner;

public enum RelationshipRoleType {


    Aunt("AUNT", "Aunt"),

    Brother("BRO", "Brother"),

    BrotherInLaw("BROINLAW", "Brother-In-Law"),

    AdoptedChild("CHLDADOPT", "Adopted Child"),

    FosterChild("CHLDFOST", "Foster Child"),

    ChildInLaw("CHLDINLAW", "Child In-Law"),

    Cousin("COUSN", "Cousin"),

    NaturalDaughter("DAU", "Natural Daughter"),

    AdoptedDaughter("DAUADOPT", "Adopted Daughter"),

    Daughter("DAUC", "Daughter"),

    FosterDaughter("DAUFOST", "Foster Daughter"),

    DaughterInLaw("DAUINLAW", "Daughter In-Law"),

    EmergencyContact("ECON", "Emergency Contact"),

    FamilyMember("FAMMEMB", "Family Member"),

    Child("CHILD", "Child"),

    ExtendedFamilyMember("EXT", "Extended Family Member"),

    ImmediateFamily("IMED", "Immediate Family"),

    Parent("PRN", "Parent"),

    Sibling("SIB", "Sibling"),

    SignificantOther("SIGOTHR", "Significant Other"),

    DomesticPartner("DOMPART", "Domestic Partner"),

    Spouse("SPS", "Spouse"),

    UnrelatedFriend("FRND", "Unrelated Friend"),

    Father("FTH", "Father"),

    FatherInLaw("FTHINLAW", "Father-In-Law"),

    GreatGrandfather("GGRFTH", "Great Grandfather"),

    GreatGrandmother("GGRMTH", "Great Grandmother"),

    GreatGrandparent("GGRPRN", "Great Grandparent"),

    Grandfather("GRFTH", "Grandfather"),

    Grandmother("GRMTH", "Grandmother"),

    Grandchild("GRNDCHILD", "Grandchild"),

    Granddaughter("GRNDDAU", "Granddaughter"),

    Grandson("GRNDSON", "Grandson"),

    Grandparent("GRPRN", "Grandparent"),

    Guardian("GUARD", "Guardian"),

    HalfBrother("HBRO", "Half-Brother"),

    HalfSibling("HSIB", "Half-Sibling"),

    HalfSister("HSIS", "Half-Sister"),

    Husband("HUSB", "Husband"),

    Mother("MTH", "Mother"),

    MotherInLaw("MTHINLAW", "Mother-In-Law"),

    Neighbor("NBOR", "Neighbor"),

    NaturalBrother("NBRO", "Natural Brother"),

    NaturalChild("NCHILD", "Natural Child"),

    Nephew("NEPHEW", "Nephew"),

    NaturalFather("NFTH", "Natural Father"),

    NaturalFatherOfFetus("NFTHF", "Natural Father Of Fetus"),

    Niece("NIECE", "Niece"),

    NieceNephew("NIENEPH", "Niece/Nephew"),

    NaturalMother("NMTH", "Natural Mother"),

    NextOfKin("NOK", "Next Of Kin"),

    NaturalParent("NPRN", "Natural Parent"),

    NaturalSibling("NSIB", "Natural Sibling"),

    NaturalSister("NSIS", "Natural Sister"),

    PowerOfAttorney("POWATY", "Power Of Attorney"),

    PowerOfAttorneyPersonal("POWATYPR", "Power Of Attorney-Personal"),

    PowerOfAttorneyProperty("POWATYPT", "Power Of Attorney-Property"),

    ParentInLaw("PRNINLAW", "Parent In-Law"),

    Roomate("ROOM", "Roomate"),

    SiblingInLaw("SIBINLAW", "Sibling In-Law"),

    Sister("SIS", "Sister"),

    SisterInLaw("SISINLAW", "Sister-In-Law"),

    NaturalSon("SON", "Natural Son"),

    AdoptedSon("SONADOPT", "Adopted Son"),

    Son("SONC", "Son"),

    FosterSon("SONFOST", "Foster Son"),

    SonInLaw("SONINLAW", "Son In-Law"),

    Stepbrother("STPBRO", "Stepbrother"),

    StepChild("STPCHLD", "Step Child"),

    Stepdaughter("STPDAU", "Stepdaughter"),

    Stepfather("STPFTH", "Stepfather"),

    Stepmother("STPMTH", "Stepmother"),

    StepParent("STPPRN", "Step Parent"),

    StepSibling("STPSIB", "Step Sibling"),

    Stepsister("STPSIS", "Stepsister"),

    Stepson("STPSON", "Stepson"),

    SubstituteDecisionMaker("SUBDM", "Substitute Decision Maker"),

    Uncle("UNCLE", "Uncle"),

    Wife("WIFE", "Wife");

    private String code;
    private String name;

    RelationshipRoleType(String code, String name) {
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
        return new StringJoiner(", ", RelationshipRoleType.class.getSimpleName() + "[", "]")
                .add("code='" + code + "'")
                .add("name='" + name + "'")
                .toString();
    }
}
