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

package au.gov.nehta.model.clinical.diagnostic.imaging;

import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;
import au.gov.nehta.model.clinical.diagnostic.pathology.DocumentParticipant;
import au.gov.nehta.model.clinical.diagnostic.pathology.RequesterParticipation;
import au.gov.nehta.model.clinical.etp.common.item.Logo;

public interface DiagnosticImageReportContext {
    public SubjectOfCareParticipant getSubjectOfCare();
    public RequesterParticipation getRequester();
    public DiagnosticImageOrderDetails getOrderDetails();
    
    public DocumentParticipant getAuthor();
     public Logo getLogo();
     public void setLogo(Logo logo);

}
