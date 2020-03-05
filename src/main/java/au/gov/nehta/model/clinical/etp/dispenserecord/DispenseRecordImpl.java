package au.gov.nehta.model.clinical.etp.dispenserecord;

import au.gov.nehta.common.utils.ArgumentUtils;

public class DispenseRecordImpl implements DispenseRecord {
	private final DispenseRecordContext context;
	private final DispenseItem content;

	public DispenseRecordImpl( DispenseRecordContext context, DispenseItem content ) {
		ArgumentUtils.checkNotNull( context, "Dispense Record Context" );
		ArgumentUtils.checkNotNull( content, "Dispense Item" );
		this.context = context;
		this.content = content;
	}

	public DispenseRecordContext getContext() {
		return context;
	}

	public DispenseItem getContent() {
		return content;
	}
}
