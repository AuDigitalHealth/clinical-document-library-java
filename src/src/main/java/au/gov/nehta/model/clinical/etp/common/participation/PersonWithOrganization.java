package au.gov.nehta.model.clinical.etp.common.participation;


import au.gov.nehta.model.cda.common.participant.EmploymentOrganization;
import au.gov.nehta.model.cda.common.person_org.Person;

public interface PersonWithOrganization extends Person {
    EmploymentOrganization getEmploymentOrganisation();

    void setEmploymentOrganisation(EmploymentOrganization employmentOrganisation);

}
