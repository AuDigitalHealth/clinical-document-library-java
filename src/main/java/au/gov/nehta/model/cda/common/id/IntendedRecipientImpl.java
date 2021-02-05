package au.gov.nehta.model.cda.common.id;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.address.PostalAddress;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.org.Organization;
import au.gov.nehta.model.cda.common.person.Person;
import au.gov.nehta.model.cda.common.telecom.Telecom;

import java.util.ArrayList;
import java.util.List;

public class IntendedRecipientImpl implements IntendedRecipient {

    private String id;
    private Coded code;
    private List<PostalAddress> address = new ArrayList<>(1);
    private List<Telecom> telecom = new ArrayList<>(2);
    private Person assignedPerson;
    private Organization representedOrganization;

    public IntendedRecipientImpl(String id) {
        this.id = id;
    }

    private IntendedRecipientImpl(String id, Person assignedPerson,
                                  Organization representedOrganization) {
        this.id = id;
        this.assignedPerson = assignedPerson;
        this.representedOrganization = representedOrganization;
    }

    public static IntendedRecipient getInstance(String id, Person assignedPerson,
                                                Organization representedOrganization) {
        ArgumentUtils.checkNotNull(assignedPerson, "Intended Recipient");
        ArgumentUtils
                .checkNotNull(representedOrganization, "IntendedRecipient representedOrganization ");
        ArgumentUtils.checkNotNull(assignedPerson.getAsEntityIdentifier(),
                "IntendedRecipient, Person asEntityIdentifier");
        return (IntendedRecipient) new IntendedRecipientImpl(id, assignedPerson,
                representedOrganization);
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
