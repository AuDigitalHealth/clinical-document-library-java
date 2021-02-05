package au.gov.nehta.model.clinical.acp;

public class AdvanceCarePlanningImpl implements AdvanceCarePlanning {

    private AdvanceCarePlanningContext context;
    private AdvanceCarePlanningContent content;

    @Override
    public AdvanceCarePlanningContext getContext() {
        return context;
    }

    @Override
    public void setContext(AdvanceCarePlanningContext context) {
        this.context = context;
    }

    @Override
    public AdvanceCarePlanningContent getContent() {
        return content;
    }

    @Override
    public void setContent(AdvanceCarePlanningContent content) {
        this.content = content;
    }
}
