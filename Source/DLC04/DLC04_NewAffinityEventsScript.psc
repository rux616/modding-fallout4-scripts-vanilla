Scriptname DLC04:DLC04_NewAffinityEventsScript extends Quest
{New events in this DLC that companions in this DLC and companions from base game will respond to}

Group Quests
	;DLC QUESTS GO HERE

	;CA_QuestStage_Bump Property XXX Auto Const Mandatory
	CA_QuestStage_Bump Property DLC04MQ00 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC04MQ01 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC04MQ02 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC04REObjectCT03 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC04RESceneCT03 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC04DialogueHarvey Auto Const Mandatory
	CA_QuestStage_Bump Property DLC04MQ04RaiderAttack Auto Const Mandatory
	CA_QuestStage_Bump Property DLC04MQ04 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC04RaidWipeOut Auto Const Mandatory
	CA_QuestStage_Bump Property DLC04RaidChaseOff Auto Const Mandatory
	CA_QuestStage_Bump Property DLC04RaidSubdue Auto Const Mandatory
	CA_QuestStage_Bump Property DLC04RaidCoerce Auto Const Mandatory
	CA_QuestStage_Bump Property DLC04MS02 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC04_RQ_Manager Auto Const Mandatory
	CA_QuestStage_Bump Property DLC04MS01 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC04MS01Post Auto Const Mandatory
	CA_QuestStage_Bump Property DLC04DialogueSettlement Auto Const Mandatory
	CA_QuestStage_Bump Property DLC04_KiddieKingdomMain Auto Const Mandatory
	CA_QuestStage_Bump Property DLC04SafariAdventureQuest Auto Const Mandatory
	CA_QuestStage_Bump Property DLC04MQ05 Auto Const Mandatory
	CA_QuestStage_Bump Property DLC04RaiderKickout Auto Const Mandatory
	CA_QuestStage_Bump Property DLC04DryRockGulch Auto Const Mandatory


	
EndGroup

Group DLCCompanionActors
	CompanionActorScript Property DLC04GageRef const auto Mandatory
EndGroup

Group DLCCompanionAffinityKeywords
	keyword Property CA_CustomEvent_GageLoves auto const mandatory
	keyword Property CA_CustomEvent_GageLikes auto const mandatory
	keyword Property CA_CustomEvent_GageDislikes auto const mandatory
	keyword Property CA_CustomEvent_GageHates auto const mandatory
	keyword Property CA_CustomEvent_Gage__UNSET auto const mandatory
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
function Gage__UNSET()

endFunction

function Gage_Neutral(bool CheckCompanionProximity = true)
endFunction

function Gage_Dislikes(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_GageDislikes, CheckCompanionProximity)
endFunction

function Gage_Hates(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_GageHates, CheckCompanionProximity)
endFunction

function Gage_Likes(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_GageLikes, CheckCompanionProximity)
endFunction

function Gage_Loves(bool CheckCompanionProximity = true)
	SendAffinityEvent(CA_CustomEvent_GageLoves, CheckCompanionProximity)
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

		if eventQuest == DLC04MQ00
			HandleQuestStageBump_DLC04MQ00(eventQuest, eventID)
		elseif eventQuest == DLC04MQ01
			HandleQuestStageBump_DLC04MQ01(eventQuest, eventID)
		elseif eventQuest == DLC04MQ02
			HandleQuestStageBump_DLC04MQ02(eventQuest, eventID)
		elseif eventQuest == DLC04REObjectCT03
			HandleQuestStageBump_DLC04REObjectCT03(eventQuest, eventID)
		elseif eventQuest == DLC04RESceneCT03
			HandleQuestStageBump_DLC04RESceneCT03(eventQuest, eventID)
		elseif eventQuest == DLC04DialogueHarvey
			HandleQuestStageBump_DLC04DialogueHarvey(eventQuest, eventID)
		elseif eventQuest == DLC04MQ04RaiderAttack
			HandleQuestStageBump_DLC04MQ04RaiderAttack(eventQuest, eventID)
		elseif eventQuest == DLC04MQ04
			HandleQuestStageBump_DLC04MQ04(eventQuest, eventID)
		elseif eventQuest == DLC04RaidWipeOut
			HandleQuestStageBump_DLC04RaidWipeOut(eventQuest, eventID)
		elseif eventQuest == DLC04RaidChaseOff
			HandleQuestStageBump_DLC04RaidChaseOff(eventQuest, eventID)
		elseif eventQuest == DLC04RaidSubdue
			HandleQuestStageBump_DLC04RaidSubdue(eventQuest, eventID)
		elseif eventQuest == DLC04RaidCoerce
			HandleQuestStageBump_DLC04RaidCoerce(eventQuest, eventID)
		elseif eventQuest == DLC04MS02
			HandleQuestStageBump_DLC04MS02(eventQuest, eventID)
		elseif eventQuest == DLC04_RQ_Manager
			HandleQuestStageBump_DLC04_RQ_Manager(eventQuest, eventID)
		elseif eventQuest == DLC04MS01
			HandleQuestStageBump_DLC04MS01(eventQuest, eventID)
		elseif eventQuest == DLC04MS01Post
			HandleQuestStageBump_DLC04MS01Post(eventQuest, eventID)
		elseif eventQuest == DLC04DialogueSettlement
			HandleQuestStageBump_DLC04DialogueSettlement(eventQuest, eventID)
		elseif eventQuest == DLC04_KiddieKingdomMain
			HandleQuestStageBump_DLC04_KiddieKingdomMain(eventQuest, eventID)
		elseif eventQuest == DLC04SafariAdventureQuest
			HandleQuestStageBump_DLC04SafariAdventureQuest(eventQuest, eventID)
		elseif eventQuest == DLC04MQ05
			HandleQuestStageBump_DLC04MQ05(eventQuest, eventID)
		elseif eventQuest == DLC04RaiderKickout
			HandleQuestStageBump_DLC04RaiderKickout(eventQuest, eventID)
		elseif eventQuest == DLC04DryRockGulch
			HandleQuestStageBump_DLC04DryRockGulch(eventQuest, eventID)
		else
			; unhandled quest - but not an error once DLC exists
			debug.trace(self + " CompanionAffinityEvent: WARNING - unhandled quest stage bump " + eventQuest)
		endif
	endif

