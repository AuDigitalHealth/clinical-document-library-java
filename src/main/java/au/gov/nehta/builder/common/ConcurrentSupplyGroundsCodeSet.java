package au.gov.nehta.builder.common;

import au.gov.nehta.builder.util.CDATypeUtil;
import au.gov.nehta.model.clinical.etp.eprescription.GroundsForConcurrentSupply;
import au.net.electronichealth.ns.cda._2_0.CD;

public class ConcurrentSupplyGroundsCodeSet {
	private static final String NCTIS_CONCURRENT_SUPPLY_GROUNDS_VALUES_CODE_SYSTEM = "1.2.36.1.2001.1001.101.104.16085";
	private static final String NCTIS_CONCURRENT_SUPPLY_GROUNDS_VALUES_CODE_SYSTEM_NAME = "NCTIS Concurrent Supply Grounds Values";

	private static final String PURSUANT_TO_REGULATION_24_DISPLAY_NAME = "Pursuant to Regulation 24";
	private static final String PURSUANT_TO_REGULATION_24_CODE = "1";
	public static final CD PURSUANT_TO_REGULATION_24 = new CD();

	private static final String HARDSHIP_CONDITIONS_APPLY_DISPLAY_NAME = "Hardship Conditions Apply";
	private static final String HARDSHIP_CONDITIONS_APPLY_CODE = "2";
	public static final CD HARDSHIP_CONDITIONS_APPLY = new CD();

	private static final String NO_GROUNDS_DISPLAY_NAME = "No Grounds";
	private static final String NO_GROUNDS_CODE = "9";
	public static final CD NO_GROUNDS = new CD();

	static {
		PURSUANT_TO_REGULATION_24.setDisplayName( PURSUANT_TO_REGULATION_24_DISPLAY_NAME );
		PURSUANT_TO_REGULATION_24.setCode( PURSUANT_TO_REGULATION_24_CODE );
		PURSUANT_TO_REGULATION_24.setCodeSystemName( NCTIS_CONCURRENT_SUPPLY_GROUNDS_VALUES_CODE_SYSTEM_NAME );
		PURSUANT_TO_REGULATION_24.setCodeSystem( NCTIS_CONCURRENT_SUPPLY_GROUNDS_VALUES_CODE_SYSTEM );
        PURSUANT_TO_REGULATION_24.setOriginalText( CDATypeUtil.getED(PURSUANT_TO_REGULATION_24_DISPLAY_NAME)  );

		HARDSHIP_CONDITIONS_APPLY.setDisplayName( HARDSHIP_CONDITIONS_APPLY_DISPLAY_NAME );
		HARDSHIP_CONDITIONS_APPLY.setCode( HARDSHIP_CONDITIONS_APPLY_CODE );
		HARDSHIP_CONDITIONS_APPLY.setCodeSystemName( NCTIS_CONCURRENT_SUPPLY_GROUNDS_VALUES_CODE_SYSTEM_NAME );
		HARDSHIP_CONDITIONS_APPLY.setCodeSystem( NCTIS_CONCURRENT_SUPPLY_GROUNDS_VALUES_CODE_SYSTEM );
		HARDSHIP_CONDITIONS_APPLY.setOriginalText( CDATypeUtil.getED(HARDSHIP_CONDITIONS_APPLY_DISPLAY_NAME)  );
		
		NO_GROUNDS.setDisplayName( NO_GROUNDS_DISPLAY_NAME );
		NO_GROUNDS.setCode( NO_GROUNDS_CODE );
		NO_GROUNDS.setCodeSystemName( NCTIS_CONCURRENT_SUPPLY_GROUNDS_VALUES_CODE_SYSTEM_NAME );
		NO_GROUNDS.setCodeSystem( NCTIS_CONCURRENT_SUPPLY_GROUNDS_VALUES_CODE_SYSTEM );
		NO_GROUNDS.setOriginalText( CDATypeUtil.getED(NO_GROUNDS_DISPLAY_NAME)  );
	}

	public static CD convert( GroundsForConcurrentSupply clinicalGroundsForConcurrentSupply ) {
		CD groundsForCurrentSupply = null;
		if(clinicalGroundsForConcurrentSupply == null) return null;
		
		switch (clinicalGroundsForConcurrentSupply) {
		case PURSUANT_TO_REGULATION_24: {
			groundsForCurrentSupply = ConcurrentSupplyGroundsCodeSet.PURSUANT_TO_REGULATION_24;
			break;
		}
		case HARDSHIP_CONDITIONS_APPLY: {
			groundsForCurrentSupply = ConcurrentSupplyGroundsCodeSet.HARDSHIP_CONDITIONS_APPLY;
			break;
		}
		case NO_GROUNDS: {
			groundsForCurrentSupply = ConcurrentSupplyGroundsCodeSet.NO_GROUNDS;
			break;
		}
		}

		return groundsForCurrentSupply;
	}

}
