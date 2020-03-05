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

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.clinical.common.SubjectOfCareParticipant;
import au.gov.nehta.model.clinical.etp.common.item.Logo;

public class  PathologyReportContextImpl implements PathologyReportContext {

	private SubjectOfCareParticipant subjectOfCare;
	private RequesterParticipation requester;
	private DocumentParticipant author;
	private OrderDetails order;
	private Logo logo;
	
	public PathologyReportContextImpl( 
			SubjectOfCareParticipant subjectOfCare, RequesterParticipation requesterParticipation, DocumentParticipant author, OrderDetails order	) {
		ArgumentUtils.checkNotNull( subjectOfCare, "subjectOfCare" );
		ArgumentUtils.checkNotNull( requesterParticipation, "requester" );
		ArgumentUtils.checkNotNull( author, "DocumentParticipant" );
		ArgumentUtils.checkNotNull( order, "OrderDetails" );
		this.subjectOfCare = subjectOfCare;
		this.requester = requesterParticipation;
		this.author = author;
		this.order=order;
	}
	
	@Override
	public SubjectOfCareParticipant getSubjectOfCare() {
		return subjectOfCare;
	}
	 
	@Override
	public RequesterParticipation getRequester() {
		return requester;
	}

    @Override
    public DocumentParticipant getAuthor() {
        return author;
    }

    @Override
    public OrderDetails getOrderDetails() {
        return order;
    }

    @Override
    public Logo getLogo() {
        return logo;
    }

    @Override
    public void setLogo( Logo logo ) {
        this.logo=logo;
    }
    

}
