Scriptname RR101Script extends Quest Conditional

; location properties
Location Property DiamondCityLocation Auto Const
Quest Property FFDiamondCity07 Auto Const
Int Property bChoseSaveSynths Auto Conditional
Int Property bChoseFightInstitute Auto Conditional
Int Property bChoseMySon Auto Conditional

MQ00Script property MQ00 auto const
bool initialized = false

function InitializeQuest()
	if initialized
		return
	endif

	RegisterForCustomEvent(MQ00, "MQFactionKickOut")

	Debug.Trace("RR101Script Intialized")

	initialized = true
endFunction

; handle faction kickout event
Event MQ00Script.MQFactionKickOut(MQ00Script akSender, Var[] akArgs)
	;store off which faction we just got kicked out of
	int kickoutFactionNumber = (akArgs[0] as int)

	Debug.Trace("Received kickout event: " + kickoutFactionNumber)

	if ( kickoutFactionNumber == 3 )     ; 3 is the Railroad
		SetStage(1300)                   ; Fail the quest
	endif

EndEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	; watch for player to change location
	if akSender == Game.GetPlayer()

		; If Piper has done her interview and the player has moved out of Diamond City, then RR101 is queued up to play
		if FFDiamondCity07.GetStageDone(100) && !Game.GetPlayer().IsInLocation(DiamondCityLocation)
			;Debug.Trace("RR101Script: conditions match")
			setStage(50)
		endif

		if akOldLoc == pOldNorthChurchLocation
			Debug.Trace("RR101Script: Left Old North Church")
			pPlayerFaction.SetEnemy(pRailroadFaction, TRUE, TRUE)	
		endif

	endif
EndEvent


Int Property nTourBotWallahID Auto Conditional

Location Property pOldNorthChurchLocation Auto Const Mandatory

Faction Property pPlayerFaction Auto Const Mandatory

Faction Property pRailroadFaction Auto Const Mandatory
