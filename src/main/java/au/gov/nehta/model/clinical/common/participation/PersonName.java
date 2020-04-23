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

public interface PersonName {
	public List<String> getNameTitle();

	public String getFamilyName();

	public List<String> getGivenName();

	public 	List<String> getNameSuffix();

	public Boolean getPreferredNameIndicator();

	public List<PersonNameUsage> getPersonNameUsage();

	public void setNameTitle( List<String> nameTitle );

	public void addNameTitle( String nameTitle );

	public void setGivenName( List<String> givenName );

	public void addGivenName( String givenName );

	public void setNameSuffix( List<String> nameSuffix );

	public void addNameSuffix( String nameSuffix );

	public void setPreferredNameIndicator( Boolean preferredNameIndicator );

	public void setPersonNameUsage( List<PersonNameUsage> personNameUsage );
	public void addPersonNameUsage( PersonNameUsage personNameUsage );
}
