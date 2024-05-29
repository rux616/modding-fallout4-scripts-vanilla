Scriptname MS14PlayerScript extends ReferenceAlias Conditional

Quest Property MS14 Auto Const

ReferenceAlias Property Travis Auto Const

ObjectReference Property TravisBreweryMarker Auto Const

Location Property DiamondCityRadioLocation Auto Const

Int Property OpeningDone Auto Conditional

Scene Property MS14BobrovOpeningScene Auto Conditional

Event OnLocationChange(Location OldLoc, Location NewLoc)

;run opening scene when player enters dugout inn after quest has started
	if OpeningDone == 0
		if NewLoc == DiamondCityDugoutInnLocation
			MS14BobrovOpeningScene.Start()
			OpeningDone=1
		endif
	endif



	if MS14.GetStage() == 70
		if OldLoc == DiamondCityRadioLocation
			Travis.GetReference().MoveTo(TravisBreweryMarker)
			Travis.GetActorReference().EvaluatePackage()
		endif
	endif

	if MS14.GetStage() == 50
		if OldLoc == DiamondCityDugoutInnLocation
			(MS14 as MS14QuestScript).RunKidnapping()
		endif
	endif





EndEvent
Location Property DiamondCityDugoutInnLocation Auto Const
