package au.gov.nehta.model.clinical.diagnostic.imaging;

import au.gov.nehta.model.cda.common.code.SNOMED_AU_Code;

/**
 *  Details about the anatomical locations
 *
 *  may be constructed with either a name, name and side or description of the location
 *
 */
public class AnatomicalSiteImpl implements AnatomicalSite {
    private SNOMED_AU_Code name;
    private SNOMED_AU_Code side;

    private String description;

    public AnatomicalSiteImpl(SNOMED_AU_Code name){
        this.name=name;
    }

    public AnatomicalSiteImpl(SNOMED_AU_Code name,SNOMED_AU_Code side){
        this.name=name;
        this.side=side;
    }

    public AnatomicalSiteImpl(String description){
        this.description=description;
    }

    @Override
    public SNOMED_AU_Code getSpecificLocationName() {
        return name;
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
