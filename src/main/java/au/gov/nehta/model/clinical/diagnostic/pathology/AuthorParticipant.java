package au.gov.nehta.model.clinical.diagnostic.pathology;

import au.gov.nehta.model.clinical.common.types.HPII;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderPerson;

public interface AuthorParticipant extends QualifiedEntitledParticipant {
    HPII getEntityIdentifiers();

    ProviderPerson getPerson();

    EmploymentOrganisation getEmploymentOrganisation();
}