endEvent


function HandleQuestStageBump_DLC04MQ00(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC04MQ00
		if eventID == 1
			; INFO/STAGE 20 on DLC04MQ00
			; DESCRIPTION: Player found a wounded man and offered to either get help or give him a stimpak (depends on if player has a stimpak in their inventory or not).

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
			Strong_Dislikes()
			Valentine_Likes()
			X688_Dislikes()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 2
			; INFO/STAGE 21 on DLC04MQ00
			; DESCRIPTION: Player found a wounded man who is asking for help to save his family. The players response is "Your family is probably dead." Spoken with a "duh" attitude, no care or sympathy.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Dislikes()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 3
			; INFO/STAGE 22 on DLC04MQ00
			; DESCRIPTION: The wounded man refused help and the player dismissively says, "It's your funeral."

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Dislikes()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 4
			; INFO/STAGE 23 on DLC04MQ00
			; DESCRIPTION: The player has agreed to help the wounded man by rescuing his family from Raiders.

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
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 5
			; INFO/STAGE 24 on DLC04MQ00
			; DESCRIPTION: The player agreed to help the wounded man but is only doing it for the caps.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Neutral()
			MacCready_Loves()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 9
			; INFO/STAGE 40 on DLC04MQ00
			; DESCRIPTION: The player has killed Harvey and did NOT know that he was lying about being injured. They just killed an injured man asking for help.

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
			Strong_Likes()
			Valentine_Hates()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 10
			; INFO/STAGE 41 on DLC04MQ00
			; DESCRIPTION: The player killed Harvey after they discovered the truth, that he was just lying about being injured, but still needed the player's help to save his family.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Hates()
			Curie_Hates()
			Danse_Hates()
			Deacon_Hates()
			Hancock_Dislikes()
			MacCready_Likes()
			Piper_Hates()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Hates()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		else
			debug.trace(self + " WARNING - DLC04MQ00 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC04MQ01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC04MQ01
		if eventID == 1
			; INFO/STAGE 20 on DLC04MQ01
			; DESCRIPTION: Player just found the man who asked to help his family lied to the player just to lure them into the Gauntlet and says, "When I get out of here, he's a dead man."

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Neutral()
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

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 2
			; INFO/STAGE 21 on DLC04MQ01
			; DESCRIPTION: When someone brings up the player killing a man earlier, the player says, "He got what he deserved." because he lied to the player about being injured.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Neutral()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 3
			; INFO/STAGE 22 on DLC04MQ01
			; DESCRIPTION: When someone brings up the player killing a man earlier, the player says, "He lied to me, so he's dead now."

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Neutral()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 4
			; INFO/STAGE 23 on DLC04MQ01
			; DESCRIPTION: When the player realizes that Gage's plan to win the fight involves a squirt gun, the player says, "Screw your plan."

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
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
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 5
			; INFO/STAGE 24 on DLC04MQ01
			; DESCRIPTION: When someone informs the player that the man he killed earlier was only a lure to bring her into Nuka-World, the player says, "It's a good thing he's dead."

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Neutral()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 6
			; INFO/STAGE 30 on DLC04MQ01
			; DESCRIPTION: After beating the Overboss, the player thanks Gage for the good plan that allowed her to win.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 7
			; INFO/STAGE 31 on DLC04MQ01
			; DESCRIPTION: Player jokes about the Overboss dying saying, "Death by squirt gun. I'd love to see what he gets on his tombstone."

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
			Strong_Neutral()
			Valentine_Neutral()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		else
			debug.trace(self + " WARNING - DLC04MQ01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC04MQ02(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC04MQ02
		if eventID == 2
			; INFO/STAGE 192 on DLC04MQ02
			; DESCRIPTION: Player says this world needs rules, otherwise it'll never recover to Nisha, the Disciple leader, who doesn't care about rules.

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
			Strong_Likes()
			Valentine_Likes()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 3
			; INFO/STAGE 193 on DLC04MQ02
			; DESCRIPTION: Player agrees with Nisha, leader of the Disciples, that rules hold us back and we should be free to do what we want.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 4
			; INFO/STAGE 194 on DLC04MQ02
			; DESCRIPTION: Player says they think the Gauntlet should be shut down because it's dangerous.

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
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 6
			; INFO/STAGE 196 on DLC04MQ02
			; DESCRIPTION: Player threatened Nisha at the end of the scene, saying I don't make promises and you'll do what I say.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Likes()
			Strong_Likes()
			Valentine_Neutral()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 8
			; INFO/STAGE 291 on DLC04MQ02
			; DESCRIPTION: Player informed the Operator bosses that they enjoyed killing Colter

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Hates()
			Danse_Neutral()
			Deacon_Dislikes()
			Hancock_Likes()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Neutral()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 9
			; INFO/STAGE 292 on DLC04MQ02
			; DESCRIPTION: Player informed the Operator bosses that they were bored by killing Colter, just like they're bored with the current conversation (the player is being a wise-ass)

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 10
			; INFO/STAGE 293 on DLC04MQ02
			; DESCRIPTION: Player stated they've come to Nuka-World to make a ton of money.

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
			Strong_Dislikes()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 12
			; INFO/STAGE 295 on DLC04MQ02
			; DESCRIPTION: When asked what they want out of Nuka-World, the player replied - I'm mostly here for the soda. This will be presented as a joke.

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
			Strong_Neutral()
			Valentine_Neutral()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 13
			; INFO/STAGE 11 on DLC04MQ02
			; DESCRIPTION: Player initially says he doesn't want the job of Overboss

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Neutral()
			Valentine_Likes()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 14
			; INFO/STAGE 21 on DLC04MQ02
			; DESCRIPTION: Player says "don't worry, everybody likes me" (and means it)

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Likes()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 15
			; INFO/STAGE 22 on DLC04MQ02
			; DESCRIPTION: Player says gangs will follow him if they all fear him

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 16
			; INFO/STAGE 101 on DLC04MQ02
			; DESCRIPTION: Player asserts that "all Raiders are stupid"

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Likes()
			Curie_Dislikes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Likes()
			Valentine_Likes()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		else
			debug.trace(self + " WARNING - DLC04MQ02 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC04REObjectCT03(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC04REObjectCT03
		if eventID == 1
			; INFO/STAGE 41 on DLC04REObjectCT03
			; DESCRIPTION: Player found Harvey trying to lure people into Nuka-World but decided to let him go free. This is after the player has already met Harvey the first time, so the player knows it's basically a death trap.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Likes()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 2
			; INFO/STAGE 42 on DLC04REObjectCT03
			; DESCRIPTION: Player told Harvey everyone he cares about is dead, they just don’t know it yet.

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
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 3
			; INFO/STAGE 43 on DLC04REObjectCT03
			; DESCRIPTION: Player told Harvey that caring is for the weak.

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
			Strong_Likes()
			Valentine_Dislikes()
			X688_Loves()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		else
			debug.trace(self + " WARNING - DLC04REObjectCT03 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC04RESceneCT03(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC04RESceneCT03
		if eventID == 1
			; INFO/STAGE 11 on DLC04RESceneCT03
			; DESCRIPTION: Player tells Dixie to let her two victims live and make them slaves. This is the most merciful option - but the player is still complicit in enslaving them.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Dislikes()
			Danse_Hates()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Likes()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 2
			; INFO/STAGE 12 on DLC04RESceneCT03
			; DESCRIPTION: Player tells Dixie to kill the Ghoul first over the old man. But both will die.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Hates()
			Danse_Neutral()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Neutral()
			Piper_Hates()
			Preston_Hates()
			Strong_Likes()
			Valentine_Hates()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 3
			; INFO/STAGE 13 on DLC04RESceneCT03
			; DESCRIPTION: Player tells Dixie to kill the old man first over the Ghoul. But both will die.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Hates()
			Danse_Dislikes()
			Deacon_Hates()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Hates()
			Preston_Hates()
			Strong_Likes()
			Valentine_Hates()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		else
			debug.trace(self + " WARNING - DLC04RESceneCT03 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC04DialogueHarvey(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC04DialogueHarvey
		if eventID == 1
			; INFO/STAGE 101 on DLC04DialogueHarvey
			; DESCRIPTION: Player chose to kill Harvey through dialogue.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Hates()
			Curie_Hates()
			Danse_Dislikes()
			Deacon_Hates()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Dislikes()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 2
			; INFO/STAGE 102 on DLC04DialogueHarvey
			; DESCRIPTION: Player tells Harvey that they understand why he lures in strangers, because he wants to protect those he cares about.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 3
			; INFO/STAGE 103 on DLC04DialogueHarvey
			; DESCRIPTION: Player tells Harvey they don't want to hear his boring sob story when telling the player why he lures in strangers, because he wants to protect those he cares about.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Dislikes()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		else
			debug.trace(self + " WARNING - DLC04DialogueHarvey got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC04MQ04RaiderAttack(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC04MQ04RaiderAttack
		if eventID == 1
			; INFO/STAGE 101 on DLC04MQ04RaiderAttack
			; DESCRIPTION: Player tried to convince a rival Raider gang leader to join the Nuka-World gangs instead of destroying the player's Raider settlement with a rousing speech. It doesn't work, but the player really tries to sell it.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Neutral()
			MacCready_Dislikes()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 2
			; INFO/STAGE 102 on DLC04MQ04RaiderAttack
			; DESCRIPTION: Player just attacks a rival Raider gang who's threatening to destroy the player's raider outpost, instead of attempt to reason with him

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Neutral()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Neutral()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 3
			; INFO/STAGE 103 on DLC04MQ04RaiderAttack
			; DESCRIPTION: Player attempts to scare off a rival Raider boss who's threatening to destroy the player's raider settlement in the Commonwealth

			;BASE GAME COMPANIONS: 
			Cait_Likes()
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

			;DLC04 COMPANIONS: 
			Gage_Likes()

		else
			debug.trace(self + " WARNING - DLC04MQ04RaiderAttack got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC04MQ04(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC04MQ04
		if eventID == 2
			; INFO/STAGE 20 on DLC04MQ04
			; DESCRIPTION: Player agreed to start running raids on the Commonwealth.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Neutral()
			Piper_Hates()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Hates()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Loves()

		elseif eventID == 3
			; INFO/STAGE 31 on DLC04MQ04
			; DESCRIPTION: A rival Raider boss is threatening the player's first raider settlement. They told Shank they'd like to try and talk it out with this rival.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Neutral()
			Deacon_Dislikes()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Dislikes()

			;DLC04 COMPANIONS: 
			Gage_Dislikes()

		elseif eventID == 4
			; INFO/STAGE 32 on DLC04MQ04
			; DESCRIPTION: A rival Raider boss is threatening the player's first raider settlement. They told Shank they're going to brutally murder this rival.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Neutral()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 5
			; INFO/STAGE 33 on DLC04MQ04
			; DESCRIPTION: A rival Raider boss is threatening the player's first raider settlement. The player cracked a joke, suggesting they'll throw an ice cream social for this rival.

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

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 6
			; INFO/STAGE 34 on DLC04MQ04
			; DESCRIPTION: CUT

			;BASE GAME COMPANIONS: 
			Cait__UNSET()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse__UNSET()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready__UNSET()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Neutral()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		else
			debug.trace(self + " WARNING - DLC04MQ04 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC04RaidWipeOut(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC04RaidWipeOut
		if eventID == 1
			; INFO/STAGE 100 on DLC04RaidWipeOut
			; DESCRIPTION: The player has killed everyone at a settlement they elected to attack.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Hates()
			Curie_Hates()
			Danse_Hates()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Dislikes()
			Piper_Hates()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Hates()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		else
			debug.trace(self + " WARNING - DLC04RaidWipeOut got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC04RaidChaseOff(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC04RaidChaseOff
		if eventID == 1
			; INFO/STAGE 30 on DLC04RaidChaseOff
			; DESCRIPTION: The player attempted to intimidate settlers at a settlement into leaving their home so the player can set up a Raider outpost there.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 2
			; INFO/STAGE 101 on DLC04RaidChaseOff
			; DESCRIPTION: The player has successfully chased a group of settlers from their home so the player can set up a Raider outpost there. The player did not bribe these people to leave.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 3
			; INFO/STAGE 102 on DLC04RaidChaseOff
			; DESCRIPTION: The player has successfully removed a group of settlers from their home by bribing them so the player can set up a Raider outpost there.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Dislikes()
			MacCready_Hates()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		else
			debug.trace(self + " WARNING - DLC04RaidChaseOff got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC04RaidSubdue(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC04RaidSubdue
		if eventID == 1
			; INFO/STAGE 100 on DLC04RaidSubdue
			; DESCRIPTION: The player has forced a settlement to start providing provisions and caps to their Raider outposts using violence by beating up and crippling the folks at the location.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Hates()
			Danse_Hates()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Neutral()
			Piper_Hates()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Hates()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Loves()

		else
			debug.trace(self + " WARNING - DLC04RaidSubdue got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC04RaidCoerce(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC04RaidCoerce
		if eventID == 1
			; INFO/STAGE 41 on DLC04RaidCoerce
			; DESCRIPTION: Player used threats of violence to attempt to intimdate a settlement into providing food and caps to their Raider outposts (but did not commit any actual violence just yet).

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 2
			; INFO/STAGE 60 on DLC04RaidCoerce
			; DESCRIPTION: Player chose to beat up a settler using their fists (brawled) in order to try and intimidate them into providing provisions and caps to the player's Raider outposts.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Hates()
			Danse_Hates()
			Deacon_Hates()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 3
			; INFO/STAGE 101 on DLC04RaidCoerce
			; DESCRIPTION: Player successfully convinced a settlement to provide their Raider outposts with provisions and caps without bribing them.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 4
			; INFO/STAGE 102 on DLC04RaidCoerce
			; DESCRIPTION: Player successfully convinced a settlement to provide their Raider outposts with provisions and caps by bribing them.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Dislikes()
			MacCready_Hates()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Dislikes()
			X688_Dislikes()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		else
			debug.trace(self + " WARNING - DLC04RaidCoerce got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC04MS02(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC04MS02
		if eventID == 1
			; INFO/STAGE 200 on DLC04MS02
			; DESCRIPTION: Player agrees to go with a cultist who has promised to help him find true happiness

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Neutral()
			Deacon_Dislikes()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Dislikes()
			X688_Dislikes()

			;DLC04 COMPANIONS: 
			Gage_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 550 on DLC04MS02
			; DESCRIPTION: Player agrees to help cultists capture a spaceship they believe is real, but the player knows is just a carnival ride.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Likes()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 3
			; INFO/STAGE 910 on DLC04MS02
			; DESCRIPTION: Player lets cultists ride the carnival spaceship, reinforcing their beliefs that it's real.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Likes()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Dislikes()

		elseif eventID == 4
			; INFO/STAGE 920 on DLC04MS02
			; DESCRIPTION: Player overloads the ride, murdering all the cultists

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Hates()
			Curie_Dislikes()
			Danse_Hates()
			Deacon_Loves()
			Hancock_Dislikes()
			MacCready_Dislikes()
			Piper_Hates()
			Preston_Hates()
			Strong_Likes()
			Valentine_Hates()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Loves()

		else
			debug.trace(self + " WARNING - DLC04MS02 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC04_RQ_Manager(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC04_RQ_Manager
		if eventID == 1
			; INFO/STAGE 101 on DLC04_RQ_Manager
			; DESCRIPTION: Player kills an innocent civilian because a gang boss needed him dealt with

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
			Strong_Neutral()
			Valentine_Hates()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 2
			; INFO/STAGE 102 on DLC04_RQ_Manager
			; DESCRIPTION: Player kills a Wasteland Raider boss because a gang boss needed him dealt with

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Loves()
			Strong_Likes()
			Valentine_Likes()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Loves()

		elseif eventID == 3
			; INFO/STAGE 103 on DLC04_RQ_Manager
			; DESCRIPTION: Player kills a Gunner boss because a gang boss needed him dealt with

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Likes()
			MacCready_Likes()
			Piper_Likes()
			Preston_Likes()
			Strong_Likes()
			Valentine_Likes()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 4
			; INFO/STAGE 104 on DLC04_RQ_Manager
			; DESCRIPTION: Player kills a Supermutant boss because a gang boss needed him dealt with

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Likes()
			Strong_Likes()
			Valentine_Likes()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 5
			; INFO/STAGE 105 on DLC04_RQ_Manager
			; DESCRIPTION: Player kills a Minuteman boss because a gang boss needed him dealt with

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
			Strong_Likes()
			Valentine_Hates()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 6
			; INFO/STAGE 106 on DLC04_RQ_Manager
			; DESCRIPTION: Player kills a Brotherhood of Steel boss because a gang boss needed him dealt with

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Hates()
			Curie_Hates()
			Danse_Hates()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Hates()
			Strong_Likes()
			Valentine_Neutral()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 7
			; INFO/STAGE 107 on DLC04_RQ_Manager
			; DESCRIPTION: Player kills a Railroad agent boss because a gang boss needed him dealt with

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Hates()
			Curie_Hates()
			Danse_Dislikes()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Neutral()
			Piper_Hates()
			Preston_Hates()
			Strong_Likes()
			Valentine_Hates()
			X688_Loves()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 8
			; INFO/STAGE 108 on DLC04_RQ_Manager
			; DESCRIPTION: Player kills an Institute boss because a gang boss needed him dealt with

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Hates()
			Curie_Hates()
			Danse_Dislikes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Dislikes()
			Strong_Likes()
			Valentine_Neutral()
			X688_Hates()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 11
			; INFO/STAGE 111 on DLC04_RQ_Manager
			; DESCRIPTION: Player enslaves an innocent civilian because a gang boss needed him dealt with

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Dislikes()
			Curie_Hates()
			Danse_Hates()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Neutral()
			Piper_Hates()
			Preston_Hates()
			Strong_Dislikes()
			Valentine_Hates()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 12
			; INFO/STAGE 112 on DLC04_RQ_Manager
			; DESCRIPTION: Player enslaves a Wasteland Raider boss because a gang boss needed him dealt with

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Dislikes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Loves()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Loves()

		elseif eventID == 13
			; INFO/STAGE 113 on DLC04_RQ_Manager
			; DESCRIPTION: Player enslaves a Gunner boss because a gang boss needed him dealt with

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Dislikes()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Likes()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 14
			; INFO/STAGE 114 on DLC04_RQ_Manager
			; DESCRIPTION: Player enslaves a Supermutant boss because a gang boss needed him dealt with

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Dislikes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Likes()
			Strong_Hates()
			Valentine_Neutral()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 15
			; INFO/STAGE 115 on DLC04_RQ_Manager
			; DESCRIPTION: Player enslaves a Minuteman boss because a gang boss needed him dealt with

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Dislikes()
			Curie_Hates()
			Danse_Dislikes()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Neutral()
			Piper_Hates()
			Preston_Hates()
			Strong_Dislikes()
			Valentine_Hates()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 16
			; INFO/STAGE 116 on DLC04_RQ_Manager
			; DESCRIPTION: Player enslaves a Brotherhood of Steel boss because a gang boss needed him dealt with

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Dislikes()
			Curie_Hates()
			Danse_Hates()
			Deacon_Hates()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Hates()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 17
			; INFO/STAGE 117 on DLC04_RQ_Manager
			; DESCRIPTION: Player enslaves a Railroad agent boss because a gang boss needed him dealt with

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Dislikes()
			Curie_Hates()
			Danse_Dislikes()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Neutral()
			Piper_Hates()
			Preston_Hates()
			Strong_Dislikes()
			Valentine_Hates()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 18
			; INFO/STAGE 118 on DLC04_RQ_Manager
			; DESCRIPTION: Player enslaves an Institute boss because a gang boss needed him dealt with

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Dislikes()
			Curie_Hates()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Hates()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		else
			debug.trace(self + " WARNING - DLC04_RQ_Manager got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC04MS01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC04MS01
		if eventID == 1
			; INFO/STAGE 1010 on DLC04MS01
			; DESCRIPTION: Sierra Petrovite, a Nuka-Cola fanatic, asks if the player has heard of her Nuka-Cola Museum. The player lies and says yes he has, in order to make her feel better.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 1011 on DLC04MS01
			; DESCRIPTION: Sierra says she is searching for something, and the player offers to help her out.

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

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 3
			; INFO/STAGE 1012 on DLC04MS01
			; DESCRIPTION: The player is dismissive and indifferent to Sierra's searching efforts, sying "You have fun with that."

			;BASE GAME COMPANIONS: 
			Cait_Likes()
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

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 4
			; INFO/STAGE 1013 on DLC04MS01
			; DESCRIPTION: Upon learning that Sierra is searching for something, the player is sarcastic and mocks her silly-looking sunglasses.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 5
			; INFO/STAGE 1014 on DLC04MS01
			; DESCRIPTION: The player demands to be paid midway through the quest, maybe a bit greedy

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Neutral()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 6
			; INFO/STAGE 1015 on DLC04MS01
			; DESCRIPTION: The player encounters the frozen head of John-Caleb Bradberton, genius inventor of Nuka-Cola. The head is alive, preserved by machines. Bradberton is miserable and the player sympathizes.

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
			Strong_Neutral()
			Valentine_Likes()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Dislikes()

		elseif eventID == 7
			; INFO/STAGE 1016 on DLC04MS01
			; DESCRIPTION: Same as above, but this time the player is insensitive and cold

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
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

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 8
			; INFO/STAGE 1017 on DLC04MS01
			; DESCRIPTION: As above, but now the frozen head asks the player to euthanize him by shutting off power to the life support. The player refuses.

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

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 9
			; INFO/STAGE 1018 on DLC04MS01
			; DESCRIPTION: Same as above, but the player agrees to euthanize Bradberton.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Neutral()
			Danse_Dislikes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Likes()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		else
			debug.trace(self + " WARNING - DLC04MS01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC04MS01Post(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC04MS01Post
		if eventID == 1
			; INFO/STAGE 1010 on DLC04MS01Post
			; DESCRIPTION: Post-quest from the above. The player cuts the power to Bradberton's head and kills him even after agreeing not to do so. This represents a betrayal of Sierra, because she has given the player a reward for NOT killing Bradberton. Player is being a jerk here.

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
			Strong_Likes()
			Valentine_Dislikes()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		else
			debug.trace(self + " WARNING - DLC04MS01Post got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC04DialogueSettlement(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC04DialogueSettlement
		if eventID == 1
			; INFO/STAGE 1010 on DLC04DialogueSettlement
			; DESCRIPTION: Asserting his new status as Overboss, the player makes a threatening remark to the town doctor

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
			Strong_Likes()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 2
			; INFO/STAGE 1011 on DLC04DialogueSettlement
			; DESCRIPTION: The player makes a saracstic remark to the town doctor

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
			Strong_Neutral()
			Valentine_Neutral()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 3
			; INFO/STAGE 1020 on DLC04DialogueSettlement
			; DESCRIPTION: When the town weapon vendor complains, the player threatens violence against him

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
			Strong_Likes()
			Valentine_Dislikes()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 4
			; INFO/STAGE 1030 on DLC04DialogueSettlement
			; DESCRIPTION: The town general supplies vendor says the previous Overboss scared her. The player is reassuring and says he doesn’t plan to be scary.

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
			X688_Dislikes()

			;DLC04 COMPANIONS: 
			Gage_Dislikes()

		elseif eventID == 5
			; INFO/STAGE 1031 on DLC04DialogueSettlement
			; DESCRIPTION: As above, but the playe rinstead tells the vendor that she should be scared of him.

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
			Strong_Likes()
			Valentine_Dislikes()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 6
			; INFO/STAGE 1060 on DLC04DialogueSettlement
			; DESCRIPTION: The town's chems merchant asks if the player is confident in being Overboss and managing the raiders. The player is extremely confident and says the raiders will be eating out of his hand.

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

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 7
			; INFO/STAGE 1061 on DLC04DialogueSettlement
			; DESCRIPTION: Same as above, but the player instead expresses serious doubt in his own ability to be the Overboss.

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

			;DLC04 COMPANIONS: 
			Gage_Dislikes()

		elseif eventID == 8
			; INFO/STAGE 1070 on DLC04DialogueSettlement
			; DESCRIPTION: The town bartender has been allowed by the previous Overboss to take off her shock collar. The player agrees to continue the policy, being nice to her.

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
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Dislikes()

		elseif eventID == 9
			; INFO/STAGE 1071 on DLC04DialogueSettlement
			; DESCRIPTION: Same situation as above, but this time the player demands that the woman put her shock collar on, which is mean-spirited.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Hates()
			Deacon_Hates()
			Hancock_Hates()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Dislikes()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 10
			; INFO/STAGE 1072 on DLC04DialogueSettlement
			; DESCRIPTION: Same as above, but the player this time compliments the vendor for her having guts in refusing to wear her collar.

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
			Strong_Likes()
			Valentine_Likes()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		else
			debug.trace(self + " WARNING - DLC04DialogueSettlement got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC04_KiddieKingdomMain(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC04_KiddieKingdomMain
		if eventID == 1
			; INFO/STAGE 780 on DLC04_KiddieKingdomMain
			; DESCRIPTION: Oswald the Outrageous is an almost insane ghoul who taunts and kills anyone that enters Kiddie Kingdom (and who doesn't leave right away). The player finds Oswald and kills him.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Likes()
			Deacon_Neutral()
			Hancock_Likes()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Likes()
			Strong_Likes()
			Valentine_Neutral()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 2
			; INFO/STAGE 790 on DLC04_KiddieKingdomMain
			; DESCRIPTION: Player convinced Oswald the Outrageous to leave Kiddie Kingdom peacefully

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Dislikes()
			Piper_Likes()
			Preston_Likes()
			Strong_Dislikes()
			Valentine_Likes()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 598 on DLC04_KiddieKingdomMain
			; DESCRIPTION: Player went through a stage show as Oswald's assistant

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Neutral()
			Curie_Likes()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Dislikes()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Dislikes()

		elseif eventID == 4
			; INFO/STAGE 570 on DLC04_KiddieKingdomMain
			; DESCRIPTION: Player did not go through the stage show, but attacked Oswald (who escaped)

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Neutral()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 5
			; INFO/STAGE 10 on DLC04_KiddieKingdomMain
			; DESCRIPTION: Player found and listened to an important holotape (Detective work)

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

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 6
			; INFO/STAGE 585 on DLC04_KiddieKingdomMain
			; DESCRIPTION: Player said they believe in magic

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Dislikes()

			;DLC04 COMPANIONS: 
			Gage_Dislikes()

		elseif eventID == 7
			; INFO/STAGE 586 on DLC04_KiddieKingdomMain
			; DESCRIPTION: Player said magic is a scam

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Neutral()
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

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 8
			; INFO/STAGE 587 on DLC04_KiddieKingdomMain
			; DESCRIPTION: Player said they believe in science, not magic

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Loves()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Likes()
			X688_Loves()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		else
			debug.trace(self + " WARNING - DLC04_KiddieKingdomMain got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC04SafariAdventureQuest(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC04SafariAdventureQuest
		if eventID == 1
			; INFO/STAGE 200 on DLC04SafariAdventureQuest
			; DESCRIPTION: Player killed innocent wild man, Cito

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
			Strong_Likes()
			Valentine_Hates()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 2
			; INFO/STAGE 250 on DLC04SafariAdventureQuest
			; DESCRIPTION: Player killed nonhostile Gorillas, Cito's family

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Likes()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 3
			; INFO/STAGE 176 on DLC04SafariAdventureQuest
			; DESCRIPTION: The player convinced Cito and his family to leave the zone before the Raiders move in for their own safety.

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
			Strong_Dislikes()
			Valentine_Likes()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 4
			; INFO/STAGE 175 on DLC04SafariAdventureQuest
			; DESCRIPTION: The player nonviolently convinced Cito to let the Raiders move into the zone and live side by side. 

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
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

			;DLC04 COMPANIONS: 
			Gage_Neutral()

		elseif eventID == 5
			; INFO/STAGE 196 on DLC04SafariAdventureQuest
			; DESCRIPTION: The player killed a gorilla on accident and asked for Cito's forgiveness

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
			Strong_Dislikes()
			Valentine_Likes()
			X688_Dislikes()

			;DLC04 COMPANIONS: 
			Gage_Dislikes()

		else
			debug.trace(self + " WARNING - DLC04SafariAdventureQuest got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC04MQ05(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC04MQ05
		if eventID == 1
			; INFO/STAGE 26 on DLC04MQ05
			; DESCRIPTION: Player has learned that one of the gangs has turned on the others and taken control of the Power Plant. The leaders of the loyal gangs is speaking with the Player about it. When the leaders ask the Player to hunt down and kill the traitor, the Player responds with "They are as good as dead."

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
			Strong_Likes()
			Valentine_Neutral()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 2
			; INFO/STAGE 27 on DLC04MQ05
			; DESCRIPTION: Player has learned that one of the gangs has turned on the others and taken control of the Power Plant. The leaders of the loyal gangs is speaking with the Player about it. When the leaders ask the Player to hunt down and kill the traitor, the Player responds asking if there's some way to get out of this without killing them.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Neutral()
			Hancock_Dislikes()
			MacCready_Dislikes()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 255 on DLC04MQ05
			; DESCRIPTION: Player has turned on the Power to Nuka-World's Power Plant, securing the Raiders position more firmly at Nuka-World. This is our big ending, the whole park will light up, and it's clear that the gangs are there to stay.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Dislikes()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Dislikes()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Loves()

		else
			debug.trace(self + " WARNING - DLC04MQ05 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC04RaiderKickout(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC04RaiderKickout
		if eventID == 1
			; INFO/STAGE 255 on DLC04RaiderKickout
			; DESCRIPTION: The Player has slain all of the gang leaders at Nuka-World, and essentially alienated himself from the Raiders. This quest tracks the "good path" and wraps up with speaking to the Traders at the hub and telling them they are free. (This is a good antithesis to DLC04MQ05 Stage 255 above)

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Loves()
			Deacon_Loves()
			Hancock_Loves()
			MacCready_Neutral()
			Piper_Loves()
			Preston_Loves()
			Strong_Likes()
			Valentine_Loves()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Hates()

		else
			debug.trace(self + " WARNING - DLC04RaiderKickout got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC04DryRockGulch(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC04DryRockGulch
		if eventID == 1
			; INFO/STAGE 12 on DLC04DryRockGulch
			; DESCRIPTION: Player is talking to the Cowboy Robots. He tells them they're dumb and that he hates robots in general.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Hates()
			Curie_Hates()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Hates()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 2
			; INFO/STAGE 13 on DLC04DryRockGulch
			; DESCRIPTION: Player is talking to the Cowboy Robots. The player is wearing the Silver Shroud outfit and talks as if he/she is the Silver Shroud.

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
			X688_Dislikes()

			;DLC04 COMPANIONS: 
			Gage_Dislikes()

		elseif eventID == 3
			; INFO/STAGE 14 on DLC04DryRockGulch
			; DESCRIPTION: Player is talking to the Cowboy Robots. The player uses his Robotics Expert perk to bypass one of the robot's challenges.

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
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 4
			; INFO/STAGE 15 on DLC04DryRockGulch
			; DESCRIPTION: Player is talking to the Cowboy Robots. The player uses a Cowboy accent and plays along with their wild west act.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Likes()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Likes()
			X688_Dislikes()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 5
			; INFO/STAGE 16 on DLC04DryRockGulch
			; DESCRIPTION: Player is talking to the Cowboy Robots. The player uses his persuasion to trick the robots into letting him skip one of the challenges.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Neutral()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Neutral()
			X688_Neutral()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		elseif eventID == 6
			; INFO/STAGE 17 on DLC04DryRockGulch
			; DESCRIPTION: Player kills one of the Cowboy Robots to get his safe combination.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Dislikes()
			X688_Likes()

			;DLC04 COMPANIONS: 
			Gage_Likes()

		else
			debug.trace(self + " WARNING - DLC04DryRockGulch got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

