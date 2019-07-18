package au.gov.nehta.model.clinical.diagnostic.imaging;

import au.gov.nehta.model.cda.common.code.SNOMED_AU_Code;

/**
 * Details about the anatomical locations
 *
 */
public interface AnatomicalSite {
    /**
     * Description of the anatomical location.
     */
    String getDescription();

    SNOMED_AU_Code getSpecificLocationSide();

    SNOMED_AU_Code getSpecificLocationName();
}
