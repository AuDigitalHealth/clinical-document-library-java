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

public class PersonNameImpl implements PersonName {
	private List<String> nameTitle = new ArrayList<String>(1);
	private String familyName;
	private List<String> givenName =  new ArrayList<String>(2);
	private List<String> nameSuffix = new ArrayList<String>(1);
	private Boolean preferredNameIndicator;
	private List<PersonNameUsage> personNameUsage = new ArrayList<PersonNameUsage>(1);

	public PersonNameImpl( String familyName ) {
		ArgumentUtils.checkNotNull( familyName, "familyName" );
		this.familyName = familyName;
	}

	public static PersonName createPersonName( String familyName ) {
		return  new PersonNameImpl( familyName );
	}

	public static PersonName getInstance( String family, String given, String prefix, String suffix, PersonNameUsage use ) {
		PersonNameImpl name = new PersonNameImpl( family );
		name.addGivenName( given );
		name.addNameTitle( prefix );
		name.addNameSuffix( suffix );
		name.addPersonNameUsage( use );
		return  name;
	}

	public static PersonName getInstance( String family, String given, String prefix, PersonNameUsage use ) {
		PersonNameImpl name = new PersonNameImpl( family );
		name.addGivenName( given );
		name.addNameTitle( prefix );
		name.addPersonNameUsage( use );
		return name;
	}

	public static PersonName getInstance( String family, String given, PersonNameUsage use ) {
		PersonNameImpl name = new PersonNameImpl( family );
		name.addGivenName( given );
		name.addPersonNameUsage( use );
		return name;
	}

	public List<String> getNameTitle() {
		return nameTitle;
	}

	public String getFamilyName() {
		return familyName;
	}

	public List<String> getGivenName() {
		return givenName;
	}

	public List<String> getNameSuffix() {
		return nameSuffix;
	}

	public Boolean getPreferredNameIndicator() {
		return preferredNameIndicator;
	}

	public List<PersonNameUsage> getPersonNameUsage() {
		return personNameUsage;
	}

	public void setNameTitle( List<String> nameTitle ) {
		ArgumentUtils.checkNotNull( nameTitle, "nameTitle" );
		this.nameTitle = nameTitle;
	}

	public void addNameTitle( String nameTitle ) {
		ArgumentUtils.checkNotNullNorBlank( nameTitle, "nameTitle" );
		this.nameTitle.add( nameTitle );
	}

	public void setGivenName( List<String> givenName ) {
		ArgumentUtils.checkNotNull( givenName, "givenName" );
		this.givenName = givenName;
	}

	public void addGivenName( String givenName ) {
		ArgumentUtils.checkNotNullNorBlank( givenName, "givenName" );
		this.givenName.add( givenName );
	}

	public void setNameSuffix( List<String> nameSuffix ) {
		ArgumentUtils.checkNotNull( nameSuffix, "nameSuffix" );
		this.nameSuffix = nameSuffix;
	}

	public void addNameSuffix( String nameSuffix ) {
		ArgumentUtils.checkNotNullNorBlank( nameSuffix, "nameSuffix" );
		this.nameSuffix.add( nameSuffix );
	}

	public void setPreferredNameIndicator( Boolean preferredNameIndicator ) {
		ArgumentUtils.checkNotNull( preferredNameIndicator, "preferredNameIndicator" );
		this.preferredNameIndicator = preferredNameIndicator;
	}
 

    @Override
    public void setPersonNameUsage( List<PersonNameUsage> personNameUsages ) {
        ArgumentUtils.checkNotNullNorEmpty( personNameUsages, "personNameUsages" );
        this.personNameUsage = personNameUsages;
    }

    @Override
    public void addPersonNameUsage( PersonNameUsage personNameUsage ) {
        ArgumentUtils.checkNotNull( personNameUsage, "personNameUsage" );
        this.personNameUsage.add( personNameUsage );
    }
        
    
}
