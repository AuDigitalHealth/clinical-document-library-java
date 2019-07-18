package au.gov.nehta.model.cda.common.person_org;

import au.gov.nehta.model.clinical.common.participation.PersonName;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

import java.util.List;

public interface PersonSubjectOfCare {
    List<UniqueIdentifier> getIdentifiers();

    List<PersonName> getPersonNames();

    Gender getGender();
}
