;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_BoSPrydwen_02_CadePost_0016437B Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_06_End
Function Fragment_Phase_06_End()
;BEGIN CODE
if BoSPostCade.GetValue() == 0
BoSPostCade.SetValue(1)
BoSEndgateCade.SetValue(0)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BoSPostCade Auto Const

GlobalVariable Property BoSEndgateCade Auto Const
