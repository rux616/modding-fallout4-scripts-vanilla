Scriptname DLC03:DLC03NucleusDungeonMovingLaserScript extends ObjectReference Hidden

Float Property StartingPosition = 0.0 const auto
{1 = Start Laser at Bottom, 0 = Start at top.}

Float Property LaserMoveTime = 4.0 const auto

Event OnLoad()
	SetAnimationVariableFloat("fvalue", StartingPosition)
    SetAnimationVariableFloat("fspeed", LaserMoveTime)
    RegisterForAnimationEvent(self, "done")

    MoveLaser()
EndEvent

Function MoveLaser()
	if is3DLoaded()
		if GetAnimationVariableFloat("fvalue") == 0
			SetAnimationVariableFloat("fvalue", 1)
		else
			SetAnimationVariableFloat("fvalue", 0)
		endif
    	PlayAnimation("Play01")
    endif
EndFunction

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
    MoveLaser()
EndEvent