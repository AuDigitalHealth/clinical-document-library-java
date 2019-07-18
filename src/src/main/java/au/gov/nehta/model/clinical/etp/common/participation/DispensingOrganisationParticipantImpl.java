package au.gov.nehta.model.clinical.etp.common.participation;

import java.util.ArrayList;
import java.util.List;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.cda.common.telecom.TelecomMedium;
import au.gov.nehta.model.clinical.common.participation.AddressPurpose;
import au.gov.nehta.model.clinical.common.participation.Organisation;
import au.gov.nehta.model.clinical.common.types.HPIO;

public class DispensingOrganisationParticipantImpl extends OrganisationParticipantImpl implements DispensingOrganisationParticipant {
	
	private List<Entitlement> entitlement;
	

	public DispensingOrganisationParticipantImpl( HPIO entityIdentifier, ProviderAddress address, List<Telecom> electronicCommunicationDetail, Organisation organisation ) {
		ArgumentUtils.checkNotNull( entityIdentifier, "entityIdentifier" );
		ArgumentUtils.checkNotNull( address, "address" );
		ArgumentUtils.checkNotNullNorEmpty( electronicCommunicationDetail, "electronicCommunicationDetail" );
		ArgumentUtils.checkNotNull( organisation, "organisation" );

		if (!address.getAddressPurpose().equals( AddressPurpose.BUSINESS )) {
			throw new IllegalArgumentException( "address must have an address purpose of BUSINESS" );
		}

		boolean containsTelephoneOrMobile = false;

		for (Telecom electronicCommunicationDetailItem : electronicCommunicationDetail) {
			if (containsTelephoneOrMobile) {
				break;
			} else {
				TelecomMedium medium = electronicCommunicationDetailItem.getTelecomMedium();
				if (medium.equals( TelecomMedium.TELEPHONE ) || medium.equals( TelecomMedium.MOBILE )) {
					containsTelephoneOrMobile = true;
				}
			}
		}
		if (containsTelephoneOrMobile == false) {
			throw new IllegalArgumentException( "electronicCommunicationDetail list must contain at least one item with an Electronic Communication Medium value of 'Telephone' or 'Mobile'" );
		}

		this.entityIdentifier = entityIdentifier;
		this.address = address;
		this.electronicCommunicationDetail = electronicCommunicationDetail;
		this.organisation = organisation;
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

	

}
