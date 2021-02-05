package au.gov.nehta.model.clinical.diagnostic.imaging;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

/**
 * Region of body (e.g. head, lower limb) that includes the anatomical
 * locations of interest (e.g. jaw, foot).
 * <p>
 * Anatomical Region The value of this element SHALL
 * subsume all of the anatomical locations identified in Anatomical Site
 * (ANATOMICAL LOCATION) (targetSiteCode and targetSiteCode/ original-
 * Text).
 */
public interface AnatomicalRegion {

    /**
     * OriginalText Description of the anatomical location.
     */
    public String getDescription();

    /**
     * Region of body (e.g. head, lower limb) that includes the anatomical
     * locations of interest (e.g. jaw, foot).
     * <p>
     * Anatomical Region The value of this element SHALL
     * subsume all of the anatomical locations identified in Anatomical Site
     * (ANATOMICAL LOCATION) (targetSiteCode and targetSiteCode/ original-
     * Text).
     */
    public Coded getRegionCode();

    /**
     * AnatomicalRegion ID
     * UUID This is a technical identifier that is used for system purposes such
     * as matching. If a suitable internal key is not available, a UUID MAY be
     * used.
     */
    public UniqueIdentifier getID();
}
