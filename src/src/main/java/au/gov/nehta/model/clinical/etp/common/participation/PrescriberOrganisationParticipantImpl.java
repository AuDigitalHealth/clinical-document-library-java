package au.gov.nehta.model.clinical.etp.common.participation;

import java.util.List;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.cda.common.telecom.TelecomMedium;
import au.gov.nehta.model.clinical.common.participation.AddressPurpose;
import au.gov.nehta.model.clinical.common.participation.Organisation;
import au.gov.nehta.model.clinical.common.types.HPIO;

public class PrescriberOrganisationParticipantImpl extends OrganisationParticipantImpl implements PrescriberOrganisationParticipant {
	

	public PrescriberOrganisationParticipantImpl( HPIO entityIdentifier, ProviderAddress address, List<Telecom> electronicCommunicationDetail, Organisation organisation ) {
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

	
   public PrescriberOrganisationParticipantImpl( HPIO entityIdentifier, ProviderAddress address, Organisation organisation ) {
        ArgumentUtils.checkNotNull( entityIdentifier, "entityIdentifier" );
        ArgumentUtils.checkNotNull( address, "address" );
        ArgumentUtils.checkNotNull( organisation, "organisation" );

        if (!address.getAddressPurpose().equals( AddressPurpose.BUSINESS )) {
            throw new IllegalArgumentException( "address must have an address purpose of BUSINESS" );
        }

        this.entityIdentifier = entityIdentifier;
        this.address = address;
        this.organisation = organisation;
    }



}
