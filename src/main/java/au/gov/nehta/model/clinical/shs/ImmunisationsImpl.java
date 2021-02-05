package au.gov.nehta.model.clinical.shs;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.code.NCTISGlobalStatement;
import au.gov.nehta.model.clinical.common.Immunisation;
import java.util.List;

/**
 * Information about the immunisation history of the subject of care.
 */
public class ImmunisationsImpl extends ExclusionStatementImpl implements Immunisations {

    private List<Immunisation> immunisations;

    /*
    * The statement about the absence or exclusion of a data item.
    * Usually an NCTISGlobalStatement code.
    */
    public ImmunisationsImpl(Coded exclusionStatement) {
        super(exclusionStatement);
    }

    /**
    * @param immunisations - A list of Immunisations
    */
    public ImmunisationsImpl(List<Immunisation> immunisations) {
        this.immunisations = immunisations;
    }

    /**
    * Convenience constructor to construct a default case.
    */
    public static Immunisations noneKnown() {
        return new ImmunisationsImpl(NCTISGlobalStatement.NONE_KNOWN);
    }

    /**
    * Convenience constructor to construct a default case.
    */
    public static Immunisations noneSupplied() {
        return new ImmunisationsImpl(NCTISGlobalStatement.NONE_SUPPLIED);
    }

    /**
    * The act of administering a dose of a vaccine to a person for the purpose of preventing or
    * minimising the effects of a disease by producing immunity and/or to counter the effects of an
    * infectious organism or insult.
    */
    @Override
    public List<Immunisation> getAdministeredImmunisations() {
        return immunisations;
    }
}
