package au.gov.nehta.model.clinical.common.address;

import java.util.StringJoiner;

public enum PostalDeliveryType {

    Undefined(null, null),

    CareOfPostOfficeOrPosteRestante("CarePo", "Care-Of Post Office Also Known As Poste Restante)"),

    CommunityMailAgent("CMA", "Community Mail Agent"),

    CommunityMailBag("CMB", "Community Mail Bag"),

    GeneralPostOfficeBox("GPO", "General Post Office Box"),

    LockedMailBagService("Locked Bag", "Locked Mail Bag Service"),

    PostOfficeBox("PO Box", "Post Office Box"),

    MailService("MS", "Mail Service"),

    CareOfPostOffice("Care PO", "Poste Restante (also known as Care-of Post Office)"),

    PrivateMailBagService("Private Bag", "Private Mail Bag Service"),

    RoadsideDelivery("RSD", "Roadside Delivery"),

    RoadsideMailBoxOrBag("RMB", "Roadside Mail Box/Bag"),

    RoadsideMailService("RMS", "Roadside Mail Service");

    private String code;
    private String name;

    PostalDeliveryType(String code, String name) {
        this.code = code;
        this.name = name;
    }

    public String getCode() {
        return code;
    }

    public String getName() {
        return name;
    }

    @Override
    public String toString() {
        return new StringJoiner(", ", StreetType.class.getSimpleName() + "[", "")
                .add("code='" + code + "'")
                .add("name='" + name + "'")
                .toString();
    }
}
