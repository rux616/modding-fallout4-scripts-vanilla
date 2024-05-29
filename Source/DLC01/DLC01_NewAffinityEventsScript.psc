Scriptname DLC01:DLC01_NewAffinityEventsScript extends Quest
{New events in this DLC that companionsin this DLC and companions from base game will respond to}

Group Quests
	;DLC QUESTS GO HERE
	Quest Property DLC01MQ01  Auto Const Mandatory
	Quest Property DLC01MQ02  Auto Const Mandatory
	Quest Property DLC01MQ04  Auto Const Mandatory
	Quest Property DLC01MQ05  Auto Const Mandatory
	Quest Property DLC01DialogueQuest Auto Const Mandatory
	Quest Property DLC01MQPostQuestRadiantAssault01 Auto Const Mandatory
	Quest Property DLC01MQPostQuestRadiantAssault02 Auto Const Mandatory
	Quest Property DLC01MQPostQuestRadiantAssault03_Min Auto Const Mandatory
	Quest Property DLC01MQPostQuestRadiantAssault04_Inst Auto Const Mandatory
	Quest Property DLC01MQPostQuestRadiantAssault05_BOS Auto Const Mandatory

EndGroup

;Group DLCCompanionActors
	;DLC01 doesn't have new companions that respond to affinity events.
;EndGroup

;Group DLCCompanionAffinityKeywords
	;DLC01 doesn't have new companions that respond to affinity events.
;EndGroup

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

		if eventQuest == DLC01MQ01 
			HandleQuestStageBump_DLC01MQ01 (eventQuest, eventID)
		elseif eventQuest == DLC01MQ02 
			HandleQuestStageBump_DLC01MQ02 (eventQuest, eventID)
		elseif eventQuest == DLC01MQ04 
			HandleQuestStageBump_DLC01MQ04 (eventQuest, eventID)
		elseif eventQuest == DLC01MQ05 
			HandleQuestStageBump_DLC01MQ05 (eventQuest, eventID)
		elseif eventQuest == DLC01DialogueQuest
			HandleQuestStageBump_DLC01DialogueQuest(eventQuest, eventID)
		elseif eventQuest == DLC01MQPostQuestRadiantAssault01
			HandleQuestStageBump_DLC01MQPostQuestRadiantAssault01(eventQuest, eventID)
		elseif eventQuest == DLC01MQPostQuestRadiantAssault02
			HandleQuestStageBump_DLC01MQPostQuestRadiantAssault02(eventQuest, eventID)
		elseif eventQuest == DLC01MQPostQuestRadiantAssault03_Min
			HandleQuestStageBump_DLC01MQPostQuestRadiantAssault03_Min(eventQuest, eventID)
		elseif eventQuest == DLC01MQPostQuestRadiantAssault04_Inst
			HandleQuestStageBump_DLC01MQPostQuestRadiantAssault04_Inst(eventQuest, eventID)
		elseif eventQuest == DLC01MQPostQuestRadiantAssault05_BOS
			HandleQuestStageBump_DLC01MQPostQuestRadiantAssault05_BOS(eventQuest, eventID)
		else
			; unhandled quest - but not an error once DLC exists
			debug.trace(self + " CompanionAffinityEvent: WARNING - unhandled quest stage bump " + eventQuest)
		endif
	endif
endEvent



