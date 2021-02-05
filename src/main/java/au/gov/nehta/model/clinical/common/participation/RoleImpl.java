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

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.code.CodeImpl;
import au.gov.nehta.model.cda.common.code.Coded;

public class RoleImpl implements Role {
    private Coded code;

    public RoleImpl() {

    }

    public RoleImpl(String uncodedValue) {
        CodeImpl c = new CodeImpl();
        c.setOriginalText(uncodedValue);
        this.code = c;
    }

    public RoleImpl(Coded code) {
        this.code = code;
    }

    public RoleImpl(ANZSCO_1ED_2006 codedValue) {
        ArgumentUtils.checkNotNull(codedValue, "codedValue");
        this.code = codedValue;
    }

    public RoleImpl(OccupationImpl codedValue) {
        ArgumentUtils.checkNotNull(codedValue, "codedValue");
        this.code = codedValue;
    }

    @Override
    public Coded getCode() {
        return code;
    }
}
