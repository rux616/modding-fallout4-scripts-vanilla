;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Scenes:SF_DLC03MQ06_WindFarmHandlin_01020425 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
;If the player has agreed to help, give them caps
if DLC03MQ06_WindFarmHandling.GetStageDone(22)
  DLC03MQ06_WindFarmHandling.SetStage(35)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC03MQ06_WindFarmHandling Auto Const Mandatory
