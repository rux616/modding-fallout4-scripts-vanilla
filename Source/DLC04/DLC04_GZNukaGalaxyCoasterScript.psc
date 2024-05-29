Scriptname DLC04:DLC04_GZNukaGalaxyCoasterScript Extends ObjectReference

DLC04:DLC04GZNukaGalaxyQuestScript property DLC04GZNukaGalaxy Auto Const Mandatory


Event OnLoad()
	RegisterForCoasterAnimEvents()
EndEvent

Event OnAnimationEventUnregistered(ObjectReference akSource, string asEventName)
    RegisterForCoasterAnimEvents()
EndEvent

Function RegisterForCoasterAnimEvents()
	Self.RegisterForAnimationEvent(Game.GetPlayer(), "Stage01")
	Self.RegisterForAnimationEvent(Game.GetPlayer(), "Stage02")
EndFunction

Event OnAnimationEvent(ObjectReference akSource, string asEventName)
	Debug.Trace("Got Anim Event " + akSource)
	if (asEventName == "stage01")
		;Debug.Trace("Attempting to exit.")
    		Self.Activate(Game.GetPlayer())
    		Self.BlockActivation(True)
    		DLC04GZNukaGalaxy.EndCoaster()
    		Utility.Wait(5)
    		Self.PlayAnimationAndWait("Play01", "Done")
    		Self.BlockActivation(False)
	ElseIf (asEventName == "stage02")
		;Debug.Trace("Advancing Coaster Scene.")
		DLC04GZNukaGalaxy.AdvanceCoaster()
	EndIf
EndEvent

Event OnActivate(ObjectReference akActivator)
	if (akActivator == Game.GetPlayer())
		DLC04GZNukaGalaxy.StartCoaster()
	EndIf
EndEvent