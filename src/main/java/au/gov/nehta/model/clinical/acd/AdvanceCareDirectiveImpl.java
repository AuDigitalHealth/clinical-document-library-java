package au.gov.nehta.model.clinical.acd;

public class AdvanceCareDirectiveImpl implements AdvanceCareDirective {

  AdvanceCareDirectiveContext context;
  AdvanceCareDirectiveContent content;

  @Override
  public AdvanceCareDirectiveContext getContext() {
    return context;
  }

  @Override
  public void setContext(AdvanceCareDirectiveContext context) {
    this.context = context;
  }

  @Override
  public AdvanceCareDirectiveContent getContent() {
    return content;
  }

  @Override
  public void setContent(AdvanceCareDirectiveContent content) {
    this.content = content;
  }
}
