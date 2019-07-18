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

package au.gov.nehta.model.clinical.etp.eprescription;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.time.PreciseDate;

public class BodyHeightImpl implements BodyHeight {
	private String bodyHeight;
	private PreciseDate dateTimeOfObservation;
	private String UNIT = "cm";

	public BodyHeightImpl( String bodyHeight, PreciseDate dateTimeOfObservation ) {
		ArgumentUtils.checkNotNull( bodyHeight, "bodyHeight" );
		ArgumentUtils.checkNotNull( dateTimeOfObservation, "dateTimeOfObservation" );
		this.bodyHeight = bodyHeight;
		this.dateTimeOfObservation = dateTimeOfObservation;
	}

	public String getValue() {
		return bodyHeight;
	}

	public PreciseDate getDateTimeOfObservation() {
		return dateTimeOfObservation;
	}

	public String getUnit() {
		return UNIT;
	}
}
