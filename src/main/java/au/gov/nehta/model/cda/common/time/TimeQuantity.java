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
package au.gov.nehta.model.cda.common.time;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.clinical.common.types.RealQuantity;

/**
 * A class to model time widths as in IVL_TS elements.
 *
 * @author NeHTA
 */
public class TimeQuantity extends RealQuantity {

    private String narrativeOverride;

    /**
     * Create a width for the measurement of time.
     * <p>
     * <p>
     * example:
     * <pre>
     *   Width width = new Width(2, TimeUnitOfMeasure.Week);
     * </pre>
     * will generate the CDA model of the IVL_TS element
     * <pre>
     * <effectiveTime>
     *   <width unit='wk' value='2' />
     *
     *  &lt;effectiveTime&gt;
     *  &nbsp;&nbsp;&lt;width unit='wk' value='2' / &gt;...
     *  </pre>
     * indicating a 2 week interval
     * <p>
     *
     * @param unit  a unit of time, eg weeks
     * @param value the amount of time int the width eg 2 weeks
     */
    public TimeQuantity(double value, TimeUnitOfMeasure unit) {
        super(value, ""); //unit might be null, check first
        ArgumentUtils.checkNotNull(unit, "Time quantity TimeUnitOfMeasure ");
        ArgumentUtils.checkNotNull(value, "Time quantity value");

        setUnit(unit.getCode());
    }

    /**
     * @return a string to use for the narrative, if any
     */
    public String getNarrative() {
        return narrativeOverride;
    }

    /**
     * @param narrativeOverride a string to use for the narrative text for this time
     */
    public void setNarrative(String narrativeOverride) {
        this.narrativeOverride = narrativeOverride;
    }
}
