;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Scenes:SF_DLC03MQ06_HighConfessor_02017948_1 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
;If player has informed High Confessor, end quest
if DLC03MQ06.GetStageDone(510)
  DLC03MQ06.GetStageDone(530)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC03MQ06 Auto Const Mandatory
