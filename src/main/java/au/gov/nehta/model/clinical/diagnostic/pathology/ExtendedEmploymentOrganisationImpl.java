package au.gov.nehta.model.clinical.diagnostic.pathology;

import static au.gov.nehta.common.utils.ArgumentUtils.checkNotNullNorEmpty;

import java.util.List;

import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.clinical.etp.common.participation.AddressContext;

public class ExtendedEmploymentOrganisationImpl extends EmploymentOrganisationImpl implements ExtendedEmploymentOrganisation {

	public List<? extends Telecom> electronicCommunicationDetails;
	private List<? extends AddressContext> addresses;

	
	/**
	 * 
	 * @param identifiers
	 *            A number or code issued for the purpose of identifying a
	 *            participant within a healthcare context at least 1 should be a
	 *            HPIO
	 * @param organisationName
	 *            The name by which an organisation is known or called.
	 * 
	 * @param addresses
	 *            a list of addresses for this organisation
	 * @param electronicCommunicationDetails
	 *            a list of Telecom's for this organisation
	 */
	public ExtendedEmploymentOrganisationImpl(List<? extends AsEntityIdentifier> identifiers,
			List<? extends AddressContext> addresses,
			List<? extends Telecom> electronicCommunicationDetails,
			String organisationName) {
		super(identifiers, organisationName);
		
		checkNotNullNorEmpty(addresses, "addresses");
		checkNotNullNorEmpty(electronicCommunicationDetails, "electronicCommunicationDetails");
		
		this.addresses= addresses;
		this.electronicCommunicationDetails= electronicCommunicationDetails;
	}

	/**
	 * The electronic communication details of entities
	 */
	public void setElectronicCommunicationDetails(List<? extends Telecom> electronicCommunicationDetails) {
		this.electronicCommunicationDetails = electronicCommunicationDetails;
	}

	public List<? extends Telecom> getElectronicCommunicationDetails() {
		return electronicCommunicationDetails;
	}

	public List<? extends AddressContext> getAddresses() {
		return addresses;
	}

	public void setAddresses(List<? extends AddressContext> addresses) {
		this.addresses = addresses;
	}

}
