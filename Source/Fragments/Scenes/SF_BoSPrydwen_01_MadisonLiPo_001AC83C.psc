;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_BoSPrydwen_01_MadisonLiPo_001AC83C Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_05_Begin
Function Fragment_Phase_05_Begin()
;BEGIN CODE
if BoSPostLi.GetValue() == 0
BoSPostLi.SetValue(1)
BoSEndgateLi.SetValue(0)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BoSPostLi Auto Const

GlobalVariable Property BoSEndgateLi Auto Const