function HandleQuestStageBump_DLC01MQ01 (Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC01MQ01 
		if eventID == 1
			; INFO/STAGE 100 on DLC01MQ01 
			; DESCRIPTION: Player was sympathetic to learn Ada lost her whole caravan, saying "Sorry for your loss."

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
			Strong_Dislikes()
			Valentine_Likes()
			X688_Neutral()

		elseif eventID == 2
			; INFO/STAGE 110 on DLC01MQ01 
			; DESCRIPTION: Player saying Ada "paid the price" when she and her caravan decided to stay in the Commonwealth a little bit longer and everyone but Ada ended up dead.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Neutral()
			MacCready_Dislikes()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Dislikes()
			X688_Likes()

		elseif eventID == 3
			; INFO/STAGE 120 on DLC01MQ01 
			; DESCRIPTION: Player agrees to help Ada on her mission against the Mechanist.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Likes()
			Piper_Likes()
			Preston_Dislikes()
			Strong_Likes()
			Valentine_Likes()
			X688_Neutral()

		elseif eventID == 4
			; INFO/STAGE 130 on DLC01MQ01 
			; DESCRIPTION: Player says this isn't their fight when Ada asks them for help against the Mechanist.

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

		else
			debug.trace(self + " WARNING - DLC01MQ01  got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC01MQ02 (Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC01MQ02 
		if eventID == 1
			; INFO/STAGE 100 on DLC01MQ02 
			; DESCRIPTION: Player is positive about the information Ada has deduced from installing the Mechanist radar beacon on herself.

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

		elseif eventID == 2
			; INFO/STAGE 110 on DLC01MQ02 
			; DESCRIPTION: Player is negative about Ada not being able to find enough information from installing the Mechanist radar beacon on her, calling it "useless".

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
			X688_Neutral()

		else
			debug.trace(self + " WARNING - DLC01MQ02  got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC01MQ04 (Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC01MQ04 
		if eventID == 1
			; INFO/STAGE 102 on DLC01MQ04 
			; DESCRIPTION: Player cracked a joke that "a little lemon juice and steel wool" could fix the Rust Devils (poking fun at a Raider group name)

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Likes()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Loves()
			Hancock_Likes()
			MacCready_Loves()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Neutral()
			X688_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 141 on DLC01MQ04 
			; DESCRIPTION: Player is speaking to Jezebel's head on the machine in the Rust Devil base. After Jez greets asking what player is doing there, Player responds with "Getting ready to crack open your dome to get the Radar Beacon"

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Neutral()
			Curie_Neutral()
			Danse_Neutral()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Dislikes()
			X688_Neutral()

		elseif eventID == 3
			; INFO/STAGE 142 on DLC01MQ04 
			; DESCRIPTION: Jezebel offers to help Player if Player agrees to reciprocate. Player is eager for the help, and heartily agrees.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Dislikes()
			Piper_Likes()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Likes()
			X688_Neutral()

		elseif eventID == 4
			; INFO/STAGE 143 on DLC01MQ04 
			; DESCRIPTION: Jezebel offers to help Player if Player agrees to reciprocate. Instead, Player threatens to take what he needs.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Dislikes()
			X688_Likes()

		elseif eventID == 5
			; INFO/STAGE 182 on DLC01MQ04 
			; DESCRIPTION: Player returned Radar Beacon to Ada. Ada is down on herself for allowing her caravan to get killed, and for making mistakes (making the Player's quest harder). Player says not to worry and is very supportive.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Loves()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Dislikes()
			Valentine_Likes()
			X688_Neutral()

		elseif eventID == 6
			; INFO/STAGE 184 on DLC01MQ04 
			; DESCRIPTION: Player returned Radar Beacon to Ada. Ada is down on herself for allowing her caravan to get killed, and for making mistakes (making the Player's quest harder). Player scolds her and basically says "yeah, quit making mistakes"

			;BASE GAME COMPANIONS: 
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

		elseif eventID == 7
			; INFO/STAGE 186 on DLC01MQ04 
			; DESCRIPTION: Ada still down in the dumps from the above and wishes she could turn off her personality mode in order to forget she cares about all the past mistakes, Player uses Speech Challenge to convince her that her personailty defines for as an individual and not to let it go.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Loves()
			Curie_Loves()
			Danse_Dislikes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Neutral()
			Piper_Likes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Loves()
			X688_Dislikes()

		elseif eventID == 8
			; INFO/STAGE 188 on DLC01MQ04 
			; DESCRIPTION: Ada still down in the dumps from the above and wishes she could turn off her personality mode in order to forget she cares about all the past mistakes, Player uses Speech Challenge to convince her that her personailty helps her think more creatively, so she should keep it.

			;BASE GAME COMPANIONS: 
			Cait_Neutral()
			Codsworth_Loves()
			Curie_Loves()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Likes()
			MacCready_Likes()
			Piper_Likes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Loves()
			X688_Dislikes()

		elseif eventID == 9
			; INFO/STAGE 202 on DLC01MQ04 
			; DESCRIPTION: Jezebel has just explained that she's been doing the Mechanist's bidding - helping the people of the Commonwealth (the logic mistake has not be revealed yet). Player says "I knew there was some good left inside that brain." in a supportive fashion.

			;BASE GAME COMPANIONS: 
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
			X688_Dislikes()

		elseif eventID == 10
			; INFO/STAGE 204 on DLC01MQ04 
			; DESCRIPTION: Jezebel has just explained that she's been doing the Mechanist's bidding - helping the people of the Commonwealth (the logic mistake has not be revealed yet). Player accused Jezebel of lying saying he doesn't believe she'd even help a human.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Neutral()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Likes()
			Valentine_Neutral()
			X688_Neutral()

		elseif eventID == 11
			; INFO/STAGE 206 on DLC01MQ04 
			; DESCRIPTION: Player threatens to turn Jezebel into "brain pate" if she doesn't cooperate. This is after a long discussion about gaining access to Mechanist's Lair.

			;BASE GAME COMPANIONS: 
			Cait_Loves()
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

		else
			debug.trace(self + " WARNING - DLC01MQ04  got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC01MQ05 (Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC01MQ05 
		if eventID == 1
			; INFO/STAGE 100 on DLC01MQ05 
			; DESCRIPTION: Player lowered their weapon on the Mechanist's request so they can talk. Once the Mechanist comes out and entered dialogue, the very first choice the player makes is "You shouldn't have trusted me" and starts combat. All the player knows about the Mechanist is that her robots are destructive and killing people, but in all of their eyebot interactions, the Mechanist always speaks as if she is the hero and the player is the villain.

			;BASE GAME COMPANIONS: 
			Cait_Loves()
			Codsworth_Hates()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Dislikes()
			Valentine_Dislikes()
			X688_Likes()

		elseif eventID == 2
			; INFO/STAGE 110 on DLC01MQ05 
			; DESCRIPTION: Player has opted to continue to speak nicely with the Mechanist after she's left the safety of her room.

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

		elseif eventID == 3
			; INFO/STAGE 130 on DLC01MQ05 
			; DESCRIPTION: Player lets the Mechanist live. Mechanist is a good person, who genuinely wanted to help, but due to her reclusive nature, she wasn't aware that her robots were acting out on their own.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Loves()
			Curie_Loves()
			Danse_Likes()
			Deacon_Loves()
			Hancock_Likes()
			MacCready_Likes()
			Piper_Loves()
			Preston_Loves()
			Strong_Dislikes()
			Valentine_Loves()
			X688_Dislikes()

		elseif eventID == 4
			; INFO/STAGE 140 on DLC01MQ05 
			; DESCRIPTION: Player has opted to kill the Mechanist. Player may or may not have known at this point that the Mechanist was really a good person. They will be able to find this out if they search the area for terminals.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Hates()
			Curie_Dislikes()
			Danse_Neutral()
			Deacon_Neutral()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Neutral()
			Preston_Neutral()
			Strong_Loves()
			Valentine_Neutral()
			X688_Likes()

		elseif eventID == 5
			; INFO/STAGE 120 on DLC01MQ05 
			; DESCRIPTION: Player has chosen to be rude to the Mechanist two times in a row.

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
			X688_Neutral()

		else
			debug.trace(self + " WARNING - DLC01MQ05  got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC01DialogueQuest(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC01DialogueQuest
		if eventID == 1
			; INFO/STAGE 11 on DLC01DialogueQuest
			; DESCRIPTION: Player is saying thank you for the Mechanist suit Isabel just gave them.

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
			Strong_Neutral()
			Valentine_Likes()
			X688_Neutral()

		elseif eventID == 2
			; INFO/STAGE 12 on DLC01DialogueQuest
			; DESCRIPTION: Player is being mean, telling Isabel to "get lost" when she wants to talk to them once they've gotten her to stand down and taken control of her lair.

			;BASE GAME COMPANIONS: 
			Cait_Likes()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Dislikes()
			Preston_Neutral()
			Strong_Neutral()
			Valentine_Dislikes()
			X688_Neutral()

		elseif eventID == 3
			; INFO/STAGE 60 on DLC01DialogueQuest
			; DESCRIPTION: Player is being nice to isabel, trying to get her to say more about herself post quest. "You never know until you tell me."

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

		elseif eventID == 4
			; INFO/STAGE 70 on DLC01DialogueQuest
			; DESCRIPTION: Player is being uncaring… Isabel is reflecting on how she could have made a difference for the better and the player is saying they don’t have time for this.

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
			X688_Loves()

		elseif eventID == 5
			; INFO/STAGE 80 on DLC01DialogueQuest
			; DESCRIPTION: Player is being nice to Isabel post quest, telling her, at least she tried to do some good, even if it backfired.

			;BASE GAME COMPANIONS: 
			Cait_Dislikes()
			Codsworth_Likes()
			Curie_Likes()
			Danse_Likes()
			Deacon_Likes()
			Hancock_Neutral()
			MacCready_Dislikes()
			Piper_Likes()
			Preston_Likes()
			Strong_Neutral()
			Valentine_Likes()
			X688_Dislikes()

		elseif eventID == 6
			; INFO/STAGE 90 on DLC01DialogueQuest
			; DESCRIPTION: Player is being mean to Isabel, saying she's only created a symbol of terror and sarcastically telling her "way to go."

			;BASE GAME COMPANIONS: 
			Cait_Loves()
			Codsworth_Dislikes()
			Curie_Dislikes()
			Danse_Dislikes()
			Deacon_Dislikes()
			Hancock_Neutral()
			MacCready_Likes()
			Piper_Dislikes()
			Preston_Dislikes()
			Strong_Neutral()
			Valentine_Dislikes()
			X688_Neutral()

		else
			debug.trace(self + " WARNING - DLC01DialogueQuest got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC01MQPostQuestRadiantAssault01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC01MQPostQuestRadiantAssault01
		if eventID == 1
			; INFO/STAGE  on DLC01MQPostQuestRadiantAssault01
			; DESCRIPTION: Player asked Isabel/Ada to locate rogue robots to stop them from attacking more people.

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

		elseif eventID == 2
			; INFO/STAGE  on DLC01MQPostQuestRadiantAssault01
			; DESCRIPTION: 

			;BASE GAME COMPANIONS: 
			Cait__UNSET()
			Codsworth__UNSET()
			Curie__UNSET()
			Danse__UNSET()
			Deacon__UNSET()
			Hancock__UNSET()
			MacCready__UNSET()
			Piper__UNSET()
			Preston__UNSET()
			Strong__UNSET()
			Valentine__UNSET()
			X688__UNSET()

		elseif eventID == 3
			; INFO/STAGE  on DLC01MQPostQuestRadiantAssault01
			; DESCRIPTION: 

			;BASE GAME COMPANIONS: 
			Cait__UNSET()
			Codsworth__UNSET()
			Curie__UNSET()
			Danse__UNSET()
			Deacon__UNSET()
			Hancock__UNSET()
			MacCready__UNSET()
			Piper__UNSET()
			Preston__UNSET()
			Strong__UNSET()
			Valentine__UNSET()
			X688__UNSET()

		else
			debug.trace(self + " WARNING - DLC01MQPostQuestRadiantAssault01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC01MQPostQuestRadiantAssault02(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC01MQPostQuestRadiantAssault02
		if eventID == 1
			; INFO/STAGE  on DLC01MQPostQuestRadiantAssault02
			; DESCRIPTION: Player asked Isabel/Ada to locate rogue robots to stop them from attacking more people.

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

		elseif eventID == 2
			; INFO/STAGE  on DLC01MQPostQuestRadiantAssault02
			; DESCRIPTION: 

			;BASE GAME COMPANIONS: 
			Cait__UNSET()
			Codsworth__UNSET()
			Curie__UNSET()
			Danse__UNSET()
			Deacon__UNSET()
			Hancock__UNSET()
			MacCready__UNSET()
			Piper__UNSET()
			Preston__UNSET()
			Strong__UNSET()
			Valentine__UNSET()
			X688__UNSET()

		elseif eventID == 3
			; INFO/STAGE  on DLC01MQPostQuestRadiantAssault02
			; DESCRIPTION: 

			;BASE GAME COMPANIONS: 
			Cait__UNSET()
			Codsworth__UNSET()
			Curie__UNSET()
			Danse__UNSET()
			Deacon__UNSET()
			Hancock__UNSET()
			MacCready__UNSET()
			Piper__UNSET()
			Preston__UNSET()
			Strong__UNSET()
			Valentine__UNSET()
			X688__UNSET()

		else
			debug.trace(self + " WARNING - DLC01MQPostQuestRadiantAssault02 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC01MQPostQuestRadiantAssault03_Min(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC01MQPostQuestRadiantAssault03_Min
		if eventID == 1
			; INFO/STAGE  on DLC01MQPostQuestRadiantAssault03_Min
			; DESCRIPTION: Player asked Isabel/Ada to locate rogue robots to stop them from attacking more people.

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

		elseif eventID == 2
			; INFO/STAGE  on DLC01MQPostQuestRadiantAssault03_Min
			; DESCRIPTION: 

			;BASE GAME COMPANIONS: 
			Cait__UNSET()
			Codsworth__UNSET()
			Curie__UNSET()
			Danse__UNSET()
			Deacon__UNSET()
			Hancock__UNSET()
			MacCready__UNSET()
			Piper__UNSET()
			Preston__UNSET()
			Strong__UNSET()
			Valentine__UNSET()
			X688__UNSET()

		elseif eventID == 3
			; INFO/STAGE  on DLC01MQPostQuestRadiantAssault03_Min
			; DESCRIPTION: 

			;BASE GAME COMPANIONS: 
			Cait__UNSET()
			Codsworth__UNSET()
			Curie__UNSET()
			Danse__UNSET()
			Deacon__UNSET()
			Hancock__UNSET()
			MacCready__UNSET()
			Piper__UNSET()
			Preston__UNSET()
			Strong__UNSET()
			Valentine__UNSET()
			X688__UNSET()

		else
			debug.trace(self + " WARNING - DLC01MQPostQuestRadiantAssault03_Min got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC01MQPostQuestRadiantAssault04_Inst(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC01MQPostQuestRadiantAssault04_Inst
		if eventID == 1
			; INFO/STAGE  on DLC01MQPostQuestRadiantAssault04_Inst
			; DESCRIPTION: Player asked Isabel/Ada to locate rogue robots to stop them from attacking more people.

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

		elseif eventID == 2
			; INFO/STAGE  on DLC01MQPostQuestRadiantAssault04_Inst
			; DESCRIPTION: 

			;BASE GAME COMPANIONS: 
			Cait__UNSET()
			Codsworth__UNSET()
			Curie__UNSET()
			Danse__UNSET()
			Deacon__UNSET()
			Hancock__UNSET()
			MacCready__UNSET()
			Piper__UNSET()
			Preston__UNSET()
			Strong__UNSET()
			Valentine__UNSET()
			X688__UNSET()

		elseif eventID == 3
			; INFO/STAGE  on DLC01MQPostQuestRadiantAssault04_Inst
			; DESCRIPTION: 

			;BASE GAME COMPANIONS: 
			Cait__UNSET()
			Codsworth__UNSET()
			Curie__UNSET()
			Danse__UNSET()
			Deacon__UNSET()
			Hancock__UNSET()
			MacCready__UNSET()
			Piper__UNSET()
			Preston__UNSET()
			Strong__UNSET()
			Valentine__UNSET()
			X688__UNSET()

		else
			debug.trace(self + " WARNING - DLC01MQPostQuestRadiantAssault04_Inst got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC01MQPostQuestRadiantAssault05_BOS(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC01MQPostQuestRadiantAssault05_BOS
		if eventID == 1
			; INFO/STAGE  on DLC01MQPostQuestRadiantAssault05_BOS
			; DESCRIPTION: Player asked Isabel/Ada to locate rogue robots to stop them from attacking more people.

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

		elseif eventID == 2
			; INFO/STAGE  on DLC01MQPostQuestRadiantAssault05_BOS
			; DESCRIPTION: 

			;BASE GAME COMPANIONS: 
			Cait__UNSET()
			Codsworth__UNSET()
			Curie__UNSET()
			Danse__UNSET()
			Deacon__UNSET()
			Hancock__UNSET()
			MacCready__UNSET()
			Piper__UNSET()
			Preston__UNSET()
			Strong__UNSET()
			Valentine__UNSET()
			X688__UNSET()

		elseif eventID == 3
			; INFO/STAGE  on DLC01MQPostQuestRadiantAssault05_BOS
			; DESCRIPTION: 

			;BASE GAME COMPANIONS: 
			Cait__UNSET()
			Codsworth__UNSET()
			Curie__UNSET()
			Danse__UNSET()
			Deacon__UNSET()
			Hancock__UNSET()
			MacCready__UNSET()
			Piper__UNSET()
			Preston__UNSET()
			Strong__UNSET()
			Valentine__UNSET()
			X688__UNSET()

		else
			debug.trace(self + " WARNING - DLC01MQPostQuestRadiantAssault05_BOS got event from wrong quest " + eventQuest)
		endif
	endif
endFunction





