package au.gov.nehta.model.clinical.common.participation;

import java.util.List;

/**
 * A base Address object with elements common to all Addresses.
 * <p>
 * <p>
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
    List<String> getUnstructuredAddressLines();

    /**
     * The numeric descriptor for a postal delivery area (as defined by
     * Australia Post), aligned with locality, suburb or place for the address.
     */
    String getPostcode();

    /**
     * The full name of the general locality contained within the specific
     * address.
     */
    String getCity();

    /**
     * A unique number assigned to a postal delivery point as recorded on the
     * Australia Post Postal Address File.
     */
    String getAdditionalLocator();


    /**
     * A composite of one or more low level standard address components
     * describing a geographical/physical location that, used in conjunction
     * with the other high level address components, e.g. Australian
     * suburb/town/locality name, Australian postcode and Australian
     * State/Territory, forms a complete geographical/physical address.
     */
    void setUnstructuredAddressLines(List<String> addressLines);


    /**
     * A composite of one or more low level standard address components
     * describing a geographical/physical location that, used in conjunction
     * with the other high level address components, e.g. Australian
     * suburb/town/locality name, Australian postcode and Australian
     * State/Territory, forms a complete geographical/physical address.
     */
    void addUnstructuredAddressLine(String addressLine);

    /**
     * The numeric descriptor for a postal delivery area (as defined by
     * Australia Post), aligned with locality, suburb or place for the address.
     */
    void setPostcode(String postcode);

    /**
     * The full name of the general locality contained within the specific
     * address.
     */
    void setCity(String city);

    /**
     * A unique number assigned to a postal delivery point as recorded on the
     * Australia Post Postal Address File.
     */
    void setAdditionalLocator(String additionalLocator);
}
