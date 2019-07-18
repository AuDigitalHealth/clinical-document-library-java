package au.gov.nehta.model.cda.common.person_org;

import au.gov.nehta.model.cda.common.time.PreciseDate;

public interface PersonConsumer {
    PreciseDate getDateOfBirth();

    void setDateOfBirth(PreciseDate dateOfBirth);

    Gender getGender();

    void setGender(Gender gender);
}
