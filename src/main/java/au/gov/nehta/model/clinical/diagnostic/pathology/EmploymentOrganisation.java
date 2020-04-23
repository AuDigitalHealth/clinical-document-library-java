package au.gov.nehta.model.clinical.diagnostic.pathology;

import java.util.List;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.clinical.common.participation.Organisation;

public interface EmploymentOrganisation extends Organisation {
        public List<? extends AsEntityIdentifier> getOrganisationIdentifiers();
        public Coded getEmployementType();
        public Coded  getOccupation();
        public Coded getPositionInOrganisation();
}
