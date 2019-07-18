package au.gov.nehta.model.clinical.common.participation;

public interface CountryState {

    public abstract String getState();

    public abstract String getCountry();

    public abstract void setState( String state );

    public abstract void setCountry( String country );

}