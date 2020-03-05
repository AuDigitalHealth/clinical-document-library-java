package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

public interface Identifiers {
    UniqueIdentifier getSpecimenIdentifier();

    UniqueIdentifier getParentSpecimenIdentifier();

    UniqueIdentifier getContainerIdentifier();

    void setSpecimenIdentifier(
        UniqueIdentifier specimenIdentifier);

    void setParentSpecimenIdentifier(
        UniqueIdentifier parentSpecimenIdentifier);

    void setContainerSpecimenIdentifier(
        UniqueIdentifier containerSpecimenIdentifier);
}
