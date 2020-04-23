package au.gov.nehta.builder.ereferral;

import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;

public class ReferralDocumentImpl implements ReferralDocument {
	private UniqueIdentifier id = UniqueIdentifierImpl.random();
	private AttachedMedia attachment;
	
	
	public ReferralDocumentImpl(AttachedMedia attachment) {
		this.attachment=attachment;
	}
	
	/**
	 * A random UUID unless explicitly set
	 */
	@Override
	public UniqueIdentifier getDocumentID() {
		return id;
	}
	
	
	public void setDocumentID(UniqueIdentifier id){
		this.id= id;
	}

	@Override
	public AttachedMedia getAttachement() {
		return attachment;
	}

}
