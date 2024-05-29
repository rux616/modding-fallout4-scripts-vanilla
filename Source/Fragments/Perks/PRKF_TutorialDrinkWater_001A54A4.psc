;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Perks:PRKF_TutorialDrinkWater_001A54A4 Extends Perk Hidden Const

;BEGIN FRAGMENT Fragment_Entry_00
Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
if MQ102.GetStageDone(10) && !Tutorial.GetStageDone(510)
  Game.GetPlayer().RemovePerk(TutorialDrinkWater)
  Tutorial.SetStage(500)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property Tutorial Auto Const

Perk Property TutorialDrinkWater Auto Const

Quest Property MQ102 Auto Const
