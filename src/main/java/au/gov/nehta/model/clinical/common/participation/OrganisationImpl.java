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

import java.util.UUID;

import au.gov.nehta.common.utils.ArgumentUtils;

public class OrganisationImpl implements Organisation {
	private String organisationName;
	private String departmentUnit;
	private OrganisationNameUsage organisationNameUsage;
	private String id = UUID.randomUUID().toString();
	
	
	public OrganisationImpl( String organisationName ) {
		ArgumentUtils.checkNotNull( organisationName, "organisationName" );
		this.organisationName = organisationName;
	}
	public OrganisationImpl( String organisationName,OrganisationNameUsage organisationNameUsage ) {
        ArgumentUtils.checkNotNull( organisationName, "organisationName" );
        ArgumentUtils.checkNotNull( organisationNameUsage, "organisationNameUsage" );
        this.organisationName = organisationName;
        this.organisationNameUsage=organisationNameUsage;
    }

	public String getOrganisationName() {
		return organisationName;
	}

	public String getDepartmentUnit() {
		return departmentUnit;
	}

	public OrganisationNameUsage getOrganisationNameUsage() {
		return organisationNameUsage;
	}

	public void setDepartmentUnit( String departmentUnit ) {
		ArgumentUtils.checkNotNull( departmentUnit, "departmentUnit" );
		this.departmentUnit = departmentUnit;
	}

	public void setOrganisationNameUsage( OrganisationNameUsage organisationNameUsage ) {
		ArgumentUtils.checkNotNull( organisationNameUsage, "organisationNameUsage" );
		this.organisationNameUsage = organisationNameUsage;
	}

	public String getId() {
		return id;
	}

	public void setId( String id ) {
		this.id = id;
	}
}
