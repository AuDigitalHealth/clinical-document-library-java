package au.gov.nehta.builder.common;

import au.net.electronichealth.ns.cda._2_0.ActClass;
import au.net.electronichealth.ns.cda._2_0.ActClassObservation;
import au.net.electronichealth.ns.cda._2_0.ActMood;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Act;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Entry;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040EntryRelationship;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Observation;
import au.net.electronichealth.ns.cda._2_0.XActClassDocumentEntryAct;
import au.net.electronichealth.ns.cda._2_0.XActMoodDocumentObservation;
import au.net.electronichealth.ns.cda._2_0.XActRelationshipEntry;
import au.net.electronichealth.ns.cda._2_0.XActRelationshipEntryRelationship;
import au.net.electronichealth.ns.cda._2_0.XDocumentActMood;
import au.net.electronichealth.ns.ci.cda.extensions._3.ControlAct;
import au.net.electronichealth.ns.ci.cda.extensions._3.Policy;

public class Creator {

    public static POCDMT000040Observation getObsEvn() {
        POCDMT000040Observation ob = new POCDMT000040Observation();
        ob.setClassCode( ActClassObservation.OBS );
        ob.setMoodCode( XActMoodDocumentObservation.EVN );
        return ob;
    }

    public static POCDMT000040Act getActEvn() {
        POCDMT000040Act act = new POCDMT000040Act();
        act.setClassCode( XActClassDocumentEntryAct.ACT );
        act.setMoodCode( XDocumentActMood.EVN );
        return act;
    }
    
    public static ControlAct getControlActEvnControlAct() {
        ControlAct control = new ControlAct();
        control.setClassCode( ActClass.CACT );
        control.setMoodCode( XDocumentActMood.EVN );
        return control;
    }

    public static POCDMT000040EntryRelationship getCompER() {
        POCDMT000040EntryRelationship start= new POCDMT000040EntryRelationship();
        start.setTypeCode( XActRelationshipEntryRelationship.COMP );
        return start;
    }
    
    public static Policy getJurispolPermPolicy() {
        Policy authPolicy = new Policy();
        authPolicy.setClassCode( ActClass.JURISPOL );
        authPolicy.setMoodCode( ActMood.PERM );
        return authPolicy;
    }
    
    public static POCDMT000040Entry getDRIVEntry() {
        POCDMT000040Entry entry = new POCDMT000040Entry();
        entry.setTypeCode( XActRelationshipEntry.DRIV );
        return entry;
    }
    
    public static POCDMT000040EntryRelationship getERComp() {
        POCDMT000040EntryRelationship er = new POCDMT000040EntryRelationship();
        er.setTypeCode( XActRelationshipEntryRelationship.COMP );
        return er;
    }




}
