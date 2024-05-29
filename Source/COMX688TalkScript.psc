Scriptname COMX688TalkScript extends Quest

;properties
location Property InstituteLocation Auto
GlobalVariable Property CompanionX6Disabled Auto Const
GlobalVariable Property CompanionX6TeleportDestination Auto Const
ReferenceAlias Property Alias_X6 Auto
ObjectReference Property CompanionX6HomeMarker Auto Const
ObjectReference Property CompanionX6SurfaceMarker Auto Const Mandatory

;watch for teleport done events and then move X6 to the appropriate place
Event TeleportActorScript.TeleportDone(TeleportActorScript akSender, Var[] akArgs)
	debug.Trace(self + "TeleportActorScript.TeleportDone " + akSender)
	if CompanionX6TeleportDestination.GetValue() == 1
		akSender.MoveTo(CompanionX6HomeMarker)
		debug.Trace(self + "Teleported to Institute " + akSender)
	elseif CompanionX6TeleportDestination.GetValue() > 1
		akSender.MoveTo(CompanionX6SurfaceMarker)
		debug.Trace(self + "Teleported to surface " + akSender)
	endif
EndEvent

;X6 re-enabling is handled in the player alias script

