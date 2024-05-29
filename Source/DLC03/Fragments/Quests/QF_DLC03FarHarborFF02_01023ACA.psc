;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03FarHarborFF02_01023ACA Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(15)

DLC03FarHarborFF02_CorpseEnableMarker.Enable()

; Update master quest
pDLC03FarHarborM02.SetStage(350)
if ( pDLC03FarHarborM03.IsRunning() )
  pDLC03FarHarborM03.SetStage(350)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0120_Item_00
Function Fragment_Stage_0120_Item_00()
;BEGIN CODE
;No longer used

;DLC03FarHarborFF02_PlayerSceneCorpse.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
;Set when the player gets near Howard's corpse

DLC03FarHarborFF02_PlayerSceneCorpse.Start()

;Enable the enable parent marker that allows the player to repair the condensers
DLC03FarHarborFF02_EnableParent.Enable()

SetObjectiveCompleted(15)
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
Game.GetPlayer().RemoveItem(DLC03FogCondenserModule, 1)
DLC03FarHarborFF02_FogCondenser01Ref.PlayAnimation("Stage1")
DLC03FarHarborFF02_RepairCondenser01.BlockActivation(True, True)

;Remove nearby placed fog clouds
Utility.Wait(5)
DLC03FarHarborFF02_Mist1Ref.Disable()
DLC03FarHarborFF02_Mist1bRef.Disable()

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
Game.GetPlayer().RemoveItem(DLC03FogCondenserModule, 1)
DLC03FogCondenser02Ref.PlayAnimation("Stage1")
DLC03FarHarborFF02_RepairCondenser02.BlockActivation(True, True)

;Remove nearby placed fog clouds
Utility.Wait(5)
DLC03FarHarborFF02_Mist2Ref.Disable()
DLC03FarHarborFF02_Mist2bRef.Disable()

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
Game.GetPlayer().RemoveItem(DLC03FogCondenserModule, 1)
DLC03FogCondenser03Ref.PlayAnimation("Stage1")
DLC03FarHarborFF02_RepairCondenser03.BlockActivation(true, true)

;Remove nearby placed fog clouds
Utility.Wait(5)
DLC03FarHarborFF02_Mist3Ref.Disable()
DLC03FarHarborFF02_Mist3bRef.Disable()

;The third and final condenser has been repaired
If GetStageDone(210) == true && GetStageDone(220) == true
  Alias_Activator.GetReference().Activate(Game.GetPlayer())
  SetStage(300)

endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
;Disable the three repair primitives (by enable parent)
DLC03FarHarborFF02_EnableParent.Disable()

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

; Update master quest
pDLC03FarHarborM02.SetStage(375)
if ( pDLC03FarHarborM03.IsRunning() )
  pDLC03FarHarborM03.SetStage(375)
endif

; Keep track of deeds for "Rite of Passage"
pDLC03DialogueFarHarbor.SetStage(720)

CompleteAllObjectives()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
FailAllObjectives()

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

Scene Property DLC03FarHarborFF02_PlayerSceneCorpse Auto Const Mandatory

ObjectReference Property DLC03FarHarborFF02_CorpseEnableMarker Auto Const Mandatory

ReferenceAlias Property Alias_Activator Auto Const Mandatory

ObjectReference Property DLC03FarHarborFF02_RepairCondenser2 Auto Const Mandatory

ObjectReference Property DLC03FarHarborFF02_RepairCondenser1 Auto Const Mandatory

ObjectReference Property DLCC03FarHarborFF02_RepairCondenser3 Auto Const Mandatory

Quest Property pDLC03DialogueFarHarbor Auto Const Mandatory

ObjectReference Property DLC03FogCondenser01Ref Auto Const Mandatory

ObjectReference Property DLC03FarHarborFF02_Mist1Ref Auto Const Mandatory

ObjectReference Property DLC03FarHarborFF02_EnableParent Auto Const Mandatory

ObjectReference Property DLC03FarHarborFF02_RepairCondenser01 Auto Const Mandatory

ObjectReference Property DLC03FarHarborFF02_FogCondenser01Ref Auto Const Mandatory

ObjectReference Property DLC03FarHarborFF02_Mist2Ref Auto Const Mandatory

ObjectReference Property DLC03FogCondenser02Ref Auto Const Mandatory

ObjectReference Property DLC03FarHarborFF02_RepairCondenser02 Auto Const Mandatory

ObjectReference Property DLC03FogCondenser03Ref Auto Const Mandatory

ObjectReference Property DLC03FarHarborFF02_RepairCondenser03 Auto Const Mandatory

Quest Property pDLC03FarHarborM02 Auto Const Mandatory

Quest Property pDLC03FarHarborM03 Auto Const Mandatory

MiscObject Property DLC03FogCondenserModule Auto Const Mandatory

ObjectReference Property DLC03FarHarborFF02_Mist3Ref Auto Const

ObjectReference Property DLC03FarHarborFF02_Mist3bRef Auto Const

ObjectReference Property DLC03FarHarborFF02_Mist2bRef Auto Const

ObjectReference Property DLC03FarHarborFF02_Mist1bRef Auto Const
