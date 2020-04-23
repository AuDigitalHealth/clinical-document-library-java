package au.gov.nehta.model.cda.diagnostic;

import org.joda.time.DateTime;

import au.gov.nehta.model.cda.common.custodian.Custodian;
import au.gov.nehta.model.cda.common.document.BaseClinicalDocument;
import au.gov.nehta.model.cda.common.document.ClinicalDocument;
import au.gov.nehta.model.cda.common.id.LegalAuthenticator;
import au.gov.nehta.model.common.CDAModelImpl;

public class DiagnosticImagingReportCdaModel extends CDAModelImpl{

	private DateTime effectiveTime;
    private ClinicalDocument diClinicalDoucment;
	

    public DiagnosticImagingReportCdaModel( ClinicalDocument clinicalDocument, LegalAuthenticator legalAuthenticator, Custodian custodian, 
			 DateTime effectiveTime ) {
	    super(null,legalAuthenticator,custodian);
	    this.diClinicalDoucment = clinicalDocument;
		this.effectiveTime = effectiveTime;
		
		validate();
	}
    
    public DiagnosticImagingReportCdaModel( ClinicalDocument clinicalDocument,  Custodian custodian, 
             DateTime effectiveTime ) {
        super(null,null,custodian);
        this.diClinicalDoucment = clinicalDocument;
        this.effectiveTime = effectiveTime;
        
        validate();
    }
    

    private void validate() {
        if(diClinicalDoucment == null) throw new IllegalArgumentException( "DiagnosticImageClinicalDocument missing" );
        if(diClinicalDoucment.getCompletionCode() == null)throw new IllegalArgumentException( "DiagnosticImageClinicalDocument is missing completion code" );
        if(diClinicalDoucment.getClinicalDocumentId() == null)throw new IllegalArgumentException( "DiagnosticImageClinicalDocument is missing DocumentID code" );
        if(diClinicalDoucment.getTypeId() == null)throw new IllegalArgumentException( "DiagnosticImageClinicalDocument is missing typeID " );
        if(diClinicalDoucment.getTemplateIds() == null || diClinicalDoucment.getTemplateIds().size() ==0)throw new IllegalArgumentException( "DiagnosticImageClinicalDocument is missing templateId " );
        
        if(effectiveTime == null)throw new IllegalArgumentException( "AuthorTime is missing" );
        
    }



    /**
     * @return the pathClinicalDoucment
     */
    public ClinicalDocument getDIClinicalDoucment() {
        return diClinicalDoucment;
    }
    
    
    @Override
    public BaseClinicalDocument getBaseClinicalDocument() {
        return (BaseClinicalDocument) diClinicalDoucment;
    }

	public DateTime getAuthorTime() {
        return effectiveTime;
    }


    public void setAuthorTime( DateTime authorTime ) {
        this.effectiveTime = authorTime;
    }
}
