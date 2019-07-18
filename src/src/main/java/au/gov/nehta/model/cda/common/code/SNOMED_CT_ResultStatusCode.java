package au.gov.nehta.model.cda.common.code;


public class SNOMED_CT_ResultStatusCode  extends CodeImpl implements Coded  {
    
    public static final String CODE_SYSTEM = "2.16.840.1.113883.12.123";
    public static final String CODE_SYSTEM_NAME = "HL7 Result Status";
    
    
    public static final SNOMED_CT_ResultStatusCode   CORRECTION_TO_RESULTS = new SNOMED_CT_ResultStatusCode(ResultStatus.CORRECTION_TO_RESULTS);
    public static final SNOMED_CT_ResultStatusCode   FINAL_RESULTS = new SNOMED_CT_ResultStatusCode(ResultStatus.FINAL_RESULTS);
    public static final SNOMED_CT_ResultStatusCode   INCOMPLETE_NO_RESULTS_AVAILABLE = new SNOMED_CT_ResultStatusCode(ResultStatus.INCOMPLETE_NO_RESULTS_AVAILABLE);
    public static final SNOMED_CT_ResultStatusCode   ORDER_RECEIVED = new SNOMED_CT_ResultStatusCode(ResultStatus.ORDER_RECEIVED);
    public static final SNOMED_CT_ResultStatusCode   PRELIMINARY = new SNOMED_CT_ResultStatusCode(ResultStatus.PRELIMINARY);
    public static final SNOMED_CT_ResultStatusCode   RESULTS_STORED = new SNOMED_CT_ResultStatusCode(ResultStatus.RESULTS_STORED);
    public static final SNOMED_CT_ResultStatusCode   SCHEDULED_NO_RESULTS_AVAILABLE = new SNOMED_CT_ResultStatusCode(ResultStatus.SCHEDULED_NO_RESULTS_AVAILABLE);
    public static final SNOMED_CT_ResultStatusCode   SOME_BUT_NOT_ALL = new SNOMED_CT_ResultStatusCode(ResultStatus.SOME_BUT_NOT_ALL);
    public static final SNOMED_CT_ResultStatusCode   CANCELLED_NO_RESULTS_AVAILABLE = new SNOMED_CT_ResultStatusCode(ResultStatus.CANCELLED_NO_RESULTS_AVAILABLE);
    public static final SNOMED_CT_ResultStatusCode   NO_ORDER_ON_RECORD = new SNOMED_CT_ResultStatusCode(ResultStatus.NO_ORDER_ON_RECORD);
    public static final SNOMED_CT_ResultStatusCode   NO_RECORD_OF_THIS_PATIENT = new SNOMED_CT_ResultStatusCode(ResultStatus.NO_RECORD_OF_THIS_PATIENT);
    
    
    public SNOMED_CT_ResultStatusCode(ResultStatus code){
        setCodeSystem( CODE_SYSTEM );
        setCodeSystemName( CODE_SYSTEM_NAME );
        setCode( code.getCode() );
        setDisplayName( code.getDisplayName() );
    }
    
    public enum ResultStatus{ 
        CORRECTION_TO_RESULTS("Correction to results", "C"),
        /*results stored and verified. Can only be changed with a corrected result.*/
        FINAL_RESULTS("Final results; results stored and verified. Can only be changed with a corrected result.","F"),
        
        /*specimen received, procedure incomplete */
        INCOMPLETE_NO_RESULTS_AVAILABLE("No results available; specimen received, procedure incomplete","I"), 
        
        /* specimen not yet received */
        ORDER_RECEIVED("Order received; specimen not yet received","O"),
        
        /* A verified early result is available */
        PRELIMINARY("Preliminary: A verified early result is available, final results not yet obtained","P"),
        
        /* not yet verified */
        RESULTS_STORED("Results stored; not yet verified","R"),
        
        /* procedure scheduled, but not done */
        SCHEDULED_NO_RESULTS_AVAILABLE("No results available; procedure scheduled, but not done","S"),
        
        
        SOME_BUT_NOT_ALL("Some, but not all, results available","A"),
        
        /* Order canceled */
        CANCELLED_NO_RESULTS_AVAILABLE("No results available; Order canceled","X"),
        
        /* Used only on queries */
        NO_ORDER_ON_RECORD("No order on record for this test","Y"),
        
        NO_RECORD_OF_THIS_PATIENT("No record of this patient","Z");
        
        
        String displayName;
        String code;
        
        ResultStatus(String displayName, String code){
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
        
        public ResultStatus fromCode(String code){
            for(ResultStatus value:ResultStatus.values()){
                if(value.getCode().equals( code )) return value;
            }
            return null;
        }
    }

}
