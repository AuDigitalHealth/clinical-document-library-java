package au.gov.nehta.model.cda.common.code;

public class PBSPrescriptionTypeCode extends CodeImpl implements Code {
    
    
    /*
     * from the specification: apendix C18 MEDICARE: PBS PRESCRIPTION TYPE VALUES
     */

    public final static String CODE_SYSTEM_NAME = "Prescription Type Values";
    public final static String CODE_SYSTEM = "1.2.36.1.5001.1.1.3.2.6";
    
    public PBSPrescriptionTypeCode(PBSPrescriptionType code){
        setCodeSystem( CODE_SYSTEM );
        setCodeSystemName( CODE_SYSTEM_NAME );
        setCode( code.getCode() );
        setDisplayName( code.getDisplayName() );
    }
    
       
    public enum PBSPrescriptionType{ 
        
      /*  TABLE C26
        VALUE SET VALUES*/
      
        STANDARD_PRESCRIPTION( "PBS/RPBS Standard Prescription","1"),
        AUTHORITY_PRESCRIPTION ( "BS/RPBS Authority Prescription","2"),
        DENTAL_PRESCRIPTION( "PBS/RPBS Dental Prescription","3"),
        OPTOMETRIST_PRESCRIPTION( "PBS/RPBS Optometrist Prescription","4"),
        OPTOMETRIST_AUTHORITY_PRESCRIPTION( "PBS/RPBS Optometrist Authority Prescription","5"),
        NURSE_PRACTITIONER_AND_MIDWIVES_PRESCRIPTION( "PBS/RPBS Nurse Practitioner and Midwives Prescription","6"),
        NURSE_PRACTITIONER_AND_MIDWIVES_AUTHORITY_PRESCRIPTIO( "PBS/RPBS Standard Prescription","7"),
        PUBLIC_HOSPITAL_PRESCRIPTION( "PBS/RPBS Public Hospital Prescription","8"),
        PUBLIC_HOSPITAL_DENTAL_PRESCRIPTION( "PBS/RPBS Public Hospital Dental Prescription","9"),
        EMERGENCY_TREATMENT_SUPPLY( "PBS/RPBS Emergency Treatment Supply","10"),
        NON_PBS_RPBS_PRESCRIPTION__PRIVATE( "PBS/RPBSNon PBS/RPBS Prescription (Private)","11")
        
        ;
        
        String displayName;
        String code;
        
        PBSPrescriptionType(String displayName, String code){
            this.displayName=displayName;
            this.code=code;
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
