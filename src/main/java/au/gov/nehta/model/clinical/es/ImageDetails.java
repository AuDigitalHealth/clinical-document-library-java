package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;

public interface ImageDetails {
    UniqueIdentifier getImageIdentifier();

    /*DICOM Series Identifier*/
    UniqueIdentifier getSeriesIdentifier();

    Coded getImageViewName();

    String getSubjectPosition();

    PreciseDate getImageDateTime();

    AttachedMedia getImage();

    void setImageIdentifier(UniqueIdentifier imageIdentifier);

    void setSeriesIdentifier(
        UniqueIdentifier seriesIdentifier);

    void setImageViewName(Coded imageViewName);

    void setSubjectPosition(String subjectPosition);

    void setImageDateTime(PreciseDate imageDateTime);

    void setImage(AttachedMedia image);
}
