package au.gov.nehta.model.cda.common.participant;

import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.clinical.common.participation.OrganisationNameUsage;

import java.util.List;

public interface Organization {
    List<AsEntityIdentifier> getIdentifiers();

    String getName();

    String getDepartment();

    OrganisationNameUsage getOrganisationNameUsage();
}
