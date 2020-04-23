package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

public class IdentifiersImpl implements Identifiers {

    protected UniqueIdentifier specimenIdentifier;
    protected UniqueIdentifier parentSpecimenIdentifier;
    protected UniqueIdentifier containerSpecimenIdentifier;

    @Override
    public UniqueIdentifier getSpecimenIdentifier() {
        return specimenIdentifier;
    }

    @Override
    public UniqueIdentifier getParentSpecimenIdentifier() {
        return parentSpecimenIdentifier;
    }

    @Override
    public UniqueIdentifier getContainerIdentifier() {
        return containerSpecimenIdentifier;
    }

    @Override
    public void setSpecimenIdentifier(UniqueIdentifier specimenIdentifier) {
        this.specimenIdentifier = specimenIdentifier;
    }

    @Override
    public void setParentSpecimenIdentifier(UniqueIdentifier parentSpecimenIdentifier) {
        this.parentSpecimenIdentifier = parentSpecimenIdentifier;
    }

    @Override
    public void setContainerSpecimenIdentifier(UniqueIdentifier containerSpecimenIdentifier) {
        this.containerSpecimenIdentifier = containerSpecimenIdentifier;
    }
}
