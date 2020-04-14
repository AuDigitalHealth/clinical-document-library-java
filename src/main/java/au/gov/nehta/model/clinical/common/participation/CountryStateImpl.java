package au.gov.nehta.model.clinical.common.participation;

public class CountryStateImpl implements CountryState {

    private String country;
    private String state;
    
    public CountryStateImpl(String country, String state) {
        this.country =country;
        this.state = state;
    }
    
    
    @Override
    public String getState() {
        return state;
    }

    @Override
    public String getCountry() {
        return country;
    }

    @Override
    public void setState( String state ) {
        this.state = state;
    }

    @Override
    public void setCountry( String country ) {
        this.country =country;
    }

}
