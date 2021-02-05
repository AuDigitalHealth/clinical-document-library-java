package au.gov.nehta.model.clinical.acd;

public interface AdvanceCareDirective {

    AdvanceCareDirectiveContext getContext();

    void setContext(AdvanceCareDirectiveContext context);

    AdvanceCareDirectiveContent getContent();

    void setContent(AdvanceCareDirectiveContent content);
}
