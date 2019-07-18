package au.gov.nehta.builder.ereferral;

import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.etp.common.item.AttachedMedia;

public interface ReferralDocument {
	public UniqueIdentifier getDocumentID();
	public AttachedMedia getAttachement();
}
