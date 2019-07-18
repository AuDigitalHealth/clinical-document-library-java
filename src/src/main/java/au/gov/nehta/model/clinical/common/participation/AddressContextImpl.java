/*
 * Copyright 2011 NEHTA
 *
 * Licensed under the NEHTA Open Source (Apache) License; you may not use this
 * file except in compliance with the License. A copy of the License is in the
 * 'license.txt' file, which should be provided with this work.
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
 * WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied. See the
 * License for the specific language governing permissions and limitations
 * under the License.
 */

package au.gov.nehta.model.clinical.common.participation;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.clinical.etp.common.participation.AddressContext;

/**
 * An Address combined with the context in which is used. Eg AddressPurpose.BUSINESS
 * It may also indicate a nullflavor address - "noFixedAddress"
 */
public class AddressContextImpl implements AddressContext {
	protected Boolean noFixedAddressIndicator;
	protected Address address;
	protected AddressPurpose addressPurpose;

	public AddressContextImpl( Boolean noFixedAddressIndicator ) {
		ArgumentUtils.checkNotNull( noFixedAddressIndicator, "noFixedAddressIndicator" );
		this.noFixedAddressIndicator = noFixedAddressIndicator;
	}

	public AddressContextImpl(   Address address, AddressPurpose addressPurpose ) {
		ArgumentUtils.checkNotNull( addressPurpose, "addressPurpose" );
		ArgumentUtils.checkNotNull( address, "address " );
		this.noFixedAddressIndicator = false;
		this.address = address;
		this.addressPurpose = addressPurpose;
	}

    public AddressContextImpl(  AustralianAddress address, AddressPurpose addressPurpose ) {
        ArgumentUtils.checkNotNull( addressPurpose, "addressPurpose" );
        ArgumentUtils.checkNotNull( address, "address " );
        
        if(address.getUnstructuredAddressLines()!= null && 
           address.getUnstructuredAddressLines().size() > 2){
            throw new IllegalArgumentException( "Address may not have more than 2 unstructured address lines" );
        }
        
        this.noFixedAddressIndicator = false;
        this.address = address;
        this.addressPurpose = addressPurpose;
    }
	

    /**
     * a convenience method that returns an empty address 
     */
    public static AddressContextImpl noFixedAddress(){
    	return new AddressContextImpl(true);
    }
    
	public Boolean getNoFixedAddressIndicator() {
		return this.noFixedAddressIndicator;
	}

	public Address getAddress() {
		return this.address;
	}

	public AddressPurpose getAddressPurpose() {
		return this.addressPurpose;
	}
}
