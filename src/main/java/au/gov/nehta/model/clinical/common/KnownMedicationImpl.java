package au.gov.nehta.model.clinical.common;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.code.AMTCode;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;


/**
 * Information pertaining to one or more therapeutic goods that is represented
 * to achieve, or is likely to achieve, its principal intended action by
 * pharmacological, chemical, immunological or metabolic means in or on the body
 * of a human.
 *
 */
public class KnownMedicationImpl implements KnownMedication {

	private Coded medicine;
	private String directions;
	private String clinicalIndication;
	private String comment;
	private UniqueIdentifier id = UniqueIdentifierImpl.random();

	public KnownMedicationImpl(AMTCode medicine, String directions, String clinicalIndication, String comment) {
		ArgumentUtils.checkNotNull(medicine, "medicine");
		ArgumentUtils.checkNotNullNorBlank(directions, "directions");
		this.medicine = medicine;
		this.directions = directions;
		this.clinicalIndication = clinicalIndication;
		this.comment = comment;
	}

	/**
	 * convenience constructor with only mandatory fields
	 */
	public KnownMedicationImpl(AMTCode medicine, String directions) {
		this.medicine = medicine;
		this.directions = directions;
	}

	/**
	 * The medicine or other therapeutic good being 1..1 ordered, administered
	 * to or used by the subject of care.
	 * 
	 * Should be an AMT code
	 */
	@Override
	public Coded getMedicine() {
		return medicine;
	}

	
	/**
	 * A complete narrative description of how much, when and how to use the
	 * medicine, vaccine or other therapeutic good.
	 */
	@Override
	public String getDirections() {
		return directions;
	}

	

	/**
	 * optional
	 * A reason for ordering the medicine, vaccine or other therapeutic good.
	 */
	@Override
	public String getClinicalIndication() {
		return clinicalIndication;
	}
	

	/**
	 * 
	 * optional
	 * Any additional information that may be needed to ensure the continuity of
	 * supply, rationale for current dose and timing, or safe and appropriate
	 * use.
	 * 
	 */
	@Override
	public String getComment() {
		return comment;
	}
	
	/**
	 * A random UUID unless explicitly set
	 */
	@Override
	public UniqueIdentifier getID() {
		return id;
	}
	
	/**
	 * A random UUID unless explicitly set
	 */
	public void setID(UniqueIdentifier id) {
		this.id=id;
	}
	
	
	public void setMedicine(Coded medicine) {
		this.medicine = medicine;
	}

	public void setDirections(String directions) {
		this.directions = directions;
	}

	public void setClinicalIndication(String clinicalIndication) {
		this.clinicalIndication = clinicalIndication;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	

}
