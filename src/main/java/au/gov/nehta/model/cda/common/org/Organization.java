package au.gov.nehta.model.cda.common.org;

import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;

public interface Organization {
    AsEntityIdentifier getAsEntityIdentifier();

    String getName();
}
