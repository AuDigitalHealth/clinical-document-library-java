package au.gov.nehta.builder.shs;

import au.gov.nehta.builder.DocumentCreatorUtil;
import au.gov.nehta.builder.util.narrative.NarrativeUtil;
import au.gov.nehta.model.clinical.common.Immunisation;
import au.gov.nehta.model.clinical.common.KnownMedication;
import au.gov.nehta.model.clinical.common.ProblemDiagnosis;
import au.gov.nehta.model.clinical.common.Procedure;
import au.gov.nehta.model.clinical.common.types.AdverseReaction;
import au.gov.nehta.model.clinical.common.types.Manifestation;
import au.gov.nehta.model.clinical.shs.AdverseReactions;
import au.gov.nehta.model.clinical.shs.ExclusionStatement;
import au.gov.nehta.model.clinical.shs.Immunisations;
import au.gov.nehta.model.clinical.shs.MedicalHistory;
import au.gov.nehta.model.clinical.shs.Medications;
import au.gov.nehta.model.clinical.shs.ProblemDiagnoses;
import au.gov.nehta.model.clinical.shs.Procedures;
import au.gov.nehta.model.clinical.shs.UncatagorisedMedicalHistoryItem;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.StrucDocContent;
import au.net.electronichealth.ns.cda._2_0.StrucDocItem;
import au.net.electronichealth.ns.cda._2_0.StrucDocList;
import au.net.electronichealth.ns.cda._2_0.StrucDocParagraph;
import au.net.electronichealth.ns.cda._2_0.StrucDocTable;
import au.net.electronichealth.ns.cda._2_0.StrucDocTbody;
import au.net.electronichealth.ns.cda._2_0.StrucDocTd;
import au.net.electronichealth.ns.cda._2_0.StrucDocText;
import au.net.electronichealth.ns.cda._2_0.StrucDocThead;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;
import javax.xml.bind.JAXBElement;

public class SharedhealthSummaryUtil extends DocumentCreatorUtil {

    static StrucDocText getAdverseReactionsNarrativeBlock(AdverseReactions ars) {

        if (ars.getAdverseReactions() == null || ars.getAdverseReactions().size() == 0) {
            StrucDocText text = new StrucDocText();
            addExclusionParagraph(ars, "No Adverse Reactions are supplied", text);
            return text;
        }

        StrucDocTable table = new StrucDocTable();

        StrucDocTbody body = addBody(table);
        addCaption(table, "Adverse Reactions");
        addHeader(table, "Substance/Agent", "Manifestations");

        for (AdverseReaction ar : ars.getAdverseReactions()) {

            StrucDocList list = new StrucDocList();
            for (Manifestation mfst : ar.getManifestations()) {
                StrucDocItem item = new StrucDocItem();
                item.getContent().add(print(mfst.getCode()));
                list.getItem().add(item);
            }

            List<StrucDocTd> cols = new ArrayList<>();

            StrucDocTd sbst = new StrucDocTd();
            sbst.getContent().add(print(ar.getSubstanceAgent()));
            cols.add(sbst);

            StrucDocTd mlist = new StrucDocTd();
            JAXBElement<StrucDocList> jaxblist = new ObjectFactory().createStrucDocTdList(list);
            mlist.getContent().add(jaxblist);
            cols.add(mlist);

            add(body, cols);
        }

        return textWithTable(table);
    }

    static StrucDocText getMedicationsNarrativeBlock(Medications meds) {

        if (meds.getKnownMedications() == null || meds.getKnownMedications().size() == 0) {
            StrucDocText text = new StrucDocText();
            addExclusionParagraph(meds, "No Medications are supplied", text);
            return text;
        }

        StrucDocTable table = new StrucDocTable();
        StrucDocTbody body = addBody(table);
        addCaption(table, "Medications");
        addHeader(table, "Medication", "Directions", "Clinical Indication", "Comment");

        for (KnownMedication m : meds.getKnownMedications()) {

            add(body, print(m.getMedicine()),
                    safe(m.getDirections()),
                    safe(m.getClinicalIndication()),
                    safe(m.getComment()));
        }

        return textWithTable(table);
    }

    static StrucDocText getImmunisationsNarrativeBlock(Immunisations immunisations) {

        if (immunisations.getAdministeredImmunisations() == null
                || immunisations.getAdministeredImmunisations().size() == 0) {
            StrucDocText text = new StrucDocText();
            addExclusionParagraph(immunisations, "No Immunisations are supplied", text);
            return text;
        }

        StrucDocTable table = new StrucDocTable();
        StrucDocTbody body = addBody(table);
        addCaption(table, "Immunisations - Administered Immunisations");
        addHeader(table, "Vaccine", "Sequence Number", "Date");

        for (Immunisation i : immunisations.getAdministeredImmunisations()) {

            add(body, print(i.getTheraputicGood()),
                    safe(i.getSequenceNumber()),
                    print(i.getMedicationActionDateTime())
            );
        }

        return textWithTable(table);
    }

