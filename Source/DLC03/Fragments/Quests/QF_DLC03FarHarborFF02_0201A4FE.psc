;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03FarHarborFF02_0201A4FE Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
SetObjectiveCompleted(15)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(DLC03FarHarborFF02_PowerModule, 1)
Alias_Condenser1.GetReference().BlockActivation(true, true)

;The third and final condenser has been repaired
If GetStageDone(220) == true && GetStageDone(230) == true
   SetStage(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(DLC03FarHarborFF02_PowerModule, 1)
Alias_Condenser2.GetReference().BlockActivation(true, true)

;The third and final condenser has been repaired
If GetStageDone(210) == true && GetStageDone(230) == true
   SetStage(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0230_Item_00
Function Fragment_Stage_0230_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(DLC03FarHarborFF02_PowerModule, 1)
Alias_Condenser3.GetReference().BlockActivation(true, true)

;The third and final condenser has been repaired
If GetStageDone(210) == true && GetStageDone(220) == true
   SetStage(300)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0400_Item_00
Function Fragment_Stage_0400_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03FarHarborFF02Script
Quest __temp = self as Quest
DLC03:DLC03FarHarborFF02Script kmyQuest = __temp as DLC03:DLC03FarHarborFF02Script
;END AUTOCAST
;BEGIN CODE
Actor PlayerRef = Game.GetPlayer()

;Give reward
If kmyquest.AveryReward == 0
    PlayerREF.AddItem(caps001, 200)
elseIf kmyquest.AveryReward == 1
    PlayerREF.AddItem(caps001, 250)
elseIf kmyquest.AveryReward == 2
    PlayerREF.AddItem(caps001, 300)
elseIf kmyquest.AveryReward == 3
    PlayerREF.AddItem(caps001, 400)
endIf

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_Condenser1 Auto Const Mandatory

MiscObject Property DLC03FarHarborFF02_PowerModule Auto Const Mandatory

ReferenceAlias Property Alias_Condenser2 Auto Const Mandatory

ReferenceAlias Property Alias_Condenser3 Auto Const Mandatory

MiscObject Property Caps001 Auto Const Mandatory
