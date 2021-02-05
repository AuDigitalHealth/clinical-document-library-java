package au.gov.nehta.model.clinical.common;

import au.gov.nehta.model.cda.common.code.Coded;

public interface ExclusionStatement {

    Coded getGlobalStatement();

    void setGlobalStatement(Coded globalStatement);

    Coded getExclusionStatement();

    void setExclusionStatement(Coded exclusionStatement);
}
