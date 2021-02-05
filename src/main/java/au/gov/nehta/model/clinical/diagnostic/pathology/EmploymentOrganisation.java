package au.gov.nehta.model.clinical.diagnostic.pathology;

import java.util.List;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.clinical.common.participation.Organisation;

public interface EmploymentOrganisation extends Organisation {

    List<? extends AsEntityIdentifier> getOrganisationIdentifiers();

    Coded getEmployementType();

    Coded getOccupation();

    Coded getPositionInOrganisation();
}
