package au.gov.nehta.test.exceptions;

public class SchemaValidationException extends Exception {

    private static final long serialVersionUID = 1L;
    
    
    public SchemaValidationException(String s){
        super(s);
    }
    
    public SchemaValidationException(Exception e){
        super(e);
    }

}
