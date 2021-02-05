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

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.DispenserParticipation;
import au.gov.nehta.model.clinical.etp.common.participation.DispensingOrganisationParticipation;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberOrganisationParticipation;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberParticipation;

import java.time.ZonedDateTime;

public class PrescriptionRequestContextImpl implements PrescriptionRequestContext {
    private SubjectOfCareParticipant subjectOfCare;
    private DispenserParticipation dispenser;
    private DispensingOrganisationParticipation dispensingOrganisation;
    private PrescriberParticipation prescriber;
    private PrescriberOrganisationParticipation prescriberOrganisation;
    private PrescriptionRequestIdentifier prescriptionRequestIdentifier;
    private ZonedDateTime dateTimePrescriptionRequestWritten;

    public PrescriptionRequestContextImpl(SubjectOfCareParticipant subjectOfCare,
                                          DispenserParticipation dispenser,
                                          DispensingOrganisationParticipation dispensingOrganisation,
                                          PrescriberParticipation prescriber,
                                          PrescriberOrganisationParticipation prescriberOrganisation,
                                          PrescriptionRequestIdentifier prescriptionRequestIdentifier,
                                          ZonedDateTime dateTimePrescriptionRequestWritten) {

        ArgumentUtils.checkNotNull(subjectOfCare, "subjectOfCare");
        ArgumentUtils.checkNotNull(dispenser, "dispenser");
        ArgumentUtils.checkNotNull(dispensingOrganisation, "dispensingOrganisation");
        ArgumentUtils.checkNotNull(prescriber, "prescriber");
        ArgumentUtils.checkNotNull(prescriberOrganisation, "prescriberOrganisation");
        ArgumentUtils.checkNotNull(prescriptionRequestIdentifier, "prescriptionRequestIdentifier");
        ArgumentUtils.checkNotNull(dateTimePrescriptionRequestWritten, "dateTimePrescriptionRequestWritten");
        this.subjectOfCare = subjectOfCare;
        this.dispenser = dispenser;
        this.dispensingOrganisation = dispensingOrganisation;
        this.prescriber = prescriber;
        this.prescriberOrganisation = prescriberOrganisation;
        this.prescriptionRequestIdentifier = prescriptionRequestIdentifier;
        this.dateTimePrescriptionRequestWritten = dateTimePrescriptionRequestWritten;
    }

    public SubjectOfCareParticipant getSubjectOfCare() {
        return subjectOfCare;
    }

    public DispenserParticipation getDispenser() {
        return dispenser;
    }

    public DispensingOrganisationParticipation getDispensingOrganisation() {
        return dispensingOrganisation;
    }

    public PrescriberParticipation getPrescriber() {
        return prescriber;
    }

    public PrescriberOrganisationParticipation getPrescriberOrganisation() {
        return prescriberOrganisation;
    }

    public PrescriptionRequestIdentifier getPrescriptionRequestIdentifier() {
        return prescriptionRequestIdentifier;
    }

    public ZonedDateTime getDateTimePrescriptionRequestWritten() {
        return dateTimePrescriptionRequestWritten; //clone
    }
}
