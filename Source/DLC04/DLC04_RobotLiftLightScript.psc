Scriptname DLC04:DLC04_RobotLiftLightScript extends ObjectReference
{Script for the lights associated with the robot lift. Play animations in response to custom events from the lift.}

Function InitializeLight(DLC04:DLC04_RobotLiftScript lift)
	RegisterForCustomEvent(lift, "Off")
	RegisterForCustomEvent(lift, "Red")
EndFunction

Event DLC04:DLC04_RobotLiftScript.Off(DLC04:DLC04_RobotLiftScript akSender, Var[] akArgs)
	Self.PlayAnimation("Off")
EndEvent

Event DLC04:DLC04_RobotLiftScript.Red(DLC04:DLC04_RobotLiftScript akSender, Var[] akArgs)
	Self.PlayAnimation("Red")
EndEvent