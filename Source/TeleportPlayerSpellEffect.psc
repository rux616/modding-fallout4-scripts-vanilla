Scriptname TeleportPlayerSpellEffect extends ActiveMagicEffect
{magic effect script that performs Player-specific teleport in/out when spell is put on the Player}

bool property bTeleportIn = true auto Const
{ TRUE = teleport IN when spell starts
  FALSE = teleport OUT when spell starts }


Spell property mySpell auto const mandatory
{ the spell that I am in - so that it can be removed when the teleport sequence is finished }

EffectShader Property TeleportInPlayerFXS Auto const
EffectShader Property TeleportOutPlayerFXS Auto const
Explosion Property TeleportInPlayerFXExplosion Auto const
Explosion Property TeleportOutPlayerFXExplosion Auto const
Idle Property IdleSynthTeleportLandC Auto Const
Idle Property IdleSynthTeleportOut Auto Const
ImageSpaceModifier Property TeleportInPlayerImod Auto Const
ImageSpaceModifier Property TeleportOutPlayerImod Auto Const
VisualEffect Property pCameraAttachTeleportFXE Auto Const
SoundCategorySnapshot Property CSHijackerTeleportPlayer  Auto Const

;sound to play ahead of teleport in explosion
Sound Property pFXTeleportInPrePLAYER Auto Const

Event OnEffectStart(Actor akTarget, Actor akCaster)
	debug.trace(self + " OnEffectStart: " + akTarget)
	if bTeleportIn
		teleportIn(akTarget)
	else
		teleportOut(akTarget)
	endif
endEvent

function teleportOut(Actor actorToTeleport)
	;fade in sound mix change
	;CSHijackerTeleportPlayer.Push(0.8)
	debug.trace(self + " teleportOut: " + actorToTeleport)
     ;Start the magic shader to fade the actor out
    TeleportOutPlayerFXS.play(actorToTeleport, 2)
    ;Place explosion that contains sound and art
    actorToTeleport.PlaceAtME(TeleportOutPlayerFXExplosion)
    ;play 3rd person idle
 ;;   actorToTeleport.PlayIdle(IdleSynthTeleportOut)
;Screen based stuff---------------------------------------
	TeleportOutPlayerImod.Apply()
	utility.wait(0.1)
	pCameraAttachTeleportFXE.Play(actorToTeleport)
    utility.wait(1.8)
	
    ;Set actor alpha
	utility.wait(0.55)

	;fade game out
	Game.FadeOutGame(true, False, 0.0, 0.5, true)

	Utility.Wait(1.0)
	; remove the spell
	actorToTeleport.RemoveSpell(mySpell)
endFunction


function teleportIn(Actor actorToTeleport)
	debug.trace(self + " teleportIn: " + actorToTeleport)
	;Play teleport in pre tail sound
	pFXTeleportInPrePLAYER.play(actorToTeleport)
	;remove sound mix change
	CSHijackerTeleportPlayer.Remove()
	;Play land idle
;;	actorToTeleport.PlayIdle(IdleSynthTeleportLandC)
    ;Start the magic shader to turn the actor invisible and fade them in
    TeleportInPlayerFXS.play(actorToTeleport)
 ;Screen stuff---------------------------------------------------------------------------
 	pCameraAttachTeleportFXE.Stop(actorToTeleport)
     ;IMOD
     TeleportInPlayerImod.Apply()

	Game.FadeOutGame(false, false, 0.0, 0.5)

	utility.wait(1.45)
;character stuff-----------------------------------------------------
    ;Place explosion that contains sound and art
    actorToTeleport.PlaceAtME(TeleportInPlayerFXExplosion)
  ;wait for fx to play a bit
    utility.wait(0.1)
    ;stop fx shader
    TeleportInPlayerFXS.stop(actorToTeleport)
;Housekeeping--------------------------------------------------------------------------------------------
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