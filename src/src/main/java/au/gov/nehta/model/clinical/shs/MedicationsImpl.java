package au.gov.nehta.model.clinical.shs;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.code.NCTISGlobalStatement;
import au.gov.nehta.model.clinical.common.KnownMedication;

import java.util.List;

/*
 * 
 * Medicine which the subject of care is using, this includes
 * self-prescribed, clinician prescribed and nonprescription medicines.
 */
public class MedicationsImpl extends ExclusionStatementImpl implements Medications {

	private List<KnownMedication> medications;

	public MedicationsImpl(Coded exclusionStatement) {
		super(exclusionStatement);
	}
	
	/**
	 * A convenience method to construct the most likely case -
	 * no reactions with an exclusion statement of none known
	 */
	public static Medications noneKnown(){
		return new MedicationsImpl(NCTISGlobalStatement.NONE_KNOWN);
	}
	
	/**
	 * Medicines which the subject of care is using, this includes
	 * self-prescribed, clinician prescribed and nonprescription medicines.
	 */
	public MedicationsImpl(List<KnownMedication> medications) {
		this.medications=medications;
	}

	
	/**
	 * Medicines which the subject of care is using, this includes
	 * self-prescribed, clinician prescribed and nonprescription medicines.
	 */
	@Override
	public List<KnownMedication> getKnownMedications() {
		return medications;
	}

}
