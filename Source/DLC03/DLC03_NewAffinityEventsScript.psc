Scriptname DLC03:DLC03_NewAffinityEventsScript extends Quest const
{New events in this DLC that companions in this DLC and companions from base game will respond to}

Group Quests
	;DLC QUESTS GO HERE

	;CA_QuestStage_Bump Property XXX Auto Const Mandatory

	CA_QuestStage_Bump Property DLC03MQ01 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03MQ02 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03MQ03 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03MQ05 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03MQ06 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03MQ06a Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03MQPostQuest Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03AcadiaM01 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03AtomM01 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03CoA_DialogueNucleusEntrance Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03AtomM02 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03FarHarborFF01 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03FarHarborFF02 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03FarHarborFF03a Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03FarHarborFF03b Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03FarHarborFF03c Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03FarHarborM01 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03FarHarborM03 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03FarHarborS01 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03FarHarborS02 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03FarHarborS03 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03CoA_FFNucleus01 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03CoA_FFNucleus02 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03CoA_FFNucleus03 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03AcadiaM02 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03AcadiaM03 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03AcadiaDialogue Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03AcadiaM04 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03Acadia_BoS Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03Acadia_Institute Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03DialogueNakanoResidence Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03DialogueKasumiAcadia Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03DialogueDiMA Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03DialogueNick Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03CoA_DialogueNucleus Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03_V118_PearlHiring Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03_V118_Intro Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03_V118_Quest Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03_V118_ClueTracker Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03DialogueV118 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03_ADV017 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03DialogueFarHarbor Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03DialogueFarHarborPostMQ05Avery Auto Const Mandatory
	CA_QuestStage_Bump Property DLC03DialogueFarHarborPostQuest Auto Const Mandatory


EndGroup

Group DLCCompanionActors
	CompanionActorScript Property DLC03_CompanionOldLongfellowRef const auto Mandatory
EndGroup

Group DLCCompanionAffinityKeywords
	keyword Property CA_CustomEvent_OldLongfellowLoves auto const mandatory
	keyword Property CA_CustomEvent_OldLongfellowLikes auto const mandatory
	keyword Property CA_CustomEvent_OldLongfellowDislikes auto const mandatory
	keyword Property CA_CustomEvent_OldLongfellowHates auto const mandatory
	keyword Property CA_CustomEvent_OldLongfellow__UNSET auto const mandatory
EndGroup

Group FOCompanionAffinityEventQuest
	CompanionAffinityEventQuestScript Property CompanionAffinity const auto mandatory
EndGroup

Group FO4CompanionActors
	CompanionActorScript Property CaitRef const auto mandatory
	CompanionActorScript Property CurieRef const auto mandatory
	CompanionActorScript Property CodsworthRef const auto mandatory
	CompanionActorScript Property BoSPaladinDanseRef const auto mandatory
	CompanionActorScript Property DeaconRef const auto mandatory
	CompanionActorScript Property HancockRef const auto mandatory
	CompanionActorScript Property CompMacCreadyRef const auto mandatory
	CompanionActorScript Property PiperRef const auto mandatory
	CompanionActorScript Property PrestonRef const auto mandatory
	CompanionActorScript Property StrongRef const auto mandatory
	CompanionActorScript Property ValentineRef const auto mandatory
	CompanionActorScript Property X688Ref const auto mandatory
EndGroup

Group FO4CompanionAffinityKeywords
	keyword Property CA_CustomEvent_CaitLoves auto const mandatory
	keyword Property CA_CustomEvent_CaitLikes auto const mandatory
	keyword Property CA_CustomEvent_CaitDislikes auto const mandatory
	keyword Property CA_CustomEvent_CaitHates auto const mandatory
	keyword Property CA_CustomEvent_Cait__UNSET auto const mandatory

	keyword Property CA_CustomEvent_CodsworthLoves auto const mandatory
	keyword Property CA_CustomEvent_CodsworthLikes auto const mandatory
	keyword Property CA_CustomEvent_CodsworthDislikes auto const mandatory
	keyword Property CA_CustomEvent_CodsworthHates auto const mandatory
	keyword Property CA_CustomEvent_Codsworth__UNSET auto const mandatory

	keyword Property CA_CustomEvent_CurieLoves auto const mandatory
	keyword Property CA_CustomEvent_CurieLikes auto const mandatory
	keyword Property CA_CustomEvent_CurieDislikes auto const mandatory
	keyword Property CA_CustomEvent_CurieHates auto const mandatory
	keyword Property CA_CustomEvent_Curie__UNSET auto const mandatory

	keyword Property CA_CustomEvent_DanseLoves auto const mandatory
	keyword Property CA_CustomEvent_DanseLikes auto const mandatory
	keyword Property CA_CustomEvent_DanseDislikes auto const mandatory
	keyword Property CA_CustomEvent_DanseHates auto const mandatory
	keyword Property CA_CustomEvent_Danse__UNSET auto const mandatory

	keyword Property CA_CustomEvent_DeaconLoves auto const mandatory
	keyword Property CA_CustomEvent_DeaconLikes auto const mandatory
	keyword Property CA_CustomEvent_DeaconDislikes auto const mandatory
	keyword Property CA_CustomEvent_DeaconHates auto const mandatory
	keyword Property CA_CustomEvent_Deacon__UNSET auto const mandatory

	keyword Property CA_CustomEvent_HancockLoves auto const mandatory
	keyword Property CA_CustomEvent_HancockLikes auto const mandatory
	keyword Property CA_CustomEvent_HancockDislikes auto const mandatory
	keyword Property CA_CustomEvent_HancockHates auto const mandatory
	keyword Property CA_CustomEvent_Hancock__UNSET auto const mandatory

	keyword Property CA_CustomEvent_MacCreadyLoves auto const mandatory
	keyword Property CA_CustomEvent_MacCreadyLikes auto const mandatory
	keyword Property CA_CustomEvent_MacCreadyDislikes auto const mandatory
	keyword Property CA_CustomEvent_MacCreadyHates auto const mandatory
	keyword Property CA_CustomEvent_MacCready__UNSET auto const mandatory

	keyword Property CA_CustomEvent_PiperLoves auto const mandatory
	keyword Property CA_CustomEvent_PiperLikes auto const mandatory
	keyword Property CA_CustomEvent_PiperDislikes auto const mandatory
	keyword Property CA_CustomEvent_PiperHates auto const mandatory
	keyword Property CA_CustomEvent_Piper__UNSET auto const mandatory

	keyword Property CA_CustomEvent_PrestonLoves auto const mandatory
	keyword Property CA_CustomEvent_PrestonLikes auto const mandatory
	keyword Property CA_CustomEvent_PrestonDislikes auto const mandatory
	keyword Property CA_CustomEvent_PrestonHates auto const mandatory
	keyword Property CA_CustomEvent_Preston__UNSET auto const mandatory

	keyword Property CA_CustomEvent_StrongLoves auto const mandatory
	keyword Property CA_CustomEvent_StrongLikes auto const mandatory
	keyword Property CA_CustomEvent_StrongDislikes auto const mandatory
	keyword Property CA_CustomEvent_StrongHates auto const mandatory
	keyword Property CA_CustomEvent_Strong__UNSET auto const mandatory

	keyword Property CA_CustomEvent_ValentineLoves auto const mandatory
	keyword Property CA_CustomEvent_ValentineLikes auto const mandatory
	keyword Property CA_CustomEvent_ValentineDislikes auto const mandatory
	keyword Property CA_CustomEvent_ValentineHates auto const mandatory
	keyword Property CA_CustomEvent_Valentine__UNSET auto const mandatory

	keyword Property CA_CustomEvent_X688Loves auto const mandatory
	keyword Property CA_CustomEvent_X688Likes auto const mandatory
	keyword Property CA_CustomEvent_X688Dislikes auto const mandatory
	keyword Property CA_CustomEvent_X688Hates auto const mandatory
	keyword Property CA_CustomEvent_X688__UNSET auto const mandatory

EndGroup

Group FO4SpecialHandlingGlobals
	GlobalVariable Property Cait_EventCondition_DislikesPlayerTakingChems Auto Const
	GlobalVariable Property MinCastleAttacker Auto Const
	GlobalVariable Property MQ302Faction Auto Const
EndGroup


;REGISTER FOR BASE GAME SCRIPT'S EVENT
event OnInit()
	RegisterForCustomEvent(CompanionAffinity, "CompanionAffinityEvent")
endEvent

;DLC COMPANIONS
function Longfellow__UNSET()

endFunction

function Longfellow_Neutral(bool CheckCompanionProximity = true)
endFunction

function Longfellow_Dislikes(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_OldLongfellowDislikes, CheckCompanionProximity)
endFunction

function Longfellow_Hates(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_OldLongfellowHates, CheckCompanionProximity)
endFunction

function Longfellow_Likes(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_OldLongfellowLikes, CheckCompanionProximity)
endFunction

function Longfellow_Loves(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_OldLongfellowLoves, CheckCompanionProximity)
endFunction


;REIMPLEMENTATION OF ALL PRE-EXISTING COMPANIONS
; companion event handleDialogueBump_r functions - TODO
function Cait__UNSET()

endFunction

function Cait_Neutral(bool CheckCompanionProximity = true)
endFunction

function Cait_Dislikes(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_CaitDislikes, CheckCompanionProximity)
endFunction

function Cait_Hates(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_CaitHates, CheckCompanionProximity)
endFunction

function Cait_Likes(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_CaitLikes, CheckCompanionProximity)
endFunction

function Cait_Loves(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_CaitLoves, CheckCompanionProximity)
endFunction

function Codsworth__UNSET()
endFunction

function Codsworth_Neutral(bool CheckCompanionProximity = true)
endFunction

function Codsworth_Dislikes(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_CodsworthDislikes, CheckCompanionProximity)
endFunction

function Codsworth_Hates(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_CodsworthHates, CheckCompanionProximity)
endFunction

function Codsworth_Likes(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_CodsworthLikes, CheckCompanionProximity)
endFunction

function Codsworth_Loves(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_CodsworthLoves, CheckCompanionProximity)
endFunction

function Curie__UNSET()
endFunction

function Curie_Neutral(bool CheckCompanionProximity = true)
endFunction

function Curie_Dislikes(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_CurieDislikes, CheckCompanionProximity)
endFunction

function Curie_Hates(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_CurieHates, CheckCompanionProximity)
endFunction

function Curie_Likes(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_CurieLikes, CheckCompanionProximity)
endFunction

function Curie_Loves(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_CurieLoves, CheckCompanionProximity)
endFunction

function Danse__UNSET()
endFunction

function Danse_Neutral(bool CheckCompanionProximity = true)
endFunction

function Danse_Dislikes(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_DanseDislikes, CheckCompanionProximity)
endFunction

function Danse_Hates(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_DanseHates, CheckCompanionProximity)
endFunction

function Danse_Likes(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_DanseLikes, CheckCompanionProximity)
endFunction

function Danse_Loves(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_DanseLoves, CheckCompanionProximity)
endFunction

function Deacon__UNSET()
endFunction

function Deacon_Neutral(bool CheckCompanionProximity = true)
endFunction

function Deacon_Dislikes(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_DeaconDislikes, CheckCompanionProximity)
endFunction

function Deacon_Hates(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_DeaconHates, CheckCompanionProximity)
endFunction

function Deacon_Likes(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_DeaconLikes, CheckCompanionProximity)
endFunction

function Deacon_Loves(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_DeaconLoves, CheckCompanionProximity)
endFunction

function Hancock__UNSET()
endFunction

function Hancock_Neutral(bool CheckCompanionProximity = true)
endFunction

function Hancock_Dislikes(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_HancockDislikes, CheckCompanionProximity)
endFunction

