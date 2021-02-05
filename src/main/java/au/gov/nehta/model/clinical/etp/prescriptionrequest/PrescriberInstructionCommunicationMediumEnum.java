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

public enum PrescriberInstructionCommunicationMediumEnum {
    PHONE("1", "phone"),
    FAX("2", "fax"),
    EMAIL("3", "email"),
    FACE_TO_FACE("4", "face-to-face");

    private final String code;
    private final String descriptor;

    PrescriberInstructionCommunicationMediumEnum(String code, String descriptor) {
        this.code = code;
        this.descriptor = descriptor;
    }

    public String getCode() {
        return code;
    }

    public String getDescriptor() {
        return descriptor;
    }
}
