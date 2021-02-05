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

package au.gov.nehta.model.cda.common.prescription;

import au.gov.nehta.model.clinical.etp.eprescription.BodyHeight;
import au.gov.nehta.model.clinical.etp.eprescription.BodyWeight;

public class ObservationsImpl implements Observations {
    private final BodyWeight bodyWeight;
    private final BodyHeight bodyHeight;

    public ObservationsImpl(BodyHeight bodyHeight, BodyWeight bodyWeight) {
        this.bodyHeight = bodyHeight;
        this.bodyWeight = bodyWeight;
    }

    public BodyWeight getBodyWeight() {
        return bodyWeight;
    }

    public BodyHeight getBodyHeight() {
        return bodyHeight;
    }

    public boolean hasBodyWeight() {
        return this.bodyWeight != null;
    }

    public boolean hasBodyHeight() {
        return this.bodyHeight != null;
    }
}
