Scriptname DLC01:DLC01_RobotLiftLightScript extends ObjectReference Hidden
{Script for the lights associated with the robot lift. Play animations in response to custom events from the lift.}

Function InitializeLight(DLC01:DLC01_RobotLiftScript lift)
	RegisterForCustomEvent(lift, "Off")
	RegisterForCustomEvent(lift, "Red")
	;RegisterForCustomEvent(lift, "Yellow")
	;RegisterForCustomEvent(lift, "Green")
EndFunction

Event DLC01:DLC01_RobotLiftScript.Off(DLC01:DLC01_RobotLiftScript akSender, Var[] akArgs)
	Self.PlayAnimation("Off")
EndEvent

Event DLC01:DLC01_RobotLiftScript.Red(DLC01:DLC01_RobotLiftScript akSender, Var[] akArgs)
	Self.PlayAnimation("Red")
EndEvent

;Not currently used, but these work if we want to use them.
;
;Event DLC01:DLC01_RobotLiftScript.Yellow(DLC01:DLC01_RobotLiftScript akSender, Var[] akArgs)
;	Self.PlayAnimation("Yellow")
;EndEvent
;
;Event DLC01:DLC01_RobotLiftScript.Green(DLC01:DLC01_RobotLiftScript akSender, Var[] akArgs)
;	Self.PlayAnimation("Green")
;EndEvent