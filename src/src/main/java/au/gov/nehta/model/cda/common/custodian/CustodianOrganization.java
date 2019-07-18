package au.gov.nehta.model.cda.common.custodian;

import java.util.List;

import au.gov.nehta.model.cda.common.address.PostalAddress;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.org.OrganizationName;
import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

public interface CustodianOrganization {
	List<UniqueIdentifier> getIds();

	AsEntityIdentifier getAsEntityIdentifier();

	OrganizationName getName();

	Telecom getTelecom();

	PostalAddress getAddress();

	void addId( UniqueIdentifier id );

	void setAsEntityIdentifier( AsEntityIdentifier asEntityIdentifier );

	void setName( OrganizationName name );

	void setTelecom( Telecom telecom );

	void setAddress( PostalAddress postalAddress );
}
