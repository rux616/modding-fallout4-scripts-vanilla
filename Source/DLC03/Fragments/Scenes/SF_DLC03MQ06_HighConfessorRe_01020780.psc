;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Scenes:SF_DLC03MQ06_HighConfessorRe_01020780 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_04_End
Function Fragment_Phase_04_End()
;BEGIN CODE
;If player has completed FFNuc02 to the High Confessor's liking, grant the right title
;1 = Crusader, 2 = Inquisitor
if DLC03_FFNucleus02_InquistorTitleAvailable.GetValue() == 1
  DLC03CoA_PlayerTitle.SetValue(2)
else
  DLC03CoA_PlayerTitle.SetValue(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC03MQ06 Auto Const Mandatory

GlobalVariable Property DLC03_FFNucleus02_InquistorTitleAvailable Auto Const Mandatory

GlobalVariable Property DLC03CoA_PlayerTitle Auto Const Mandatory
