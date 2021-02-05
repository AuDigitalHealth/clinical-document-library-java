package au.gov.nehta.model.cda.common.custodian;

import au.gov.nehta.common.utils.ArgumentUtils;
import au.gov.nehta.model.cda.common.address.PostalAddress;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.cda.common.org.OrganizationName;
import au.gov.nehta.model.cda.common.telecom.Telecom;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public class CustodianOrganizationImpl implements CustodianOrganization {

    private List<UniqueIdentifier> id;
    private AsEntityIdentifier asEntityIdentifier;
    private OrganizationName name;
    private Telecom telecom;
    private PostalAddress address;

    private CustodianOrganizationImpl(List<UniqueIdentifier> custodianOrganizationIds,
                                      AsEntityIdentifier asEntityIdentifier) {
        this.id = custodianOrganizationIds;
        this.asEntityIdentifier = asEntityIdentifier;
    }

    public static CustodianOrganizationImpl getInstance(
            List<UniqueIdentifier> custodianOrganizationIds, AsEntityIdentifier asEntityIdentifier) {
        ArgumentUtils.checkNotNullNorEmpty(custodianOrganizationIds, "CustodianOrganization id");
        ArgumentUtils.checkNotNull(asEntityIdentifier, "CustodianOrganization entityIdentifier");

        return new CustodianOrganizationImpl(custodianOrganizationIds, asEntityIdentifier);
    }

    /**
     * The minimum required for a custodian
     */
    public static CustodianOrganizationImpl getInstance(UniqueIdentifier custodianOrganizationId) {
        ArgumentUtils.checkNotNull(custodianOrganizationId, "CustodianOrganization id");

        return new CustodianOrganizationImpl(Collections.singletonList(custodianOrganizationId), null);
    }

    @Override
    public List<UniqueIdentifier> getIds() {
        return id;
    }

    @Override
    public AsEntityIdentifier getAsEntityIdentifier() {
        return asEntityIdentifier;
    }

    @Override
    public void setAsEntityIdentifier(AsEntityIdentifier asEntityIdentifier) {
        this.asEntityIdentifier = asEntityIdentifier;
    }

    @Override
    public OrganizationName getName() {
        return name;
    }

    @Override
    public void setName(OrganizationName name) {
        this.name = name;
    }

    @Override
    public Telecom getTelecom() {
        return telecom;
    }

    @Override
    public void setTelecom(Telecom telecom) {
        this.telecom = telecom;
    }

    @Override
    public PostalAddress getAddress() {
        return address;
    }

    @Override
    public void setAddress(PostalAddress address) {
        this.address = address;
    }

    @Override
    public void addId(UniqueIdentifier id) {
        this.id.add(id);
    }
}
