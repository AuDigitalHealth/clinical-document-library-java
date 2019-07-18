package au.gov.nehta.model.clinical.es;

import au.gov.nehta.model.cda.common.time.PreciseDate;

public class HandlingAndProcessing {
    protected PreciseDate collectionDateTime;
    protected String collectionSetting;
    protected PreciseDate receiptDateTime;

    public PreciseDate getCollectionDateTime() {
        return collectionDateTime;
    }

    public String getCollectionSetting() {
        return collectionSetting;
    }

    public PreciseDate getReceiptDateTime() {
        return receiptDateTime;
    }

    public void setCollectionDateTime(PreciseDate collectionDateTime) {
        this.collectionDateTime = collectionDateTime;
    }

    public void setCollectionSetting(String collectionSetting) {
        this.collectionSetting = collectionSetting;
    }

    public void setReceiptDateTime(PreciseDate receiptDateTime) {
        this.receiptDateTime = receiptDateTime;
    }
}
