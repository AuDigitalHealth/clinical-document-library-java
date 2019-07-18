package au.gov.nehta.model.cda.common.person;

import java.util.List;

import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.clinical.common.participation.PersonName;

public interface Person {
	AsEntityIdentifier getAsEntityIdentifier();

	List<PersonName> getName();
}
