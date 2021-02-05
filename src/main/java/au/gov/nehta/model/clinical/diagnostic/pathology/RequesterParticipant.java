package au.gov.nehta.model.clinical.diagnostic.pathology;

import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;
import au.gov.nehta.model.clinical.etp.common.participation.PathologyOrganisationParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderPerson;
import au.gov.nehta.model.clinical.etp.common.participation.QualifiedParticipant;

import java.util.List;

public interface RequesterParticipant extends PathologyOrganisationParticipant,
        QualifiedParticipant {

    @Override
    AsEntityIdentifier getEntityIdentifiers();

    List<AsEntityIdentifier> getOrganisationIdentifiers();

    ProviderPerson getPerson();

    List<Entitlement> getEntitlement();

    void setEntitlement(List<Entitlement> entitlement);

    void addEntitlement(Entitlement entitlement);
}
