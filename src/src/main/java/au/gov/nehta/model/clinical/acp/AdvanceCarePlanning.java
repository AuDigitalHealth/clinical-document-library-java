package au.gov.nehta.model.clinical.acp;

public interface AdvanceCarePlanning {
  AdvanceCarePlanningContext getContext();

  void setContext(AdvanceCarePlanningContext context);

  AdvanceCarePlanningContent getContent();

  void setContent(AdvanceCarePlanningContent content);

}
