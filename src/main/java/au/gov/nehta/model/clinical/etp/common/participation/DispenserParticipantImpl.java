package au.gov.nehta.model.clinical.etp.common.participation;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.clinical.common.participation.PersonName;
import au.gov.nehta.model.clinical.common.types.HPII;

public class DispenserParticipantImpl  extends QualifiedParticipantImpl implements DispenserParticipant {
	private HPII entityIdentifier;
	private PersonName personName;
	private String qualifications;

	public DispenserParticipantImpl( HPII entityIdentifier, PersonName personName, ProviderAddress address ) {
		ArgumentUtils.checkNotNull( entityIdentifier, "entityIdentifier" );
		ArgumentUtils.checkNotNull( personName, "person" );
		ArgumentUtils.checkNotNull( address, "dispenser participant address" );
		this.entityIdentifier = entityIdentifier;
		this.address=address;
		this.personName = personName;
	}

	public HPII getEntityIdentifiers() {
		return entityIdentifier;
	}


	public PersonName getPersonName() {
		return personName;
	}

	public String getQualifications() {
		return qualifications;
	}

	public void setQualifications( String qualifications ) {
		ArgumentUtils.checkNotNull( qualifications, "qualifications" );
		this.qualifications = qualifications;
	}
}
