package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.RestrictedTimeInterval;

public interface Procedure {

  boolean isShowOngoingInNarrative();

  Coded getProcedureName();

  void setProcedureName(Coded procedureName);

  RestrictedTimeInterval getProcedureDateTime();

  void setProcedureDateTime(
      RestrictedTimeInterval procedureDateTime);

  String getComment();

  void setComment(String comment);

  void setShowOngoingNarrative(boolean showOngoingNarrative);
}
