;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_BoSPrydwen_03_IngramPost_0016437D Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_06_End
Function Fragment_Phase_06_End()
;BEGIN CODE
if BoSPostIngram.GetValue() == 0
BoSFFMaster.SetStage(30)
BoSPostIngram.SetValue(1)
BoSEndgateIngram.SetValue(0)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BoSPostIngram Auto Const

GlobalVariable Property BoSEndgateIngram Auto Const

Book Property BoSPostCoolantNote Auto Const

Quest Property BoSFFMaster Auto Const
