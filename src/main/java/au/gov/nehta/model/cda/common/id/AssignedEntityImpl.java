package au.gov.nehta.model.cda.common.id;

import java.util.ArrayList;
import java.util.List;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.address.PostalAddress;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.org.Organization;
import au.gov.nehta.model.cda.common.person.Person;
import au.gov.nehta.model.cda.common.telecom.Telecom;

public class AssignedEntityImpl implements AssignedEntity {
    private String id;
    private Coded code;
    private List<PostalAddress> address = new ArrayList<>(1);
    private List<Telecom> telecom = new ArrayList<>(2);
    private Person assignedPerson;
    private Organization representedOrganization;

    public AssignedEntityImpl(String id) {
        this.id = id;
    }

    private AssignedEntityImpl(String id, Person assignedPerson, Organization representedOrganization) {
        this.id = id;
        this.assignedPerson = assignedPerson;
        this.representedOrganization = representedOrganization;
    }

    public static AssignedEntity getInstance(String id, Person assignedPerson, Organization representedOrganization) {
        ArgumentUtils.checkNotNull(assignedPerson, "AssignedEntity Person");
        ArgumentUtils.checkNotNull(representedOrganization, "AssignedEntity representedOrganization ");
        ArgumentUtils.checkNotNull(assignedPerson.getAsEntityIdentifier(), "AssignedEntity, Person asEntityIdentifier");
        return new AssignedEntityImpl(id, assignedPerson, representedOrganization);
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public Coded getCode() {
        return code;
    }

    public List<PostalAddress> getAddress() {
        return address;
    }

    public List<Telecom> getTelecom() {
        return telecom;
    }

    public Person getAssignedPerson() {
        return assignedPerson;
    }

    public Organization getRepresentedOrganization() {
        return representedOrganization;
    }

    public void setCode(Coded code) {
        this.code = code;
    }

    public void setAddress(List<PostalAddress> address) {
        this.address = address;
    }

    public void setTelecom(List<Telecom> telecom) {
        this.telecom = telecom;
    }

    public void setRepresentedOrganization(Organization representedOrganization) {
        this.representedOrganization = representedOrganization;
    }
}
