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

package au.gov.nehta.model.clinical.etp.prescriptionrequest;

import au.gov.nehta.common.utils.ArgumentUtils;

public class PrescriptionRequestImpl implements PrescriptionRequest {
	private PrescriptionRequestContext context;
	private PrescriptionRequestContent content;

	public PrescriptionRequestImpl( PrescriptionRequestContext context, PrescriptionRequestContent content ) {
		ArgumentUtils.checkNotNull( context, "context" );
		ArgumentUtils.checkNotNull( content, "content" );
		this.context = context;
		this.content = content;
	}

	public PrescriptionRequestContext getContext() {
		return context;
	}

	public PrescriptionRequestContent getContent() {
		return content;
	}
}
