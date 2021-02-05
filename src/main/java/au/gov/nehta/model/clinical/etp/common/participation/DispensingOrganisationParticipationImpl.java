package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.code.Code;
import au.gov.nehta.model.cda.common.code.CodeImpl;
import au.gov.nehta.model.clinical.common.participation.Role;
import au.gov.nehta.model.clinical.common.participation.RoleImpl;

public class DispensingOrganisationParticipationImpl implements DispensingOrganisationParticipation {

    private Role role;
    private DispensingOrganisationParticipant participant;
    public static final Code PHARM_ROLE_CODE = getPharmCode();

    /**
     * Create a Participation with the supplied participant and the default role code of
     * <pre>
     *  <code code="PHARM" codeSystem="2.16.840.1.113883.1.11.17660" codeSystemName="HL7 ServiceDeliveryLocationRoleType" displayName="Pharmacy" />
     * </pre>
     *
     * @param participant the dispenser organisation
     */
    public DispensingOrganisationParticipationImpl(DispensingOrganisationParticipant participant) {
        ArgumentUtils.checkNotNull(participant, "participant");
        this.role = new RoleImpl(PHARM_ROLE_CODE);
        this.participant = participant;
    }

    public DispensingOrganisationParticipationImpl(Role role, DispensingOrganisationParticipant participant) {
        ArgumentUtils.checkNotNull(participant, "participant");
        this.role = role;
        this.participant = participant;
    }

    public Role getRole() {
        return role;
    }

    public DispensingOrganisationParticipant getParticipant() {
        return participant;
    }

    public static Code getPharmCode() {
        Code hardcodedRoleCode = new CodeImpl("PHARM");
        hardcodedRoleCode.setCodeSystem("2.16.840.1.113883.1.11.17660");
        hardcodedRoleCode.setCodeSystemName("HL7 ServiceDeliveryLocationRoleType");
        hardcodedRoleCode.setDisplayName("Pharmacy");
        return hardcodedRoleCode;
    }
}
