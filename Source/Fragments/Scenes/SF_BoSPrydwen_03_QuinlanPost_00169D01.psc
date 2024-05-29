;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_BoSPrydwen_03_QuinlanPost_00169D01 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_04_End
Function Fragment_Phase_04_End()
;BEGIN CODE
if BoSPostQuinlan.GetValue() == 0
BoSPostQuinlan.SetValue(1)
BoSEndgateQuinlan.SetValue(0)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BoSPostQuinlan Auto Const

GlobalVariable Property BoSEndgateQuinlan Auto Const
