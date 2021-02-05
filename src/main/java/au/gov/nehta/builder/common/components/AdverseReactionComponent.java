package au.gov.nehta.builder.common.components;

import au.gov.nehta.builder.common.ClinicalDocumentCodes;
import au.gov.nehta.builder.common.NarrativeUtilCommon;
import au.gov.nehta.builder.util.CDATypeUtil;
import au.gov.nehta.builder.util.Converter;
import au.gov.nehta.model.cda.common.code.Coded;
import au.gov.nehta.model.clinical.es.AdverseReaction;
import au.gov.nehta.model.clinical.es.NewlyIdentifiedAdverseReactions;
import au.net.electronichealth.ns.cda._2_0.ActClassObservation;
import au.net.electronichealth.ns.cda._2_0.ActRelationshipHasComponent;
import au.net.electronichealth.ns.cda._2_0.CD;
import au.net.electronichealth.ns.cda._2_0.CE;
import au.net.electronichealth.ns.cda._2_0.ObjectFactory;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Act;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Component3;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Entry;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040EntryRelationship;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Observation;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Participant2;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040ParticipantRole;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040PlayingEntity;
import au.net.electronichealth.ns.cda._2_0.POCDMT000040Section;
import au.net.electronichealth.ns.cda._2_0.ParticipationType;
import au.net.electronichealth.ns.cda._2_0.XActClassDocumentEntryAct;
import au.net.electronichealth.ns.cda._2_0.XActMoodDocumentObservation;
import au.net.electronichealth.ns.cda._2_0.XActRelationshipEntryRelationship;
import au.net.electronichealth.ns.cda._2_0.XDocumentActMood;

import java.util.Map;
import java.util.Objects;
import java.util.UUID;

public class AdverseReactionComponent {

    private ObjectFactory objectFactory = new ObjectFactory();
    private Map<String, CD> codeMap;

    public AdverseReactionComponent(Map<String, CD> codeMap) {
        this.codeMap = codeMap;
    }

    public POCDMT000040Component3 getAdverseReactions(NewlyIdentifiedAdverseReactions
                                                              newlyIdentifiedAdverseReactions) {

        POCDMT000040Component3 newlyIdentifiedAdverseReactionsComponent = objectFactory
                .createPOCDMT000040Component3();
        newlyIdentifiedAdverseReactionsComponent.setTypeCode(ActRelationshipHasComponent.COMP);
        POCDMT000040Section adverseReactionSection = objectFactory.createPOCDMT000040Section();
        adverseReactionSection.setId(CDATypeUtil.getII(UUID.randomUUID().toString()));
        adverseReactionSection.setCode((CE) codeMap.get(ClinicalDocumentCodes.ADVERSE_REACTIONS));
        adverseReactionSection.setTitle(CDATypeUtil.getST("Adverse Reactions"));
        adverseReactionSection.setText(
                NarrativeUtilCommon.getAdverseReactionsNarrative(newlyIdentifiedAdverseReactions));
        if (null != newlyIdentifiedAdverseReactions.getAdverseReactions()
                && !newlyIdentifiedAdverseReactions.getAdverseReactions().isEmpty()) {
            newlyIdentifiedAdverseReactions.getAdverseReactions().stream()
                    .filter(Objects::nonNull)
                    .forEach(adverseReaction -> adverseReactionSection.getEntry()
                            .add(getAdverseReactionEntry(adverseReaction)));
        }
        newlyIdentifiedAdverseReactionsComponent.setSection(adverseReactionSection);
        return newlyIdentifiedAdverseReactionsComponent;
    }

