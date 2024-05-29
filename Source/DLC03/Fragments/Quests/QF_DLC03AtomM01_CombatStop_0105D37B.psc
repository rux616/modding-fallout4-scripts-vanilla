;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03AtomM01_CombatStop_0105D37B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
;Make the player friends with the interior NPC faction and stop combat on folks within
DLC03ChildrenofAtomInteriorFaction.SetAlly(PlayerFaction, true, true)
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03AtomM01CombatStopScript
Quest __temp = self as Quest
DLC03:DLC03AtomM01CombatStopScript kmyQuest = __temp as DLC03:DLC03AtomM01CombatStopScript
;END AUTOCAST
;BEGIN CODE
kmyquest.EndNucleusCombat()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0750_Item_00
Function Fragment_Stage_0750_Item_00()
;BEGIN CODE
;If the stop combat loop hasn't already started
if !GetStageDone(100)
  SetStage(1000)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Faction Property DLC03ChildrenofAtomInteriorFaction Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory
