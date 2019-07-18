package au.gov.nehta.model.cda.common.document;

import java.util.ArrayList;
import java.util.List;

import au.gov.nehta.model.cda.common.id.TemplateId;
import au.gov.nehta.model.cda.common.id.TypeId;
import au.gov.nehta.model.cda.common.id.TypeIdImpl;

public class BaseClinicalDocumentImpl implements BaseClinicalDocument {

	private final TypeId typeId = TypeIdImpl.getInstance( "POCD_HD000040", "2.16.840.1.113883.1.3" );
	private final List<TemplateId> templateIds = new ArrayList<TemplateId>( 3 );
	private String languageCode;
	private String setId;
	private int versionNumber;
	private String title;
    private String clinicalDocumentId;

	protected BaseClinicalDocumentImpl( TemplateId templateId, String title ) {
		this.templateIds.add( templateId );
		this.title =title;
		
		//initialise sensible defaults
		this.languageCode = "en-AU";
		this.versionNumber=1;
	}

	public String getTitle() {
		return title;
	}

	public TypeId getTypeId() {
		return typeId;
	}

	public String getSetId() {
		return setId;
	}

	public String getLanguageCode() {
		return languageCode;
	}

	public Integer getVersionNumber() {
		return versionNumber;
	}

	public List<TemplateId> getTemplateIds() {
		return templateIds;
	}

	public void setTitle( String title ) {
		this.title = title;
	}

	public void setLanguageCode( String languageCode ) {
		this.languageCode = languageCode;
	}

	public void setSetId( String setId ) {
		this.setId = setId;
	}

	public void setVersionNumber( Integer versionNumber ) {
		this.versionNumber = versionNumber;
	}

	public void addTemplateId( TemplateId templateId ) {
		this.templateIds.add( templateId );
	}

    @Override
    public String getClinicalDocumentId() {
        return this.clinicalDocumentId;
    }

    @Override
    public void setClinicalDocumentId( String id ) {
        this.clinicalDocumentId=id;
    }
}
