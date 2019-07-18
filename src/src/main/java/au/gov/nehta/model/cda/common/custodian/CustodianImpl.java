package au.gov.nehta.model.cda.common.custodian;


public class CustodianImpl implements Custodian {
	private AssignedCustodian assignedCustodian;

	private CustodianImpl( AssignedCustodian assignedCustodian ) {
		this.assignedCustodian = assignedCustodian;
	}

	public static Custodian getInstance( AssignedCustodian assignedCustodian ) {
		return (Custodian) new CustodianImpl( assignedCustodian );
	}

	public AssignedCustodian getAssignedCustodian() {
		return assignedCustodian;
	}
}
