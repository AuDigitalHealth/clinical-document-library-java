package au.gov.nehta.model.clinical.common;

import java.util.*;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.clinical.etp.common.participation.AddressContext;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;

/**
 * This class is designed to model a generic Subject Of Care and be
 * reusable across CDA Documents.
 * <p>
 * Individual document types may impose stricter constraints
 * than this class, itself, imposes.
 * <p>
 * .<br><br>
 * IMPORTANT: <br>
 *
 * <strong>
 * To ensure that a valid subject of care is
 * created, run the CDA creator with .useStrict() when testing
 * </strong>
 */
public class SubjectOfCareParticipantImpl implements SubjectOfCareParticipant {
    private List<? extends AsEntityIdentifier> entityIdentifiers;
    private List<AddressContext> address;
    private List<Telecom> electronicCommunicationDetail = new ArrayList<>(1);
    private SubjectOfCarePerson person;
    private List<Entitlement> entitlement = new ArrayList<>(2);
    private String patientRoleId = UUID.randomUUID().toString();

    public SubjectOfCareParticipantImpl(List<? extends AsEntityIdentifier> entityIdentifiers, List<AddressContext> address, SubjectOfCarePerson person) {
        ArgumentUtils.checkNotNull(person, "person");

        this.entityIdentifiers = entityIdentifiers;
        this.address = address;
        this.person = person;
    }

    /**
     * Convenience constructor for the most likely case where there is only one address being supplied
     */
    public SubjectOfCareParticipantImpl(List<? extends AsEntityIdentifier> entityIdentifiers, AddressContext address, SubjectOfCarePerson person) {
        ArgumentUtils.checkNotNull(person, "person");

        this.entityIdentifiers = entityIdentifiers;
        this.address = Collections.singletonList(address);
        this.person = person;
    }

    public List<? extends AsEntityIdentifier> getEntityIdentifiers() {
        return entityIdentifiers;
    }

    public List<AddressContext> getAddresses() {
        return address;
    }

    public List<Telecom> getElectronicCommunicationDetail() {
        return electronicCommunicationDetail;
    }

    public SubjectOfCarePerson getPerson() {
        return person;
    }

    public List<Entitlement> getEntitlements() {
        return entitlement;
    }

    public void setElectronicCommunicationDetails(List<Telecom> electronicCommunicationDetail) {
        this.electronicCommunicationDetail = electronicCommunicationDetail;
    }

    public void addElectronicCommunicationDetail(Telecom electronicCommunicationDetail) {
        this.electronicCommunicationDetail.add(electronicCommunicationDetail);
    }

    public void setEntitlements(List<Entitlement> entitlement) {
        this.entitlement = entitlement;
    }

    public void addEntitlement(Entitlement entitlement) {
        this.entitlement.add(entitlement);
    }

    @Override
    public void setPatientRoleId(String id) {
        this.patientRoleId = id;
    }

    /**
     * Initialised to a Random UUID if not set.
     */
    @Override
    public String getPatientRoleId() {
        return patientRoleId;
    }
}
