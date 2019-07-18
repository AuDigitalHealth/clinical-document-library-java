package au.gov.nehta.model.clinical.etp.dispenserecord;

import au.gov.nehta.model.clinical.common.types.UniqueIdentifier;
import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;
import au.net.electronichealth.ns.cda._2_0.NullFlavor;

/**
 * A partially filled Manufacturing code.
 * The extension is left to the user.
 * 
 * <p>
 * example:
 * <pre>
 *   ManufacturingCode manufacturingCode = ManufacturingCode.AUSTRALIAN_PBS_MANUFACTURER_CODE;
 *   manufacturingCode.setExtension( "AP" ); //astrazeneca example 
 * </pre>
 * 
 * @author NeHTA
 *
 */
public enum ManufacturingCode implements UniqueIdentifier {
    MEDVIEW_PRESCRIPTION_ITEM_IDENTIFIER( "1.2.36.1.2001.1005.36", "Medview prescription item identifier" ),

    AUSTRALIAN_PBS_MANUFACTURER_CODE( "1.2.36.1.2001.1005.23", "Australian PBS Manufacturer Code" ),

    MEDVIEW_TRANSACTION_IDENTIFIER( "1.2.36.1.2001.1005.35", "Medview transaction identifier" ),

    BARWON_PRESCRIBE_TRANSACTION_IDENTIFIER( "1.2.36.1.2001.1005.28.1.3", "Barwon prescribe transaction identifier" );
    
    UniqueIdentifierImpl impl; //shaded implementation

    ManufacturingCode( String root,String displayName ) {
        impl = new UniqueIdentifierImpl(root);
        impl.setAssigningAuthorityName( displayName );
    }

    @Override
    public String getRoot() {
        return impl.getRoot();
    }
    
    @Override
    public String getExtension() {
        return impl.getExtension();
    }

    public void setExtension(String extension) {
        impl.setExtension(extension);
    }


    @Override
    public String getAssigningAuthorityName() {
        return impl.getAssigningAuthorityName();
    }

    @Override
    public String getAssigningGeographicArea() {
        return impl.getAssigningGeographicArea();
    }

    @Override
    public Boolean getDisplayable() {
        return impl.getDisplayable();
    }

    @Override
    public NullFlavor getNullFlavour() {
        return impl.getNullFlavour();
    }




}