    static StrucDocText getMedicalHistoryNarrativeBlock(MedicalHistory medicalHistory) {
        StrucDocText text = new StrucDocText();
        if (medicalHistory == null) {
            return text;
        }

        ProblemDiagnoses problemDiagnosis = medicalHistory.getProblemDiagnosis();
        if (problemDiagnosis == null ||
                problemDiagnosis.getDiagnoses() == null ||
                problemDiagnosis.getDiagnoses().size() == 0) {

            addExclusionParagraph(problemDiagnosis, "No Problem Diagnosis are supplied", text);
        }

        Procedures procedures = medicalHistory.getProcedures();
        if (procedures == null ||
                procedures.getProcedures() == null ||
                procedures.getProcedures().size() == 0) {

            addExclusionParagraph(procedures, "No Procedures are supplied", text);

        }

        // create a list of sorted data items based on the supplied
        // objects, sort by date As per the CUP requirement
        List<NarrativeTripple> tripples = getTripples(procedures, problemDiagnosis,
                medicalHistory.getOtherHistoryItems());

        StrucDocTable hisTable = new StrucDocTable();
        addCaption(hisTable, "Medical History");

        StrucDocTbody body = new StrucDocTbody();

        StrucDocThead head = new StrucDocThead();
        head.getTr().add(NarrativeUtil.getTableHeaderRow(
                Arrays.asList("Item", "Date", "Comment")));

        for (NarrativeTripple t : tripples) {
            add(body, t.item, t.date, t.comment);
        }

        JAXBElement<StrucDocTable> hisElement = null;
        if (body.getTr().size() > 0) {
            hisTable.setThead(head);
            hisTable.getTbody().add(body);
            hisElement = new ObjectFactory().createStrucDocTextTable(hisTable);
        }
        text.getContent().add(hisElement);
        return text;
    }

    // get a sorted list of medical history items
    // sorting on date as per CUP requirement
    private static List<NarrativeTripple> getTripples(Procedures procedures,
                                                      ProblemDiagnoses problemDiagnoses,
                                                      List<UncatagorisedMedicalHistoryItem> otherHistoryItems) {

        List<NarrativeTripple> tripples = new ArrayList<>();

        if (procedures != null && procedures.getProcedures() != null) {
            for (Procedure p : procedures.getProcedures()) {
                tripples.add(new NarrativeTripple(p));
            }
        }

        if (problemDiagnoses != null && problemDiagnoses.getDiagnoses() != null) {
            for (ProblemDiagnosis pd : problemDiagnoses.getDiagnoses()) {
                tripples.add(new NarrativeTripple(pd));
            }
        }

        if (otherHistoryItems != null) {
            for (UncatagorisedMedicalHistoryItem i : otherHistoryItems) {
                tripples.add(new NarrativeTripple(i));
            }
        }

        Collections.sort(tripples, new NarrativeTrippleComparator());

        return tripples;
    }

    private static void addExclusionParagraph(ExclusionStatement es, String alternate,
                                              StrucDocText text) {
        StrucDocParagraph para = new StrucDocParagraph();

        // if we're missing the ExclusionStatement object or
        // it contains a coded exclusion statement then show the message
        if (es == null || es.getExclusionStatement() != null) {
            // just show the message as per the CUP requirement
            // para.getContent().add( print(es.getExclusionStatement()) );
            // }else{
            para.getContent().add(alternate);
        }

        JAXBElement<StrucDocParagraph> paraJaxbElement = new ObjectFactory()
                .createStrucDocTextParagraph(para);
        text.getContent().add(paraJaxbElement);
    }

    protected static JAXBElement<StrucDocContent> getContent(String text) {
        StrucDocContent content = new StrucDocContent();
        content.getContent().add(text);
        JAXBElement<StrucDocContent> jaxbContent = new ObjectFactory().createStrucDocTdContent(content);
        return jaxbContent;
    }
}

class NarrativeTrippleComparator implements Comparator<NarrativeTripple>, Serializable {

    private static final long serialVersionUID = 1L;

    @Override
    public int compare(NarrativeTripple o1, NarrativeTripple o2) {
        return o2.sortDate.compareTo(o1.sortDate);
    }

}
