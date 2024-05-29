;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03AcadiaM03_0104B1F6 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Alias_HardDrive1.GetReference().Enable()
Alias_HardDrive2.GetReference().Enable()
SetObjectiveDisplayed(200)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Alias_HardDrive1.GetReference().Disable()
if GetStageDone(250)
SetStage(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0250_Item_00
Function Fragment_Stage_0250_Item_00()
;BEGIN CODE
Alias_HardDrive2.GetReference().Disable()
If GetStageDone(200)
SetStage(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(200)
SetObjectiveDisplayed(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03AcadiaM03QuestScript
Quest __temp = self as Quest
DLC03:DLC03AcadiaM03QuestScript kmyQuest = __temp as DLC03:DLC03AcadiaM03QuestScript
;END AUTOCAST
;BEGIN CODE
;remove drives
Game.GetPlayer().RemoveItem(Alias_HardDrive1.GetReference(),1)
Game.GetPlayer().RemoveItem(Alias_HardDrive2.GetReference(),1)
;hand over reward
Game.GetPlayer().AddItem(Caps001, (DLC03AcadiaM03Reward.GetValueInt()))

CompleteAllObjectives()
DLC03AcadiaQuestPointers.SetStage(20)


;start up timer for M04

kmyquest.StartAcadiaM04Timer()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
FailAllObjectives()

if DLC03AcadiaQuestPointers.IsRunning()
DLC03AcadiaQuestPointers.SetStage(500)
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_HardDrive1 Auto Const Mandatory

ReferenceAlias Property Alias_HardDrive2 Auto Const Mandatory

GlobalVariable Property DLC03AcadiaM03Reward Auto Const Mandatory

MiscObject Property Caps001 Auto Const Mandatory

Quest Property DLC03AcadiaQuestPointers Auto Const Mandatory
