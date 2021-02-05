package au.gov.nehta.model.cda.common.org;

public class OrganizationNameImpl implements OrganizationName {
    private String value;
    private OrganizationNameUseEnum use;

    private OrganizationNameImpl(String value, OrganizationNameUseEnum use) {
        this.value = value;
        this.use = use;
    }

    public OrganizationNameImpl() {
    }

    public OrganizationNameImpl(String name) {
        this.value = name;
    }

    public static OrganizationName getInstance(String value, OrganizationNameUseEnum use) {

        return new OrganizationNameImpl(value, use);
    }

    public static OrganizationName getInstance() {

        return new OrganizationNameImpl();
    }

    public String getValue() {
        return value;
    }

    public OrganizationNameUseEnum getUse() {
        return use;
    }

    public void setValue(String value) {
        this.value = value;
    }

    public void setUse(OrganizationNameUseEnum use) {
        this.use = use;
    }
}
