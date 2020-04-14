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

package au.gov.nehta.model.clinical.etp.common.item;

import java.util.UUID;

public class ItemFactory {
	

	public static PrescriptionItemIdentifier createPrescriptionItemIdentifier() {
		return new PrescriptionItemIdentifier();
	}

	public static PrescriptionItemIdentifier createPrescriptionItemIdentifier( String extension ) {
		PrescriptionItemIdentifier prescriptionItemIdentifier = new PrescriptionItemIdentifier();
		prescriptionItemIdentifier.setRoot( UUID.randomUUID().toString() );
		prescriptionItemIdentifier.setExtension( extension );
		return prescriptionItemIdentifier;
	}

	public static PrescriptionItemIdentifier createPrescriptionItemIdentifier( String root, String extension ) {
		PrescriptionItemIdentifier prescriptionItemIdentifier = new PrescriptionItemIdentifier();
		prescriptionItemIdentifier.setRoot( root );
		prescriptionItemIdentifier.setExtension( extension );
		return prescriptionItemIdentifier;
	}
	



}
