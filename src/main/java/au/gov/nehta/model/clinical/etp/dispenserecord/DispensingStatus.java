package au.gov.nehta.model.clinical.etp.dispenserecord;

public enum DispensingStatus implements DispensingStatusType{
    ACTIVE("active"), COMPLETED("completed");
    
    private String statusCode; 
    
    DispensingStatus(String statusCode){
        this.statusCode = statusCode;
    }
    
    public String getStatusCode() {
        return statusCode;
    }
}
