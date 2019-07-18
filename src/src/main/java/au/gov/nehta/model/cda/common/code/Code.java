package au.gov.nehta.model.cda.common.code;


public interface Code extends Coded {
    public void setCode( String code);
    
    public void addTranslation( Code code);
    public void setCodeSystem( String codeSystem );
    public void setCodeSystemName( String codeSystemName );
    public void setDisplayName( String displayName );
    public void setOriginalText( String originalText );
    public void setCodeSystemVersion(String version );
}
