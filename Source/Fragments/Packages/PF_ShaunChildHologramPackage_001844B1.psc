;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Packages:PF_ShaunChildHologramPackage_001844B1 Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(Actor akActor)
;BEGIN CODE
akActor.SetRestrained(True)
HologramShaunFXS.Play(akActor)
akActor.SetAlpha(0.25)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

EffectShader Property HologramShaunFXS Auto Const
