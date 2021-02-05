package au.gov.nehta.model.cda.common.document;

import java.util.List;

import au.gov.nehta.model.cda.common.id.TemplateId;
import au.gov.nehta.model.cda.common.id.TypeId;

public interface BaseClinicalDocument {

    TypeId getTypeId();

    List<TemplateId> getTemplateIds();

    String getLanguageCode();

    String getSetId();

    Integer getVersionNumber();

    String getTitle();

    String getClinicalDocumentId();

    void setTitle(String title);

    void setLanguageCode(String languageCode);

    void setVersionNumber(Integer versionNumber);

    void setSetId(String setId);

    void setClinicalDocumentId(String id);

    void addTemplateId(TemplateId templateId);
}
