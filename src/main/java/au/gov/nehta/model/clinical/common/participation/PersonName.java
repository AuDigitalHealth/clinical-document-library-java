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
    List<String> getNameTitle();

    String getFamilyName();

    List<String> getGivenName();

    List<String> getNameSuffix();

    Boolean getPreferredNameIndicator();

    List<PersonNameUsage> getPersonNameUsage();

    void setNameTitle(List<String> nameTitle);

    void addNameTitle(String nameTitle);

    void setGivenName(List<String> givenName);

    void addGivenName(String givenName);

    void setNameSuffix(List<String> nameSuffix);

    void addNameSuffix(String nameSuffix);

    void setPreferredNameIndicator(Boolean preferredNameIndicator);

    void setPersonNameUsage(List<PersonNameUsage> personNameUsage);

    void addPersonNameUsage(PersonNameUsage personNameUsage);
}
