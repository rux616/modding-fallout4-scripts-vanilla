Scriptname DLC06:DLC06_NewAffinityEventsScript extends Quest
{New events in this DLC that companions in this DLC and companions from base game will respond to}

Group Quests
	;DLC QUESTS GO HERE

	;CA_QuestStage_Bump Property XXX Auto Const Mandatory

	CA_QuestStage_Bump Property DLC06MQ03 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC06E01 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC06E02 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC06E03 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC06E04 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC06DialogueVault88 Auto Const Mandatory
	
EndGroup

String sDLC03 = "DLCCoast.esm" const
CompanionActorScript DLC03_CompanionOldLongfellowRef
keyword CA_CustomEvent_OldLongfellowLoves
keyword CA_CustomEvent_OldLongfellowLikes
keyword CA_CustomEvent_OldLongfellowDislikes
keyword CA_CustomEvent_OldLongfellowHates
keyword CA_CustomEvent_OldLongfellow__UNSET

int iDLC03_CompanionOldLongfellowRef 		= 0x01014602 const
int iCA_CustomEvent_OldLongfellowLoves		= 0x01006E60 const
int iCA_CustomEvent_OldLongfellowLikes 		= 0x01006E61 const
int iCA_CustomEvent_OldLongfellowDislikes 	= 0x01006E62 const
int iCA_CustomEvent_OldLongfellowHates		= 0x01006E63 const
int iCA_CustomEvent_OldLongfellow__UNSET	= 0x01006E64 const

bool bDLC06EventsReady

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
	RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerLoadGame")
	RegisterForCustomEvent(CompanionAffinity, "CompanionAffinityEvent")
	CheckForDLCAndProcessVariablesAndRegisterForEvent()
endEvent

;need this event, in case the player installs the other DLC AFTER installing this one
Event Actor.OnPlayerLoadGame(actor akSource)
    bDLC06EventsReady = bDLC06EventsReady || CheckForDLCAndProcessVariablesAndRegisterForEvent()
EndEvent

bool Function CheckForDLCAndProcessVariablesAndRegisterForEvent()
	if Game.IsPluginInstalled(sDLC03)
		DLC03_CompanionOldLongfellowRef = Game.GetFormFromFile(iDLC03_CompanionOldLongfellowRef, sDLC03) as CompanionActorScript
		CA_CustomEvent_OldLongfellowLoves = Game.GetFormFromFile(iCA_CustomEvent_OldLongfellowLoves, sDLC03) as Keyword
		CA_CustomEvent_OldLongfellowLikes = Game.GetFormFromFile(iCA_CustomEvent_OldLongfellowLikes, sDLC03) as Keyword
		CA_CustomEvent_OldLongfellowDislikes = Game.GetFormFromFile(iCA_CustomEvent_OldLongfellowDislikes, sDLC03) as Keyword
		CA_CustomEvent_OldLongfellowHates = Game.GetFormFromFile(iCA_CustomEvent_OldLongfellowHates, sDLC03) as Keyword
		CA_CustomEvent_OldLongfellow__UNSET = Game.GetFormFromFile(iCA_CustomEvent_OldLongfellow__UNSET, sDLC03) as Keyword
		return true
	endif

	return false
EndFunction

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

		if eventQuest == DLC06MQ03
			HandleQuestStageBump_DLC06MQ03(eventQuest, eventID)
		elseif eventQuest == DLC06E01
			HandleQuestStageBump_DLC06E01(eventQuest, eventID)
		elseif eventQuest == DLC06E02
			HandleQuestStageBump_DLC06E02(eventQuest, eventID)
		elseif eventQuest == DLC06E03
			HandleQuestStageBump_DLC06E03(eventQuest, eventID)
		elseif eventQuest == DLC06E04
			HandleQuestStageBump_DLC06E04(eventQuest, eventID)
		ElseIf eventQuest == DLC06DialogueVault88
			HandleQuestStageBump_DLC06DialogueVault88(eventQuest, eventID)
		else
			; unhandled quest - but not an error once DLC exists
			debug.trace(self + " CompanionAffinityEvent: WARNING - unhandled quest stage bump " + eventQuest)
		endif
	endif
endEvent

