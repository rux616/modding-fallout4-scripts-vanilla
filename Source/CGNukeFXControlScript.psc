Scriptname CGNukeFXControlScript extends ObjectReference
{This script is for controling the Character-Gen Nuke detonation effects.}

Explosion Property NukeExplosionRef Auto Const
{Explosion form for the nuke.}

ObjectReference Property NukeLocationRef Auto Const
{Heading Marker where the nuke is detonated.}
ObjectReference Property ShockwaveFXRef Auto Const
{Shockwave art for animations.}
ObjectReference Property ElevatorRef Auto Const

imagespaceModifier Property CGNukeImageSpaceLong Auto Const
imagespaceModifier Property WaveHitImod Auto Const
imagespaceModifier Property FadeOutImod Auto Const

sound Property CGNukeFlashSound Auto Const
sound Property CGNukeShockwave Auto Const

SoundCategorySnapshot Property CSChargenNuke  Auto

weather Property NukeWeatherClearFog Auto Const
globalVariable Property TimescaleGlobal Auto 
globalVariable Property TrailerGlobal Auto Const

float StoredTimescale = 20.0

CustomEvent CGShockWaveAnimEvent

function NukeBlast()

	if StoredTimescale != 19.0
		StoredTimescale = TimescaleGlobal.getvalue()
	endif

	TimescaleGlobal.setvalue(19.0)
	weather.ReleaseOverride()

	NukeWeatherClearFog.SetActive(True, True)

	; Set up the Sound Category Snapshot.
	CSChargenNuke.push(1.0)

	;Play Sounds
	int NukeSoundID = CGNukeFlashSound.play(self) 
	RegisterForAnimationEvent(ShockwaveFXRef, "WaveSoundPlay")

	; remove old running version of the imagespace
	CGNukeImageSpaceLong.Remove()

	NukeLocationRef.Placeatme(NukeExplosionRef)
	;;CGNukeImageSpaceLong.Apply()

  	Var[] kargs = new Var[1]
  	kargs[0] = self
	SendCustomEvent("CGShockWaveAnimEvent", kargs)

	ShockwaveFXRef.playAnimation("BeginFXAnimation")
	game.ShakeCamera(none, 0.15, 0.85)
	game.ShakeController(0.15, 0.15, 0.85)
	game.ShakeCamera(none, 0.08, 8.0)
	game.ShakeController(0.08, 0.08, 8.0)
	RegisterForAnimationEvent(ShockwaveFXRef, "CamShakeWeak")
	RegisterForAnimationEvent(ShockwaveFXRef, "WaveHit")

	;;TESTING for the elevator movement.
	If TrailerGlobal.GetValueInt() == 1
		;do nothing
	Else
		ElevatorRef.playAnimation("DelayStage")
	EndIf
EndFunction

Event OnAnimationEvent(ObjectReference akSource, String asEventName)

	if  (asEventName == "WaveSoundPlay")
		UnRegisterForAnimationEvent(ShockwaveFXRef, "WaveSoundPlay")
		int WaveSoundID = CGNukeShockwave.play(self)
    	;;debug.trace("CGNUKE__WeakShake Event?")
	endIf

	if  (asEventName == "CamShakeWeak")
		UnRegisterForAnimationEvent(ShockwaveFXRef, "CamShakeWeak")
    	game.ShakeCamera(none, 0.2, 6.0)
    	game.ShakeController(0.1, 0.1, 6.0)
    	;;debug.trace("CGNUKE__WeakShake Event?")
	endIf

	if  (asEventName == "WaveHit")
		UnRegisterForAnimationEvent(ShockwaveFXRef, "WaveHit")
    	game.ShakeCamera(none, 1.0, 8.0)
    	game.ShakeController(0.85, 0.85, 8.0)
    	WaveHitImod.Apply()
    	FadeOutImod.Apply()
    	starttimer(12.0,1)
    	;;debug.trace("CGNUKE__WaveHit Event?")
	endIf
endEvent

Event OnTimer(int aiTimerID)
	If aiTimerID == 1
    	weather.ReleaseOverride()

;; If we are still in my wacky Timescale Value, then put back the one we had.

    	if TimescaleGlobal.getvalue() == 19.0
    		TimescaleGlobal.setvalue(StoredTimescale)
    	endif
	endif
endEvent

Event OnCellDetach()
	;;clean up some things.
	UnRegisterForAnimationEvent(ShockwaveFXRef, "WaveHit")
	UnRegisterForAnimationEvent(ShockwaveFXRef, "CamShakeWeak")

	weather.ReleaseOverride()

;; If we are still in my wacky Timescale Value, then put back the one we had.
	if TimescaleGlobal.getvalue() == 19.0
		TimescaleGlobal.setvalue(StoredTimescale)
    endif
	;;CGNukeImageSpaceLong.Remove()

	; Remove the Sound Category Snapshot.
	CSChargenNuke.Remove()
endEvent