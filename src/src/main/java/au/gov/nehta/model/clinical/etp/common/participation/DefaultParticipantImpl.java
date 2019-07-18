package au.gov.nehta.model.clinical.etp.common.participation;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.clinical.common.types.HPII;

public class DefaultParticipantImpl extends QualifiedParticipantImpl implements DefaultParticipant {
	private ProviderPerson person;
	private List<Entitlement> entitlement;
	private String authorID = UUID.randomUUID().toString();  

	public DefaultParticipantImpl( HPII entityIdentifier, ProviderPerson person ) {
		ArgumentUtils.checkNotNull( entityIdentifier, "entityIdentifier" );
		ArgumentUtils.checkNotNull( person, "person" );
		this.entityIdentifier = entityIdentifier;
		this.person = person;
	}

	public ProviderPerson getPerson() {
		return person;
	}

	public List<Entitlement> getEntitlement() {
		return entitlement;
	}

	public void setEntitlement( List<Entitlement> entitlement ) {
		ArgumentUtils.checkNotNull( entitlement, "entitlement" );
		this.entitlement = entitlement;
	}

	public void addEntitlement( Entitlement entitlement ) {
		ArgumentUtils.checkNotNull( entitlement, "entitlement" );
		if (this.entitlement == null) {
			this.entitlement = new ArrayList<Entitlement>();
		}
		this.entitlement.add( entitlement );
	}

	/**
	 * Defaults to random UUID if not explicitly set
	 */
	@Override
	public String getParticipantID() {
		return authorID;
	}

	@Override
	public void setParticipantID(String id) {
		this.authorID=id;
	}
	
	

}
