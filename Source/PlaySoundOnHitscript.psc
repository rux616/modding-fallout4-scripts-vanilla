Scriptname PlaySoundOnHitscript extends ObjectReference

import sound

sound Property OBJBuoyAlarm Auto Const
sound Property OBJBuoyActivate Auto Const
sound property FXBulletImpactBuoyBell auto Const

Int[] Property sfxInstances Auto hidden
int CurrentSFXindex = 0

bool Property PlayAnimOnActivate = TRUE Auto
string Property AnimToPlay = "Stage2" Auto

Event OnLoad()
    registerForHitEvent(self)
EndEvent

Event OnHit(ObjectReference akTarget, ObjectReference akAggressor, Form akSource, Projectile akProjectile, bool abPowerAttack, bool abSneakAttack, bool abBashAttack, bool abHitBlocked, string asMaterialName)
	playNewSound(FXBulletImpactBuoyBell)
    registerForHitEvent(self)
    if PlayAnimOnActivate
    	playAnimation("Stage2")
    endif
EndEvent

Event OnActivate(ObjectReference akActionRef)
	if PlayAnimOnActivate
		playAnimation(AnimToPlay)
	else
		playNewSound(FXBulletImpactBuoyBell)
	endif
	; if (akActionRef as actor).isinCombat()
	; 	PlayNewSound(OBJBuoyAlarm)
	; else
	; 	playNewSound(OBJBuoyActivate)
	; endif
EndEvent

Function PlayNewSound(sound SFXtoPlay)
	; stop the "oldest" sound by tracking back one index.
	int SFXtoKill
	if (currentSFXIndex - 1) < 0
		; to avoid passing out-of-range index, 
		SFXtoKill = SFXInstances.Length - 1;
	else
		SFXtoKill = currentSFXIndex - 1
	endif

	if (SFXInstances[SFXtoKill] != 0)
		; commenting this out.  Too few instances to prevent audio clipping and it's better handled in the code, anyway.
		;stopInstance(SFXInstances[SFXtoKill])
	endif

	; play the new sound, storing at the current index slot
	debug.trace("Line 44: currentSFXIndex: "+currentSFXIndex)
	SFXInstances[currentSFXIndex] = SFXtoPlay.play(self)
	; increment index slot
	currentSFXIndex += 1
	debug.trace("Line 48: currentSFXIndex: "+currentSFXIndex)
	if currentSFXIndex >= (SFXInstances.Length)
		currentSFXIndex = 0
		debug.trace("Line 51: currentSFXIndex: "+currentSFXIndex)
		debug.trace("FYI: sfxInstances.Length: "+sfxInstances.Length)
	endif
endFunction
