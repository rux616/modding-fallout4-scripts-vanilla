;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_BoSPSHaylenPostQuest_0017417D Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_04_End
Function Fragment_Phase_04_End()
;BEGIN CODE
if BoSPostHaylen.GetValue() == 0
BoSPostHaylen.SetValue(1)
BoSEndgateHaylen.SetValue(0)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BoSPostHaylen Auto Const

GlobalVariable Property BoSEndgateHaylen Auto Const
