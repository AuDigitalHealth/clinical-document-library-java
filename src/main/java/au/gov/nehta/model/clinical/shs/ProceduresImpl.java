package au.gov.nehta.model.clinical.shs;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.code.NCTISGlobalStatement;
import au.gov.nehta.model.clinical.common.Procedure;

import java.util.List;

/**
 * A clinical activity carried out for therapeutic, evaluative, investigative,
 * screening or diagnostic purposes.
 */
public class ProceduresImpl extends ExclusionStatementImpl implements Procedures {

    private List<Procedure> procedures;

    /*
     * The statement about the absence or exclusion of a data item Usually an
     * NCTISGlobalStatement code.
     */
    public ProceduresImpl(Coded exclusionStatement) {
        super(exclusionStatement);
    }

    /*
     * Convenience method for the likely case.
     */
    public static Procedures noneKnown() {
        return new ProceduresImpl(NCTISGlobalStatement.NONE_KNOWN);
    }

    /**
     * 
     * @param procedures
     *            list of clinical activities carried out for therapeutic,
     *            evaluative, investigative, screening or diagnostic purposes.
     */
    public ProceduresImpl(List<Procedure> procedures) {
        ArgumentUtils.checkNotNullNorEmpty(procedures, "procedures");
        this.procedures = procedures;
    }

    /**
     * A clinical activity carried out for therapeutic, evaluative,
     * investigative, screening or diagnostic purposes.
     */
    @Override
    public List<Procedure> getProcedures() {
        return procedures;
    }
}
