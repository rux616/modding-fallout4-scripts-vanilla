Scriptname DLC03:DLC03_PreviousDLCAffinityEventsScript extends Quest
{Previous DLC events that companions in this DLC will respond to}

Group FOCompanionAffinityEventQuest
	CompanionAffinityEventQuestScript Property CompanionAffinity const auto mandatory
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

;PREVIOUS DLC QUESTS
String sDLC01 = "DLCRobot.esm" const

Quest DLC01MQ01 
Quest DLC01MQ02 
Quest DLC01MQ04 
Quest DLC01MQ05 
Quest DLC01DialogueQuest 
Quest DLC01MQPostQuestRadiantAssault01 
Quest DLC01MQPostQuestRadiantAssault02 
Quest DLC01MQPostQuestRadiantAssault03_Min
Quest DLC01MQPostQuestRadiantAssault04_Inst
Quest DLC01MQPostQuestRadiantAssault05_BOS

int iDLC01MQ01 = 0x01000806 const
int iDLC01MQ02 = 0x01000801 const
int iDLC01MQ04 = 0x01002833 const
int iDLC01MQ05 = 0x010010F5 const
int iDLC01DialogueQuest = 0x0100AEDD const
int iDLC01MQPostQuestRadiantAssault01 = 0x01003E8A const
int iDLC01MQPostQuestRadiantAssault02 = 0x0100AF4D const
int iDLC01MQPostQuestRadiantAssault03_Min = 0x0100AF50 const
int iDLC01MQPostQuestRadiantAssault04_Inst = 0x0100AF4C const
int iDLC01MQPostQuestRadiantAssault05_BOS = 0x0100AF51 const

bool bDLC01EventsReady

Event OnQuestInit()
   RegisterForRemoteEvent(Game.GetPlayer(), "OnPlayerLoadGame")
   bDLC01EventsReady = bDLC01EventsReady || CheckForDLCAndProcessVariablesAndRegisterForEvent()
EndEvent

;need this event, in case the player installs the other DLC AFTER installing this one
Event Actor.OnPlayerLoadGame(actor akSource)
    bDLC01EventsReady = bDLC01EventsReady || CheckForDLCAndProcessVariablesAndRegisterForEvent()
EndEvent

bool Function CheckForDLCAndProcessVariablesAndRegisterForEvent()
	if Game.IsPluginInstalled(sDLC01)

		DLC01MQ01 = Game.GetFormFromFile(iDLC01MQ01, sDLC01) as Quest
		DLC01MQ02 = Game.GetFormFromFile(iDLC01MQ02, sDLC01) as Quest
		DLC01MQ04 = Game.GetFormFromFile(iDLC01MQ04, sDLC01) as Quest
		DLC01MQ05 = Game.GetFormFromFile(iDLC01MQ05, sDLC01) as Quest
		DLC01DialogueQuest = Game.GetFormFromFile(iDLC01DialogueQuest, sDLC01) as Quest
		DLC01MQPostQuestRadiantAssault01 = Game.GetFormFromFile(iDLC01MQPostQuestRadiantAssault01, sDLC01) as Quest
		DLC01MQPostQuestRadiantAssault02 = Game.GetFormFromFile(iDLC01MQPostQuestRadiantAssault02, sDLC01) as Quest
		DLC01MQPostQuestRadiantAssault03_Min= Game.GetFormFromFile(iDLC01MQPostQuestRadiantAssault03_Min, sDLC01) as Quest
		DLC01MQPostQuestRadiantAssault04_Inst= Game.GetFormFromFile(iDLC01MQPostQuestRadiantAssault04_Inst, sDLC01) as Quest
		DLC01MQPostQuestRadiantAssault05_BOS= Game.GetFormFromFile(iDLC01MQPostQuestRadiantAssault05_BOS, sDLC01) as Quest

		;register for companion events (no reason to do this if the plugin isn't installed, since other scripts are handling base game and this DLC's events)
		RegisterForCustomEvent(CompanionAffinity, "CompanionAffinityEvent")

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
			HandleQuestStageBump_DLC01MQ01(eventQuest, eventID)
		elseif eventQuest == DLC01MQ02
			HandleQuestStageBump_DLC01MQ02(eventQuest, eventID)
		elseif eventQuest == DLC01MQ04
			HandleQuestStageBump_DLC01MQ04(eventQuest, eventID)
		elseif eventQuest == DLC01MQ05
			HandleQuestStageBump_DLC01MQ05(eventQuest, eventID)
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


