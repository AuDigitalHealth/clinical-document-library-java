package au.gov.nehta.model.clinical.common;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;

/**
 * A clinical activity carried out for therapeutic, evaluative, investigative,
 * screening or diagnostic purposes.
 */
public class ProcedureImpl implements Procedure {
	private Coded name;
	private String comment;
	private PreciseDate startTime;
	
	private UniqueIdentifier id = UniqueIdentifierImpl.random();

	/**
	 * @param name
	 *            The name of the procedure (to be) performed.
	 * @param startTime
	 *            The start date and/or time for the procedure.
	 * @param comment
	 *            optional Additional narrative about the procedure not captured
	 *            in other fields.
	 * 
	 */
	public ProcedureImpl(Coded name, PreciseDate startTime, String comment ) {
		ArgumentUtils.checkNotNull(name, "name");
		ArgumentUtils.checkNotNull(startTime, "startTime");
		this.name = name;
		this.comment = comment;
		this.startTime = startTime;
	}

	/**
	 * The name of the procedure (to be) performed.
	 */
	@Override
	public Coded getName() {
		return name;
	}

	/**
	 * optional
	 *  Additional narrative about the procedure not captured in other
	 * fields.
	 */
	@Override
	public String getComment() {
		return comment;
	}

	/**
	 *  optional 
	 *  The start date and/or time for the procedure.
	 */
	@Override
	public PreciseDate getDateTimeStarted() {
		return startTime;
	}

	/**
	 * A Unique Identifier unless explicitly set
	 */
	@Override
	public UniqueIdentifier getID() {
		return id;
	}
	
	
	/**
	 * Explicitly set the Procedure id to something other than a random UUID
	 */
	public void setID(UniqueIdentifier id){
		this.id=id;
	}

}
