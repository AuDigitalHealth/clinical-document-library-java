package au.gov.nehta.model.clinical.common;

import au.gov.nehta.model.cda.common.code.Coded;


/**
 * Statements that positively assert that the patient does not have the problem or diagnosis.
 */
public class ExclusionStatementImpl implements ExclusionStatement {

  private Coded globalStatement;
  private Coded exclusionStatement;


  public ExclusionStatementImpl() {
  }

  public ExclusionStatementImpl(Coded exclusionStatement) {
    this.exclusionStatement = exclusionStatement;
  }

  @Override
  public Coded getGlobalStatement() {
    return globalStatement;
  }

  @Override
  public void setGlobalStatement(Coded globalStatement) {
    this.globalStatement = globalStatement;
  }

  @Override
  public Coded getExclusionStatement() {
    return exclusionStatement;
  }

  @Override
  public void setExclusionStatement(Coded exclusionStatement) {
    this.exclusionStatement = exclusionStatement;
  }

}
