package au.gov.nehta.model.cda.common.person;

import java.util.ArrayList;
import java.util.List;

import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.clinical.common.participation.PersonName;

public class PersonImpl implements Person {
    private AsEntityIdentifier asEntityIdentifier;
    private List<PersonName> personNames = new ArrayList<>(1);

    private PersonImpl(AsEntityIdentifier asEntityIdentifier, PersonName personName) {

        this.asEntityIdentifier = asEntityIdentifier;
        this.personNames.add(personName);
    }

    private PersonImpl(AsEntityIdentifier asEntityIdentifier, List<PersonName> personNames) {

        this.asEntityIdentifier = asEntityIdentifier;
        this.personNames = personNames;
    }

    public static Person getInstance(AsEntityIdentifier asEntityIdentifier, PersonName personName) {

        return new PersonImpl(asEntityIdentifier, personName);
    }

    public static Person getInstance(AsEntityIdentifier asEntityIdentifier, List<PersonName> personNames) {

        return new PersonImpl(asEntityIdentifier, personNames);
    }

    public AsEntityIdentifier getAsEntityIdentifier() {
        return asEntityIdentifier;
    }

    public List<PersonName> getName() {
        return personNames;
    }
}
