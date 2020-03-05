package au.gov.nehta.model.clinical.psml;

import au.gov.nehta.model.cda.common.id.TemplateId;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;
import java.util.List;

public class SectionImpl implements Section {

  private List<AttachedMedia> encapsulatedDataItems;
  private TemplateId templateId;

  @Override
  public List<AttachedMedia> getEncapsulatedDataItems() {
    return encapsulatedDataItems;
  }

  @Override
  public void setEncapsulatedDataItems(List<AttachedMedia> encapsulatedDataItems) {
    this.encapsulatedDataItems = encapsulatedDataItems;
  }

  @Override
  public TemplateId getTemplateId() {
    return templateId;
  }

  @Override
  public void setTemplateId(TemplateId templateId) {
    this.templateId = templateId;
  }
}
