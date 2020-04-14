package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;

public class ImageDetailsImpl implements ImageDetails {

  private UniqueIdentifier imageIdentifier;
  private UniqueIdentifier seriesIdentifier;
  private Coded imageViewName;
  private String subjectPosition;
  private PreciseDate imageDateTime;
  private AttachedMedia image;

  @Override
  public UniqueIdentifier getImageIdentifier() {
    return imageIdentifier;
  }

  @Override
  public void setImageIdentifier(UniqueIdentifier imageIdentifier) {
    this.imageIdentifier = imageIdentifier;
  }

  @Override
  public UniqueIdentifier getSeriesIdentifier() {
    return seriesIdentifier;
  }

  @Override
  public void setSeriesIdentifier(
      UniqueIdentifier seriesIdentifier) {
    this.seriesIdentifier = seriesIdentifier;
  }

  @Override
  public Coded getImageViewName() {
    return imageViewName;
  }

  @Override
  public void setImageViewName(Coded imageViewName) {
    this.imageViewName = imageViewName;
  }

  @Override
  public String getSubjectPosition() {
    return subjectPosition;
  }

  @Override
  public void setSubjectPosition(String subjectPosition) {
    this.subjectPosition = subjectPosition;
  }

  @Override
  public PreciseDate getImageDateTime() {
    return imageDateTime;
  }

  @Override
  public void setImageDateTime(PreciseDate imageDateTime) {
    this.imageDateTime = imageDateTime;
  }

  @Override
  public AttachedMedia getImage() {
    return image;
  }

  @Override
  public void setImage(AttachedMedia image) {
    this.image = image;
  }
}