    private POCDMT000040Entry getAdverseReactionEntry(AdverseReaction adverseReaction) {
        POCDMT000040Entry adverseReactionEntry = objectFactory.createPOCDMT000040Entry();

        POCDMT000040Act adverseReactionAct = objectFactory.createPOCDMT000040Act();
        adverseReactionAct.setClassCode(XActClassDocumentEntryAct.ACT);
        adverseReactionAct.setMoodCode(XDocumentActMood.EVN);
        adverseReactionAct.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
        adverseReactionAct.setCode(codeMap.get(ClinicalDocumentCodes.ADVERSE_REACTION));
        POCDMT000040Participant2 adverseReactionSubstanceOrAgent = objectFactory
                .createPOCDMT000040Participant2();
        adverseReactionSubstanceOrAgent.setTypeCode(ParticipationType.CAGNT);
        POCDMT000040ParticipantRole participantRole = objectFactory.createPOCDMT000040ParticipantRole();
        POCDMT000040PlayingEntity playingEntity = objectFactory.createPOCDMT000040PlayingEntity();
        playingEntity.setCode(Converter.convertToCECode(adverseReaction.getSubstanceOrAgent()));
        participantRole.setPlayingEntity(playingEntity);
        adverseReactionSubstanceOrAgent.setParticipantRole(participantRole);
        adverseReactionAct.getParticipant().add(adverseReactionSubstanceOrAgent);

        adverseReactionAct.getEntryRelationship()
                .add(getReactionEventEntryRelationshipCause(adverseReaction));

        adverseReactionEntry.setAct(adverseReactionAct);
        return adverseReactionEntry;
    }

    private POCDMT000040EntryRelationship getReactionEventEntryRelationshipCause(
            AdverseReaction adverseReaction) {

        au.net.electronichealth.ns.cda._2_0.POCDMT000040EntryRelationship entryRelationshipCause = objectFactory
                .createPOCDMT000040EntryRelationship();
        POCDMT000040Observation reactionEventObservation = objectFactory
                .createPOCDMT000040Observation();
        reactionEventObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
        reactionEventObservation.setClassCode(ActClassObservation.OBS);
        reactionEventObservation.setMoodCode(XActMoodDocumentObservation.EVN);
        reactionEventObservation.setCode(codeMap.get(ClinicalDocumentCodes.REACTION_EVENT));
        reactionEventObservation.getValue()
                .add(Converter.convertToCDCode(adverseReaction.getReactionEvent().getReactionType()));
        if (null != adverseReaction.getReactionEvent().getManifestations()) {
            adverseReaction.getReactionEvent().getManifestations().stream().filter(Objects::nonNull)
                    .forEach(manifestation -> reactionEventObservation.getEntryRelationship().add(
                            getReactionEventEntryRelationshipManifestation(
                                    adverseReaction.getReactionEvent().getReactionType(), manifestation)));
        } else {
            throw new RuntimeException(
                    "Mandatory attribute missing : Adverse Reaction > Reaction Event > Manifestation(s)");
        }
        entryRelationshipCause.setTypeCode(XActRelationshipEntryRelationship.CAUS);
        entryRelationshipCause.setObservation(reactionEventObservation);
        return entryRelationshipCause;
    }

    private POCDMT000040EntryRelationship getReactionEventEntryRelationshipManifestation(
            Coded reactionType, Coded manifestation) {

        POCDMT000040EntryRelationship entryRelationshipManifest = objectFactory
                .createPOCDMT000040EntryRelationship();
        entryRelationshipManifest.setInversionInd(true);
        entryRelationshipManifest.setTypeCode(XActRelationshipEntryRelationship.MFST);
        POCDMT000040Observation manifestObservation = objectFactory.createPOCDMT000040Observation();
        manifestObservation.setClassCode(ActClassObservation.OBS);
        manifestObservation.setMoodCode(XActMoodDocumentObservation.EVN);
        manifestObservation.getId().add(CDATypeUtil.getII(UUID.randomUUID().toString()));
        manifestObservation.setCode(Converter.convertToCDCode(manifestation));
        manifestObservation.getValue().add(Converter.convertToCVCode(reactionType));
        entryRelationshipManifest.setObservation(manifestObservation);
        return entryRelationshipManifest;
    }
}
