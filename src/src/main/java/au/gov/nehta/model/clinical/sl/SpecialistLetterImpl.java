package au.gov.nehta.model.clinical.sl;

public class SpecialistLetterImpl implements SpecialistLetter {

  private SpecialistLetterContext specialistLetterContext;

  private SpecialistLetterContent specialistLetterContent;

  @Override
  public SpecialistLetterContext getContext() {
    return specialistLetterContext;
  }

  @Override
  public void setContext(SpecialistLetterContext specialistLetterContext) {
    this.specialistLetterContext = specialistLetterContext;
  }

  @Override
  public SpecialistLetterContent getContent() {
    return specialistLetterContent;
  }

  @Override
  public void setContent(SpecialistLetterContent specialistLetterContent) {
    this.specialistLetterContent = specialistLetterContent;
  }
}
