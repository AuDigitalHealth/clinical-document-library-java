package au.gov.nehta.model.clinical.diagnostic.pathology;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;

import java.time.ZonedDateTime;

public interface ReportDocument {

    /**
     * The path inside the clinical document to the representation of the pathology test results
     * for example, "x-ray.tiff"
     * <p>
     * The MediaType of the TestResultsRepresentation
     * must be one PDF
     */
    AttachedMedia getTestResultsRepresentation();

    /**
     * The  unique identifier of the target document
     */
    UniqueIdentifier getDocumentID();

    /**
     * ACT ID is a unique identifier to identify the ACT element in
     * a clinical document.
     */
    UniqueIdentifier getActID();

    /**
     * the Report status of the document
     */
    Coded getReportStatus();

    /**
     * return the title of this pathology report
     */
    String getReportTitle();

    ZonedDateTime getReportDate();
}
