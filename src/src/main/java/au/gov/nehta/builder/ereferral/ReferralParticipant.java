package au.gov.nehta.builder.ereferral;

import java.util.List;

import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.clinical.common.participation.Organisation;
import au.gov.nehta.model.clinical.common.participation.PersonName;
import au.gov.nehta.model.clinical.common.types.HPII;
import au.gov.nehta.model.clinical.common.types.HPIO;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderAddress;

public interface ReferralParticipant {
	public ProviderAddress getProviderAddress();
	public List<Telecom> getElectronicCommunicationDetails();
	public PersonName getParticipantName();
	public HPII getParticipantHPII();
	public HPIO getEmploymentOrganisationHPIO();
	public Organisation getEmploymentOrganisation();
	public UniqueIdentifier getID();
}
