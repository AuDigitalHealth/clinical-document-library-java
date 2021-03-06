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
import au.gov.nehta.model.cda.common.prescription.Observations;
import au.gov.nehta.model.clinical.etp.common.item.Logo;

public class EPrescriptionContentImpl implements EPrescriptionContent {

    private PrescriptionItem prescriptionItem;
    private Observations observations;
    private PrescriptionNoteDetail prescriptionNoteDetail;
    private Logo logo;

    public EPrescriptionContentImpl(PrescriptionItem prescriptionItem) {
        ArgumentUtils.checkNotNull(prescriptionItem, "prescriptionItem");
        this.prescriptionItem = prescriptionItem;
    }

    public PrescriptionItem getPrescriptionItem() {
        return prescriptionItem;
    }

    public Observations getObservations() {
        return observations;
    }

    public PrescriptionNoteDetail getPrescriptionNoteDetail() {
        return this.prescriptionNoteDetail;
    }

    public void setObservations(Observations observations) {
        this.observations = observations;
    }

    public void setPrescriptionNoteDetail(PrescriptionNoteDetail prescriptionNoteDetail) {
        this.prescriptionNoteDetail = prescriptionNoteDetail;
    }

    public boolean hasObservations() {
        return this.observations != null;
    }

    public boolean hasPrescriptionNoteDetail() {
        return this.prescriptionNoteDetail != null;
    }

    @Override
    public Logo getLogo() {
        return logo;
    }

    @Override
    public void setLogo(Logo logo) {
        ArgumentUtils.checkNotNull(logo, "prescription item logo");
        this.logo = logo;
    }
}
