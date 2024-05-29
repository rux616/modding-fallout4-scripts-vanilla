;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03CoA_FFNucleus03_0102B500 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)

;Set appropriate stage in pointer quest
DLC03CoA_QuestPointers.SetStage(525)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;If the player has already gotten the task, update objectives
if GetStageDone(10)
  SetObjectiveCompleted(10)
  SetObjectiveDisplayed(20)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveCompleted(20)
SetObjectiveDisplayed(30)

;Turn on pump handler quest
DLC03CoA_FFNucleus03_PumpHandler.SetStage(10)

;Set appropriate stage in pointer quest
DLC03CoA_QuestPointers.SetStage(525)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_02
Function Fragment_Stage_0040_Item_02()
;BEGIN CODE
Game.GetPlayer().RemoveItem(Alias_Pump.GetRef())

SetObjectiveCompleted(30)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_02
Function Fragment_Stage_0050_Item_02()
;BEGIN CODE
;Update pump handler quest
DLC03CoA_FFNucleus03_PumpHandler.SetStage(40)

;Increment the "CoA Quests Complete" var
DLC03CoA_QuestsCompleted.SetValue(DLC03CoA_QuestsCompleted.GetValue() + 1)

;Set appropriate stage in pointer quest
DLC03CoA_QuestPointers.SetStage(550)

;Set appropriate affinity stage
if DLC03_FFNucleus03_PumpState.GetValue() == 1
  SetStage(52)
elseif DLC03_FFNucleus03_PumpState.GetValue() == 2
  SetStage(51)
endif

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

Quest Property DLC03CoA_FFNucleus03_PumpHandler Auto Const Mandatory

ReferenceAlias Property Alias_pump Auto Const Mandatory

ReferenceAlias Property PumpQuestItemAlias Auto Const Mandatory

GlobalVariable Property DLC03CoA_QuestsCompleted Auto Const Mandatory

Quest Property DLC03CoA_FFNucleus03_Misc Auto Const Mandatory

Quest Property DLC03CoA_QuestPointers Auto Const Mandatory

GlobalVariable Property DLC03_FFNucleus03_PumpState Auto Const Mandatory
