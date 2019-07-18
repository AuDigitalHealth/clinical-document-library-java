package au.gov.nehta.builder.common;

import au.gov.nehta.model.clinical.etp.common.item.MedicalBenefitCategoryType;
import au.net.electronichealth.ns.cda._2_0.CD;

public class MedicalBenefitCategoryTypeCodeSet {
	private static final String NCTIS_MEDICAL_BENEFIT_CATEGORY_TYPE_VALUES_CODE_SYSTEM = "1.2.36.1.2001.1001.101.104.16095";
	private static final String NCTIS_MEDICAL_BENEFIT_CATEGORY_TYPE_VALUES_CODE_SYSTEM_NAME = "NCTIS Medical Benefit Category Type Values";

	private static final String PBS_DISPLAY_NAME = "PBS";
	private static final String PBS_CODE = "1";
	public static final CD PBS = new CD();

	private static final String RPBS_DISPLAY_NAME = "RPBS";
	private static final String RPBS_CODE = "2";
	public static final CD RPBS = new CD();

	private static final String CTG_DISPLAY_NAME = "Hardship Conditions Apply";
	private static final String CTG_CODE = "3";
	public static final CD CTG = new CD();

	private static final String NO_BENEFIT_DISPLAY_NAME = "No Benefit";
	private static final String NO_BENEFIT_CODE = "9";
	public static final CD NO_BENEFIT = new CD();

	static {
		PBS.setDisplayName( PBS_DISPLAY_NAME );
		PBS.setCode( PBS_CODE );
		PBS.setCodeSystemName( NCTIS_MEDICAL_BENEFIT_CATEGORY_TYPE_VALUES_CODE_SYSTEM_NAME );
		PBS.setCodeSystem( NCTIS_MEDICAL_BENEFIT_CATEGORY_TYPE_VALUES_CODE_SYSTEM );

		CTG.setDisplayName( CTG_DISPLAY_NAME );
		CTG.setCode( CTG_CODE );
		CTG.setCodeSystemName( NCTIS_MEDICAL_BENEFIT_CATEGORY_TYPE_VALUES_CODE_SYSTEM_NAME );
		CTG.setCodeSystem( NCTIS_MEDICAL_BENEFIT_CATEGORY_TYPE_VALUES_CODE_SYSTEM );

		RPBS.setDisplayName( RPBS_DISPLAY_NAME );
		RPBS.setCode( RPBS_CODE );
		RPBS.setCodeSystemName( NCTIS_MEDICAL_BENEFIT_CATEGORY_TYPE_VALUES_CODE_SYSTEM_NAME );
		RPBS.setCodeSystem( NCTIS_MEDICAL_BENEFIT_CATEGORY_TYPE_VALUES_CODE_SYSTEM );

		NO_BENEFIT.setDisplayName( NO_BENEFIT_DISPLAY_NAME );
		NO_BENEFIT.setCode( NO_BENEFIT_CODE );
		NO_BENEFIT.setCodeSystemName( NCTIS_MEDICAL_BENEFIT_CATEGORY_TYPE_VALUES_CODE_SYSTEM_NAME );
		NO_BENEFIT.setCodeSystem( NCTIS_MEDICAL_BENEFIT_CATEGORY_TYPE_VALUES_CODE_SYSTEM );
	}

	public static CD convert( MedicalBenefitCategoryType clinicalMedicalBenefitCategoryType ) {
		CD medicalBenefitsCategoryType = null;

		switch (clinicalMedicalBenefitCategoryType) {
		case PBS: {
			medicalBenefitsCategoryType = MedicalBenefitCategoryTypeCodeSet.PBS;
			break;
		}
		case RPBS: {
			medicalBenefitsCategoryType = MedicalBenefitCategoryTypeCodeSet.RPBS;
			break;
		}
		case CTG: {
			medicalBenefitsCategoryType = MedicalBenefitCategoryTypeCodeSet.CTG;
			break;
		}
		case NO_BENEFIT: {
			medicalBenefitsCategoryType = MedicalBenefitCategoryTypeCodeSet.NO_BENEFIT;
			break;
		}
		}

		return medicalBenefitsCategoryType;
	}
}
