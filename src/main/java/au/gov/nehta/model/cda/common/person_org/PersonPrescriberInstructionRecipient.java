package au.gov.nehta.model.cda.common.person_org;

import au.gov.nehta.model.clinical.common.participation.PersonName;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

import java.util.List;

public interface PersonPrescriberInstructionRecipient {
    List<UniqueIdentifier> getIdentifiers();

    void setIdentifiers(List<UniqueIdentifier> identifiers);

    List<PersonName> getPersonNames();

    void setPersonNames(List<PersonName> personNames);

    String getQualifications();
    void setQualifications(String qualifications);
}
