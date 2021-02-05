package au.gov.nehta.builder.common;

import au.gov.nehta.model.clinical.etp.dispenserecord.ClaimTypeCategory;
import au.net.electronichealth.ns.cda._2_0.CD;

public class ClaimCategoryTypeCodeSet {
    private static final String CLAIM_CATEGORY_TYPE_VALUES_CODE_SYSTEM = "1.2.36.1.2001.1001.101.104.16060";
    private static final String CLAIM_CATEGORY_TYPE_VALUES_CODE_SYSTEM_NAME = "Claim Category Type Values";

    private static final String GENERAL_BENEFIT_DISPLAY_NAME = "G - General Benefit";
    private static final String GENERAL_BENEFIT_CODE = "1";
    public static final CD GENERAL_BENEFIT = new CD();

    private static final String CONCESSIONAL_OR_SAFETY_NET_CONCESSION_BENEFIT_DISPLAY_NAME = "C - Concessional or Safety Net Concession Benefit";
    private static final String CONCESSIONAL_OR_SAFETY_NET_CONCESSION_BENEFIT_CODE = "2";
    public static final CD CONCESSIONAL_OR_SAFETY_NET_CONCESSION_BENEFIT = new CD();

    private static final String SAFETY_NET_ENTITLEMENT_CARD_BENEFIT_DISPLAY_NAME = "E - Safety Net ParticipantEntitlement Card Benefit";
    private static final String SAFETY_NET_ENTITLEMENT_CARD_BENEFIT_CODE = "3";
    public static final CD SAFETY_NET_ENTITLEMENT_CARD_BENEFIT = new CD();

    private static final String RPBS_BENEFIT_DISPLAY_NAME = "R - RPBS Benefit";
    private static final String RPBS_BENEFIT_CODE = "4";
    public static final CD RPBS_BENEFIT = new CD();

    private static final String CTG_BENEFIT_DISPLAY_NAME = "CTG - Closing the Gap Benefit";
    private static final String CTG_BENEFIT_CODE = "5";
    public static final CD CTG_BENEFIT = new CD();

    private static final String NO_BENEFIT_DISPLAY_NAME = "No benefit - This item is not covered by any Medi- care registered benefit";
    private static final String NO_BENEFIT_CODE = "9";
    public static final CD NO_BENEFIT = new CD();

    static {
        GENERAL_BENEFIT.setDisplayName( GENERAL_BENEFIT_DISPLAY_NAME );
        GENERAL_BENEFIT.setCode( GENERAL_BENEFIT_CODE );
        GENERAL_BENEFIT.setCodeSystemName( CLAIM_CATEGORY_TYPE_VALUES_CODE_SYSTEM_NAME );
        GENERAL_BENEFIT.setCodeSystem( CLAIM_CATEGORY_TYPE_VALUES_CODE_SYSTEM );

        CONCESSIONAL_OR_SAFETY_NET_CONCESSION_BENEFIT.setDisplayName( CONCESSIONAL_OR_SAFETY_NET_CONCESSION_BENEFIT_DISPLAY_NAME );
        CONCESSIONAL_OR_SAFETY_NET_CONCESSION_BENEFIT.setCode( CONCESSIONAL_OR_SAFETY_NET_CONCESSION_BENEFIT_CODE );
        CONCESSIONAL_OR_SAFETY_NET_CONCESSION_BENEFIT.setCodeSystemName( CLAIM_CATEGORY_TYPE_VALUES_CODE_SYSTEM_NAME );
        CONCESSIONAL_OR_SAFETY_NET_CONCESSION_BENEFIT.setCodeSystem( CLAIM_CATEGORY_TYPE_VALUES_CODE_SYSTEM );

        SAFETY_NET_ENTITLEMENT_CARD_BENEFIT.setDisplayName( SAFETY_NET_ENTITLEMENT_CARD_BENEFIT_DISPLAY_NAME );
        SAFETY_NET_ENTITLEMENT_CARD_BENEFIT.setCode( SAFETY_NET_ENTITLEMENT_CARD_BENEFIT_CODE );
        SAFETY_NET_ENTITLEMENT_CARD_BENEFIT.setCodeSystemName( CLAIM_CATEGORY_TYPE_VALUES_CODE_SYSTEM_NAME );
        SAFETY_NET_ENTITLEMENT_CARD_BENEFIT.setCodeSystem( CLAIM_CATEGORY_TYPE_VALUES_CODE_SYSTEM );

        RPBS_BENEFIT.setDisplayName( RPBS_BENEFIT_DISPLAY_NAME );
        RPBS_BENEFIT.setCode( RPBS_BENEFIT_CODE );
        RPBS_BENEFIT.setCodeSystemName( CLAIM_CATEGORY_TYPE_VALUES_CODE_SYSTEM_NAME );
        RPBS_BENEFIT.setCodeSystem( CLAIM_CATEGORY_TYPE_VALUES_CODE_SYSTEM );

        CTG_BENEFIT.setDisplayName( CTG_BENEFIT_DISPLAY_NAME );
        CTG_BENEFIT.setCode( CTG_BENEFIT_CODE );
        CTG_BENEFIT.setCodeSystemName( CLAIM_CATEGORY_TYPE_VALUES_CODE_SYSTEM_NAME );
        CTG_BENEFIT.setCodeSystem( CLAIM_CATEGORY_TYPE_VALUES_CODE_SYSTEM );

        NO_BENEFIT.setDisplayName( NO_BENEFIT_DISPLAY_NAME );
        NO_BENEFIT.setCode( NO_BENEFIT_CODE );
        NO_BENEFIT.setCodeSystemName( CLAIM_CATEGORY_TYPE_VALUES_CODE_SYSTEM_NAME );
        NO_BENEFIT.setCodeSystem( CLAIM_CATEGORY_TYPE_VALUES_CODE_SYSTEM );
    }

    public static CD convert( ClaimTypeCategory claimCategoryType ) {
        CD result = null;
        switch (claimCategoryType) {
            case GENERAL_BENEFIT: {
                result = ClaimCategoryTypeCodeSet.GENERAL_BENEFIT;
                break;
            }
            case CONCESSIONAL_OR_SAFETY_NET_CONCESSION_BENEFIT: {
                result = ClaimCategoryTypeCodeSet.CONCESSIONAL_OR_SAFETY_NET_CONCESSION_BENEFIT;
                break;
            }
            case SAFETY_NET_ENTITLEMENT_CARD_BENEFIT: {
                result = ClaimCategoryTypeCodeSet.SAFETY_NET_ENTITLEMENT_CARD_BENEFIT;
                break;
            }
            case RPBS_BENEFIT: {
                result = ClaimCategoryTypeCodeSet.RPBS_BENEFIT;
                break;
            }
            case CLOSING_THE_GAP_BENEFIT: {
                result = ClaimCategoryTypeCodeSet.CTG_BENEFIT;
                break;
            }
            case NO_BENEFIT: {
                result = ClaimCategoryTypeCodeSet.NO_BENEFIT;
                break;
            }
        }

        return result;
    }
}
