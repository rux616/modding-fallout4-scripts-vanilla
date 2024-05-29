Scriptname CGNukeTreesScript extends ObjectReference const
{This script sets whatever it runs on to register for an event called "CGShockWaveAnimEvent" and then play an animation.}

;;ObjectReference CGNukeControlParent auto const 

Event OnInit()
    RegisterForCustomEvent(GetLinkedRef() as CGNukeFXControlScript, "CGShockWaveAnimEvent")
EndEvent

Event CGNukeFXControlScript.CGShockWaveAnimEvent(CGNukeFXControlScript akSender, var[] args)
	Self.playAnimation("BeginFXAnimation")
	;;We want to stay registered here so we can trigger the nuke again for testing.  We can enable this if needed for final.
	;;UnregisterForCustomEvent(GetLinkedRef() as CGNukeFXControlScript, "CGShockWaveAnimEvent")
EndEvent

Event OnCellDetach()
	UnregisterForCustomEvent(GetLinkedRef() as CGNukeFXControlScript, "CGShockWaveAnimEvent")
EndEvent