function HandleQuestStageBump_DLC01MQ01(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC01MQ01
		if eventID == 1
			; INFO/STAGE 100 on DLC01MQ01
			; DESCRIPTION: Player was sympathetic to learn Ada lost her whole caravan, saying "Sorry for your loss."

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 2
			; INFO/STAGE 110 on DLC01MQ01
			; DESCRIPTION: Player saying Ada "paid the price" when she and her caravan decided to stay in the Commonwealth a little bit longer and everyone but Ada ended up dead.

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 3
			; INFO/STAGE 120 on DLC01MQ01
			; DESCRIPTION: Player agrees to help Ada on her mission against the Mechanist.

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 4
			; INFO/STAGE 130 on DLC01MQ01
			; DESCRIPTION: Player says this isn't their fight when Ada asks them for help against the Mechanist.

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		else
			debug.trace(self + " WARNING - DLC01MQ01 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC01MQ02(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC01MQ02
		if eventID == 1
			; INFO/STAGE 100 on DLC01MQ02
			; DESCRIPTION: Player is positive about the information Ada has deduced from installing the Mechanist radar beacon on herself.

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 2
			; INFO/STAGE 110 on DLC01MQ02
			; DESCRIPTION: Player is negative about Ada not being able to find enough information from installing the Mechanist radar beacon on her, calling it "useless".

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		else
			debug.trace(self + " WARNING - DLC01MQ02 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC01MQ04(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC01MQ04
		if eventID == 1
			; INFO/STAGE 102 on DLC01MQ04
			; DESCRIPTION: Player cracked a joke that "a little lemon juice and steel wool" could fix the Rust Devils (poking fun at a Raider group name)

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 2
			; INFO/STAGE 141 on DLC01MQ04
			; DESCRIPTION: Player is speaking to Jezebel's head on the machine in the Rust Devil base. After Jez greets asking what player is doing there, Player responds with "Getting ready to crack open your dome to get the Radar Beacon"

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 3
			; INFO/STAGE 142 on DLC01MQ04
			; DESCRIPTION: Jezebel offers to help Player if Player agrees to reciprocate. Player is eager for the help, and heartily agrees.

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 4
			; INFO/STAGE 143 on DLC01MQ04
			; DESCRIPTION: Jezebel offers to help Player if Player agrees to reciprocate. Instead, Player threatens to take what he needs.

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 5
			; INFO/STAGE 182 on DLC01MQ04
			; DESCRIPTION: Player returned Radar Beacon to Ada. Ada is down on herself for allowing her caravan to get killed, and for making mistakes (making the Player's quest harder). Player says not to worry and is very supportive.

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 6
			; INFO/STAGE 184 on DLC01MQ04
			; DESCRIPTION: Player returned Radar Beacon to Ada. Ada is down on herself for allowing her caravan to get killed, and for making mistakes (making the Player's quest harder). Player scolds her and basically says "yeah, quit making mistakes"

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 7
			; INFO/STAGE 186 on DLC01MQ04
			; DESCRIPTION: Ada still down in the dumps from the above and wishes she could turn off her personality mode in order to forget she cares about all the past mistakes, Player uses Speech Challenge to convince her that her personailty defines for as an individual and not to let it go.

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 8
			; INFO/STAGE 188 on DLC01MQ04
			; DESCRIPTION: Ada still down in the dumps from the above and wishes she could turn off her personality mode in order to forget she cares about all the past mistakes, Player uses Speech Challenge to convince her that her personailty helps her think more creatively, so she should keep it.

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 9
			; INFO/STAGE 202 on DLC01MQ04
			; DESCRIPTION: Jezebel has just explained that she's been doing the Mechanist's bidding - helping the people of the Commonwealth (the logic mistake has not be revealed yet). Player says "I knew there was some good left inside that brain." in a supportive fashion.

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 10
			; INFO/STAGE 204 on DLC01MQ04
			; DESCRIPTION: Jezebel has just explained that she's been doing the Mechanist's bidding - helping the people of the Commonwealth (the logic mistake has not be revealed yet). Player accused Jezebel of lying saying he doesn't believe she'd even help a human.

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 11
			; INFO/STAGE 206 on DLC01MQ04
			; DESCRIPTION: Player threatens to turn Jezebel into "brain pate" if she doesn't cooperate. This is after a long discussion about gaining access to Mechanist's Lair.

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		else
			debug.trace(self + " WARNING - DLC01MQ04 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC01MQ05(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC01MQ05
		if eventID == 1
			; INFO/STAGE 100 on DLC01MQ05
			; DESCRIPTION: Player lowered their weapon on the Mechanist's request so they can talk. Once the Mechanist comes out and entered dialogue, the very first choice the player makes is "You shouldn't have trusted me" and starts combat. All the player knows about the Mechanist is that her robots are destructive and killing people, but in all of their eyebot interactions, the Mechanist always speaks as if she is the hero and the player is the villain.

			;DLC03 COMPANIONS: 
			LongFellow_Dislikes()

		elseif eventID == 2
			; INFO/STAGE 110 on DLC01MQ05
			; DESCRIPTION: Player has opted to continue to speak nicely with the Mechanist after she's left the safety of her room.

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 3
			; INFO/STAGE 130 on DLC01MQ05
			; DESCRIPTION: Player lets the Mechanist live. Mechanist is a good person, who genuinely wanted to help, but due to her reclusive nature, she wasn't aware that her robots were acting out on their own.

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 4
			; INFO/STAGE 140 on DLC01MQ05
			; DESCRIPTION: Player has opted to kill the Mechanist. Player may or may not have known at this point that the Mechanist was really a good person. They will be able to find this out if they search the area for terminals.

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 5
			; INFO/STAGE 120 on DLC01MQ05
			; DESCRIPTION: Player has chosen to be rude to the Mechanist two times in a row.

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		else
			debug.trace(self + " WARNING - DLC01MQ05 got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

function HandleQuestStageBump_DLC01DialogueQuest(Quest eventQuest, int eventID)
	 ; double-check that this is the right quest
	if eventQuest == DLC01DialogueQuest
		if eventID == 1
			; INFO/STAGE 11 on DLC01DialogueQuest
			; DESCRIPTION: Player is saying thank you for the Mechanist suit Isabel just gave them.

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 2
			; INFO/STAGE 12 on DLC01DialogueQuest
			; DESCRIPTION: Player is being mean, telling Isabel to "get lost" when she wants to talk to them once they've gotten her to stand down and taken control of her lair.

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 3
			; INFO/STAGE 60 on DLC01DialogueQuest
			; DESCRIPTION: Player is being nice to isabel, trying to get her to say more about herself post quest. "You never know until you tell me."

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 4
			; INFO/STAGE 70 on DLC01DialogueQuest
			; DESCRIPTION: Player is being uncaring… Isabel is reflecting on how she could have made a difference for the better and the player is saying they don’t have time for this.

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		elseif eventID == 5
			; INFO/STAGE 80 on DLC01DialogueQuest
			; DESCRIPTION: Player is being nice to Isabel post quest, telling her, at least she tried to do some good, even if it backfired.

			;DLC03 COMPANIONS: 
			LongFellow_Neutral()

		elseif eventID == 6
			; INFO/STAGE 90 on DLC01DialogueQuest
			; DESCRIPTION: Player is being mean to Isabel, saying she's only created a symbol of terror and sarcastically telling her "way to go."

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

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

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

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

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

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

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

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

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

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

			;DLC03 COMPANIONS: 
			LongFellow_Likes()

		else
			debug.trace(self + " WARNING - DLC01MQPostQuestRadiantAssault05_BOS got event from wrong quest " + eventQuest)
		endif
	endif
endFunction

