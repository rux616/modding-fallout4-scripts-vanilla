Scriptname TeleportSpellEffectScript extends ActiveMagicEffect Const
{magic effect script that performs teleport in/out when spell is put on an actor}

bool property bTeleportIn = true auto Const
{ TRUE = teleport IN when spell starts
  FALSE = teleport OUT when spell starts }

Spell property mySpell auto const mandatory
{ the spell that I am in - so that it can be removed when the teleport sequence is finished }

EffectShader Property TeleportInFXS Auto const
EffectShader Property TeleportOutFXS Auto const
Explosion Property TeleportFXExplosion Auto const
Explosion Property TeleportOutFXExplosion Auto const
Idle Property IdleSynthTeleportLandB Auto Const
Idle Property IdleSynthTeleportOut Auto Const
Sound Property UIPipBoyRadioTeleportInterference Auto Const

Event OnEffectStart(Actor akTarget, Actor akCaster)
	debug.trace(self + " OnEffectStart: " + akTarget)
	if bTeleportIn
		teleportIn(akTarget)
	else
		teleportOut(akTarget)
	endif
endEvent

function teleportIn(Actor actorToTeleport)
	debug.trace(self + " teleportIn: " + actorToTeleport)
	;play the interference sound
	If Game.IsPlayerRadioOn()
		UIPipBoyRadioTeleportInterference.Play(Game.GetPlayer())
	EndIf
    ;Start the magic shader to turn the actor invisible and fade them in
    TeleportInFXS.play(actorToTeleport, 1.2)
    ;Place explosion that contains sound and art
    actorToTeleport.PlaceAtME(TeleportFXExplosion)
    ;wait for fx to play a bit
    utility.wait(0.45)
    ;play lading idle
 ;;   actorToTeleport.PlayIdle(IdleSynthTeleportLandB)
    ;Wait for fx to be all done
    utility.wait(1.0)
 

    ; tell anyone interested that I've teleported, if target is teleportActorScript
    TeleportActorScript teleportActor = actorToTeleport as TeleportActorScript
    if teleportActor
		teleportActor.SendCustomEvent("TeleportDone")
	endif

	; remove the spell
	actorToTeleport.RemoveSpell(mySpell)
endFunction

function teleportOut(Actor actorToTeleport)
	debug.trace(self + " teleportOut: " + actorToTeleport)
    ;play lading idle
 ;;   actorToTeleport.PlayIdle(IdleSynthTeleportOut)
    ;Start the magic shader to fade the actor out
    TeleportOutFXS.play(actorToTeleport)
    ;wait for the anim to play a bit
    utility.wait(0.15)
    ;Place explosion that contains sound and art
    actorToTeleport.PlaceAtME(TeleportOutFXExplosion)

    ;Wait for fx to be all done
    utility.wait(1.0)
    ;clean up stuff that doesn't clean itself
    actorToTeleport.disable()

    ; tell anyone interested that I've teleported, if target is teleportActorScript
    TeleportActorScript teleportActor = actorToTeleport as TeleportActorScript
    if teleportActor
		teleportActor.SendCustomEvent("TeleportDone")
	endif

	; remove the spell
	actorToTeleport.RemoveSpell(mySpell)
endFunction

