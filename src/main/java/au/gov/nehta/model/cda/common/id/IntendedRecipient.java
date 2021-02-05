package au.gov.nehta.model.cda.common.id;

import au.gov.nehta.model.cda.common.address.PostalAddress;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.org.Organization;
import au.gov.nehta.model.cda.common.person.Person;
import au.gov.nehta.model.cda.common.telecom.Telecom;

import java.util.List;

public interface IntendedRecipient {

    String getId();

    Coded getCode();

    List<PostalAddress> getAddress();

    List<Telecom> getTelecom();

    Person getAssignedPerson();

    Organization getRepresentedOrganization();

    void setCode(Coded code);

    void setAddress(List<PostalAddress> address);

    void setTelecom(List<Telecom> telecom);

    void setRepresentedOrganization(Organization representedOrganization);
}
