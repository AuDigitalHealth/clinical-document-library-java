package au.gov.nehta.builder.ereferral;

import java.util.List;

import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.clinical.common.participation.Organisation;
import au.gov.nehta.model.clinical.common.participation.PersonName;
import au.gov.nehta.model.clinical.common.types.HPII;
import au.gov.nehta.model.clinical.common.types.HPIO;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderAddress;

public class ReferralParticipantImpl implements ReferralParticipant{
	private ProviderAddress address;
	private List<Telecom> telecoms;
	private PersonName name;
	private HPII hpii;
	private HPIO hpio;
	private Organisation org;
	private UniqueIdentifier id = UniqueIdentifierImpl.random();
	
	public ReferralParticipantImpl(HPII hpii,PersonName name, ProviderAddress address,List<Telecom> telecoms,HPIO hpio,Organisation org) {
		this.address=address;
		this.telecoms=telecoms;
		this.name=name;
		this.hpii = hpii;
		this.hpio = hpio;
		this.org=org;
	}
	
	
	@Override
	public ProviderAddress getProviderAddress() {
		return address;
	}
	@Override
	public List<Telecom> getElectronicCommunicationDetails() {
		return telecoms;
	}
	@Override
	public PersonName getParticipantName() {
		return name;
	}
	@Override
	public HPII getParticipantHPII() {
		return hpii;
	}
	@Override
	public HPIO getEmploymentOrganisationHPIO() {
		return hpio;
	}
	@Override
	public Organisation getEmploymentOrganisation() {
		return org;
	}


	/**
	 * Returns a Random UUID unless explicitly set
	 */
	@Override
	public UniqueIdentifier getID() {
		return id;
	}
	
	public void setID(UniqueIdentifier id){
		this.id=id;
	}
	
	
	 
}
