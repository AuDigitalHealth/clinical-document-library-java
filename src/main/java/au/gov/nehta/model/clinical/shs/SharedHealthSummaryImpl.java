package au.gov.nehta.model.clinical.shs;

import au.gov.nehta.common.utils.ArgumentUtils;

/**
 * A class that implements the CDA Shared Health Summary Clinical Document model.
*
*/
public class SharedHealthSummaryImpl implements SharedHealthSummary {

    protected SharedHealthSummaryContext context;
    protected SharedHealthSummaryContent content;

    public SharedHealthSummaryImpl(SharedHealthSummaryContext context, SharedHealthSummaryContent content){

        ArgumentUtils.checkNotNull(context, "context");
        ArgumentUtils.checkNotNull(content, "content");
        
        this.content = content;
        this.context = context;
    }

    @Override
    public SharedHealthSummaryContext getContext() {
        return context;
    }

    @Override
    public SharedHealthSummaryContent getContent() {
        return content;
    }
}
