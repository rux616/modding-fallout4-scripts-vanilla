Scriptname FXInstNukeFXControlScript extends ObjectReference Const
{This script is for controling the Inst Nuke detonation effects.}

Explosion Property NukeExplosionRef Auto Const
{Explosion form for the nuke.}

ObjectReference Property NukeLocationRef Auto Const
{Heading Marker where the nuke is detonated.}

ObjectReference Property LODEnableMarker Auto Const
{New LOD marker when nuke is detonated.}

ObjectReference Property LODDisableMarker Auto Const
{OLD LOD Marker for when nuke is detonated.}


Activator Property ExtraEffectsObject Auto Const
{We needed an aditional animated object to hold timing for the sounds.}

sound Property CGNukeFlashSound Auto Const
sound Property NukeShockSound Auto Const

;ImageSpaceModifier Property HitImod Auto Const
ImageSpaceModifier Property ShockHitImod Auto Const

function NukeBlast()

	if ExtraEffectsObject
		objectreference NukeRef = self.Placeatme(ExtraEffectsObject)
		if NukeRef.WaitFor3DLoad()
			DoNukeStuff()
		else 
			DoNukeStuff()
		endif
	else
		DoNukeStuff()
	endif

EndFunction

function DoNukeStuff()
	StartTimer(2.15, 1)

	;Play Sounds
	;int NukeSoundID = CGNukeFlashSound.play(self) 

	NukeLocationRef.Placeatme(NukeExplosionRef)

	game.ShakeCamera(none, 0.1, 0.9)
	game.ShakeController(0.1, 0.1, 0.9)
	StartTimer(4.0, 2)
EndFunction



Event OnTimer(int aiTimerID)
	If aiTimerID == 1
		;;HitImod.Apply()
		game.ShakeCamera(none, 0.1, 3.0)
		game.ShakeController(0.1, 0.1, 3.0)
	endif

	If aiTimerID == 2
		;int NukeShockSoundID = NukeShockSound.play(self)
		game.ShakeCamera(none, 0.3, 4.0)
		game.ShakeController(0.3, 0.3, 4.0)
		ShockHitImod.Apply()
		MusSpecialNukeInstitute.Add()
		StartTimer(3.9, 3)
	endif

	If aiTimerID == 3
			LODEnableMarker.enable()
			LODDisableMarker.disable()
			game.ShakeCamera(none, 0.1, 4.0)
			game.ShakeController(0.1, 0.1, 4.0)
	endif
EndEvent
MusicType Property MUSSpecialNukeInstitute Auto Const Mandatory
