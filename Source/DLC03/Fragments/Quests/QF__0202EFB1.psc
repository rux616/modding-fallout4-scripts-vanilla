;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF__0202EFB1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;If player hasn't started Trials of Brother Devin, throw obj
if !DLC03CoA_DialogueNucleus.GetStageDone(115) && !DLC03CoA_DialogueNucleus.GetStageDone(114)
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

ActorValue Property Rads Auto Const Mandatory

GlobalVariable Property DLC03_FFNucleus01_RadThreshold Auto Const Mandatory

ReferenceAlias Property Alias_CoARags Auto Const Mandatory

ReferenceAlias Property Alias_SackHood Auto Const Mandatory

GlobalVariable Property DLC03CoA_QuestsCompleted Auto Const Mandatory

Quest Property DLC03CoA_DialogueNucleus Auto Const Mandatory
