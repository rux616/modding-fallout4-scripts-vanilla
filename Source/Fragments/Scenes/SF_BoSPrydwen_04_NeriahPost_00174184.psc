;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_BoSPrydwen_04_NeriahPost_00174184 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_04_End
Function Fragment_Phase_04_End()
;BEGIN CODE
if BoSPostNeriah.GetValue() == 0
BoSPostNeriah.SetValue(1)
BoSEndgateNeriah.SetValue(0)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BoSPostNeriah Auto Const

GlobalVariable Property BoSEndgateNeriah Auto Const
