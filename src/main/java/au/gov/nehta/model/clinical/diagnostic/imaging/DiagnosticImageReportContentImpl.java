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

import java.util.List;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;
import au.gov.nehta.model.clinical.diagnostic.pathology.DocumentParticipant;
import au.gov.nehta.model.clinical.diagnostic.pathology.ReportDocument;

public class DiagnosticImageReportContentImpl implements DiagnosticImageReportContent {
    private List<ImagingExaminationResult> imagingResults;
    // private AuthorisationToPost authorisationToPost;
    private UniqueIdentifier id = UniqueIdentifierImpl.random();
    private ReportDocument doc;
    private DocumentParticipant reportingRadiologist;
//      
//    public DiagnosticImageReportContentImpl(List<ImagingExaminationResult> imagingResults, ReportDocument doc, DocumentParticipant reportingRadiologist /*, AuthorisationToPost authorisationToPost */) {
//        ArgumentUtils.checkNotNullNorEmpty( imagingResults, " imagingResults" );
//        ArgumentUtils.checkNotNull( authorisationToPost, "AuthorisationToPost" );
//        ArgumentUtils.checkNotNull( doc, " Document" );
//        ArgumentUtils.checkNotNull( reportingRadiologist, "reportingRadiologist" );
//        this.imagingResults = imagingResults;
//       // this.authorisationToPost = authorisationToPost;
//        this.doc = doc;
//        this.reportingRadiologist = reportingRadiologist;
//
//    }

    public DiagnosticImageReportContentImpl(List<ImagingExaminationResult> imagingResults, ReportDocument doc, DocumentParticipant reportingRadiologist) {
        ArgumentUtils.checkNotNullNorEmpty(imagingResults, "imagingResults");
        ArgumentUtils.checkNotNull(doc, "Document");
        ArgumentUtils.checkNotNull(reportingRadiologist, " reportingRadiologist");
        this.imagingResults = imagingResults;
        this.doc = doc;
        this.reportingRadiologist = reportingRadiologist;
    }

    @Override
    public List<ImagingExaminationResult> getImagingExaminationResults() {
        return imagingResults;
    }

//    @Override
//    public AuthorisationToPost getAuthorisationToPost() {
//        return authorisationToPost;
//    }

    @Override
    public UniqueIdentifier getId() {
        return id;
    }

    /**
     * Set the ID for the Pathology Section of the CDA document.
     * If not explicitly set this will become a random UUID.
     *
     * @param id
     */
    public void setId(UniqueIdentifier id) {
        this.id = id;
    }

    @Override
    public ReportDocument getRelatedDocument() {
        return doc;
    }

    @Override
    public DocumentParticipant getReportingRadiologist() {
        return reportingRadiologist;
    }
}
