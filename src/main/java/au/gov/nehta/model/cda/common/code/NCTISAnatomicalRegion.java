package au.gov.nehta.model.cda.common.code;


public class NCTISAnatomicalRegion extends NCTISDataComponent {

    private static final String CODE_SYSTEM = "1.2.36.1.2001.1001.101.104.17008";
    private static final String CODE_SYSTEM_NAME = "NCTIS Anatomical Region Values";

    public NCTISAnatomicalRegion(String code, String displayName) {
        super(code, displayName);
        setCodeSystemName(CODE_SYSTEM_NAME);
        setCodeSystem(CODE_SYSTEM);
    }

    public NCTISAnatomicalRegion(Region region) {
        super(region.getCode().getCode(), region.getCode().getDisplayName());
        setCodeSystemName(CODE_SYSTEM_NAME);
        setCodeSystem(CODE_SYSTEM);
    }

    /**
     * some pre-canned regions
     */
    public enum Region {
        HEAD("1", "Head"),
        NECK("2", "Neck"),
        CHEST("3", "Chest"),
        CARDIAC("4", "Cardiac"),
        BREAST("5", "Breast"),
        ABDOMEN("6", "Abdomen"),
        PELVIS("7", "Pelvis"),
        UPPER_LIMB("8", "Upper Limb"),
        LOWER_LIMB("9", "Lower Limb"),
        CERVICAL_SPINE("10", "Cervical Spine"),
        THORACIC_SPINE("11", "Thoracic Spine"),
        LUMBAR_SPINE("12", "Lumbar Spine"),
        WHOLE_BODY("13", "Whole Body"),
        ;

        private NCTISAnatomicalRegion code;

        Region(String code, String displayName) {
            this.code = new NCTISAnatomicalRegion(code, displayName);
        }

        public NCTISAnatomicalRegion getCode() {
            return code;
        }

        public Region fromCode(String code) {
            for (Region value : Region.values()) {
                if (value.getCode().getCode().equals(code)) return value;
            }
            return null;
        }
    }
}
