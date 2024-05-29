;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_BoSPSRhysPostQuest_00174182 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_04_End
Function Fragment_Phase_04_End()
;BEGIN CODE
if BoSPostRhys.GetValue() == 0
BoSPostRhys.SetValue(1)
BoSEndgateRhys.SetValue(0)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BoSPostRhys Auto Const

GlobalVariable Property BoSEndgateRhys Auto Const
