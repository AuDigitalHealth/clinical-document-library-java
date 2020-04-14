package au.gov.nehta.model.clinical.common.participation;

import java.util.List;

/**
 * A base Address object with elements common to all Addresses.
 * <p> 
 *
 * The description of a location where an entity is located or can be
 * otherwise reached or found and a description of the purpose for which
 * that address is primarily used by that entity.
 */
public interface Address extends CountryState {
	
	/**
	 * A composite of one or more low level standard address components
	 * describing a geographical/physical location that, used in conjunction
	 * with the other high level address components, e.g. Australian
	 * suburb/town/locality name, Australian postcode and Australian
	 * State/Territory, forms a complete geographical/physical address.
	 */
    public List<String> getUnstructuredAddressLines();
    
	/**
	 * The numeric descriptor for a postal delivery area (as defined by
	 * Australia Post), aligned with locality, suburb or place for the address.
	 */
    public String getPostcode();
    
	/**
	 * The full name of the general locality contained within the specific
	 * address.
	 */
    public String getCity();
    
	/**
	 * A unique number assigned to a postal delivery point as recorded on the
	 * Australia Post Postal Address File.
	 */
    public String getAdditionalLocator();
    

	/**
	 * A composite of one or more low level standard address components
	 * describing a geographical/physical location that, used in conjunction
	 * with the other high level address components, e.g. Australian
	 * suburb/town/locality name, Australian postcode and Australian
	 * State/Territory, forms a complete geographical/physical address.
	 */
    public void setUnstructuredAddressLines( List<String> addressLines );
    

	/**
	 * A composite of one or more low level standard address components
	 * describing a geographical/physical location that, used in conjunction
	 * with the other high level address components, e.g. Australian
	 * suburb/town/locality name, Australian postcode and Australian
	 * State/Territory, forms a complete geographical/physical address.
	 */
    public void addUnstructuredAddressLine( String addressLine );
    
    /**
	 * The numeric descriptor for a postal delivery area (as defined by
	 * Australia Post), aligned with locality, suburb or place for the address.
	 */
    public void setPostcode( String postcode );
    
	/**
	 * The full name of the general locality contained within the specific
	 * address.
	 */
    public void setCity( String city );
    
    /**
	 * A unique number assigned to a postal delivery point as recorded on the
	 * Australia Post Postal Address File.
	 */
    public void setAdditionalLocator( String additionalLocator );
}
