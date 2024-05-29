;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03PostQuestTreasureDig_0104D2F5 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Unblock stash cover activation (it gets blocked in DLC03MQ00 stage 0)
DLC03PostQuestTreasureDig_Cover.BlockActivation(False)

SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03PostQuestTreasureDigScript
Quest __temp = self as Quest
DLC03:DLC03PostQuestTreasureDigScript kmyQuest = __temp as DLC03:DLC03PostQuestTreasureDigScript
;END AUTOCAST
;BEGIN CODE
;Disable player controls
kmyquest.BlockPlayerControls()

;Begin fade out
Game.FadeOutGame(True, True, 0.0, 2.0, True)

;Play digging sound
Utility.Wait(0.5)
QSTMS07BPlayerGraveExhume2D.Play(Game.GetPlayer())

Utility.Wait(2.5)

;Disable cover, enable chest
KeepsakeStash.Disable()
Utility.Wait(0.5)
(Alias_Chest as DLC03:DLC03PostQuestTreasureChestScript) .AddLegendaryToChest()

Game.FadeOutGame(False, True, 0.0, 2.5)
Utility.Wait(2.5)

;Reenable player controls
kmyquest.UnblockPlayerControls()

;Shut down the quest
SetStage(300)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
CompleteAllObjectives()

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Sound Property QSTMS07BPlayerGraveExhume2D Auto Const Mandatory

ObjectReference Property KeepsakeStash Auto Const Mandatory

ObjectReference Property DLC03PostQuestTreasureDig_Cover Auto Const Mandatory

ReferenceAlias Property Alias_Chest Auto Const Mandatory
