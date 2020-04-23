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

import java.util.Collections;
import java.util.List;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.code.Code;

public class EntitlementTypeImpl implements EntitlementType {
	private String uncodedValue;
	private boolean isCoded;

	EntitlementTypeImpl( String uncodedValue ) {
		ArgumentUtils.checkNotNull( uncodedValue, "uncodedValue" );
		this.isCoded = false;
		this.uncodedValue = uncodedValue;
	}

	public boolean isCoded() {
		return isCoded;
	}

	public String getUncodedValue() {
		return uncodedValue;
	}

	public String getOriginalText() {
		throw new UnsupportedOperationException();
	}

	public String getCode() {
		throw new UnsupportedOperationException();
	}

	public String getCodeSystem() {
		throw new UnsupportedOperationException();
	}

	public String getCodeSystemName() {
		throw new UnsupportedOperationException();
	}

	public String getCodeSystemVersion() {
		throw new UnsupportedOperationException();
	}

	public String getDisplayName() {
		throw new UnsupportedOperationException();
	}

    @Override
    public List<Code> getTranslations() {
        return Collections.emptyList();
    }
}
