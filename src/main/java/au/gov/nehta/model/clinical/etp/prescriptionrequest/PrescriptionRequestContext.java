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
package au.gov.nehta.model.clinical.etp.prescriptionrequest;

import org.joda.time.DateTime;

import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.DispenserParticipation;
import au.gov.nehta.model.clinical.etp.common.participation.DispensingOrganisationParticipation;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberOrganisationParticipation;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberParticipation;

public interface PrescriptionRequestContext {
	SubjectOfCareParticipant getSubjectOfCare();

	DispenserParticipation getDispenser();

	DispensingOrganisationParticipation getDispensingOrganisation();

	PrescriberParticipation getPrescriber();

	PrescriberOrganisationParticipation getPrescriberOrganisation();

	PrescriptionRequestIdentifier getPrescriptionRequestIdentifier();

	DateTime getDateTimePrescriptionRequestWritten();
}
