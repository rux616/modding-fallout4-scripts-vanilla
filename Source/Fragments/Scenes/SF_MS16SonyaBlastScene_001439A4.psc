;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MS16SonyaBlastScene_001439A4 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_04_Begin
Function Fragment_Phase_04_Begin()
;BEGIN CODE
SonyaBot.getReference().placeatNode("BDexploHelper", pStoneBreakingPulse01explosion)

SonyaBlastTarget.getReference().DamageObject(10)

SonyaBot.GetActorReference().PlaySubGraphAnimation("CharFXBurstA")

SonyaBot.GetReference().MakeRadioReceiver( 98, 1, None, true)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property SonyaBlastTarget Auto Const

ReferenceAlias Property SonyaBot Auto Const

Explosion Property pStoneBreakingPulse01explosion Auto Const
