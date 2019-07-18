package au.gov.nehta.model.clinical.common;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.code.SNOMED_AU_Code;
import au.gov.nehta.model.cda.common.time.PreciseDate;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;

/**
 * The problems and/or diagnoses that form part of the current and past medical history of the
 * subject of care.
 */
public class ProblemDiagnosisImpl implements ProblemDiagnosis {

  private Coded identification;
  private PreciseDate dateOfOnset;
  private PreciseDate remissionDate;
  private String comment;
  private UniqueIdentifier id = UniqueIdentifierImpl.random();


  /**
   * @param identification Identification of the problem or diagnosis. a snomed ct-au code
   * @param dateOfOnset optional Estimated or actual date the Problem/Diagnosis began, in the
   * opinion of the clinician.
   * @param remissionDate optional Estimated or actual date the Problem/Diagnosis began, in the
   * opinion of the clinician.
   * @param comment optional
   *
   * The date or estimated date that the problem/diagnosis resolved or went into remission, as
   * indicated/identified by the clinician.
   */
  public ProblemDiagnosisImpl(SNOMED_AU_Code identification, PreciseDate dateOfOnset,
      PreciseDate remissionDate, String comment) {
    ArgumentUtils.checkNotNull(identification, "identification");
    this.identification = identification;
    this.dateOfOnset = dateOfOnset;
    this.remissionDate = remissionDate;
    this.comment = comment;
  }


  /**
   * Identification of the problem or diagnosis. Should be a snomed ct-au code
   */
  @Override
  public Coded getIdentification() {
    return identification;
  }

  /**
   * optional
   *
   * Estimated or actual date the Problem/Diagnosis began, in the opinion of the clinician.
   */
  @Override
  public PreciseDate getDateOfOnset() {
    return dateOfOnset;
  }


  /**
   * optional
   *
   * The date or estimated date that the problem/diagnosis resolved or went into remission, as
   * indicated/identified by the clinician.
   */
  @Override
  public PreciseDate getDateOfRemission() {
    return remissionDate;
  }


  /**
   * optional Additional narrative about the problem or diagnosis not captured in other fields.
   */
  @Override
  public String getComment() {
    return comment;
  }


  /**
   * Random UUID unless explicitly set
   *
   * This is a technical identifier that is used for system purposes such as matching. If a suitable
   * internal key is not available, a UUID may be used.
   */
  @Override
  public UniqueIdentifier getID() {
    return id;
  }


  public void setID(UniqueIdentifier id) {
    this.id = id;
  }

}
