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

public interface Person {
    List<PersonName> getPersonName();

// RelationshipToSubjectOfCare getRelationshipToSubjectOfCare();

// EmploymentDetail getEmploymentDetail();

    // DemographicData getDemographicData();

// void setRelationshipToSubjectOfCare( RelationshipToSubjectOfCare relationshipToSubjectOfCare );

// void setEmploymentDetail( EmploymentDetail employmentDetail );

    // void setDemographicData( DemographicData demographicData );
}
