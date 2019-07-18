package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.clinical.common.Immunisation;

import java.util.List;

public class ImmunisationsImpl implements Immunisations {

    protected List<Immunisation> immunisations;

    public ImmunisationsImpl(List<Immunisation> immunisations) {
        this.immunisations = immunisations;
    }

    @Override
    public List<Immunisation> getImmunisations() {
        return immunisations;
    }
}
