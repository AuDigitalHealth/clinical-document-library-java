package au.gov.nehta.model.clinical.sl;

import au.gov.nehta.model.cda.common.code.Coded;

public class Procedure {
    private Coded procedureName;

    public Coded getProcedureName() {
        return procedureName;
    }

    public void setProcedureName(Coded procedureName) {
        this.procedureName = procedureName;
    }
}