function Hancock_Hates(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_HancockHates, CheckCompanionProximity)
endFunction

function Hancock_Likes(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_HancockLikes, CheckCompanionProximity)
endFunction

function Hancock_Loves(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_HancockLoves, CheckCompanionProximity)
endFunction

function MacCready__UNSET()
endFunction

function MacCready_Neutral(bool CheckCompanionProximity = true)
endFunction

function MacCready_Dislikes(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_MacCreadyDislikes, CheckCompanionProximity)
endFunction

function MacCready_Hates(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_MacCreadyHates, CheckCompanionProximity)
endFunction

function MacCready_Likes(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_MacCreadyLikes, CheckCompanionProximity)
endFunction

function MacCready_Loves(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_MacCreadyLoves, CheckCompanionProximity)
endFunction

function Piper__UNSET()
endFunction

function Piper_Neutral(bool CheckCompanionProximity = true)
endFunction

function Piper_Dislikes(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_PiperDislikes, CheckCompanionProximity)
endFunction

function Piper_Hates(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_PiperHates, CheckCompanionProximity)
endFunction

function Piper_Likes(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_PiperLikes, CheckCompanionProximity)
endFunction

function Piper_Loves(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_PiperLoves, CheckCompanionProximity)
endFunction

function Preston__UNSET()
endFunction

function Preston_Neutral(bool CheckCompanionProximity = true)
endFunction

function Preston_Dislikes(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_PrestonDislikes, CheckCompanionProximity)
endFunction

function Preston_Hates(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_PrestonHates, CheckCompanionProximity)
endFunction

function Preston_Likes(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_PrestonLikes, CheckCompanionProximity)
endFunction

function Preston_Loves(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_PrestonLoves, CheckCompanionProximity)
endFunction

function Strong__UNSET()
endFunction

function Strong_Neutral(bool CheckCompanionProximity = true)
endFunction

function Strong_Dislikes(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_StrongDislikes, CheckCompanionProximity)
endFunction

function Strong_Hates(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_StrongHates, CheckCompanionProximity)
endFunction

function Strong_Likes(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_StrongLikes, CheckCompanionProximity)
endFunction

function Strong_Loves(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_StrongLoves, CheckCompanionProximity)
endFunction

function Valentine__UNSET()
endFunction

function Valentine_Neutral(bool CheckCompanionProximity = true)
endFunction

function Valentine_Dislikes(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_ValentineDislikes, CheckCompanionProximity)
endFunction

function Valentine_Hates(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_ValentineHates, CheckCompanionProximity)
endFunction

function Valentine_Likes(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_ValentineLikes, CheckCompanionProximity)
endFunction

function Valentine_Loves(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_ValentineLoves, CheckCompanionProximity)
endFunction

function X688__UNSET()
endFunction

function X688_Neutral(bool CheckCompanionProximity = true)
endFunction

function X688_Dislikes(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_X688Dislikes, CheckCompanionProximity)
endFunction

function X688_Hates(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_X688Hates, CheckCompanionProximity)
endFunction

function X688_Likes(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_X688Likes, CheckCompanionProximity)
endFunction

function X688_Loves(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_X688Loves, CheckCompanionProximity)
endFunction




function SendAffinityEvent(keyword affinityKeyword, bool CheckCompanionProximity = true)
	debug.trace(self + " SendAffinityEvent " + affinityKeyword)
	FollowersScript.SendAffinityEvent(self, affinityKeyword, ShouldSuppressComment = false, IsDialogueBump = true, CheckCompanionProximity = CheckCompanionProximity)
endFunction


Event CompanionAffinityEventQuestScript.CompanionAffinityEvent(CompanionAffinityEventQuestScript akSender, Var[] akArgs)
	; cast akSender to figure out the eventID
	; akArgs:
	; 0: Quest
	; 1: Sender (TopicInfo or Quest)
	; 2: eventID
	Quest eventQuest = akArgs[0] as Quest
	ScriptObject sender = akArgs[1] as ScriptObject
	int eventID = akArgs[2] as int

	debug.trace(self + " CompanionAffinityEvent received: " + eventQuest + ", " + sender + ", " + eventID)

	if eventID == -1
		debug.trace(self + " WARNING - uninitialized eventID from " + sender)
		return
	endif

	; send to correct quest function

	if sender is TopicInfo

		;...

	elseif sender is Quest

		if eventQuest == DLC03MQ01
			HandleQuestStageBump_DLC03MQ01(eventQuest, eventID)
		elseif eventQuest == DLC03MQ02
			HandleQuestStageBump_DLC03MQ02(eventQuest, eventID)
		elseif eventQuest == DLC03MQ03
			HandleQuestStageBump_DLC03MQ03(eventQuest, eventID)
		elseif eventQuest == DLC03MQ05
			HandleQuestStageBump_DLC03MQ05(eventQuest, eventID)
		elseif eventQuest == DLC03MQ06
			HandleQuestStageBump_DLC03MQ06(eventQuest, eventID)
		elseif eventQuest == DLC03MQ06a
			HandleQuestStageBump_DLC03MQ06a(eventQuest, eventID)
		elseif eventQuest == DLC03MQPostQuest
			HandleQuestStageBump_DLC03MQPostQuest(eventQuest, eventID)
		elseif eventQuest == DLC03AcadiaM01
			HandleQuestStageBump_DLC03AcadiaM01(eventQuest, eventID)
		elseif eventQuest == DLC03AtomM01
			HandleQuestStageBump_DLC03AtomM01(eventQuest, eventID)
		elseif eventQuest == DLC03CoA_DialogueNucleusEntrance
			HandleQuestStageBump_DLC03CoA_DialogueNucleusEntrance(eventQuest, eventID)
		elseif eventQuest == DLC03AtomM02
			HandleQuestStageBump_DLC03AtomM02(eventQuest, eventID)
		elseif eventQuest == DLC03FarHarborFF01
			HandleQuestStageBump_DLC03FarHarborFF01(eventQuest, eventID)
		elseif eventQuest == DLC03FarHarborFF02
			HandleQuestStageBump_DLC03FarHarborFF02(eventQuest, eventID)
		elseif eventQuest == DLC03FarHarborFF03a
			HandleQuestStageBump_DLC03FarHarborFF03a(eventQuest, eventID)
		elseif eventQuest == DLC03FarHarborFF03b
			HandleQuestStageBump_DLC03FarHarborFF03b(eventQuest, eventID)
		elseif eventQuest == DLC03FarHarborFF03c
			HandleQuestStageBump_DLC03FarHarborFF03c(eventQuest, eventID)
		elseif eventQuest == DLC03FarHarborM01
			HandleQuestStageBump_DLC03FarHarborM01(eventQuest, eventID)
		elseif eventQuest == DLC03FarHarborM03
			HandleQuestStageBump_DLC03FarHarborM03(eventQuest, eventID)
		elseif eventQuest == DLC03FarHarborS01
			HandleQuestStageBump_DLC03FarHarborS01(eventQuest, eventID)
		elseif eventQuest == DLC03FarHarborS02
			HandleQuestStageBump_DLC03FarHarborS02(eventQuest, eventID)
		elseif eventQuest == DLC03FarHarborS03
			HandleQuestStageBump_DLC03FarHarborS03(eventQuest, eventID)
		elseif eventQuest == DLC03CoA_FFNucleus01
			HandleQuestStageBump_DLC03CoA_FFNucleus01(eventQuest, eventID)
		elseif eventQuest == DLC03CoA_FFNucleus02
			HandleQuestStageBump_DLC03CoA_FFNucleus02(eventQuest, eventID)
		elseif eventQuest == DLC03CoA_FFNucleus03
			HandleQuestStageBump_DLC03CoA_FFNucleus03(eventQuest, eventID)
		elseif eventQuest == DLC03AcadiaM02
			HandleQuestStageBump_DLC03AcadiaM02(eventQuest, eventID)
		elseif eventQuest == DLC03AcadiaM03
			HandleQuestStageBump_DLC03AcadiaM03(eventQuest, eventID)
		elseif eventQuest == DLC03AcadiaDialogue
			HandleQuestStageBump_DLC03AcadiaDialogue(eventQuest, eventID)
		elseif eventQuest == DLC03AcadiaM04
			HandleQuestStageBump_DLC03AcadiaM04(eventQuest, eventID)
		elseif eventQuest == DLC03Acadia_BoS
			HandleQuestStageBump_DLC03Acadia_BoS(eventQuest, eventID)
		elseif eventQuest == DLC03Acadia_Institute
			HandleQuestStageBump_DLC03Acadia_Institute(eventQuest, eventID)
		elseif eventQuest == DLC03DialogueNakanoResidence
			HandleQuestStageBump_DLC03DialogueNakanoResidence(eventQuest, eventID)
		elseif eventQuest == DLC03DialogueKasumiAcadia
			HandleQuestStageBump_DLC03DialogueKasumiAcadia(eventQuest, eventID)
		elseif eventQuest == DLC03DialogueDiMA
			HandleQuestStageBump_DLC03DialogueDiMA(eventQuest, eventID)
		elseif eventQuest == DLC03DialogueNick
			HandleQuestStageBump_DLC03DialogueNick(eventQuest, eventID)
		elseif eventQuest == DLC03CoA_DialogueNucleus
			HandleQuestStageBump_DLC03CoA_DialogueNucleus(eventQuest, eventID)
		elseif eventQuest == DLC03_V118_PearlHiring
			HandleQuestStageBump_DLC03_V118_PearlHiring(eventQuest, eventID)
		elseif eventQuest == DLC03_V118_Intro
			HandleQuestStageBump_DLC03_V118_Intro(eventQuest, eventID)
		elseif eventQuest == DLC03_V118_Quest
			HandleQuestStageBump_DLC03_V118_Quest(eventQuest, eventID)
		elseif eventQuest == DLC03_V118_ClueTracker
			HandleQuestStageBump_DLC03_V118_ClueTracker(eventQuest, eventID)
		elseif eventQuest == DLC03DialogueV118
			HandleQuestStageBump_DLC03DialogueV118(eventQuest, eventID)
		elseif eventQuest == DLC03_ADV017
			HandleQuestStageBump_DLC03_ADV017(eventQuest, eventID)
		elseif eventQuest == DLC03DialogueFarHarbor
			HandleQuestStageBump_DLC03DialogueFarHarbor(eventQuest, eventID)
		elseif eventQuest == DLC03DialogueFarHarborPostMQ05Avery
			HandleQuestStageBump_DLC03DialogueFarHarborPostMQ05Avery(eventQuest, eventID)
		elseif eventQuest == DLC03DialogueFarHarborPostQuest
			HandleQuestStageBump_DLC03DialogueFarHarborPostQuest(eventQuest, eventID)
		else
			; unhandled quest - but not an error once DLC exists
			debug.trace(self + " CompanionAffinityEvent: WARNING - unhandled quest stage bump " + eventQuest)
		endif
	endif
endEvent


