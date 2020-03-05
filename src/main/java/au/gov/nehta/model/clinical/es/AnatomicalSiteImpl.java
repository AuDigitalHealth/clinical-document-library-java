package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;

import java.util.List;

public class AnatomicalSiteImpl implements AnatomicalSite {
    private SpecificLocation specificLocation;
    private String anatomicalLocationDesc;
    private List<AttachedMedia> anatomicalLocationImages;

    @Override
    public SpecificLocation getSpecificLocation() {
        return specificLocation;
    }

    @Override
    public void setSpecificLocation(SpecificLocation specificLocation) {
        this.specificLocation = specificLocation;
    }

    @Override
    public String getAnatomicalLocationDesc() {
        return anatomicalLocationDesc;
    }

    @Override
    public void setAnatomicalLocationDesc(String anatomicalLocationDesc) {
        this.anatomicalLocationDesc = anatomicalLocationDesc;
    }

    @Override
    public List<AttachedMedia> getAnatomicalLocationImages() {
        return anatomicalLocationImages;
    }

    @Override
    public void setAnatomicalLocationImages(List<AttachedMedia> anatomicalLocationImages) {
        this.anatomicalLocationImages = anatomicalLocationImages;
    }
}
