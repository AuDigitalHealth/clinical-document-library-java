package au.gov.nehta.builder.ereferral;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.diagnostic.pathology.EmploymentOrganisation;
import au.gov.nehta.model.clinical.etp.common.participation.DefaultParticipant;

public interface ReferralAuthor extends DefaultParticipant {
    public Coded getRoleCode();
    public EmploymentOrganisation getEmploymentOrganisation();
}
