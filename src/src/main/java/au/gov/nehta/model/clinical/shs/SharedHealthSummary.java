package au.gov.nehta.model.clinical.shs;


/**
 * An interface that models the CDA  Shared Health Summary Clinical Document
 *
 */
public interface SharedHealthSummary {
	public SharedHealthSummaryContext getContext();
	public SharedHealthSummaryContent getContent();
}
