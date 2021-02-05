package au.gov.nehta.model.clinical.diagnostic.imaging;

import java.util.List;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

/**
 * Findings and interpretation of an imaging examination, or series of examinations
 * IG Guide 7.1.1.1
 */
public interface ImagingExaminationResult {

    /**
     * Identification of the imaging examination or procedure performed,
     * typically including modality and anatomical location (including laterality).
     */
    public Coded getImagingResultName();

    /**
     * This is a technical identifier that is used for system purposes such as
     * matching. If a suitable internal key is not available, a UUID MAY be
     * used.
     */
    public UniqueIdentifier getImagingResultNameId();


    /**
     * The imaging method used to perform the examination
     */
    public Coded getModality();


    /**
     * Details about the anatomical locations to which this examination result
     * refers.
     */
    public List<AnatomicalSite> getSites();

    /**
     * Region of body (e.g. head, lower limb) that includes the anatomical
     * locations of interest (e.g. jaw, foot).
     * <p>
     * Anatomical Region The value of this element SHALL
     * subsume all of the anatomical locations identified in Anatomical Site
     * (ANATOMICAL LOCATION) (targetSiteCode and targetSiteCode/ original-
     * Text).
     */
    public AnatomicalRegion getAnatomicalRegion();

    /**
     * Additional details of imaging examination methodology followed.
     */
    public String getExaminationProcedure();

    /**
     * A globally unique identifier for imaging examination methodology followed.
     */
    public UniqueIdentifier getExaminationProcedureId();

    /**
     * A globally unique identifier for each instance of an
     * Imaging Examination Result observation.
     */
    public UniqueIdentifier getId();

    /**
     * Date, and optionally time, when an observation is clinically significant
     * to the condition of the subject of the observation.
     */
    public PreciseDate getImageDateTime();

    /**
     * The status of the examination result as a whole.
     *
     * @return code as HL7: Result Status
     */
    public Coded getOverallResultStatusCode();

    /**
     * UUID This is a technical identifier that is used for system purposes such
     * as matching. If a suitable internal key is not available, a UUID MAY be
     * used.
     */
    public UniqueIdentifier getOverallResultStatusId();

    /**
     * A link to, or identifier of, information of interest
     * Any URI, filename etc
     */
    public String getRelatedImage();

    /**
     * UUID This is a technical identifier that is used for system purposes such
     * as matching. If a suitable internal key is not available, a UUID MAY be
     * used.
     */
    public UniqueIdentifier getRelatedImageId();
}
