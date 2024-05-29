;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DN102_HalluciGenTest1_0100B2EC Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
DN102Lab1Lights.Disable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
DN102Lab1Lights.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_03_Begin
Function Fragment_Phase_03_Begin()
;BEGIN CODE
DN102Lab1Radiation.Enable()
DN102Lab1ExplosionSource.PlaceAtMe(CarExplosion)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DN102Lab1Lights Auto Const

Explosion Property CarExplosion Auto Const

ObjectReference Property DN102Lab1ExplosionSource Auto Const

ObjectReference Property DN102Lab1Radiation Auto Const
