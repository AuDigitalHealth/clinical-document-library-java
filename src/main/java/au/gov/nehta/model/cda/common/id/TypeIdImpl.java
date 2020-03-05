package au.gov.nehta.model.cda.common.id;

import au.gov.nehta.model.clinical.common.types.UniqueIdentifierImpl;

public class TypeIdImpl extends UniqueIdentifierImpl implements TypeId {

	private TypeIdImpl( String extension, String root ) {
		this.extension = extension;
		this.root = root;
	}

	public static TypeId getInstance( String extension, String root ) {
		return (TypeId) new TypeIdImpl( extension, root );
	}

}
