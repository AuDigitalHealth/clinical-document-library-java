package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.clinical.common.types.Quantity;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;

public class PhysicalDetails {
  private Quantity weight;

  private Dimensions dimensions;

  private String description;

  private AttachedMedia image;

  public Quantity getWeight() {
    return weight;
  }

  public void setWeight(Quantity weight) {
    this.weight = weight;
  }

  public Dimensions getDimensions() {
    return dimensions;
  }

  public void setDimensions(Dimensions dimensions) {
    this.dimensions = dimensions;
  }

  public String getDescription() {
    return description;
  }

  public void setDescription(String description) {
    this.description = description;
  }

  public AttachedMedia getImage() {
    return image;
  }

  public void setImage(AttachedMedia image) {
    this.image = image;
  }
}
