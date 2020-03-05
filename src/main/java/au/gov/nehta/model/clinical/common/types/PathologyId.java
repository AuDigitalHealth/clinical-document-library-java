package au.gov.nehta.model.clinical.common.types;

import java.util.UUID;

/**
 * A Convenience class to create UniqueIdentifier's with
 * a know root for pathology and diagnostic investigation.
 *
 */
public class PathologyId extends UniqueIdentifierImpl implements UniqueIdentifier{

	public static final String PATH_ORDER_DETAILS_OID = "1.2.36.1.2001.1005.52."; 
	public static final String PATH_REPORT_OID = "1.2.36.1.2001.1005.54.";
	
	public static final String DI_ACCESSION__OID = "1.2.36.1.2001.1005.53.";
	
	public PathologyId(String root, String extension){
		super(root,extension);
	}
	
	/**
	* Create a UniqueIdentifier with the supplied HPIO appended to the
	* OrderDetails OID and a random extension 
	**/
	public static PathologyId orderID(String HPIO ){
		return new PathologyId(PATH_ORDER_DETAILS_OID+HPIO, UUID.randomUUID().toString());
	}
	
	/**
	* Create a UniqueIdentifier with the supplied HPIO appended to the
	* OrderDetails OID and the supplied id as the extension
	**/
	public static PathologyId orderID(String HPIO, String id ){
		return new PathologyId(PATH_ORDER_DETAILS_OID+HPIO, id);
	}
	
	/**
	* Create a UniqueIdentifier with the supplied HPIO appended to the
	* PathologyReport OID and a random extension 
	**/
	public static PathologyId pathReportID(String HPIO ){
		return  new PathologyId(PATH_REPORT_OID+HPIO, UUID.randomUUID().toString());
	}
	
	/**
	* Create a UniqueIdentifier with the supplied HPIO appended to the
	* PathologyReport OID and the supplied id as the extension
	**/
	public static PathologyId pathReportID( String HPIO, String id ){
		return new PathologyId( PATH_REPORT_OID+HPIO, id );
	}
	

	/**
	* Create a UniqueIdentifier with the supplied HPIO appended to the
	* Diagnostic Image Order Details Accession OID and a random extension 
	**/
	public static PathologyId diAccessionID(String HPIO ){
		return  new PathologyId(DI_ACCESSION__OID+HPIO, UUID.randomUUID().toString());
	}
	
	/**
	* Create a UniqueIdentifier with the supplied HPIO appended to the
	* Diagnostic Image Order Details Accession OIDand the supplied id as the extension
	**/
	public static PathologyId diAccessionID( String HPIO, String id ){
		return new PathologyId( PATH_ORDER_DETAILS_OID+HPIO, id );
	}
	
}
