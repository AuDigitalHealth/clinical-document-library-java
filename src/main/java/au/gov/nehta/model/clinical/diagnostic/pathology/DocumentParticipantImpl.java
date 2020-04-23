package au.gov.nehta.model.clinical.diagnostic.pathology;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.clinical.common.participation.Occupation;
import au.gov.nehta.model.clinical.common.participation.Role;
import au.gov.nehta.model.clinical.common.participation.RoleImpl;

public class DocumentParticipantImpl implements DocumentParticipant {

  private AuthorParticipant participant;
  private Role role;

  public DocumentParticipantImpl(Role role, AuthorParticipant participant) {
    ArgumentUtils.checkNotNull(participant, "participant");
    ArgumentUtils.checkNotNull(role, "role");
    this.participant = participant;
    this.role = role;

    if (participant.getEmploymentOrganisation() == null
        || participant.getEmploymentOrganisation().getOrganisationIdentifiers() == null) {
      throw new IllegalArgumentException(
          "AuthorParticipant must have employmentOrganisation and OrganisationIdentifiers");
    }
		
		/*boolean hasNATAid = false;
		for(AsEntityIdentifier id : participant.getEmploymentOrganisation().getOrganisationIdentifiers()){
		    if("1.2.36.1.2001.1005.12".equals(id.getRoot()) || "NATA".equals( id.getAssigningAuthorityName()) )
		    {
		        hasNATAid = true;
		        break;
		    }
		}*/
		
		/*if( !hasNATAid){
		    throw new IllegalArgumentException("AuthorParticipant Employment Orgaisation should include NATA id");
		}*/

  }

  public DocumentParticipantImpl(Occupation role, AuthorParticipant participant) {
    this(new RoleImpl(role), participant);
  }


  @Override
  public AuthorParticipant getParticipant() {
    return participant;
  }


  @Override
  public Role getRole() {
    return role;
  }
}

