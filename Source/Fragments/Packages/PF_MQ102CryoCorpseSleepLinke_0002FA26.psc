;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname fragments:packages:pf_mq102cryocorpsesleeplinke_0002fa26 Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(Actor akActor)
;BEGIN CODE
akactor.SetRestrained()
akactor.BlockActivation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(Actor akActor)
;BEGIN CODE
;akactor.Kill()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

EffectShader Property CryoCorpseFXS Auto Const

Int Property doOnce Auto Const
