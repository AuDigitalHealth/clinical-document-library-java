package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;

public class ProcedureImpl implements Procedure {

  private boolean showOngoingNarrative;
  private Coded procedureName;
  private RestrictedTimeInterval procedureDateTime;
  private String comment;

  @Override
  public boolean isShowOngoingInNarrative() {
    return showOngoingNarrative;
  }

  @Override
  public Coded getProcedureName() {
    return procedureName;
  }

  @Override
  public void setProcedureName(Coded procedureName) {
    this.procedureName = procedureName;
  }

  @Override
  public RestrictedTimeInterval getProcedureDateTime() {
    return procedureDateTime;
  }

  @Override
  public void setProcedureDateTime(
      RestrictedTimeInterval procedureDateTime) {
    this.procedureDateTime = procedureDateTime;
  }

  @Override
  public String getComment() {
    return comment;
  }

  @Override
  public void setComment(String comment) {
    this.comment = comment;
  }

  @Override
  public void setShowOngoingNarrative(boolean showOngoingNarrative) {
    this.showOngoingNarrative = showOngoingNarrative;
  }
}