function HandleQuestStageBump_DLC06MQ03(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC06MQ03
		if eventID == 1
			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Neutral()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Neutral()
			Longfellow_Neutral()
		elseif eventID == 2
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
			Longfellow_Likes()	
		elseif eventID == 3
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Dislikes()
			X688_Likes()
			Longfellow_Neutral()
		elseif eventID == 4
			Cait_Dislikes()
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
			Longfellow_Neutral()
		elseif eventID == 5
			Cait_Likes()
			Codsworth_Dislikes()
			Danse_Dislikes()
			MacCready_Likes()
			Preston_Dislikes()
			X688_Likes()
		endif
	endif
endFunction

function HandleQuestStageBump_DLC06E01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC06E01
		if eventID == 1
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Dislikes()
			MacCready_Likes()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Neutral()
			Valentine_Dislikes()
			X688_Likes()
			Longfellow_Dislikes()
		elseif eventID == 2
			Cait_Neutral()
			Codsworth_Dislikes()
			Curie_Hates()
			Danse_Hates()
			Deacon_Hates()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Hates()
			Preston_Hates()
			Strong_Neutral()
			Valentine_Hates()
			X688_Neutral()
			Longfellow_Dislikes()
		elseif eventID == 3
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Dislikes()
			Piper_Likes()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Likes()
			X688_Neutral()
			Longfellow_Neutral()
		endif
	endif
endFunction

function HandleQuestStageBump_DLC06E02(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC06E02
		if eventID == 1
			if ( Cait_EventCondition_DislikesPlayerTakingChems.GetValue() == 0 )
				Cait_Loves()
			else
				Cait_Hates()
			endif
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Dislikes()
			X688_Neutral()
			Longfellow_Neutral()
		elseif eventID == 2
			if ( Cait_EventCondition_DislikesPlayerTakingChems.GetValue() == 0 )
				Cait_Loves()
			else
				Cait_Hates()
			endif
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Dislikes()
			X688_Likes()
			Longfellow_Dislikes()
		elseif eventID == 3
			Cait_Dislikes()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Likes()
			X688_Neutral()
			Longfellow_Neutral()
		elseif eventID == 4
			Cait_Likes()
			Codsworth_Dislikes()
			Danse_Dislikes()
			MacCready_Likes()
			Preston_Dislikes()
			X688_Likes()
		endif
	endif
endFunction

function HandleQuestStageBump_DLC06E03(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC06E03
		if eventID == 1
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Loves()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Dislikes()
			Valentine_Likes()
			X688_Dislikes()
			Longfellow_Neutral()
		elseif eventID == 2
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Dislikes()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Neutral()
			X688_Likes()
			Longfellow_Neutral()
		elseif eventID == 3
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Likes()
			Hancock_Dislikes()
			MacCready_Likes()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Dislikes()
			X688_Neutral()
			Longfellow_Dislikes()
		elseif eventID == 4
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Loves()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Neutral()
			Valentine_Likes()
			X688_Dislikes()
			Longfellow_Neutral()
		elseif eventID == 5
			Cait_Dislikes()
			Codsworth_Neutral()
			Curie_Likes()
			Danse_Likes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Dislikes()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Neutral()
			Longfellow_Neutral()
		elseif eventID == 6
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Hates()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Neutral()
			Piper_Hates()
			Preston_Hates()
			Strong_Likes()
			Valentine_Hates()
			X688_Likes()
			Longfellow_Dislikes()
		elseif eventID == 7
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Hates()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Dislikes()
			Piper_Hates()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Hates()
			X688_Likes()
			Longfellow_Dislikes()
		elseif eventID == 8
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Loves()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Neutral()
			Valentine_Likes()
			X688_Neutral()
			Longfellow_Likes()
		endif
	endif
endFunction

function HandleQuestStageBump_DLC06E04(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC06E04
		if eventID == 1
			Cait_Likes()
			Codsworth_Likes()
			Curie_Dislikes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Likes()
			Piper_Likes()
			Preston_Likes()
			Strong_Neutral()
			Valentine_Likes()
			X688_Neutral()
			Longfellow_Likes()
		elseif eventID == 2
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
			X688_Neutral()
			Longfellow_Dislikes()
		elseif eventID == 3
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Loves()
			Strong_Neutral()
			Valentine_Likes()
			X688_Dislikes()
			Longfellow_Neutral()
		elseif eventID == 4
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Neutral()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Likes()
			Piper_Likes()
			Preston_Loves()
			Strong_Likes()
			Valentine_Likes()
			X688_Neutral()
			Longfellow_Likes()
		elseif eventID == 5
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Dislikes()
			X688_Neutral()
			Longfellow_Dislikes()
		elseif eventID == 6
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Likes()
			Deacon_Neutral()
			Hancock_Dislikes()
			MacCready_Likes()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Neutral()
			Valentine_Dislikes()
			X688_Neutral()
			Longfellow_Dislikes()
		elseif eventID == 7
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Hates()
			Piper_Likes()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Likes()
			X688_Dislikes()
			Longfellow_Dislikes()
		endif
	endif
endFunction

function HandleQuestStageBump_DLC06DialogueVault88(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC06DialogueVault88
		if eventID == 1
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Likes()
			X688_Neutral()
			Longfellow_Neutral()
		elseif eventID == 2
			Cait_Likes()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Dislikes()
			X688_Neutral()
			Longfellow_Likes()
		endif
	endif
endFunction


