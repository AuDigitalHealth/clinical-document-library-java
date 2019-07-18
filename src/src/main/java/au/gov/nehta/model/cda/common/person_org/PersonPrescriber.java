package au.gov.nehta.model.cda.common.person_org;

import au.gov.nehta.model.clinical.common.participation.PersonName;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;

import java.util.List;

public interface PersonPrescriber {
    List<UniqueIdentifier> getIdentifiers();

    void setIdentifiers(List<UniqueIdentifier> identifiers);

    List<PersonName> getPersonNames();

    void setPersonNames(List<PersonName> personNames);

    List<Entitlement> getEntitlements();

    void setEntitlements(List<Entitlement> entitlements);

    Occupation getOccupation();

    void setOccupation(Occupation occupation);

    String getQualifications();

    void setQualifications(String qualifications);
}