function HandleQuestStageBump_DLC03MQ01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03MQ01
		if eventID == 1
			; INFO/STAGE 6 on DLC03MQ01
			; DESCRIPTION: Player jokes around with Ellie about the case. "The only thing I'm ready for is danger and awesome."

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Likes()
			Piper_Likes()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 2
			; INFO/STAGE 7 on DLC03MQ01
			; DESCRIPTION: Player jokes around with Ellie again. "So is the fedora and trench-coat mandatory when solving these cases? 'Cause I'm thinking smoking pipe and British accent..."

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 3
			; INFO/STAGE 123 on DLC03MQ01
			; DESCRIPTION: Player hits up Kenji Nakano for money before he'll look for the missing daughter.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Loves()
			Piper_Neutral()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 4
			; INFO/STAGE 312 on DLC03MQ01
			; DESCRIPTION: Player tells the Nakano's that synths are Institute Property

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Hates()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Likes()
			Valentine_Dislikes()
			X688_Loves()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 5
			; INFO/STAGE 313 on DLC03MQ01
			; DESCRIPTION: Player tell the Nakano's that synths are people too

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Hates()
			Deacon_Loves()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Likes()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 6
			; INFO/STAGE 314 on DLC03MQ01
			; DESCRIPTION: Player tell the Nakano's that synths are abominations

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Likes()
			Deacon_Hates()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Likes()
			Valentine_Hates()
			X688_Hates()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		else
			debug.trace(self + " WARNING - DLC03MQ01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03MQ02(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03MQ02
		if eventID == 1
			; INFO/STAGE 21 on DLC03MQ02
			; DESCRIPTION: Agree that the Children of Atom should be killed. Extremely aggressive stand against an arguably insane cult.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Likes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Neutral()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Loves()

		elseif eventID == 2
			; INFO/STAGE 22 on DLC03MQ02
			; DESCRIPTION: Just met Old Longfellow who started bossing the player around. The player chooses to say back, "Don't order me around, old man." Rude, but provoked.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Neutral()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 23 on DLC03MQ02
			; DESCRIPTION: Just met a confrontational Children of Atom preacher. The first thing the player says to them is they're crazy.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Likes()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Neutral()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Loves()

		elseif eventID == 4
			; INFO/STAGE 24 on DLC03MQ02
			; DESCRIPTION: Just met a confrontational Children of Atom preacher with Old Longfellow. The player tells Longfellow to just shoot her.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Likes()
			Valentine_Dislikes()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Loves()

		elseif eventID == 5
			; INFO/STAGE 25 on DLC03MQ02
			; DESCRIPTION: Just met a confrontational Children of Atom preacher with Old Longfellow. The player tells Longfellow to calm down and tries to defuse the situation.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Likes()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 6
			; INFO/STAGE 26 on DLC03MQ02
			; DESCRIPTION: Player tells the Children of Atom zealot that he'd like to sign up and join the Children of Atom.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Neutral()
			MacCready_Dislikes()
			Piper_Neutral()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Hates()

		elseif eventID == 7
			; INFO/STAGE 565 on DLC03MQ02
			; DESCRIPTION: After meeting a Children of Atom zealot, the player kills her in cold blood. She was spouting off dangerous rhetoric, but she did nothing directly threatening.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Hates()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Hates()
			Preston_Hates()
			Strong_Loves()
			Valentine_Hates()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Loves()

		else
			debug.trace(self + " WARNING - DLC03MQ02 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03MQ03(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03MQ03
		if eventID == 1
			; INFO/STAGE 121 on DLC03MQ03
			; DESCRIPTION: Player is kind to Kasumi and treats her with compassion

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Likes()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 2
			; INFO/STAGE 122 on DLC03MQ03
			; DESCRIPTION: Player tries to convince Kasumi that she's not a synth and that Kenji and Rei are her parents

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Likes()
			Danse_Likes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 3
			; INFO/STAGE 123 on DLC03MQ03
			; DESCRIPTION: Player tries to convince Kasumi that she's not a synth by explaining that she's just confused/having an identity crisis

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 4
			; INFO/STAGE 126 on DLC03MQ03
			; DESCRIPTION: Player offers to help Kasumi investigate DiMA

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Likes()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 5
			; INFO/STAGE 127 on DLC03MQ03
			; DESCRIPTION: Player tells Kasumi that investigating DiMA isn't his problem

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Dislikes()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 6
			; INFO/STAGE 128 on DLC03MQ03
			; DESCRIPTION: Player jokes around and tells Kasumi that mass-murder is very soothing

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Likes()
			Hancock_Dislikes()
			MacCready_Dislikes()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Loves()
			Valentine_Dislikes()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 7
			; INFO/STAGE 131 on DLC03MQ03
			; DESCRIPTION: Player persuades DiMA into telling him the truth by offering to help him

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Neutral()
			Danse_Dislikes()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Likes()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 8
			; INFO/STAGE 132 on DLC03MQ03
			; DESCRIPTION: Player strong-arms DiMA into telling him the truth by demanding answers

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Dislikes()
			X688_Loves()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		else
			debug.trace(self + " WARNING - DLC03MQ03 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03MQ05(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03MQ05
		if eventID == 1
			; INFO/STAGE 21 on DLC03MQ05
			; DESCRIPTION: DiMA murdered and replace a leader of Far Harbor in order to ensure there is a peace on the island. The player says that DiMA did the right thing.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Dislikes()
			Curie_Hates()
			Danse_Hates()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Dislikes()
			Piper_Hates()
			Preston_Dislikes()
			Strong_Neutral()
			Valentine_Dislikes()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Hates()

		elseif eventID == 2
			; INFO/STAGE 22 on DLC03MQ05
			; DESCRIPTION: DiMA murdered and replace a leader of Far Harbor in order to ensure there is a peace on the island. The player says that DiMA is a fraud (because he poses as a holy man type).

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Likes()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 3
			; INFO/STAGE 23 on DLC03MQ05
			; DESCRIPTION: The player tries to convince DiMA to turn himself in for murdering the Far Harbor leader.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Loves()
			Danse_Loves()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Likes()
			Piper_Loves()
			Preston_Likes()
			Strong_Neutral()
			Valentine_Loves()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Loves()

		elseif eventID == 4
			; INFO/STAGE 24 on DLC03MQ05
			; DESCRIPTION: Captain Avery breaks down after discovering she is a synth. The player offers his sympathies.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Likes()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 5
			; INFO/STAGE 25 on DLC03MQ05
			; DESCRIPTION: The player has proof that DiMA has replaced Captain Avery with a synth. When asked by the local doctor what the player will do with this info, he chooses to "Minimize the damage".

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Hates()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 6
			; INFO/STAGE 26 on DLC03MQ05
			; DESCRIPTION: The player has proof that DiMA has replaced Captain Avery with a synth. When asked by the local doctor what the player will do with this info, he chooses to "Make DiMA pay".

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Likes()
			Deacon_Dislikes()
			Hancock_Likes()
			MacCready_Likes()
			Piper_Likes()
			Preston_Dislikes()
			Strong_Likes()
			Valentine_Dislikes()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Loves()

		elseif eventID == 7
			; INFO/STAGE 27 on DLC03MQ05
			; DESCRIPTION: Captain Avery is exposed a synth by an angry mob. The player defends her saying she shouldn't be killed.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Loves()
			Hancock_Loves()
			MacCready_Neutral()
			Piper_Loves()
			Preston_Likes()
			Strong_Dislikes()
			Valentine_Loves()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 8
			; INFO/STAGE 28 on DLC03MQ05
			; DESCRIPTION: Captain Avery is exposed a synth by an angry mob. The player says that she should be exectuted.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Likes()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Likes()
			Piper_Hates()
			Preston_Hates()
			Strong_Likes()
			Valentine_Hates()
			X688_Hates()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 9
			; INFO/STAGE 29 on DLC03MQ05
			; DESCRIPTION: DiMA turns himself in for justice for his murder. An angry firebrand says that not only should DiMA be executed, but his settlement Acadia should be destroyed, as well. The player says, "Acadia should burn!"

			;BASE GAME COMPANIONS: 
			Cait_Loves()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Likes()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Dislikes()
			Piper_Hates()
			Preston_Dislikes()
			Strong_Loves()
			Valentine_Hates()
			X688_Hates()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 10
			; INFO/STAGE 30 on DLC03MQ05
			; DESCRIPTION: There is a mob outisde of Acadia ready to attack for their replacing the Far Harbor leader with a synth. The residents of Acadia are innocent of any wrong doing, though. The player is eager to attack Acadia with the mob and says so.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Likes()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Dislikes()
			Piper_Hates()
			Preston_Dislikes()
			Strong_Loves()
			Valentine_Hates()
			X688_Hates()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 11
			; INFO/STAGE 125 on DLC03MQ05
			; DESCRIPTION: DiMA shares a plan to murder and replace Tektus (a militant cultist) with a synth to achieve a lasting peace on the island. An ends to a means (and as ends go, it's killing someone that's a big problem). The player agrees to go along with this plan.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Hates()
			Deacon_Neutral()
			Hancock_Loves()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Hates()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Loves()

			;DLC03 COMPANIONS: 
			LongFellow_Loves()

		elseif eventID == 12
			; INFO/STAGE 110 on DLC03MQ05
			; DESCRIPTION: DiMA shares a plan to murder and replace Tektus (a militant cultist) with a synth to achieve a lasting peace on the island. An ends to a means (and as ends go, it's killing someone that's a big problem). The player refuses to do DiMA's dirty work.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Likes()
			Strong_Likes()
			Valentine_Neutral()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 13
			; INFO/STAGE 100 on DLC03MQ05
			; DESCRIPTION: The player confronts DiMA about his murder and replacement of Captain Avery. Then he tells DiMA he's going to tell Far Harbor (which could result in a lynch mob - although it's by many people's standards a morale act).

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Likes()
			Danse_Likes()
			Deacon_Neutral()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Loves()
			Preston_Likes()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 14
			; INFO/STAGE 775 on DLC03MQ05
			; DESCRIPTION: DiMA turns himself in for justice for his murder. An angry firebrand says that not only should DiMA be executed, but his settlement Acadia should be destroyed, as well. The player tries to talk down the firebrand and save the people of Acadia.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Dislikes()
			Deacon_Loves()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Loves()
			Preston_Likes()
			Strong_Dislikes()
			Valentine_Loves()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 15
			; INFO/STAGE 820 on DLC03MQ05
			; DESCRIPTION: There is a mob outisde of Acadia ready to attack for their replacing the Far Harbor leader with a synth. The residents of Acadia are innocent of any wrong doing, though. The player tries to stop the attack, but at this point there's no hope of stopping it.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Dislikes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Dislikes()
			Valentine_Likes()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 16
			; INFO/STAGE 36 on DLC03MQ05
			; DESCRIPTION: Avery just asked for the player to keep a secret that ensures the town won't attack Acadia (and execute DiMA). The player agrees to keep DiMA's murder secret.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 17
			; INFO/STAGE 37 on DLC03MQ05
			; DESCRIPTION: Avery just asked for the player to keep a secret that ensures the town won't attack Acadia (and execute DiMA). The player tries to extort bribe money out of Avery for his silence.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Hates()
			Danse_Dislikes()
			Deacon_Hates()
			Hancock_Dislikes()
			MacCready_Likes()
			Piper_Hates()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Hates()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		else
			debug.trace(self + " WARNING - DLC03MQ05 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03MQ06(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03MQ06
		if eventID == 1
			; INFO/STAGE 190 on DLC03MQ06
			; DESCRIPTION: Player gave Tektus the key to the nukes (he has no intention of using it to blow up the Children. The player has effectively closed out the "Nuke the Children" path)

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Neutral()
			Curie_Likes()
			Danse_Likes()
			Deacon_Neutral()
			Hancock_Dislikes()
			MacCready__UNSET()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Hates()

		elseif eventID == 2
			; INFO/STAGE 200 on DLC03MQ06
			; DESCRIPTION: Player convinced the High Confessor its time for Division - death through a Nucleus explosion - but hasn't turned the key yet. This will kill everyone in the Nucleus (though it is part of their religious precepts) 

			;BASE GAME COMPANIONS: 
			Cait_Loves()
			Codsworth_Dislikes()
			Curie_Hates()
			Danse_Dislikes()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Dislikes()
			Piper_Neutral()
			Preston_Dislikes()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 1
			; INFO/STAGE 103 on DLC03MQ06
			; DESCRIPTION: Player launched the nuke to destroy the Children of Atom, but did not convince them it was time for Division first (effectively murdering all of them against their will)

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Hates()
			Curie_Hates()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Likes()
			MacCready_Dislikes()
			Piper_Dislikes()
			Preston_Hates()
			Strong_Likes()
			Valentine_Dislikes()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Loves()

		elseif eventID == 1
			; INFO/STAGE 23 on DLC03MQ06
			; DESCRIPTION: Player told Captain Avery, leader of Far Harbor, about the wind farm kill switch code which could be used to destroy their town and informed her they won't use the it, keeping Far Harbor safe.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Loves()
			MacCready_Likes()
			Piper_Loves()
			Preston_Likes()
			Strong_Likes()
			Valentine_Loves()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Loves()

		elseif eventID == 2
			; INFO/STAGE 24 on DLC03MQ06
			; DESCRIPTION: Player told Avery about the wind farm kill switch code, but said they haven't yet decided what they're planning to do with them.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Dislikes()
			MacCready_Dislikes()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Neutral()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 25 on DLC03MQ06
			; DESCRIPTION: Player told Avery about the wind farm kill switch code and then extorted her for money (the player still hasn't agreed to not use it)

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Hates()
			Danse_Hates()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Likes()
			Piper_Hates()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Hates()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 4
			; INFO/STAGE 50 on DLC03MQ06
			; DESCRIPTION: The player has brought down Far Harbor's wind turbine, killing the town.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Hates()
			Curie_Hates()
			Danse_Hates()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Dislikes()
			Piper_Hates()
			Preston_Hates()
			Strong_Dislikes()
			Valentine_Hates()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Hates()

		else
			debug.trace(self + " WARNING - DLC03MQ06 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03MQ06a(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03MQ06a
		if eventID == 1
			; INFO/STAGE 97 on DLC03MQ06a
			; DESCRIPTION: While meeting with the High Confessor with the intention of replacing him with a synth, the player attempted to convince the High Confessor to leave the island instead of the player killing him. Tektus had been threatening player before the player made this offer.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Dislikes()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 2
			; INFO/STAGE 98 on DLC03MQ06a
			; DESCRIPTION: While meeting with the High Confessor with the intention of replacing him with a synth, the player attacked Tektus without attempting to convince the High Confessor to leave the island. Tektus had been threatening the player.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Dislikes()
			Strong_Likes()
			Valentine_Neutral()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Loves()

		elseif eventID == 3
			; INFO/STAGE 99 on DLC03MQ06a
			; DESCRIPTION: While meeting with the High Confessor with the intention of replacing him with a synth, the player attempted to convince the High Confessor to leave the island instead of the player killing him. Tektus trusted the player in this case, coming without guards and respectfully asking for the player's help.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Neutral()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 4
			; INFO/STAGE 94 on DLC03MQ06a
			; DESCRIPTION: While meeting with the High Confessor with the intention of replacing him with a synth, the player attacked Tektus without attempting to convince the High Confessor to leave the island. Tektus trusted the player in this case, coming without guards and respectfully asking for the player's help.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Dislikes()
			Strong_Likes()
			Valentine_Neutral()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Loves()

		else
			debug.trace(self + " WARNING - DLC03MQ06a got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03MQPostQuest(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03MQPostQuest
		if eventID == 1
			; INFO/STAGE 140 on DLC03MQPostQuest
			; DESCRIPTION: The player is reporting back to Kasumi after seeing DiMA's memories. Here, he expresses the believe that Acadia is worth protecting (from the threat posed by the conflict between Far Harbor and the Children of Atom)

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Dislikes()
			Deacon_Loves()
			Hancock_Likes()
			MacCready_Likes()
			Piper_Likes()
			Preston_Likes()
			Strong_Neutral()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 2
			; INFO/STAGE 145 on DLC03MQPostQuest
			; DESCRIPTION: Same sitution as above, but this time, the player goes the opposite direction and says "Acadia will burn. This can't continue." It's an implied threat that the player might personally wipe out all the synths, possibly because the idea of a synth refuge should nto be tolerated.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Likes()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Dislikes()
			Piper_Hates()
			Preston_Dislikes()
			Strong_Likes()
			Valentine_Hates()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 146 on DLC03MQPostQuest
			; DESCRIPTION: This is a very dark moment in which Kasumi questions the player's involvement in the destruction of both the Children of Atom and Far Harbor. The player can be sarcastic and say how much he enjoyed murdering all of those people. Yes, it's pretty messed up.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Hates()
			Danse_Hates()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Dislikes()
			Piper_Hates()
			Preston_Dislikes()
			Strong_Likes()
			Valentine_Hates()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 4
			; INFO/STAGE 191 on DLC03MQPostQuest
			; DESCRIPTION: Just after Kasumi has been happily reunited with her parents, the player decides to out her as a synth, which shocks and devastates Kenji and Rei Nakano. Afterward, the player can explain why he made this choice. In this specific case, the player said it was because Kenji and Rei deserved to know the truth.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Likes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 5
			; INFO/STAGE 192 on DLC03MQPostQuest
			; DESCRIPTION: Same situation as above but this time the player says he outed Kasumi as a synth because he wants Kasumi's parents to accept her for who she really is. The vibe here is more about acceptance, reconciliation, and healing because the real (human) Kasumi is obviously dead.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Likes()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		else
			debug.trace(self + " WARNING - DLC03MQPostQuest got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03AcadiaM01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03AcadiaM01
		if eventID == 1
			; INFO/STAGE 405 on DLC03AcadiaM01
			; DESCRIPTION: The player either failed a speech challenge to avoid violence against some Trappers, or chose to attack the Trapers and initiate violence. Characters who like violence should like this outcome.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Likes()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Neutral()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 440 on DLC03AcadiaM01
			; DESCRIPTION: The player succeeded at a speech challenge to avoid combat with some Trappers and thus resolve the situation peacefully

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 3
			; INFO/STAGE 550 on DLC03AcadiaM01
			; DESCRIPTION: When offered caps as a reward, the player asked for more caps.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		else
			debug.trace(self + " WARNING - DLC03AcadiaM01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03AtomM01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03AtomM01
		if eventID == 1
			; INFO/STAGE 146 on DLC03AtomM01
			; DESCRIPTION: After having their vision quest, when asked about it by the Grand Zealot of the Children of Atom, the player chose to make a joke about seeing a beautiful Lurk-taur ("You know, half woman, half Mirelurk") instead of answering the question

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Likes()
			Piper_Likes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 2
			; INFO/STAGE 147 on DLC03AtomM01
			; DESCRIPTION: After being told the player was led by a messenger from Atom and that they were meant to join the family, the player opted to join the Children of Atom, but without fervor. Stated "Sure. I'm willing to learn."

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Neutral()
			MacCready_Dislikes()
			Piper_Neutral()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 148 on DLC03AtomM01
			; DESCRIPTION: After being told the player was led by a messenger from Atom and that they were meant to join the family, the player chose to join the Children of Atom, but with more fervor. Stated "I am ready to follow His (Atom's) path."

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Neutral()
			MacCready_Dislikes()
			Piper_Neutral()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Hates()

		elseif eventID == 4
			; INFO/STAGE 149 on DLC03AtomM01
			; DESCRIPTION: After being told the player was led by a messenger from Atom and that they were meant to join the family, the player declined joining the Children of Atom.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Likes()
			Strong_Likes()
			Valentine_Neutral()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		else
			debug.trace(self + " WARNING - DLC03AtomM01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03CoA_DialogueNucleusEntrance(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03CoA_DialogueNucleusEntrance
		if eventID == 1
			; INFO/STAGE 62 on DLC03CoA_DialogueNucleusEntrance
			; DESCRIPTION: When asked if the player if from Far Harbor, player replied "Far Harbor can go rot."

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Neutral()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		else
			debug.trace(self + " WARNING - DLC03CoA_DialogueNucleusEntrance got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03AtomM02(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03AtomM02
		if eventID == 1
			; INFO/STAGE 520 on DLC03AtomM02
			; DESCRIPTION: The player has been sent to locate Sister Gwyneth, a heretic who fled from the Nucleus. Upon finding her, and with a cry of "Die, heretic!" the player attacks Sister Gwyneth, who never threatened violence. This is a bloodthuirsty choice but it was the player's mission to kill her.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Hates()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Likes()
			Valentine_Dislikes()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 2
			; INFO/STAGE 525 on DLC03AtomM02
			; DESCRIPTION: The player tries to persuade Sister Gwyneth to return to the Nucleus to atone for her sins against Atom. This is a peaceful alternative to killing her and shows that the player seems to truly believe in Atom

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Dislikes()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 535 on DLC03AtomM02
			; DESCRIPTION: The player tries to persuade Sister Gwyneth to leave the island for good. Like the above line, this is another peaceful alternative to killing Sister Gwyneth, but in this case it's a less pro-Atom choice (because the player is not telling Gwyneth that she's wrong), suggesting the player does not care as much about the Cult of Atom as he might in the above choice.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Dislikes()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 4
			; INFO/STAGE 610 on DLC03AtomM02
			; DESCRIPTION: The player says "Glory to Atom!" after being congratulated on the success of his mission to deal with Sister Gwyneth. This shows a righteous zeal, and the player here is clearly choosing to roleplay a devout follower of Atom.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Dislikes()
			MacCready_Dislikes()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Hates()

		elseif eventID == 5
			; INFO/STAGE 620 on DLC03AtomM02
			; DESCRIPTION: In contrast to the above, the player is sarcastic and mocks the faith of Atom after being congratulated on the successful completion of his mission. This earns an angry rebuke from Grand Zealot Richter and shows the player is not taking the Children of Atom very seriously.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Likes()
			Piper_Likes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Loves()

		else
			debug.trace(self + " WARNING - DLC03AtomM02 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03FarHarborFF01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03FarHarborFF01
		if eventID == 1
			; INFO/STAGE 155 on DLC03FarHarborFF01
			; DESCRIPTION: When offered caps as a reward, the player asked for more caps.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 2
			; INFO/STAGE 255 on DLC03FarHarborFF01
			; DESCRIPTION: When offered caps as a reward, the player asked for more caps.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 3
			; INFO/STAGE 355 on DLC03FarHarborFF01
			; DESCRIPTION: The player said he didn't care about a woman's family history and her desire to avenge the deaths of those she lost - he just wants to get paid.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Neutral()
			Deacon_Dislikes()
			Hancock_Neutral()
			MacCready_Loves()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		else
			debug.trace(self + " WARNING - DLC03FarHarborFF01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03FarHarborFF02(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03FarHarborFF02
		if eventID == 1
			; INFO/STAGE 310 on DLC03FarHarborFF02
			; DESCRIPTION: The player found the corpse of Howard Dunbar, a citizen of Far Harbor who was out trying to repair some Fog Condensers when he was killed by Mirelurks. The player calls him a hero.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Neutral()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 2
			; INFO/STAGE 320 on DLC03FarHarborFF02
			; DESCRIPTION: Same as above, but this time the plaeyr is insensitive and says that Howard is "Mirelurk food"

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 330 on DLC03FarHarborFF02
			; DESCRIPTION: When offered caps as a reward, the player asked for more caps.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		else
			debug.trace(self + " WARNING - DLC03FarHarborFF02 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03FarHarborFF03a(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03FarHarborFF03a
		if eventID == 1
			; INFO/STAGE 250 on DLC03FarHarborFF03a
			; DESCRIPTION: The player was contracted to get power tools for the Mariner (who needs it to help defend the town). Instead, he agrees to sell the tools to someone else for a TON more money.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Dislikes()
			MacCready_Loves()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Neutral()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 2
			; INFO/STAGE 22 on DLC03FarHarborFF03a
			; DESCRIPTION: The player was contracted to get power tools for the Mariner (who needs it to help defend the town). He's offered a ton of money to sell it to someone else and refuses.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Neutral()
			Hancock_Likes()
			MacCready_Dislikes()
			Piper_Likes()
			Preston_Likes()
			Strong_Neutral()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 290 on DLC03FarHarborFF03a
			; DESCRIPTION: An innocent trader offered the player a bunch of money to sell something to him and renege on a contract. The player killed the trader.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Hates()
			Curie_Hates()
			Danse_Hates()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Neutral()
			Piper_Hates()
			Preston_Hates()
			Strong_Loves()
			Valentine_Hates()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		else
			debug.trace(self + " WARNING - DLC03FarHarborFF03a got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03FarHarborFF03b(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03FarHarborFF03b
		if eventID == 1
			; INFO/STAGE 21 on DLC03FarHarborFF03b
			; DESCRIPTION: The player learns the Mariner has terminal cancer. He offers his sympathy and support.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Loves()
			Curie_Loves()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Likes()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 2
			; INFO/STAGE 22 on DLC03FarHarborFF03b
			; DESCRIPTION: A distraught Mariner is wondering to do with her last remaining weeks of life. The player says you should, "Stay with friends".

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 3
			; INFO/STAGE 23 on DLC03FarHarborFF03b
			; DESCRIPTION: A distraught Mariner is wondering to do with her last remaining weeks of life. The player says you should, "End life on your terms."

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Likes()
			Deacon_Neutral()
			Hancock_Likes()
			MacCready_Likes()
			Piper_Likes()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 4
			; INFO/STAGE 24 on DLC03FarHarborFF03b
			; DESCRIPTION: A distraught Mariner is wondering to do with her last remaining weeks of life. The player says you should, "Leave town with dignity." This is what she was leaning towards.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		else
			debug.trace(self + " WARNING - DLC03FarHarborFF03b got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03FarHarborFF03c(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03FarHarborFF03c
		if eventID == 1
			; INFO/STAGE 21 on DLC03FarHarborFF03c
			; DESCRIPTION: After helping the Mariner for the 3rd time in helping reinforce the town's wall, the players says he's sick of working on the wall (which isn’t completely unreasonably, if rude to say).

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Dislikes()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 2
			; INFO/STAGE 22 on DLC03FarHarborFF03c
			; DESCRIPTION: The terminally dying Mariner is depressed that her fellow citizens squabble instead of helping save each other's lives. The player says the community "should come together".

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Loves()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Likes()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 3
			; INFO/STAGE 23 on DLC03FarHarborFF03c
			; DESCRIPTION: The terminally dying Mariner is depressed that her fellow citizens squabble instead of helping save each other's lives. The player says it's OK to "Protect your interests".

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Dislikes()
			MacCready_Likes()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Likes()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		else
			debug.trace(self + " WARNING - DLC03FarHarborFF03c got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03FarHarborM01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03FarHarborM01
		if eventID == 1
			; INFO/STAGE 21 on DLC03FarHarborM01
			; DESCRIPTION: The player is asked why he's been helping the people of Far Harbor. He says, "You're good people."

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Neutral()
			Valentine_Likes()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 2
			; INFO/STAGE 22 on DLC03FarHarborM01
			; DESCRIPTION: The player is asked why he's been helping the people of Far Harbor. He says he is "Planning to stop" helping.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Dislikes()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 3
			; INFO/STAGE 23 on DLC03FarHarborM01
			; DESCRIPTION: The player is asked why he's been helping the people of Far Harbor. He says, "For the caps."

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		else
			debug.trace(self + " WARNING - DLC03FarHarborM01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03FarHarborM03(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03FarHarborM03
		if eventID == 1
			; INFO/STAGE 21 on DLC03FarHarborM03
			; DESCRIPTION: Avery thanks the player profusely for saving the town. The player says he did it to help his friends.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Likes()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 2
			; INFO/STAGE 22 on DLC03FarHarborM03
			; DESCRIPTION: Avery thanks the player profusely for saving the town. The player says he did it for the money.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		else
			debug.trace(self + " WARNING - DLC03FarHarborM03 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03FarHarborS01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03FarHarborS01
		if eventID == 1
			; INFO/STAGE 21 on DLC03FarHarborS01
			; DESCRIPTION: Mitch is hesitating big time in asking the player for help for his Uncle Ken. The players says he'd do anything for family if he was in Mitch's shoes.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Loves()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Likes()
			Piper_Likes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 2
			; INFO/STAGE 22 on DLC03FarHarborS01
			; DESCRIPTION: Mitch is hesitating big time in asking the player for help for his Uncle Ken. The players says pride is going to get Mitch killed one day.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Likes()
			Deacon_Neutral()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 3
			; INFO/STAGE 23 on DLC03FarHarborS01
			; DESCRIPTION: The player is confronted by a slightly unhinged Uncle Ken who threatens and tries to intimidate the player. The player calls the old geezer crazy.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Neutral()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 4
			; INFO/STAGE 24 on DLC03FarHarborS01
			; DESCRIPTION: Uncle Ken and the player fight off raiders together. And still Uncle Ken refuses to leave his farm. The player angrily says "You're going to die".

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Neutral()
			Deacon_Dislikes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Neutral()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 5
			; INFO/STAGE 25 on DLC03FarHarborS01
			; DESCRIPTION: Uncle Ken and the player fight off raiders together. And still Uncle Ken refuses to leave his farm. The player tries to use Charisma to convince him to leave for the safety of town.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 6
			; INFO/STAGE 26 on DLC03FarHarborS01
			; DESCRIPTION: When trying to convince Uncle Ken to go back to town, the player threatens to take Uncle Ken by force.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Dislikes()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		else
			debug.trace(self + " WARNING - DLC03FarHarborS01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03FarHarborS02(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03FarHarborS02
		if eventID == 1
			; INFO/STAGE 21 on DLC03FarHarborS02
			; DESCRIPTION: A young girl offers 14 1/2 caps to help her. She sounds very earnest. The player says he'll help for free.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Dislikes()
			Piper_Likes()
			Preston_Likes()
			Strong_Likes()
			Valentine_Likes()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 22 on DLC03FarHarborS02
			; DESCRIPTION: A young girl offers 14 1/2 caps to help her. She sounds very earnest. The player blows her off.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Dislikes()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 23 on DLC03FarHarborS02
			; DESCRIPTION: A young girl offers a pretty sophisticated plan to help her town survive. The players says she's a remarkable girl.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 4
			; INFO/STAGE 24 on DLC03FarHarborS02
			; DESCRIPTION: A cannibalistic raider offers a Faustian bargain to the player. Take these caps and lure your friends here so I can eat them. The player takes the caps.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Hates()
			Danse_Hates()
			Deacon_Dislikes()
			Hancock_Hates()
			MacCready_Likes()
			Piper_Hates()
			Preston_Hates()
			Strong_Dislikes()
			Valentine_Hates()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 5
			; INFO/STAGE 25 on DLC03FarHarborS02
			; DESCRIPTION: A cannibalistic raider offers a Faustian bargain to the player. Take these caps and lure your friends here so I can eat them. The player leaves in peace and allows him to keep his land.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Neutral()
			Hancock_Dislikes()
			MacCready_Dislikes()
			Piper_Neutral()
			Preston_Dislikes()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 6
			; INFO/STAGE 26 on DLC03FarHarborS02
			; DESCRIPTION: The player warns Far Harbor that there's a dangerous cannibal on the land they want to settle. The player urges them to chase the cannibal off.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Neutral()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 7
			; INFO/STAGE 27 on DLC03FarHarborS02
			; DESCRIPTION: The player warns Far Harbor that there's a dangerous cannibal on the land they want to settle. The player urges them to kill the raider.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Likes()
			Strong_Likes()
			Valentine_Neutral()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 8
			; INFO/STAGE 325 on DLC03FarHarborS02
			; DESCRIPTION: The player warns Far Harbor that there's a dangerous cannibal on the land they want to settle. He then says they should let the raider keep his land.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Neutral()
			Deacon_Dislikes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		else
			debug.trace(self + " WARNING - DLC03FarHarborS02 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03FarHarborS03(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03FarHarborS03
		if eventID == 1
			; INFO/STAGE 21 on DLC03FarHarborS03
			; DESCRIPTION: The Mariner says she's planning something she knows is crazy. She if the player ever does insane things. Player chooses "I like to play it safe"

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Likes()
			Danse_Likes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 2
			; INFO/STAGE 22 on DLC03FarHarborS03
			; DESCRIPTION: The Mariner says she's planning something she knows is crazy. She if the player ever does insane things. Player chooses "The crazier the better"

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Neutral()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 3
			; INFO/STAGE 23 on DLC03FarHarborS03
			; DESCRIPTION: The Mariner says she's planning something she knows is crazy. She if the player ever does insane things. Player chooses "I rely on logic"

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Likes()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 4
			; INFO/STAGE 24 on DLC03FarHarborS03
			; DESCRIPTION: The Mariner and the player come across a mythical boogeyman that proves to be a hoax. If they reveal what they found, the Mariner will be a laughingstock. The player recommends they don't lie.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Neutral()
			Curie_Likes()
			Danse_Likes()
			Deacon_Dislikes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 5
			; INFO/STAGE 25 on DLC03FarHarborS03
			; DESCRIPTION: The Mariner and the player come across a mythical boogeyman that proves to be a hoax. If they reveal what they found, the Mariner will be a laughingstock. The player recommends they make up a suitably tall tale about their accomplishments. Total lies.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Loves()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 6
			; INFO/STAGE 26 on DLC03FarHarborS03
			; DESCRIPTION: The Mariner and the player come across a mythical boogeyman that proves to be a hoax. If they reveal what they found, the Mariner will be a laughingstock. The player recommends telling a little white lie - they didn't find the mythic beast.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 7
			; INFO/STAGE 27 on DLC03FarHarborS03
			; DESCRIPTION: The Mariner is considering how to spend her few remaining weeks/days on earth. The player says she should help others.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Neutral()
			Valentine_Likes()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 8
			; INFO/STAGE 28 on DLC03FarHarborS03
			; DESCRIPTION: The Mariner is considering how to spend her few remaining weeks/days on earth. The player says she should be selfish - and do what's right for her alone (and she deserves this for all her good deeds).

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Likes()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 9
			; INFO/STAGE 29 on DLC03FarHarborS03
			; DESCRIPTION: The Mariner is considering how to spend her few remaining weeks/days on earth. The player recommends leaving a legacy behind.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Neutral()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Neutral()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		else
			debug.trace(self + " WARNING - DLC03FarHarborS03 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03CoA_FFNucleus01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03CoA_FFNucleus01
		if eventID == 1
			; INFO/STAGE 26 on DLC03CoA_FFNucleus01
			; DESCRIPTION: Zealot Ware, a friend of Brother Devin, a fasting Child of Atom, has suggested to the player that they dress up as a messenger from Atom in order to trick Devin into giving up his fast. The player has stated they think that sounds like blasphemy.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		else
			debug.trace(self + " WARNING - DLC03CoA_FFNucleus01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03CoA_FFNucleus02(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03CoA_FFNucleus02
		if eventID == 1
			; INFO/STAGE 220 on DLC03CoA_FFNucleus02
			; DESCRIPTION: The player has been tasked by the High Confessor to investigate the loyalty of one of the Children of Atom. The player has found a note where the woman in question, Sister Aubert, questions the High Confessor's right to rule and vaguely threatens him, as she suspects him of having her lover killed. The player has found this note and handed it over to her to destroy.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Likes()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Loves()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Loves()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 2
			; INFO/STAGE 230 on DLC03CoA_FFNucleus02
			; DESCRIPTION: The player has been tasked by the High Confessor to investigate the loyalty of one of the Children of Atom. The player has found a note where the woman in question, Sister Aubert, questions the High Confessor's right to rule and vaguely threatens him, as she suspects him of having her lover killed. The player has found this note and demands caps for her (but has not yet agreed to give her the note or otherwise).

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Dislikes()
			MacCready_Likes()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 3
			; INFO/STAGE 240 on DLC03CoA_FFNucleus02
			; DESCRIPTION: The player has been tasked by the High Confessor to investigate the loyalty of one of the Children of Atom. The player has found a note where the woman in question, Sister Aubert, questions the High Confessor's right to rule and vaguely threatens him, as she suspects him of having her lover killed. The player has found this note but informed Aubert she should flee.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 4
			; INFO/STAGE 300 on DLC03CoA_FFNucleus02
			; DESCRIPTION: The player has been tasked by the High Confessor to investigate the loyalty of one of the Children of Atom. The player has found a note where the woman in question, Sister Aubert, questions the High Confessor's right to rule and vaguely threatens him, as she suspects him of having her lover killed. The player has found this note but convinced the High Confessor that Aubert is not a threat.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 5
			; INFO/STAGE 310 on DLC03CoA_FFNucleus02
			; DESCRIPTION: The player has been tasked by the High Confessor to investigate the loyalty of one of the Children of Atom. The player has found a note where the woman in question, Sister Aubert, questions the High Confessor's right to rule and vaguely threatens him, as she suspects him of having her lover killed. The player has found this note and turned it over to the High Confessor, effectively signing Aubert's death warrant (although the player could've already told her to flee).

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Neutral()
			Deacon_Dislikes()
			Hancock_Hates()
			MacCready_Neutral()
			Piper_Hates()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Hates()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 6
			; INFO/STAGE 320 on DLC03CoA_FFNucleus02
			; DESCRIPTION: The player has been tasked by the High Confessor to investigate the loyalty of one of the Children of Atom. The player has found a note where the woman in question, Sister Aubert, questions the High Confessor's right to rule and vaguely threatens him, as she suspects him of having her lover killed. The player informed the High Confessor that there is not evidence against Aubert, but did not pass the speech challenge convincing him she's not a threat.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Likes()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		else
			debug.trace(self + " WARNING - DLC03CoA_FFNucleus02 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03CoA_FFNucleus03(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03CoA_FFNucleus03
		if eventID == 1
			; INFO/STAGE 40 on DLC03CoA_FFNucleus03
			; DESCRIPTION: The player succesfully repaired the Nucleus' radiation decontamination arches.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 2
			; INFO/STAGE 51 on DLC03CoA_FFNucleus03
			; DESCRIPTION: The player activated the decontamination arches for the first time, but was sprayed with a dangerous amount of irradiated water

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 3
			; INFO/STAGE 52 on DLC03CoA_FFNucleus03
			; DESCRIPTION: The player activated the decontamination arches for the first time, but fixed them so they remove radiation damage instead of inflicting it, against the wishes of the Children of Atom

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		else
			debug.trace(self + " WARNING - DLC03CoA_FFNucleus03 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03AcadiaM02(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03AcadiaM02
		if eventID == 1
			; INFO/STAGE 100 on DLC03AcadiaM02
			; DESCRIPTION: Player has agreed to kill a Courser for the citizens of Acadia

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Likes()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Loves()
			Hancock_Loves()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Likes()
			Valentine_Likes()
			X688_Hates()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 20 on DLC03AcadiaM02
			; DESCRIPTION: Player tells Dejen he's killed Coursers before

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Hates()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 220 on DLC03AcadiaM02
			; DESCRIPTION: Player jokes with Dejen, saying that the Courser killed him and now he's  a ghost, rather than just telling Dejen the job is done and Acadia is safe.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Likes()
			Piper_Likes()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Likes()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		else
			debug.trace(self + " WARNING - DLC03AcadiaM02 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03AcadiaM03(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03AcadiaM03
		if eventID == 1
			; INFO/STAGE 30 on DLC03AcadiaM03
			; DESCRIPTION: Player repeatedly insists Faraday pay him extra for retrieving the storage drives

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Loves()
			Piper_Neutral()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		else
			debug.trace(self + " WARNING - DLC03AcadiaM03 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03AcadiaDialogue(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03AcadiaDialogue
		if eventID == 1
			; INFO/STAGE 61 on DLC03AcadiaDialogue
			; DESCRIPTION: Player confronts Faraday about the mind wipe performed on Jule without her consent (it was done to save her life), but agrees it was the right thing to do

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Likes()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Dislikes()
			MacCready_Dislikes()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Dislikes()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 2
			; INFO/STAGE 62 on DLC03AcadiaDialogue
			; DESCRIPTION: Player confronts Faraday about the mind wipe performed on Jule without her knowledge, and says there's no excuse for leaving her in that state

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		else
			debug.trace(self + " WARNING - DLC03AcadiaDialogue got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03AcadiaM04(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03AcadiaM04
		if eventID == 3
			; INFO/STAGE 400 on DLC03AcadiaM04
			; DESCRIPTION: Player agrees to hand over evidence of the mind wipe to Cog, and keep it a secret from Jule

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Dislikes()
			MacCready_Dislikes()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Neutral()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 4
			; INFO/STAGE 410 on DLC03AcadiaM04
			; DESCRIPTION: Player tells Jule that she was mind-wiped without her permission

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Neutral()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		else
			debug.trace(self + " WARNING - DLC03AcadiaM04 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03Acadia_BoS(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03Acadia_BoS
		if eventID == 1
			; INFO/STAGE 40 on DLC03Acadia_BoS
			; DESCRIPTION: Player tells Captain Kells about the existence of Acadia

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Loves()
			Deacon_Dislikes()
			Hancock_Hates()
			MacCready_Neutral()
			Piper_Hates()
			Preston_Dislikes()
			Strong_Neutral()
			Valentine_Hates()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 500 on DLC03Acadia_BoS
			; DESCRIPTION: Player has helped the BoS destroy all the synths in Acadia

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Loves()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Neutral()
			Piper_Hates()
			Preston_Dislikes()
			Strong_Likes()
			Valentine_Hates()
			X688_Hates()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 180 on DLC03Acadia_BoS
			; DESCRIPTION: Player asks at the last minute whether there's some other way to deal with the situation, rather than wiping out the synths. The attack will still proceed after the player asks.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Dislikes()
			Valentine_Likes()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		else
			debug.trace(self + " WARNING - DLC03Acadia_BoS got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03Acadia_Institute(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03Acadia_Institute
		if eventID == 1
			; INFO/STAGE 40 on DLC03Acadia_Institute
			; DESCRIPTION: Player tells the Institute about the existence of Acadia

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Hates()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Dislikes()
			Piper_Hates()
			Preston_Dislikes()
			Strong_Neutral()
			Valentine_Hates()
			X688_Loves()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 500 on DLC03Acadia_Institute
			; DESCRIPTION: Player has helped the Institute reclaim all of the synths of Acadia

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Hates()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Dislikes()
			Piper_Hates()
			Preston_Dislikes()
			Strong_Likes()
			Valentine_Hates()
			X688_Loves()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 180 on DLC03Acadia_Institute
			; DESCRIPTION: Player asks at the last minute whether there's another option for handling the situation, rather than forcibly reclaiming all the synths. The attack will still proceed after the player asks.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Dislikes()
			Valentine_Likes()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		else
			debug.trace(self + " WARNING - DLC03Acadia_Institute got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03DialogueNakanoResidence(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03DialogueNakanoResidence
		if eventID == 1
			; INFO/STAGE 100 on DLC03DialogueNakanoResidence
			; DESCRIPTION: Player goes to the trouble of returning to the Nakano's and telling them Kasumi is safe, but they're still working on convincing her to come home

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Likes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		else
			debug.trace(self + " WARNING - DLC03DialogueNakanoResidence got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03DialogueKasumiAcadia(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03DialogueKasumiAcadia
		if eventID == 1
			; INFO/STAGE 6 on DLC03DialogueKasumiAcadia
			; DESCRIPTION: Player reports back to Kasumi. Tell her not to worry. He'll get to the bottom of DiMA's secrets

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 2
			; INFO/STAGE 7 on DLC03DialogueKasumiAcadia
			; DESCRIPTION: Player reports back to Kasumi. Tells her that he's going to keep anything he finds about DiMA for himself.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Neutral()
			Valentine_Dislikes()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 8 on DLC03DialogueKasumiAcadia
			; DESCRIPTION: Player reports back to Kasumi. He jokes around about hoping that DiMA's memories aren't just going to be him starting at a wall or something.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Likes()
			Piper_Likes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		else
			debug.trace(self + " WARNING - DLC03DialogueKasumiAcadia got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03DialogueDiMA(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03DialogueDiMA
		if eventID == 1
			; INFO/STAGE 106 on DLC03DialogueDiMA
			; DESCRIPTION: After DiMA introduces himself, Player calls DiMA out as a kidnapper and says he brainwashed Kasumi

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Likes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 2
			; INFO/STAGE 107 on DLC03DialogueDiMA
			; DESCRIPTION: After DiMA introduces himself, Player jokes around, says he wants Kasumi returned home and also a pony

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Loves()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 3
			; INFO/STAGE 131 on DLC03DialogueDiMA
			; DESCRIPTION: DiMa asks if the player is a synth. Player admits that he suspects that he/she is.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Likes()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 4
			; INFO/STAGE 132 on DLC03DialogueDiMA
			; DESCRIPTION: DiMa asks if the player is a synth. Player says he's a human. End of story.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Likes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 5
			; INFO/STAGE 133 on DLC03DialogueDiMA
			; DESCRIPTION: DiMa asks if the player is a synth. Player jokes around and says he looks like a different person if he squints hard in the mirror.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 6
			; INFO/STAGE 136 on DLC03DialogueDiMA
			; DESCRIPTION: DiMA asks the player what he thinks of synths. Player says they're impressive

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Neutral()
			Curie_Likes()
			Danse_Hates()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Likes()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 7
			; INFO/STAGE 137 on DLC03DialogueDiMA
			; DESCRIPTION: DiMA asks the player what he thinks of synths. Player says he has no opinion

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 8
			; INFO/STAGE 138 on DLC03DialogueDiMA
			; DESCRIPTION: DiMA asks the player what he thinks of synths. Player says he thinks they're just machines.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Likes()
			Deacon_Dislikes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Hates()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 9
			; INFO/STAGE 71 on DLC03DialogueDiMA
			; DESCRIPTION: Player tells DiMA he's in the Railroad, DiMA objects because the Railroad changes synth identity - Player then says he never thought about it like that and apologizes

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Likes()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 10
			; INFO/STAGE 72 on DLC03DialogueDiMA
			; DESCRIPTION: Player tells DiMA he's in the Railroad, DiMA objects because the Railroad changes synth identity - Player then says we protect them and we do what we have to

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Dislikes()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Hates()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 11
			; INFO/STAGE 73 on DLC03DialogueDiMA
			; DESCRIPTION: Player tells DiMA he's in the Railroad, DiMA objects because the Railroad changes synth identity - Player then says he's not here to debate, just to help

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Dislikes()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Likes()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 12
			; INFO/STAGE 76 on DLC03DialogueDiMA
			; DESCRIPTION: Player tells DiMA he's in the Institute, DiMA asks the player to give Acadia a chance. Player agrees to keep Acadia a secret from the Institute.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Likes()
			Danse_Dislikes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Likes()
			Valentine_Likes()
			X688_Hates()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 13
			; INFO/STAGE 77 on DLC03DialogueDiMA
			; DESCRIPTION: Player tells DiMA he's in the Institute, DiMA asks the player to give Acadia a chance. Player says he won't agree to staying silent.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Hates()
			MacCready_Neutral()
			Piper_Hates()
			Preston_Dislikes()
			Strong_Neutral()
			Valentine_Hates()
			X688_Loves()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 14
			; INFO/STAGE 78 on DLC03DialogueDiMA
			; DESCRIPTION: Player tells DiMA he's in the Institute, DiMA asks the player to give Acadia a chance. Player says he'll think about it.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Dislikes()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 15
			; INFO/STAGE 81 on DLC03DialogueDiMA
			; DESCRIPTION: Player tells DiMA he's in the Brotherhood of Steel, DiMA asks the player to give Acadia a chance. Player agrees to reserve judgment.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Hates()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Likes()
			Strong_Neutral()
			Valentine_Dislikes()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 16
			; INFO/STAGE 82 on DLC03DialogueDiMA
			; DESCRIPTION: Player tells DiMA he's in the Brotherhood of Steel, DiMA asks the player to give Acadia a chance. Player says synths are a threat to all humanity.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Loves()
			Deacon_Dislikes()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Hates()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 17
			; INFO/STAGE 83 on DLC03DialogueDiMA
			; DESCRIPTION: Player tells DiMA he's in the Brotherhood of Steel, DiMA asks the player to give Acadia a chance. Player says he'll think about it.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 18
			; INFO/STAGE 123 on DLC03DialogueDiMA
			; DESCRIPTION: Player tells DiMA that the Institute has been destroyed.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Likes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Neutral()
			X688_Hates()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 19
			; INFO/STAGE 51 on DLC03DialogueDiMA
			; DESCRIPTION: Player has the nuclear launch key, confronts DiMA, but tells DiMA that he'll ensure the Nucleus isn't destroyed

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Dislikes()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 20
			; INFO/STAGE 52 on DLC03DialogueDiMA
			; DESCRIPTION: Player has the nuclear launch key, confronts DiMA, and tells DiMA that they should destroy the Children of Atom

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Likes()
			Valentine_Dislikes()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Loves()

		elseif eventID == 21
			; INFO/STAGE 53 on DLC03DialogueDiMA
			; DESCRIPTION: Player has the nuclear launch key, confronts DiMA, and tells DiMA that they should destroy BOTH the Children of Atom and Far Harbor

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Hates()
			Danse_Hates()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Dislikes()
			Piper_Hates()
			Preston_Hates()
			Strong_Dislikes()
			Valentine_Hates()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 22
			; INFO/STAGE 56 on DLC03DialogueDiMA
			; DESCRIPTION: Player has the Far Harbor Kill Code, confronts DiMA, but tells DiMA he'll protect Far Harbor and make sure it isn't used.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Likes()
			Piper_Likes()
			Preston_Loves()
			Strong_Likes()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Loves()

		elseif eventID == 23
			; INFO/STAGE 57 on DLC03DialogueDiMA
			; DESCRIPTION: Player has the Far Harbor Kill Code, confronts DiMA, and tells DiMA that they should destroy Far Harbor

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Hates()
			Danse_Hates()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Dislikes()
			Piper_Hates()
			Preston_Hates()
			Strong_Dislikes()
			Valentine_Hates()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Hates()

		elseif eventID == 24
			; INFO/STAGE 58 on DLC03DialogueDiMA
			; DESCRIPTION: Player has the Far Harbor Kill Code, confronts DiMA, and tells DiMA that they should destroy BOTH Far Harbor and the Children of Atom

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Hates()
			Danse_Hates()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Dislikes()
			Piper_Hates()
			Preston_Hates()
			Strong_Dislikes()
			Valentine_Hates()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		else
			debug.trace(self + " WARNING - DLC03DialogueDiMA got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03DialogueNick(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03DialogueNick
		if eventID == 1
			; INFO/STAGE 200 on DLC03DialogueNick
			; DESCRIPTION: Player gives Nick a holotape proving that he and DiMA are brothers

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Loves()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Loves()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		else
			debug.trace(self + " WARNING - DLC03DialogueNick got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03CoA_DialogueNucleus(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03CoA_DialogueNucleus
		if eventID == 1
			; INFO/STAGE 41 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: When the player speaks to the High Confessor for the first time and he asks "How does it feel to take your place among Atom's chosen," the player replies "It's an honor."

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Neutral()
			Curie_Likes()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Neutral()
			MacCready_Dislikes()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 42 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: When the player speaks to the High Confessor for the first time and he asks "How does it feel to take your place among Atom's chosen," the player replies "Like I'm surrounded by fanatics."

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Likes()
			Piper_Likes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 3
			; INFO/STAGE 43 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: When the player speaks to the High Confessor for the first time and he asks "How does it feel to take your place among Atom's chosen," the player replies "A lot more rads than I usually like."

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 4
			; INFO/STAGE 44 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: When the player speaks to the High Confessor for the first time and the Confessor asks "What would you do with Far Harbor?" the player replies "Try to make peace."

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Likes()
			Piper_Likes()
			Preston_Likes()
			Strong_Dislikes()
			Valentine_Likes()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 5
			; INFO/STAGE 45 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: When the player speaks to the High Confessor for the first time and the Confessor asks "What would you do with Far Harbor?" the player replies "Destroy them."

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Dislikes()
			Curie_Hates()
			Danse_Hates()
			Deacon_Hates()
			Hancock_Dislikes()
			MacCready_Dislikes()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Likes()
			Valentine_Dislikes()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Hates()

		elseif eventID == 6
			; INFO/STAGE 46 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: When the player speaks to the High Confessor for the first time and the Confessor asks "What would you do with Far Harbor?" the player replies "I don't know."

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 7
			; INFO/STAGE 47 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: The player has attempted to rat on a Child of Atom who the confessor suspects of disloyalty, possibly putting her life in danger. All woman said was say that she didn't like the confessor.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Neutral()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 8
			; INFO/STAGE 75 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: Player has agreed to investigate a Child of Atom who the High Confessor suspects of disloyalty. At this point, the player doesn't know who the Child in question is.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 9
			; INFO/STAGE 48 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: The High Confessor has asked the player to investigate a Child of Atom they suspect of disloyalty. The player has declined. The player does not know at this point who the Child is.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Likes()
			Danse_Likes()
			Deacon_Neutral()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 10
			; INFO/STAGE 20 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: The player has informed the High Confessor they have the means to bring down the Wind Farm powering Far Harbor's condensors and destroy the town. When asked what they plan to do with the information, the player has said they plan to destroy Far Harbor.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Dislikes()
			Curie_Hates()
			Danse_Hates()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Dislikes()
			Piper_Hates()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Hates()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Hates()

		elseif eventID == 11
			; INFO/STAGE 21 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: The player has informed the High Confessor they have the means to bring down the Wind Farm powering Far Harbor's condensors and destroy the town. When asked what they plan to do with the information, the player has said they are still deciding.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 12
			; INFO/STAGE 22 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: The player has informed the High Confessor they have the means to bring down the Wind Farm powering Far Harbor's condensors and destroy the town. When asked what they plan to do with the information, the player has said they plan to destroy Far Harbor, but only if they get paid.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Hates()
			Danse_Hates()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Neutral()
			Piper_Hates()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Hates()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Hates()

		elseif eventID == 13
			; INFO/STAGE 23 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: Player has agreed to help Sister Mai repair the decontamination arches in the bay by collecting an object from a dangerous dungeon filled with Super Mutants (the player may or may not know that Mai plans to use them to spray irradiated water. If you think your Comp would have a different opinion either way, let me know and I can add additional handling).

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 14
			; INFO/STAGE 24 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: Player has declined to help Sister Mai repair the decontamination arches in the bay by collecting an object from a dangerous dungeon (the player may or may not know that Mai plans to use them to spray irradiated water. If you think you Comp would have an opinion either way, let me know and I can add additional handling).

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 15
			; INFO/STAGE 25 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: Player has demanded caps from Mai in addition to the reward she's already offered to provide.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Neutral()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Loves()
			Piper_Neutral()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 16
			; INFO/STAGE 26 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: Player has agreed to hunt down and kill a Child of Atom heretic - Sister Gwyneth. Gwyneth's only apparent crime was vandalizing some Children of Atom shrines and claiming Atom isn't real.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Neutral()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Likes()
			Valentine_Dislikes()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 17
			; INFO/STAGE 27 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: Player objected to hunting down and killing a Child of Atom heretic - Sister Gwyneth. Gwyneth's only apparent crime was vandalizing some Children of Atom shrines and claiming Atom isn't real.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Dislikes()
			Valentine_Likes()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 18
			; INFO/STAGE 28 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: When asked to hunt down and kill a Child of Atom heretic (whose only apparent crime was vandalizing some Children of Atom holy sites and not believing in Atom), the player suggested they might try talking to her isn't of killing her.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Dislikes()
			Valentine_Likes()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 19
			; INFO/STAGE 2 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: When asked what they think about a Child of Atom who's been on a dangerously long fast, the player replied that it's very admirable.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Likes()
			Danse_Neutral()
			Deacon_Dislikes()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 20
			; INFO/STAGE 3 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: When asked what they think about a Child of Atom who's been on a dangerously long fast, the player replied that it's nuts.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Likes()
			Piper_Likes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 21
			; INFO/STAGE 4 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: When asked what they think about a Child of Atom who's been on a dangerously long fast, the player replied that it's that Child's choice.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 22
			; INFO/STAGE 5 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: When asked to attempt to talk this Child of Atom out of their dangerously long fast, the player agreed to speak to the fasting Child.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Neutral()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 23
			; INFO/STAGE 6 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: When asked to attempt to talk this Child of Atom out of their dangerously long fast, the player said it's not their problem.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 24
			; INFO/STAGE 7 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: When asked to attempt to talk this Child of Atom out of their dangerously long fast, the player Chastized the person asking, stating that they should try and be as pious as the fasting child.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Dislikes()
			MacCready_Dislikes()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 25
			; INFO/STAGE 8 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: When asking the fasting Child of Atom about the message he claims to have received from Atom, the player replied "Atom's not real."

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Loves()

		elseif eventID == 26
			; INFO/STAGE 125 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: The player pretended to be a messenger from Atom, successfully convincing the fasting Child of Atom that they can go back to their normal life.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Loves()
			Hancock_Likes()
			MacCready_Likes()
			Piper_Likes()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 27
			; INFO/STAGE 127 on DLC03CoA_DialogueNucleus
			; DESCRIPTION: While dressed as a messenger from Atom in an attempt to convince a fasting Child of Atom to end their dangerous fast, the player demanded caps from the Child.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Loves()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		else
			debug.trace(self + " WARNING - DLC03CoA_DialogueNucleus got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03_V118_PearlHiring(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03_V118_PearlHiring
		if eventID == 1
			; INFO/STAGE 10 on DLC03_V118_PearlHiring
			; DESCRIPTION: When approached by a robot to help solve a murder in Vault 118, the player asked for money.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 2
			; INFO/STAGE 13 on DLC03_V118_PearlHiring
			; DESCRIPTION: When approached by a robot to help solve a murder in Vault 118, the player asked for money.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 3
			; INFO/STAGE 200 on DLC03_V118_PearlHiring
			; DESCRIPTION: When approached by a robot to help solve a murder in Vault 118, the player agreed to help.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		else
			debug.trace(self + " WARNING - DLC03_V118_PearlHiring got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03_V118_Intro(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03_V118_Intro
		if eventID == 1
			; INFO/STAGE 21 on DLC03_V118_Intro
			; DESCRIPTION: Upon entering Vault 118, the player asked the receptionist for money to help with the investigation

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Neutral()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 2
			; INFO/STAGE 22 on DLC03_V118_Intro
			; DESCRIPTION: Upon entering Vault 118, the player asked the receptionist for money to help with the investigation

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Neutral()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		else
			debug.trace(self + " WARNING - DLC03_V118_Intro got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03_V118_Quest(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03_V118_Quest
		if eventID == 1
			; INFO/STAGE 200 on DLC03_V118_Quest
			; DESCRIPTION: The player agreed to help the robobrains in Vault 118 investigate the murder.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 2
			; INFO/STAGE 910 on DLC03_V118_Quest
			; DESCRIPTION: The player found and defeated the killer (not the actual killer, but the player doesn't know that yet)

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 3
			; INFO/STAGE 833 on DLC03_V118_Quest
			; DESCRIPTION: The player, through difficult speech challenges, got information from one of the robobrains that implicates the real murderer.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 4
			; INFO/STAGE 544 on DLC03_V118_Quest
			; DESCRIPTION: The player flirted with one of the robobrains

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 5
			; INFO/STAGE 545 on DLC03_V118_Quest
			; DESCRIPTION: The player flirted with one of the robobrains

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 6
			; INFO/STAGE 546 on DLC03_V118_Quest
			; DESCRIPTION: The player flirted with one of the robobrains

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 7
			; INFO/STAGE 548 on DLC03_V118_Quest
			; DESCRIPTION: The player 'went on a date' with one of the robobrains

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Hates()
			Valentine_Neutral()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		else
			debug.trace(self + " WARNING - DLC03_V118_Quest got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03_V118_ClueTracker(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03_V118_ClueTracker
		if eventID == 1
			; INFO/STAGE 40 on DLC03_V118_ClueTracker
			; DESCRIPTION: The player found a hidden clue at the crime scene

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 2
			; INFO/STAGE 80 on DLC03_V118_ClueTracker
			; DESCRIPTION: The player found hidden proof that victim had been embezzling from the residents.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 3
			; INFO/STAGE 501 on DLC03_V118_ClueTracker
			; DESCRIPTION: The player found out that one of the robobrains was in love with the victim, ruling that person out as a suspect.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		else
			debug.trace(self + " WARNING - DLC03_V118_ClueTracker got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03DialogueV118(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03DialogueV118
		if eventID == 1
			; INFO/STAGE 500 on DLC03DialogueV118
			; DESCRIPTION: The player revealed real killer

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 2
			; INFO/STAGE 1350 on DLC03DialogueV118
			; DESCRIPTION: The receptionist told the player that they got the wrong person with their first conviction. This means the player killed someone who was innocent.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 510 on DLC03DialogueV118
			; DESCRIPTION: After revealing the true identity of the killer, the player asked for money in exchange for letting the killer go. This was successful

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Neutral()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Dislikes()
			MacCready_Likes()
			Piper_Hates()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Hates()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 4
			; INFO/STAGE 511 on DLC03DialogueV118
			; DESCRIPTION: After revealing the true identity of the killer, the player asked for money in exchange for letting the killer go. This failed.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Neutral()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Dislikes()
			MacCready_Likes()
			Piper_Hates()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Hates()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 5
			; INFO/STAGE 600 on DLC03DialogueV118
			; DESCRIPTION: The player said they would let the killer go. They still have a chance to go tell the receptionist the killers true identity if they can do so before the killer leaves the vault.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Neutral()
			Deacon_Dislikes()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 6
			; INFO/STAGE 950 on DLC03DialogueV118
			; DESCRIPTION: The player told the receptionist that the killer is actually alive, allowing the robotic staff to help kill the killer.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Likes()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 7
			; INFO/STAGE 920 on DLC03DialogueV118
			; DESCRIPTION: Player told the receptionist that they had defeated the killer (truth)

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 8
			; INFO/STAGE 930 on DLC03DialogueV118
			; DESCRIPTION: Player told the receptionist that they had defeated the killer or that the killer had escaped (lie)

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Neutral()
			Deacon_Dislikes()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 9
			; INFO/STAGE 1500 on DLC03DialogueV118
			; DESCRIPTION: The actual killer was killed.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 10
			; INFO/STAGE 810 on DLC03DialogueV118
			; DESCRIPTION: The player is now enemies of Vault 118 for killing one of the residents in cold blood (not having accused them of murder)

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Hates()
			Curie_Hates()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Hates()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Hates()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		else
			debug.trace(self + " WARNING - DLC03DialogueV118 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03_ADV017(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03_ADV017
		if eventID == 1
			; INFO/STAGE 8 on DLC03_ADV017
			; DESCRIPTION: The player found Erikson, the super mutant who is friendly, and decided (through speech option) to start combat.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Likes()
			Deacon_Dislikes()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Loves()
			Valentine_Dislikes()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 1 on DLC03_ADV017
			; DESCRIPTION: The player killed Erikson.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Hates()
			Curie_Dislikes()
			Danse_Likes()
			Deacon_Dislikes()
			Hancock_Hates()
			MacCready_Neutral()
			Piper_Hates()
			Preston_Dislikes()
			Strong_Likes()
			Valentine_Hates()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 2 on DLC03_ADV017
			; DESCRIPTION: Player killed one of Erikson's dogs

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Dislikes()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Likes()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 4
			; INFO/STAGE 3 on DLC03_ADV017
			; DESCRIPTION: Player killed one of Erikson's dogs

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Dislikes()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Likes()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 5
			; INFO/STAGE 4 on DLC03_ADV017
			; DESCRIPTION: Player killed one of Erikson's dogs

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Dislikes()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Likes()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 6
			; INFO/STAGE 7 on DLC03_ADV017
			; DESCRIPTION: The player didn't kill Erikson on sight, but let him go up to his camp.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 7
			; INFO/STAGE 40 on DLC03_ADV017
			; DESCRIPTION: The player bought a dog from Erikson (this only happens the first time you buy one)

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 8
			; INFO/STAGE 50 on DLC03_ADV017
			; DESCRIPTION: The player bought a wolf from Erikson (this only happens the first time you buy one)

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 9
			; INFO/STAGE 60 on DLC03_ADV017
			; DESCRIPTION: The player bought a FEV Hound from Erikson (this only happens the first time you buy one)

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Loves()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		else
			debug.trace(self + " WARNING - DLC03_ADV017 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03DialogueFarHarbor(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03DialogueFarHarbor
		if eventID == 1
			; INFO/STAGE 21 on DLC03DialogueFarHarbor
			; DESCRIPTION: Allen Lee is dismissive of the player's help defending the town's wall. The player calls Allen an ungrateful jerk. Rude but accurate.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 2
			; INFO/STAGE 22 on DLC03DialogueFarHarbor
			; DESCRIPTION: Andre's was near death and the player used his medical knowledge to save him. When Andre asks why the player did it, the player says he was just being a good samaritan.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Likes()
			Valentine_Likes()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 3
			; INFO/STAGE 23 on DLC03DialogueFarHarbor
			; DESCRIPTION: Andre's was near death and the player used his medical knowledge to save him. When Andre asks why the player did it, the player says he was hoping for a reward.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Neutral()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 4
			; INFO/STAGE 24 on DLC03DialogueFarHarbor
			; DESCRIPTION: Andre is consumed with revenge for the death of his husband. He wants to go on a suicide run murdering things. The player tries to convince him to stop by finding a good reason to live.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Neutral()
			Valentine_Likes()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 5
			; INFO/STAGE 25 on DLC03DialogueFarHarbor
			; DESCRIPTION: Brooks (who the player correctly thinks may be a synth) asks what the player's view of synths is. The player says he's a friend of the synths.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Neutral()
			Curie_Likes()
			Danse_Hates()
			Deacon_Loves()
			Hancock_Neutral()
			MacCready_Dislikes()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Likes()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 6
			; INFO/STAGE 26 on DLC03DialogueFarHarbor
			; DESCRIPTION: Brooks (who the player correctly thinks may be a synth) asks what the player's view of synths is. The player says synths are abominations.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Loves()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Likes()
			Piper_Hates()
			Preston_Dislikes()
			Strong_Likes()
			Valentine_Hates()
			X688_Hates()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 7
			; INFO/STAGE 27 on DLC03DialogueFarHarbor
			; DESCRIPTION: Brooks (who the player correctly thinks may be a synth) asks what the player's view of synths is. The player says synths belong in the Institute.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Neutral()
			Piper_Hates()
			Preston_Dislikes()
			Strong_Neutral()
			Valentine_Hates()
			X688_Loves()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 8
			; INFO/STAGE 110 on DLC03DialogueFarHarbor
			; DESCRIPTION: The player has healed a dying person in Far Harbor. This displays some medical skill and no reward has been offered.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Loves()
			Curie_Loves()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Likes()
			Valentine_Likes()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		else
			debug.trace(self + " WARNING - DLC03DialogueFarHarbor got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03DialogueFarHarborPostMQ05Avery(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03DialogueFarHarborPostMQ05Avery
		if eventID == 1
			; INFO/STAGE 21 on DLC03DialogueFarHarborPostMQ05Avery
			; DESCRIPTION: Captain Avery is shocked her people stood up to the firebrand Allen Lee and didn't storm Acadia in large part because of the player. The player says Harbormen are good.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Dislikes()
			Valentine_Likes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 2
			; INFO/STAGE 22 on DLC03DialogueFarHarborPostMQ05Avery
			; DESCRIPTION: Captain Avery is shocked her people stood up to the firebrand Allen Lee and didn't storm Acadia in large part because of the player. The player says Avery owes him (which is absolutely accurate if mercenary).

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 3
			; INFO/STAGE 23 on DLC03DialogueFarHarborPostMQ05Avery
			; DESCRIPTION: Captain Avery is depressed that Harbormen slaughtered an innocent settlement. The player says it's a tragedy.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Neutral()

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 4
			; INFO/STAGE 24 on DLC03DialogueFarHarborPostMQ05Avery
			; DESCRIPTION: Captain Avery is depressed that Harbormen slaughtered an innocent settlement. The player says that Acadia wasn't so innocent, it was a threat.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Likes()
			Deacon_Dislikes()
			Hancock_Dislikes()
			MacCready_Likes()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Hates()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 5
			; INFO/STAGE 25 on DLC03DialogueFarHarborPostMQ05Avery
			; DESCRIPTION: Captain Avery is depressed that Harbormen slaughtered an innocent settlement. The player says that it was Far Harbor's fault (which it is, but is very harsh).

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Dislikes()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		else
			debug.trace(self + " WARNING - DLC03DialogueFarHarborPostMQ05Avery got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC03DialogueFarHarborPostQuest(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC03DialogueFarHarborPostQuest
		if eventID == 1
			; INFO/STAGE 21 on DLC03DialogueFarHarborPostQuest
			; DESCRIPTION: The Children of Atom were nuked, the player is responsible. When asked why he did it, he says the Children of Atom were a disease.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Dislikes()
			X688_Likes()

			;DLC03 COMPANIONS: 
			LongFellow_Loves()

		elseif eventID == 2
			; INFO/STAGE 22 on DLC03DialogueFarHarborPostQuest
			; DESCRIPTION: The Children of Atom were nuked, the player is responsible. When asked why he did it, he says he killed the cultists to safeguard Far Harbor's future.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Neutral()
			X688_Dislikes()

			;DLC03 COMPANIONS: 
			LongFellow_Loves()

		else
			debug.trace(self + " WARNING - DLC03DialogueFarHarborPostQuest got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

