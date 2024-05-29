;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Scenes:SF_DLC03MQ06a_MartinsNewAge_0203176C Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
if DLC03MQ06a.IsRunning() && DLC03MQ06a.GetStageDone(45) && !DLC03MQ06a.GetStageDone(50) && Game.GetPlayer().GetDistance(HCTektus.GetRef()) < DLC03MQ06a_TapeDistance.GetValue() && !HCTektus.GetActorRef().IsInCombat()
  DLC03MQ06a.GetStageDone(50)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN CODE
if !DLC03MQ06a.GetStageDone(47)
  DLC03MQ06a.SetStage(47)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property HCTektus Auto Const Mandatory

Quest Property DLC03MQ06a Auto Const Mandatory

GlobalVariable Property DLC03MQ06a_TapeDistance Auto Const Mandatory
