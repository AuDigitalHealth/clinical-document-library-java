package au.gov.nehta.model.clinical.diagnostic.pathology;

import static au.gov.nehta.common.utils.ArgumentUtils.checkNotNull;
import static au.gov.nehta.common.utils.ArgumentUtils.checkNotNullNorEmpty;

import java.util.List;

import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.cda.common.id.AsEntityIdentifier;
import au.gov.nehta.model.clinical.common.participation.OrganisationImpl;
import au.gov.nehta.model.clinical.common.participation.OrganisationNameUsage;
import au.gov.nehta.model.clinical.common.types.HPIO;

public class EmploymentOrganisationImpl extends OrganisationImpl implements EmploymentOrganisation{

    public List<? extends AsEntityIdentifier> identifiers;
    public OrganisationNameUsage nameUsage;
    public Coded jobClassCode;
    public Coded jobCode;
    public Coded positionInOrganisation;
  
    
    /**
     * 
     * @param identifiers A number or code issued for the purpose of identifying a participant within a healthcare context
     *                    at least 1 should be a HPIO
     * @param organisationName The name by which an organisation is known or called.
     */
    public EmploymentOrganisationImpl(List<? extends AsEntityIdentifier> identifiers,String organisationName ){
        super(organisationName);
        checkNotNullNorEmpty( identifiers, "Identifiers" );
        
        this.identifiers=identifiers;
        
        boolean foundHPIO=false;
        for(AsEntityIdentifier i: identifiers){
            if(i instanceof HPIO){
                foundHPIO=true;
                break;
            }
        }
        
        
        if(!foundHPIO) throw new IllegalArgumentException("At least one Identifier must be a HPIO");
    }
    
    /**
     * 
     * @param usage The classification that enables differentiation between recorded names
     * for an organisation or service location.
     */
    public void setOrganisationNameUsage(OrganisationNameUsage usage){
        checkNotNull(usage,"OrganisationNameUsage");
        this.nameUsage=usage;
    }
    
    
    /**
     * 
     * @param jobClassCode
     *            The basis on which the person is employed by employer
     *            organisation.
     */
    public void setEmploymentType(Coded jobClassCode){
        checkNotNull(jobClassCode,"jobClassCode");
        this.jobClassCode=jobClassCode;
    }
    
    
    /**
     * 
     * @param jobCode
     *            A descriptor of the class of job based on similarities in the
     *            tasks undertaken.
     */
    public void setOccupation( Coded  jobCode){
        checkNotNull(jobCode,"jobCode");
        this.jobCode=jobCode;
    }
    
    
    /**
     * 
     * @param pio A descriptor of the job or the job role based on the management hierarchy of the organisation.
     */
    public void setPositionInOrganisation(Coded pio){
        checkNotNull(pio,"PositionInOrganisation");
        this.positionInOrganisation=pio;
    }
    
    
    @Override
    public List<? extends AsEntityIdentifier> getOrganisationIdentifiers() {
        return identifiers;
    }
    
    @Override
    public Coded getEmployementType() {
        return jobClassCode;
    }
    
    @Override
    public  Coded  getOccupation() {
        return jobCode;
    }
    
    @Override
    public Coded getPositionInOrganisation() {
        return positionInOrganisation;
    }

	
}
