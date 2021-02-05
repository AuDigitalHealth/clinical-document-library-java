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

import java.util.ArrayList;
import java.util.List;

public class InternationalAddressImpl implements InternationalAddress {

    private static final int STD_NUM_OF_ADDRESS_LINES = 3;
    private List<String> addressLines = new ArrayList<>(STD_NUM_OF_ADDRESS_LINES);
    private String stateProvince;
    private String postcode;
    private String country;
    private String city;

    private String additionalLocator;

    public InternationalAddressImpl() {
    }

    /**
     * Get all address lines
     */
    @Override
    public List<String> getUnstructuredAddressLines() {
        return addressLines;
    }

    /**
     * Replace the address lines with an alternative
     */
    @Override
    public void setUnstructuredAddressLines(List<String> addressLines) {
        this.addressLines = addressLines;
    }

    /**
     * Add an address line to the existing address lines
     */
    @Override
    public void addUnstructuredAddressLine(String addressLine) {
        if (this.addressLines == null) {
            this.addressLines = new ArrayList<>(3);
        }
        this.addressLines.add(addressLine);
    }

    /**
     * @return the additionalLocator
     */
    @Override
    public String getAdditionalLocator() {
        return additionalLocator;
    }

    /**
     * @param additionalLocator the additionalLocator to set
     */
    @Override
    public void setAdditionalLocator(String additionalLocator) {
        this.additionalLocator = additionalLocator;
    }

    /**
     * @return the city
     */
    @Override
    public String getCity() {
        return city;
    }

    /**
     * @param city the city to set
     */
    @Override
    public void setCity(String city) {
        this.city = city;
    }

    /**
     * @return the stateProvince
     */
    public String getState() {
        return stateProvince;
    }

    /**
     * @return the postcode
     */
    public String getPostcode() {
        return postcode;
    }

    /**
     * @return the country
     */
    public String getCountry() {
        return country;
    }

    /**
     * @param stateProvince the stateProvince to set
     */
    public void setState(String stateProvince) {
        this.stateProvince = stateProvince;
    }

    /**
     * @param postcode the postcode to set
     */
    public void setPostcode(String postcode) {
        this.postcode = postcode;
    }

    /**
     * @param country the country to set
     */
    public void setCountry(String country) {
        this.country = country;
    }
}
