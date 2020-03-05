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

import au.gov.nehta.model.cda.common.code.Coded;

public interface EntitlementType extends Coded {
	final String CODE_SYSTEM = "1.2.36.1.2001.1001.101.103.16048";
	final String CODE_SYSTEM_NAME = "ParticipantEntitlement Type Values";
	final String CODE_SYSTEM_VERSION = "2010";
}