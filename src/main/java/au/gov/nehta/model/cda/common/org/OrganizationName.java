package au.gov.nehta.model.cda.common.org;

public interface OrganizationName {
	public String getValue();

	public OrganizationNameUseEnum getUse();

	public void setValue( String value );

	public void setUse( OrganizationNameUseEnum use );
}
