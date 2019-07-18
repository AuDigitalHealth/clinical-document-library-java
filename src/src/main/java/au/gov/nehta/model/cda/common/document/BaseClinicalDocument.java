package au.gov.nehta.model.cda.common.document;

import java.util.List;

import au.gov.nehta.model.cda.common.id.TemplateId;
import au.gov.nehta.model.cda.common.id.TypeId;

public interface BaseClinicalDocument {
    
    public TypeId getTypeId();

    public List<TemplateId> getTemplateIds();

    public String getLanguageCode();

    public String getSetId();

    public Integer getVersionNumber();

    public String getTitle();
	
    public String getClinicalDocumentId();

    public void setTitle( String title );

    public void setLanguageCode( String languageCode );

    public void setVersionNumber( Integer versionNumber );

    public void setSetId( String setId );
	
    public void setClinicalDocumentId(String id); 

    public void addTemplateId( TemplateId templateId );
}
