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
import au.gov.nehta.model.clinical.etp.common.item.Logo;
import au.gov.nehta.model.clinical.etp.eprescription.PrescriptionItem;

public class PrescriptionRequestContentImpl implements PrescriptionRequestContent {
    private PrescriberInstructionDetail prescriberInstructionDetail;
    private PrescriptionItem prescriptionRequestItem;
    private RequesterNote requesterNote;
    private Logo logo;

    public PrescriptionRequestContentImpl(PrescriberInstructionDetail prescriberInstructionDetail, PrescriptionItem prescriptionRequestItem) {

        ArgumentUtils.checkNotNull(prescriberInstructionDetail, "prescriberInstructionDetail");
        ArgumentUtils.checkNotNull(prescriptionRequestItem, "prescriptionRequestItem");
        if (!prescriptionRequestItem.isRequestItem())
            throw new IllegalArgumentException("Only a PrescriptionItem built as a prescriptionRequestItem  may be supplied to PrescriptionRequestContent");
        this.prescriberInstructionDetail = prescriberInstructionDetail;
        this.prescriptionRequestItem = prescriptionRequestItem;
    }

    public PrescriberInstructionDetail getPrescriberInstructionDetail() {
        return prescriberInstructionDetail;
    }

    public PrescriptionItem getPrescriptionRequestItem() {
        return prescriptionRequestItem;
    }

    public RequesterNote getRequesterNote() {
        if (this.requesterNote == null) {
            throw new IllegalStateException();
        }
        return this.requesterNote;
    }

    public void setRequesterNote(RequesterNote requesterNote) {
        ArgumentUtils.checkNotNull(requesterNote, "requesterNote");
        this.requesterNote = requesterNote;
    }

    /**
     * @return the logo
     */
    public Logo getLogo() {
        return logo;
    }

    /**
     * @param logo the logo to set
     */
    public void setLogo(Logo logo) {
        this.logo = logo;
    }

    public boolean hasRequesterNote() {
        return this.requesterNote != null;
    }
}
