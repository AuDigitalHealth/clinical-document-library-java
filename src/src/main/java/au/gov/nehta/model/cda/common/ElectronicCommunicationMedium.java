package au.gov.nehta.model.cda.common;

public enum ElectronicCommunicationMedium {
    UNDEFINED(null),
    TELEPHONE("Phone"),
    FAX("Fax"),
    EMAIL("Email"),
    FTP("FTP"),
    HTTP("HTTP"),
    MLLP("MLLP"),
    Modem("Modem"),
    NFS("NFS"),
    TELNET("Telnet"),
    MOBILE("Mobile"),
    PAGE("Page"),
    OTHER("Other");

    private String name;

    public String getName() {
        return name;
    }

    ElectronicCommunicationMedium(String name) {
        this.name = name;
    }
}
