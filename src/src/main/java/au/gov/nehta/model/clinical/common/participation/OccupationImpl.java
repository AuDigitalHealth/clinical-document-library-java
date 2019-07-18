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
import au.gov.nehta.model.cda.common.code.Coded;

public final class OccupationImpl implements Occupation {
	private Boolean isCoded;
	private String uncodedValue;
	private Coded codedValue;

	public OccupationImpl( String uncodedValue ) {
		ArgumentUtils.checkNotNull( uncodedValue, "uncodedValue" );
		this.isCoded = false;
		this.uncodedValue = uncodedValue;
	}

	public OccupationImpl( ANZSCO_1ED_2006 codedValue ) {
		ArgumentUtils.checkNotNull( codedValue, "codedValue" );
		this.isCoded = true;
		this.codedValue = codedValue;
	}
	
	public OccupationImpl( Coded codedValue ) {
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
		return codedValue.getOriginalText();
	}

	public String getCode() {
		return codedValue.getCode();
	}
	
	public String getCodeSystem() {
		return codedValue.getCodeSystem();
	}

	public String getCodeSystemName() {
		return codedValue.getCodeSystemName();
	}

	public String getCodeSystemVersion() {
		return codedValue.getCodeSystemVersion();
	}

	public String getDisplayName() {
		return codedValue.getDisplayName();
	}

    @Override
    public List<Code> getTranslations() {
        return codedValue.getTranslations();
    }
}
