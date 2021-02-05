package au.gov.nehta.model.clinical.common.types;

public class StreamlinedAuthorityApprovalNumber extends UniqueIdentifierImpl implements UniqueIdentifier {

    public static final String ROOT = "1.2.36.1.2001.1005.24";

    public StreamlinedAuthorityApprovalNumber(String number) {
        super(ROOT, number);
    }
}
