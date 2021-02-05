package au.gov.nehta.model.clinical.psml;

import au.gov.nehta.model.cda.common.id.TemplateId;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;

import java.util.List;

public interface Section {

    List<AttachedMedia> getEncapsulatedDataItems();

    void setEncapsulatedDataItems(List<AttachedMedia> encapsulatedDataItems);

    TemplateId getTemplateId();

    void setTemplateId(TemplateId templateId);
}
