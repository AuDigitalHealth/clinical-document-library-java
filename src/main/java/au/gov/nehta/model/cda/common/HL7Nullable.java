package au.gov.nehta.model.cda.common;

import au.net.electronichealth.ns.cda._2_0.NullFlavor;


/**
 * HL7 has the concept of a null flavour which many objects extend from
 * This class is intended as a base to provide Null Falvour to all that need it.
 * 
 * This class is not intended to be used directly, but extended from.
 *
 */
public class HL7Nullable {
    
    private NullFlavor flavour;
    

    public void setNullFlavour( NullFlavor flavour ) {
        this.flavour=flavour;
    }

    public NullFlavor getNullFlavour() {
        return flavour; 
    }
    
    public boolean hasNullFlavour(){
        return flavour == null;
    }
    
    public boolean doesNotHaveNullFlavour(){
        return flavour != null;
    }

}
