;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueCovenant_000890B4 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE DialogueCovenantScript
Quest __temp = self as Quest
DialogueCovenantScript kmyQuest = __temp as DialogueCovenantScript
;END AUTOCAST
;BEGIN CODE
; NOTE: Priority of this quest is set to 41 to be bigger than WorkshopParent

; register quest script for remote events:
kmyQuest.RegisterForRemoteEvent(Game.GetPlayer(), "OnLocationChange")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN CODE
; Make the Workshop owned by the player
(Alias_Workshop.GetRef() as WorkshopScript).SetOwnedByPlayer(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
; The player gets a cool perk
Game.GetPlayer().AddPerk(pMS17WiredReflexesPerk)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
; Dir the player made a deal with Chamber?
;if ( pMS17.GetStageDone(740) )
  ; If you kill her after that - make sure all the factions react appropriately
  Game.GetPlayer().RemoveFromFaction(pCovenantFaction)
  pCovenantHQSecurityFaction.SetEnemy(pPlayerFaction)
  pCovenantFaction.SetEnemy(pPlayerFaction)
;endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Perk Property pMS17WiredReflexesPerk Auto Const

ReferenceAlias Property Alias_Workshop Auto Const

Quest Property pMS17 Auto Const

Faction Property pCovenantFaction Auto Const

Faction Property pPlayerFaction Auto Const

Faction Property pCovenantHQSecurityFaction Auto Const
