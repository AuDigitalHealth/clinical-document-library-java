package au.gov.nehta.model.clinical.diagnostic.imaging;

import au.gov.nehta.model.cda.common.code.SNOMED_AU_Code;
import au.net.electronichealth.ns.cda._2_0.NullFlavor;

/**
 * Details about the anatomical locations (Note: If you assign NullFlavor, the rest of the
 * information will be ignored and hence there is a dedicated parameterised constructor for the sole
 * purpose may be constructed with either a name, name and side or description of the location
 */
public interface AnatomicalSite {

  /**
   * Description of the anatomical location.
   */
  String getDescription();

  SNOMED_AU_Code getSpecificLocationSide();

  SNOMED_AU_Code getSpecificLocationName();

  NullFlavor getNullFlavor();

  void setNullFlavor(NullFlavor nullFlavor);

}
