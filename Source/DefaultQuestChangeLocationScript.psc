Scriptname DefaultQuestChangeLocationScript extends Quest const Default
{set a stage when the player enters or exits a location}

struct ChangeLocationStage
	int StageToSet
	{ the stage to set }

	Location TargetLocation
	{ what location we're looking for }

	LocationAlias TargetLocationAlias
	{ what location alias we're looking for }

	bool setStageOnEnterLocation = true 
	{ 	true = set stage when player enters location 
		false = set stage when player exits location
	}

	Int PrereqStage = -1
	{OPTIONAL: Stage that must be set for this event to fire.}

	Int TurnOffStage = -1
	{OPTIONAL: If the quest stage is equal or greater than TurnOffStage, further events are ignored
	NOTE: this stage does not actually have to be set - any quest stage equal or higher will turn off this script}

endStruct

ChangeLocationStage[] property changeLocationStages auto Const
{ array of stage/location data }

Event OnQuestInit()
	; register for events
	RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
endEvent

Event Actor.OnLocationChange(Actor akSender, Location akOldLoc, Location akNewLoc)
	; watch for player to change location
	if akSender == Game.GetPlayer()
		; check stage array for this location
		int i = 0
		while i < changeLocationStages.Length
			ChangeLocationStage changeLocData = changeLocationStages[i]
			if changeLocData.TargetLocation
				CheckLocation(changeLocData.TargetLocation, changeLocData, akOldLoc, akNewLoc)
			endif

			if changeLocData.TargetLocationAlias
				Location targetLocation = changeLocData.TargetLocationAlias.GetLocation()
				CheckLocation(targetLocation, changeLocData, akOldLoc, akNewLoc)
			endif
			i += 1
		endwhile

	endif
EndEvent

function CheckLocation(Location targetLocation, ChangeLocationStage changeLocData, Location akOldLoc, Location akNewLoc)
	if (targetLocation == akNewLoc && changeLocData.setStageOnEnterLocation) || (targetLocation == akOldLoc && changeLocData.setStageOnEnterLocation == false)
		; valid location - check stages
		if GetStageDone(changeLocData.StageToSet) == false && ( changeLocData.PrereqStage == -1 || GetStageDone(changeLocData.PrereqStage) ) && ( changeLocData.TurnOffStage == -1 || GetStage() < changeLocData.TurnOffStage )
			; passes stage checks
			SetStage(changeLocData.StageToSet)
		endif
	endif
endFunction