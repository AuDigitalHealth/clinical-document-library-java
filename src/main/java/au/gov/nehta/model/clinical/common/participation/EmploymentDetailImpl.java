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

import java.util.ArrayList;
import java.util.List;

import au.gov.nehta.common.utils.ArgumentUtils;

public class EmploymentDetailImpl implements EmploymentDetail {
	private List<String> employerOrganisation;
	private EmploymentType employmentType;
	private List<Occupation> occupation;
	private PositionInOrganisation positionInOrganisation;

	EmploymentDetailImpl() {
	}

	public List<String> getEmployerOrganisation() {
		return employerOrganisation;
	}

	public EmploymentType getEmploymentType() {
		return employmentType;
	}

	public List<Occupation> getOccupation() {
		return occupation;
	}

	public PositionInOrganisation getPositionInOrganisation() {
		return positionInOrganisation;
	}

	public void addEmployerOrganisation( String employerOrganisation ) {
		ArgumentUtils.checkNotNull( employerOrganisation, "employerOrganisation" );
		if (this.employerOrganisation == null) {
			this.employerOrganisation = new ArrayList<String>();
		}
		this.employerOrganisation.add( employerOrganisation );
	}

	public void addOccupation( Occupation occupation ) {
		ArgumentUtils.checkNotNull( occupation, "occupation" );
		if (this.occupation == null) {
			this.occupation = new ArrayList<Occupation>();
		}
		this.occupation.add( occupation );
	}

	public void setEmployerOrganisation( List<String> employerOrganisation ) {
		ArgumentUtils.checkNotNull( employerOrganisation, "employerOrganisation" );
		this.employerOrganisation = employerOrganisation;
	}

	public void setOccupation( List<Occupation> occupation ) {
		ArgumentUtils.checkNotNull( occupation, "occupation" );
		this.occupation = occupation;
	}

	public void setEmploymentType( EmploymentType employmentType ) {
		ArgumentUtils.checkNotNull( employmentType, "employmentType" );
		this.employmentType = employmentType;
	}

	public void setPositionInOrganisation( PositionInOrganisation positionInOrganisation ) {
		ArgumentUtils.checkNotNull( positionInOrganisation, "positionInOrganisation" );
		this.positionInOrganisation = positionInOrganisation;
	}
}
