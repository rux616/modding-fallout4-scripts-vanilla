Scriptname BoSM02QuestScript Extends Quest Conditional
{Quest script for BoSM02, Duty or Dishonor.}
;
;This script mainly runs a timer that manages the 'Shadow Initiate Clarke' objective, checking
;whether Clarke can 'see' the player and how he reacts to it.

ReferenceAlias property BoSClarke Auto Const Mandatory
{Initiate Clarke's alias on BoSM02.}

Location property BostonAirportRuinsLocation Auto Const Mandatory
{Airport Ruins interior location.}

Scene property BoSM02_ClarkeStage150_Follow0b Auto Const Mandatory
{Scene in which Clarke walks to the beach.}

Scene property BoSM02_ClarkeStage150_Follow0c Auto Const Mandatory
{Interruption scene in which Clarke stops walking to the beach and confronts the player.}

bool property playerSeenByClarke Auto Hidden Conditional
{Is the player currently 'visible' to Clarke? A combination of detection and a range check.}

int property rewardLevel Auto Hidden Conditional
{The player's reward calculation for the quest, based on what they say to Kells. Will be 0-4.}

;Local refs.
Actor Clarke
Actor player


;Called when 'Shadow Initiate Clarke' begins. Starts the timer loop.
Function StartClarkeMonitor()
	Clarke = BoSClarke.GetActorRef()
	player = Game.GetPlayer()
	StartTimer(1)
EndFunction

Event OnTimer(int timerID)
	playerSeenByClarke = False
	if (GetStage() == 155)
		;We're in the first part of the shadow objective. Small radius, interruption scene if the player gets too close.
		if ((player.IsDetectedBy(Clarke)) && (Player.GetDistance(Clarke) < 768))
			playerSeenByClarke = True

			if (BoSM02_ClarkeStage150_Follow0b.IsPlaying())
				BoSM02_ClarkeStage150_Follow0b.Stop()
				BoSM02_ClarkeStage150_Follow0c.Start()
			EndIf
		EndIf
	ElseIf (GetStage() == 159)
		;We're in the second part of the shadow objective. Large radius, interruption scene if the player gets too close.
		if ((player.IsDetectedBy(Clarke)) && (Player.GetDistance(Clarke) < 2000))
			playerSeenByClarke = True

			if (BoSM02_ClarkeStage150_Follow0b.IsPlaying())
				BoSM02_ClarkeStage150_Follow0b.Stop()
				BoSM02_ClarkeStage150_Follow0c.Start()
			EndIf
		EndIf
	ElseIf (GetStage() < 199)
		;We're in the third part of the shadow objective. Has a full dialogue interruption scene.

		;Has Clarke made it inside the airport?
		if (Clarke.IsInLocation(BostonAirportRuinsLocation))
			;Complete the shadow objective.
			;Debug.Trace("Clarke is inside the airport.")
			SetStage(199)
			return
		EndIf

		;Play Clarke's cursing scene if the player gets close to him and the first interruption has already played.
		if ((GetStage() == 190) && (Player.GetDistance(Clarke) < 768))
			;Debug.Trace("Clarke curses")
			SetStage(191)
		EndIf

		;EVP Clarke during and after the forcegreet.
		if ((GetStage() == 175) || (GetStage() == 176))
			Clarke.EvaluatePackage()
		EndIf

		;Trigger Clarke's forcegreet if the player gets too close to him.
		if ((GetStage() == 160) && (player.IsDetectedBy(Clarke)) && (player.GetDistance(Clarke) < 2000))
			;Debug.Trace("Clarke Forcegreet On")
			SetStage(175)
			Clarke.EvaluatePackage()
		EndIf
	EndIf

	;Continue monitoring Clarke until he reaches the airport.
	if (GetStage() < 199)
		StartTimer(1)
	EndIf
EndEvent


;----------------------------------------------------
;Handling for Danse's override in the Airport Ruins.
;----------------------------------------------------

Quest property BoSM02DanseOverrides Auto Const Mandatory

ReferenceAlias property Companion Auto Const Mandatory

ReferenceAlias property BoSM02PaladinDanse Auto Const Mandatory


Function StartDanseOverride()
	if ((Companion.GetActorRef() != None) && (Companion.GetActorRef() != BoSM02PaladinDanse.GetActorRef()))
		BoSM02DanseOverrides.Start()
	EndIf
EndFunction

Function StopDanseOverride()
	BoSM02DanseOverrides.Stop()
EndFunction