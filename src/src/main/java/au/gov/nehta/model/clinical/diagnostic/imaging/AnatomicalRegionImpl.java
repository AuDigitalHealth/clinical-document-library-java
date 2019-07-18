package au.gov.nehta.model.clinical.diagnostic.imaging;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.code.NCTISAnatomicalRegion;
import au.gov.nehta.model.cda.common.code.NCTISAnatomicalRegion.Region;
import au.gov.nehta.model.clinical.common.types.RandomID;

/**
 * Region of body (e.g. head, lower limb) that includes the anatomical
 * locations of interest (e.g. jaw, foot).
 * 
 *  Anatomical Region The value of this element SHALL
 * subsume all of the anatomical locations identified in Anatomical Site
 * (ANATOMICAL LOCATION) (targetSiteCode and targetSiteCode/ original-
 * Text).
 */
public class AnatomicalRegionImpl extends RandomID implements AnatomicalRegion {

	private Coded region;
	private String description;

	
	/**
	 * @param region Should be an NCTISAnatomicalRegion. 
	 *            Region of body (e.g. head, lower limb) that includes the
	 *            anatomical locations of interest (e.g. jaw, foot).
	 * 
	 *            Anatomical Region The value of this element SHALL subsume all
	 *            of the anatomical locations identified in Anatomical Site
	 *            (ANATOMICAL LOCATION) (targetSiteCode and targetSiteCode/
	 *            original- Text).
	 * @param description
	 *            OriginalText Description of the anatomical location.
	 */
	public AnatomicalRegionImpl(Coded region, String description) {
		this.region = region;
		this.description = description;
	}
	
	/**
	 * @param region Should be an NCTISAnatomicalRegion. 
	 *            Region of body (e.g. head, lower limb) that includes the
	 *            anatomical locations of interest (e.g. jaw, foot).
	 * 
	 *            Anatomical Region The value of this element SHALL subsume all
	 *            of the anatomical locations identified in Anatomical Site
	 *            (ANATOMICAL LOCATION) (targetSiteCode and targetSiteCode/
	 *            original- Text).
	 * @param description
	 *            OriginalText Description of the anatomical location.
	 */
	public AnatomicalRegionImpl(Region region, String description) {
		this.region = new NCTISAnatomicalRegion(region);
		this.description = description;
	}

	@Override
	public String getDescription() {
		return description;
	}

	@Override
	public Coded getRegionCode() {
		return region;
	}

	 

}
