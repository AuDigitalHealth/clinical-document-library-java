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

import java.util.List;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.code.Code;

public class PositionInOrganisationImpl implements PositionInOrganisation {
	private boolean isCoded;
	private String uncodedValue;
	private ANZSCO_1ED_2006 codedValue;

	PositionInOrganisationImpl( String uncodedValue ) {
		ArgumentUtils.checkNotNull( uncodedValue, "uncodedValue" );
		this.isCoded = false;
		this.uncodedValue = uncodedValue;
	}

	PositionInOrganisationImpl( ANZSCO_1ED_2006 codedValue ) {
		ArgumentUtils.checkNotNull( codedValue, "codedValue" );
		this.isCoded = true;
		this.codedValue = codedValue;
	}

	public boolean isCoded() {
		return isCoded;
	}

	public String getUncodedValue() {
		return uncodedValue;
	}

	public String getOriginalText() {
		return codedValue.getDescriptor();
	}

	public String getCode() {
		return codedValue.getCode();
	}

	public String getCodeSystem() {
		return CODE_SYSTEM;
	}

	public String getCodeSystemName() {
		return CODE_SYSTEM_NAME;
	}

	public String getCodeSystemVersion() {
		return CODE_SYSTEM_VERSION;
	}

	public String getDisplayName() {
		return codedValue.getDescriptor();
	}
	
	 @Override
    public List<Code> getTranslations() {
        return codedValue.getTranslations();
    }
}
