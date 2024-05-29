Scriptname MS07bPostPlayerChangeLocationScript extends ReferenceAlias

Location Property DmndValentines01 Auto Const

ReferenceAlias Property Nick Auto Const

Quest Property MS07bPostQuest Auto Const

Quest Property MS07a Auto Const

Faction Property CurrentCompanionFaction Auto Const

Event OnLocationChange(Location akOldLoc, Location akNewLoc)

if akNewLoc == DmndValentines01	

	if MS07a.GetStageDone(100) && !MS07a.GetStageDone(200)

	else

		if Nick.GetRef().GetCurrentLocation() == DmndValentines01

				MS07bPostQuest.SetStage(10)

		endif

	endif
endif
EndEvent