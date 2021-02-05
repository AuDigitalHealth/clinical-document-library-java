package au.gov.nehta.model.cda.common.code;

public class SourceOfDeathNotificationCode extends CodeImpl implements Code {

    /*
     * 10.5 AS 5017-2006:
     */

    public static final String CODE_SYSTEM_NAME = "AS 5017-2006 Health Care Client Source of Death Notification";
    public static final String CODE_SYSTEM = "2.16.840.1.113883.13.64";

    public static final SourceOfDeathNotificationCode OFFICIAL_DEATH_CERTIFICATE_OR_DEATH_REGISTER = new SourceOfDeathNotificationCode(SourceOfDeathNotification.OFFICIAL_DEATH_CERTIFICATE_OR_DEATH_REGISTER);
    public static final SourceOfDeathNotificationCode HEALTH_CARE_PROVIDER = new SourceOfDeathNotificationCode(SourceOfDeathNotification.HEALTH_CARE_PROVIDER);
    public static final SourceOfDeathNotificationCode RELATIVE = new SourceOfDeathNotificationCode(SourceOfDeathNotification.RELATIVE);
    public static final SourceOfDeathNotificationCode OTHER = new SourceOfDeathNotificationCode(SourceOfDeathNotification.OTHER);
    public static final SourceOfDeathNotificationCode UNKNOWN = new SourceOfDeathNotificationCode(SourceOfDeathNotification.UNKNOWN);

    public SourceOfDeathNotificationCode(SourceOfDeathNotification code) {
        setCodeSystem(CODE_SYSTEM);
        setCodeSystemName(CODE_SYSTEM_NAME);
        setCode(code.getCode());
        setDisplayName(code.getDisplayName());
    }

    public enum SourceOfDeathNotification {

        /* 10.5 AS 5017-2006:*/

        OFFICIAL_DEATH_CERTIFICATE_OR_DEATH_REGISTER("Official death certificate or death register", "D"),
        HEALTH_CARE_PROVIDER("Health Care Provider", "H"),
        RELATIVE("Relative", "R"),
        OTHER("Other", "O"),
        UNKNOWN("Unknown", "U");

        String displayName;
        String code;

        SourceOfDeathNotification(String displayName, String code) {
            this.displayName = displayName;
            this.code = code;
        }

        /**
         * @return the displayName
         */
        public String getDisplayName() {
            return displayName;
        }

        /**
         * @return the code
         */
        public String getCode() {
            return code;
        }
    }
}
