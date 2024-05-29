;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03CoA_AtomM02_Misc_0104B1B9 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;If player hasn't started The Heretic, throw obj
if !DLC03AtomM02.GetStageDone(100)
  SetObjectiveDisplayed(10)
else
  ;Otherwise, shut down quest
  SetStage(200)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
CompleteAllObjectives()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
FailAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC03CoA_DialogueNucleus Auto Const Mandatory

Quest Property DLC03CoA_FFNucleus03 Auto Const Mandatory

Quest Property DLC03AtomM02 Auto Const Mandatory
