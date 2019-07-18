package au.gov.nehta.model.clinical.diagnostic.pathology;

import org.joda.time.DateTime;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;

public interface ReportDocument {
    
    /**
     * The path inside the clinical document to the representation of the pathology test results 
     * for example, "x-ray.tiff"
     * 
     * The MediaType of the TestResultsRepresentation
     * must be one PDF
     * 
     */
    public AttachedMedia getTestResultsRepresentation();

    /**
     * The  unique identifier of the target document
     */
    public UniqueIdentifier getDocumentID();
    
    /**
     * ACT ID is a unique identifier to identify the ACT element in 
     * a clinical document.
     */
    public UniqueIdentifier getActID();
    
    /**
     * the Report status of the document
     */
    public Coded getReportStatus();
    
    /**
     * return the title of this pathology report
     */
    public String getReportTitle();

    public DateTime getReportDate();
    
}
