package au.gov.nehta.model.clinical.common;

import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.clinical.etp.common.participation.AddressContext;
import au.gov.nehta.model.clinical.etp.common.participation.Entitlement;

import java.util.List;

/**
 * This interface is designed to model a generic Subject Of Care and be reusable across CDA
 * Documents.
 *
 * <p>Individual document types may impose stricter constraints than this class, itself, imposes.
 * For example, allow only one address.
 *
 * <p>.<br>
 * <br>
 * IMPORTANT: <br>
 * <strong> To ensure that a valid subject of care is created, run the CDA creator with .useStrict()
 * when testing </strong>
 */
public interface SubjectOfCareParticipant {

    String getPatientRoleId();

    void setPatientRoleId(String id);

    List<? extends AsEntityIdentifier> getEntityIdentifiers();

    List<AddressContext> getAddresses();

    List<Telecom> getElectronicCommunicationDetail();

    SubjectOfCarePerson getPerson();

    List<Entitlement> getEntitlements();

    void setEntitlements(List<Entitlement> entitlement);

    void setElectronicCommunicationDetails(List<Telecom> electronicCommunicationDetail);

    void addElectronicCommunicationDetail(Telecom electronicCommunicationDetail);

    void addEntitlement(Entitlement entitlement);
}
