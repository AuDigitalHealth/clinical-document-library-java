package au.gov.nehta.model.clinical.diagnostic.imaging;

import au.gov.nehta.model.cda.common.code.SNOMED_AU_Code;
import au.net.electronichealth.ns.cda._2_0.NullFlavor;

/**
 * Details about the anatomical locations (Note: If you assign NullFlavor, the rest of the
 * information will be ignored and hence there is a dedicated parameterised constructor for the sole
 * purpose may be constructed with either a name, name and side or description of the location
 */
public class AnatomicalSiteImpl implements AnatomicalSite {

  private SNOMED_AU_Code name;
  private SNOMED_AU_Code side;

  private String description;
  private NullFlavor nullFlavor;

  public AnatomicalSiteImpl(SNOMED_AU_Code name) {
    this.name = name;
  }

  public AnatomicalSiteImpl(SNOMED_AU_Code name, SNOMED_AU_Code side) {
    this.name = name;
    this.side = side;
  }

  public AnatomicalSiteImpl(String description) {
    this.description = description;
  }

  public AnatomicalSiteImpl(NullFlavor nullFlavor) {
    this.nullFlavor = nullFlavor;
  }

  @Override
  public SNOMED_AU_Code getSpecificLocationName() {
    return name;
  }

  @Override
  public NullFlavor getNullFlavor() {
    return nullFlavor;
  }

  @Override
  public void setNullFlavor(NullFlavor nullFlavor) {
    this.nullFlavor = nullFlavor;
  }

  @Override
  public SNOMED_AU_Code getSpecificLocationSide() {
    return side;
  }

  @Override
  public String getDescription() {
    return description;
  }

}
