package au.gov.nehta.model.clinical.common.types;

public class PbsAuthorityPrescriptionNumber extends UniqueIdentifierImpl implements UniqueIdentifier {
    public static final String ROOT= "1.2.36.1.5001.1.1.3.2.2";
    
    public PbsAuthorityPrescriptionNumber(String number){
        super(ROOT,number);
    }
}
