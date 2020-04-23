package au.gov.nehta.model.clinical.sl;


public interface SpecialistLetter {

  SpecialistLetterContext getContext();

  void setContext(SpecialistLetterContext specialistLetterContext);

  SpecialistLetterContent getContent();

  void setContent(SpecialistLetterContent specialistLetterContent);
}
