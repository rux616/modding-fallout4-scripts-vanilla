Scriptname MS04PostQuestScript extends Quest Conditional

bool initialized = false

function InitializeQuest()

	if initialized
		return
	endif

	Debug.Trace("MS04PostQuestScript Intialized")

	initialized = true
endFunction

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)

	Debug.Trace("MS04PostQuestScript caught PC changing location")

	; watch for player to change location
	if akSender == Game.GetPlayer()

		; Check to see if the player's Shroud armor is ready for an upgrade
		if (Game.GetPlayer().GetLevel() >= pMS04ArmorLevel.GetValue() )
			;float fWaitTimer = Utility.RandomFloat(300.0, 1000.0)
			;Utility.Wait(fWaitTimer)
			(pRadioSilverShroudQuest as RadioSilverShroudQuestScript).SongRepeats = 60
			pMS04ShroudRadioTransmitter.Enable()    ; If so, turn on the Silver Shroud radio station
		endif

	endif
EndEvent

GlobalVariable Property pMS04ArmorLevel Auto Const
ObjectReference Property pMS04ShroudRadioTransmitter Auto Const
Quest Property pRadioSilverShroudQuest Auto Const
