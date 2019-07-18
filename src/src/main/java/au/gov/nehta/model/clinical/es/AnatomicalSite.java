package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;

import java.util.List;

public interface AnatomicalSite {
    SpecificLocation getSpecificLocation();

    void setSpecificLocation(SpecificLocation specificLocation);

    String getAnatomicalLocationDesc();

    void setAnatomicalLocationDesc(String anatomicalLocationDesc);

    List<AttachedMedia> getAnatomicalLocationImages();

    void setAnatomicalLocationImages(List<AttachedMedia> anatomicalLocationImages);

    //TODO Missing Validation
}
