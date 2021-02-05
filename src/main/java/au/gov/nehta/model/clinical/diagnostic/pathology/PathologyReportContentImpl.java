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

package au.gov.nehta.model.clinical.diagnostic.pathology;

import java.util.List;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;

public class PathologyReportContentImpl implements PathologyReportContent {
    private List<PathologyResult> pathologyResults;
    private UniqueIdentifier id = UniqueIdentifierImpl.random();
    private ReportDocument doc;
    private DocumentParticipant author;

    public PathologyReportContentImpl(List<PathologyResult> pathologyResults, ReportDocument doc, DocumentParticipant author) {
        ArgumentUtils.checkNotNullNorEmpty(pathologyResults, "pathologyResults");
        ArgumentUtils.checkNotNull(doc, "Document");
        ArgumentUtils.checkNotNull(author, "Author");
        this.pathologyResults = pathologyResults;
        this.doc = doc;
        this.author = author;
    }

    @Override
    public List<PathologyResult> getPathologyResults() {
        return pathologyResults;
    }

    @Override
    public UniqueIdentifier getId() {
        return id;
    }

    /**
     * Set the ID for the Pathology Section of the CDA document.
     * If not explicitly set this will become a random UUID.
     *
     * @param id UniqueIdentifier for the id of the Pathology section.
     */
    public void setId(UniqueIdentifier id) {
        this.id = id;
    }

    @Override
    public ReportDocument getRelatedDocument() {
        return doc;
    }

    @Override
    public DocumentParticipant getReportingPathologist() {
        return author;
    }
}
