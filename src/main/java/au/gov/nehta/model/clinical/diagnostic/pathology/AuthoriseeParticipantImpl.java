package au.gov.nehta.model.clinical.diagnostic.pathology;

import java.util.List;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.clinical.common.participation.AddressPurpose;
import au.gov.nehta.model.clinical.common.participation.Organisation;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;
import au.gov.nehta.model.clinical.etp.common.participation.PathologyOrganisationParticipant;
import au.gov.nehta.model.clinical.etp.common.participation.PathologyOrganisationParticipantImpl;
import au.gov.nehta.model.clinical.etp.common.participation.ProviderAddress;


public class AuthoriseeParticipantImpl  extends PathologyOrganisationParticipantImpl implements PathologyOrganisationParticipant  {
    private UniqueIdentifier roleId = UniqueIdentifierImpl.random(); 
    private Coded healthcareFacilityType; 
   
    public AuthoriseeParticipantImpl( AsEntityIdentifier entityIdentifier, Coded healthcareFacilityType,  ProviderAddress address, List<Telecom> electronicCommunicationDetail, Organisation organisation ) {
            ArgumentUtils.checkNotNull( entityIdentifier, "entityIdentifier" );
            ArgumentUtils.checkNotNull( address, "address" );
            ArgumentUtils.checkNotNullNorEmpty( electronicCommunicationDetail, "electronicCommunicationDetail" );
            ArgumentUtils.checkNotNull( organisation, "organisation" );
            ArgumentUtils.checkNotNull( healthcareFacilityType, "healthcareFacilityType" );

            if (!address.getAddressPurpose().equals( AddressPurpose.BUSINESS )) {
                throw new IllegalArgumentException( "address must have an address purpose of BUSINESS" );
            }


            this.entityIdentifier = entityIdentifier;
            this.address = address;
            this.electronicCommunicationDetail = electronicCommunicationDetail;
            this.organisation = organisation;
            this.healthcareFacilityType=healthcareFacilityType;
        }


    public UniqueIdentifier getRoleId() {
        return roleId;
    }


    public void setRoleId( UniqueIdentifier roleId ) {
        this.roleId = roleId;
    }


    public Coded getHealthcareFacilityType() {
        return healthcareFacilityType;
    }


}
