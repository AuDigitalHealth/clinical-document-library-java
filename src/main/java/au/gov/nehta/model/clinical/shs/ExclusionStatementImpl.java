package au.gov.nehta.model.clinical.shs;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;

/**
 * Statements that positively assert that the patient does not have the problem or diagnosis.
 */
public class ExclusionStatementImpl implements ExclusionStatement {

    /* Used with Specialist Letter. */
    private Coded globalStatement;

    /* Used with EventSummary, SharedHealthSummary. */
    private Coded exclusionStatement;

    private UniqueIdentifier id = UniqueIdentifierImpl.random();

    public ExclusionStatementImpl() {
    }

    /*
    * The statement about the absence or exclusion of a data item.
    * Usually an NCTISGlobalStatement code.
    */
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

    /*
    * The statement about the absence or exclusion of a data item.
    * Usually an NCTISGlobalStatement code.
    */
    @Override
    public Coded getExclusionStatement() {
        return exclusionStatement;
    }

    @Override
    public void setExclusionStatement(Coded exclusionStatement) {
        this.exclusionStatement = exclusionStatement;
    }

    /**
    * A random UUID unless explicitly set.
    */
    @Override
    public UniqueIdentifier getID() {
        return id;
    }


    /**
    * The technical identifier for the exclusion statement. A random UUID unless explicitly set by
    * this method.
    */
    public void setID(UniqueIdentifier id) {
        this.id = id;
    }
}
