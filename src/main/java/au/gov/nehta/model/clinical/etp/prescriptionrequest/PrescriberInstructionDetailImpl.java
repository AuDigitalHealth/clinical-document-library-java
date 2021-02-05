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

import java.time.ZonedDateTime;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.clinical.etp.common.participation.PrescriberInstructionRecipientParticipation;

public class PrescriberInstructionDetailImpl implements PrescriberInstructionDetail {
    private PrescriberInstructionRecipientParticipation prescriberInstructionRecipient;
    private ZonedDateTime dateTimePrescriberInstructionReceived;
    private String prescriberInstruction;
    private PrescriberInstructionSource prescriberInstructionSource;
    private PrescriberInstructionCommunicationMedium prescriberInstructionCommunicationMedium;

    public PrescriberInstructionDetailImpl(PrescriberInstructionRecipientParticipation prescriberInstructionRecipient,
                                           ZonedDateTime dateTimePrescriberInstructionReceived,
                                           String prescriberInstruction,
                                           PrescriberInstructionSource prescriberInstructionSource,
                                           PrescriberInstructionCommunicationMedium prescriberInstructionCommunicationMedium) {

        ArgumentUtils.checkNotNull(prescriberInstructionRecipient, "prescriberInstructionRecipient");
        ArgumentUtils.checkNotNull(dateTimePrescriberInstructionReceived, "dateTimePrescriberInstructionReceived");
        ArgumentUtils.checkNotNull(prescriberInstruction, "prescriberInstruction");
        ArgumentUtils.checkNotNull(prescriberInstructionSource, "prescriberInstructionSource");
        ArgumentUtils.checkNotNull(prescriberInstructionCommunicationMedium, "prescriberInstructionCommunicationMedium");
        this.prescriberInstructionRecipient = prescriberInstructionRecipient;
        this.dateTimePrescriberInstructionReceived = dateTimePrescriberInstructionReceived;
        this.prescriberInstruction = prescriberInstruction;
        this.prescriberInstructionSource = prescriberInstructionSource;
        this.prescriberInstructionCommunicationMedium = prescriberInstructionCommunicationMedium;
    }

    public PrescriberInstructionRecipientParticipation getPrescriberInstructionRecipient() {
        return prescriberInstructionRecipient;
    }

    public ZonedDateTime getDateTimePrescriberInstructionReceived() {
        return dateTimePrescriberInstructionReceived;
    }

    public String getPrescriberInstruction() {
        return prescriberInstruction;
    }

    public PrescriberInstructionSource getPrescriberInstructionSource() {
        return prescriberInstructionSource;
    }

    public PrescriberInstructionCommunicationMedium getPrescriberInstructionCommunicationMedium() {
        return prescriberInstructionCommunicationMedium;
    }
}
