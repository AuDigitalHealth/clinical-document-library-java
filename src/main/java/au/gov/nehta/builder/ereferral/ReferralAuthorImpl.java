package au.gov.nehta.builder.ereferral;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.common.types.HPII;
import au.gov.nehta.model.clinical.diagnostic.pathology.EmploymentOrganisation;
import au.gov.nehta.model.clinical.etp.common.participation.DefaultParticipantImpl;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderPerson;

public class ReferralAuthorImpl extends DefaultParticipantImpl implements ReferralAuthor {
    private Coded roleCode;
    private EmploymentOrganisation employmentOrg;

    public ReferralAuthorImpl(HPII entityIdentifier, ProviderPerson person, Coded role, EmploymentOrganisation employmentOrg) {
        super(entityIdentifier, person);
        this.roleCode = role;
        this.employmentOrg = employmentOrg;
    }

    @Override
    public Coded getRoleCode() {
        return roleCode;
    }

    public void setRoleCode(Coded code) {
        this.roleCode = code;
    }

    @Override
    public EmploymentOrganisation getEmploymentOrganisation() {
        return employmentOrg;
    }
}
