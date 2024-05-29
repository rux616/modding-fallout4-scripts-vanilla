;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MS16MelLastBarrier_00147D46 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_03_End
Function Fragment_Phase_03_End()
;BEGIN CODE
game.stopDialogueCamera()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_05_Begin
Function Fragment_Phase_05_Begin()
;BEGIN CODE
lastwallTrigger.disable() 

SonyaBot.getReference().placeatme(StoneBreakingPulse01explosion)

utility.wait(1)

lastwall.DamageObject(10)

SonyaBot.GetReference().MakeRadioReceiver( 98, 1, None, true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property SonyaBot Auto Const

Explosion Property StoneBreakingPulse01explosion Auto Const

ObjectReference Property lastWallTrigger Auto Const



ObjectReference Property lastWall Auto Const
