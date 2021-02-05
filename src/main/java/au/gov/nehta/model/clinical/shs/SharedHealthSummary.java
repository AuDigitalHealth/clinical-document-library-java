package au.gov.nehta.model.clinical.shs;

/**
 * An interface that models the CDA Shared Health Summary Clinical Document.
 */
public interface SharedHealthSummary {

    SharedHealthSummaryContext getContext();

    SharedHealthSummaryContent getContent();
}
