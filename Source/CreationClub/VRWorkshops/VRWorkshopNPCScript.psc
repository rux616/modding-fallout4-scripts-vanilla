Scriptname CreationClub:VRWorkshops:VRWorkshopNPCScript extends Actor Const
{Handles special events, effects, and functions unique to VR Settlers}

Group VisalSoundEffects
	EffectShader Property TeleportInFXS Auto Const Mandatory
	EffectShader Property TeleportOutFXS Auto Const Mandatory
	Sound Property TeleportSound Auto Const Mandatory
EndGroup

Float AnimationDuration = 1.2 Const
Float FadeOutDelay = 2.0 Const

Event OnInit()
	;If the player shoots a settler in VR, they'll be attacked by all settlers in that VR space forever; let's prevent that.
	IgnoreFriendlyHits(True)
EndEvent

Event OnLoad()
	TeleportInFXS.play(self, AnimationDuration)
	TeleportSound.Play(self)
EndEvent

Event OnDeath(Actor akKiller)
	;Make the settler fizzle out of existence instead of having a corpse hanging around.
	;This is to 1. reinforce the idea they are virtual and 2. to avoid generating 30 settlers, killing them all, and looting their bodies.
	Utility.Wait(FadeOutDelay) ;give a delay to avoid any issues with paired animations (i.e. killing with Sandman Perk)
	TeleportOutFXS.play(self, AnimationDuration)
	TeleportSound.Play(self)
	Utility.Wait(AnimationDuration)
	Disable() ;DisableNoWait() crashes the game in certain situations after paired animation kills
EndEvent