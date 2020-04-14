package au.gov.nehta.model.clinical.diagnostic.imaging;

import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.diagnostic.pathology.OrderDetails;

public interface DiagnosticImageOrderDetails extends OrderDetails {
	public UniqueIdentifier getAccessionNumber();
	
}
