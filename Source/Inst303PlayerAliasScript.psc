Scriptname Inst303PlayerAliasScript extends ReferenceAlias Conditional

ReferenceAlias Property Allie Auto Const

Location Property InstituteAdvSysLocation Auto Const Mandatory

Location Property InstituteConcourseLocation Auto Const Mandatory

Quest Property Inst303 Auto Const Mandatory



Event OnLocationChange(Location OldLoc, Location NewLoc)

	if Inst303.GetStage() < 30 && InstMassFusion.GetStage() == 300
		if Allie.GetReference().GetCurrentLocation() == InstituteAdvSysLocation
			Allie.GetReference().MoveTo(DirectorateMeetingMarker1)
			Allie.GetActorReference().EvaluatePackage()
		endif
	endif

EndEvent
ObjectReference Property DirectorateMeetingMarker1 Auto Const Mandatory

Quest Property InstMassFusion Auto Const Mandatory
