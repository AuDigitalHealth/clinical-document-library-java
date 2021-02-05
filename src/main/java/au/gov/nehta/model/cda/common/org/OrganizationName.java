package au.gov.nehta.model.cda.common.org;

public interface OrganizationName {
    String getValue();

    OrganizationNameUseEnum getUse();

    void setValue(String value);

    void setUse(OrganizationNameUseEnum use);
}
