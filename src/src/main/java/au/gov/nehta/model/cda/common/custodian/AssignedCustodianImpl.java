package au.gov.nehta.model.cda.common.custodian;



public class AssignedCustodianImpl implements AssignedCustodian {
	private CustodianOrganization representedCustodianOrganization;

	private AssignedCustodianImpl( CustodianOrganization representedCustodianOrganization ) {
		this.representedCustodianOrganization = representedCustodianOrganization;
	}

	public static AssignedCustodian getInstance( CustodianOrganization representedCustodianOrganization ) {
		return (AssignedCustodian) new AssignedCustodianImpl( representedCustodianOrganization );
	}
	

	public CustodianOrganization getRepresentedCustodianOrganization() {
		return representedCustodianOrganization;
	}
}
