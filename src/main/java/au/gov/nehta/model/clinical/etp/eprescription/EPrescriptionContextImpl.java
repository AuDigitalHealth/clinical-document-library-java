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
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberOrganisationParticipation;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberParticipation;

public class EPrescriptionContextImpl implements EPrescriptionContext {

	private SubjectOfCareParticipant subjectOfCare;
	private PrescriberParticipation prescriber;
	private PrescriberOrganisationParticipation prescriberOrganisation;

	public EPrescriptionContextImpl( 
	        SubjectOfCareParticipant subjectOfCare, PrescriberParticipation prescriber, PrescriberOrganisationParticipation prescriberOrganisation	) {
		ArgumentUtils.checkNotNull( subjectOfCare, "subjectOfCare" );
		ArgumentUtils.checkNotNull( prescriber, "prescriber" );
		ArgumentUtils.checkNotNull( prescriberOrganisation, "prescriberOrganisation" );
		this.subjectOfCare = subjectOfCare;
		this.prescriber = prescriber;
		this.prescriberOrganisation = prescriberOrganisation;
	}

	public SubjectOfCareParticipant getSubjectOfCare() {
		return subjectOfCare;
	}

	public PrescriberParticipation getPrescriber() {
		return prescriber;
	}

	public PrescriberOrganisationParticipation getPrescriberOrganisation() {
		return prescriberOrganisation;
	}

}
