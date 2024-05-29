ScriptName TeleportRefCollectionAlias extends RefCollectionAlias

Spell Property TeleportOutSpell Auto const mandatory
Spell Property TeleportInSpell Auto const mandatory

Group OptionalProperties
	bool property requiresActorVar = false Auto
	{if this is true, check the actorvar below}
	ActorValue Property TeleportRefCollOptionalRequired Auto
	{if requiresActorVar is set, this must be set to 1 on the actor}
	ActorValue Property TeleportRefCollOnLoad Auto
	{Defaults to 1, set in script to 0 when it has been loaded once}
EndGroup

Event OnLoad(ObjectReference akSenderRef)
	;if we require an actor value to be set and that is not set
	if requiresActorVar && akSenderRef.GetValue(TeleportRefCollOptionalRequired) != 1
		;Then bail out. No teleport FX, just do the normal enabling

	;If we don't require an actor value OR we do and it is set
	else
	    ;teleport an actor with this script on the first time they are enabled
	    if akSenderRef.Is3dLoaded() && akSenderRef.GetValue(TeleportRefCollOnLoad) == 1
	        akSenderRef.SetValue(TeleportRefCollOnLoad, 0)
	        teleportIn(akSenderRef)
	    endIf
	endif
EndEvent

function teleportIn(ObjectReference akSenderRef)
    Actor akSenderActor = akSenderRef as Actor
    akSenderActor.AddSpell(teleportInSpell)
endFunction

function teleportOut(ObjectReference akSenderRef)
    Actor akSenderActor = akSenderRef as Actor
    akSenderActor.AddSpell(teleportOutSpell)
endFunction

Function TeleportOutAll(bool doNotTeleportDead = false)
	int count = self.GetCount()
	int i = 0
	While i < count
		teleportOut(self.GetAt(i))
		i += 1
	EndWhile
EndFunction