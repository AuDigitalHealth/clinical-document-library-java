package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.model.clinical.common.participation.PersonName;
import au.gov.nehta.model.clinical.common.types.HPII;

public interface DispenserParticipant extends QualifiedParticipant {
    public HPII getEntityIdentifiers();

    public PersonName getPersonName();
}
