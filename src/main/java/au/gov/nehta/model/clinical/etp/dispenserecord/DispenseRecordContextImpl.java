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

package au.gov.nehta.model.clinical.etp.dispenserecord;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;
import au.gov.nehta.model.clinical.etp.common.item.Logo;
import au.gov.nehta.model.clinical.etp.common.participation.DispenserParticipation;
import au.gov.nehta.model.clinical.etp.common.participation.DispensingOrganisationParticipation;

public class DispenseRecordContextImpl implements DispenseRecordContext {

    private final SubjectOfCareParticipant subjectOfCare;
    private final DispenserParticipation dispenser;
    private DispensingOrganisationParticipation dispensingOrganisation;
    private Logo logo;

    public DispenseRecordContextImpl(SubjectOfCareParticipant subjectOfCare, DispenserParticipation dispenser, DispensingOrganisationParticipation dispensingOrganisation) {
        ArgumentUtils.checkNotNull(subjectOfCare, "subjectOfCare");
        ArgumentUtils.checkNotNull(dispenser, "dispenser");
        ArgumentUtils.checkNotNull(dispensingOrganisation, "dispensingOrganisation");
        this.subjectOfCare = subjectOfCare;
        this.dispenser = dispenser;
        this.dispensingOrganisation = dispensingOrganisation;
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

    public void setLogo(Logo logo) {
        this.logo = logo;
    }

    @Override
    public Logo getLogo() {
        return logo;
    }
}
