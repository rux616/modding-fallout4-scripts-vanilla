ScriptName TeleportReferenceAlias extends ReferenceAlias

Spell Property TeleportOutSpell Auto const mandatory
Spell Property TeleportInSpell Auto const mandatory

Actor mySelf

Group OptionalProperties
	bool property requiresActorVar = false Auto
	{if this is true, check the actorvar below}
	ActorValue Property TeleportRefCollOptionalRequired Auto
	{if requiresActorVar is set, this must be set to 1 on the actor}
	ActorValue Property TeleportRefCollOnLoad Auto
	{Defaults to 1, set in script to 0 when it has been loaded once}
EndGroup

Event OnLoad()
    mySelf = Self.GetActorRef()

	;if we require an actor value to be set and that is not set
	if requiresActorVar && mySelf.GetValue(TeleportRefCollOptionalRequired) != 1
		;Then bail out. No teleport FX, just do the normal enabling

	;If we don't require an actor value OR we do and it is set
	else
	    ;teleport an actor with this script on the first time they are enabled
	    if mySelf.Is3dLoaded() && mySelf.GetValue(TeleportRefCollOnLoad) == 1
	        mySelf.SetValue(TeleportRefCollOnLoad, 0)
	        teleportIn()
	    endIf
	endif
EndEvent

function teleportIn()
    mySelf = Self.GetActorRef()
    mySelf.AddSpell(teleportInSpell)
endFunction

function teleportOut()
    mySelf = Self.GetActorRef()
    mySelf.AddSpell(teleportOutSpell)
endFunction
