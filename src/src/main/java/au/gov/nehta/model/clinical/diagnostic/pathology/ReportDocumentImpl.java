package au.gov.nehta.model.clinical.diagnostic.pathology;

import org.joda.time.DateTime;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.code.SNOMED_CT_ResultStatusCode;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import au.net.electronichealth.ns.cda._2_0.MediaType;

public class ReportDocumentImpl implements ReportDocument {
    private UniqueIdentifier actID = UniqueIdentifierImpl.random();
    private Coded statusCode;
    private UniqueIdentifier documentID;
    private AttachedMedia testResultRepresentation;
    private String title;
    private DateTime reportDate;
    
    public ReportDocumentImpl(String title,
            AttachedMedia testResultRepresentation,
            UniqueIdentifier documentID,
            Coded reportStatus,
            DateTime reportDate
            ){
        ArgumentUtils.checkNotNullNorBlank( title, "title" );
        ArgumentUtils.checkNotNull( testResultRepresentation, "testResultRepresentation" );
        ArgumentUtils.checkNotNull( documentID, "documentID" );
        ArgumentUtils.checkNotNull( reportStatus, "reportStatus" );
        ArgumentUtils.checkNotNull( reportDate, "reportDate" );
        
        
        if(! MediaType.APPLICATION_PDF.value().equals( testResultRepresentation.getMediaType() ) ){
            throw new IllegalArgumentException("Media type must be pdf");
        }
        
        if( !(  SNOMED_CT_ResultStatusCode.FINAL_RESULTS.getCode().equals(reportStatus.getCode()) ||  
                SNOMED_CT_ResultStatusCode.PRELIMINARY.getCode().equals(reportStatus.getCode())  ||
                 SNOMED_CT_ResultStatusCode.CORRECTION_TO_RESULTS.getCode().equals(reportStatus.getCode())
                ) ){
            throw new IllegalArgumentException("Report status code must be (P)RELIMINARY (F)INAL_RESULTS or (C)ORRECTION_TO_RESULTS");
        }
        
        this.statusCode=reportStatus;
        this.testResultRepresentation=testResultRepresentation;
        this.documentID=documentID;
        this.title=title;
        this.reportDate=reportDate;
    }
    
  
    
    
    @Override
    public AttachedMedia getTestResultsRepresentation() {
        return testResultRepresentation;
    }

    @Override
    public UniqueIdentifier getDocumentID() {
        return documentID;
    }

    @Override
    public Coded getReportStatus() {
        return statusCode;
    }
    
    public void setActID(UniqueIdentifier actID){
        this.actID=actID;
    }
    
    
    @Override
    public String getReportTitle() {
        return title;
    }


    /**
     * An identifier for the ACT segment of the CDA document
     * defaulted to a random UUID if not explicitly supplied 
     */
    @Override
    public UniqueIdentifier getActID() {
        return actID;
    }




    @Override
    public DateTime getReportDate() {
        return reportDate;
    }

 

  
    

}
