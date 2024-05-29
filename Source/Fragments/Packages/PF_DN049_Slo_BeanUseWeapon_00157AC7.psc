;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Packages:PF_DN049_Slo_BeanUseWeapon_00157AC7 Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(Actor akActor)
;BEGIN CODE
;As a failsafe, set Bean hostile even if the
;gas trap didn't trigger for some reason.
DN049.SetStage(649)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DN049 Auto Const
