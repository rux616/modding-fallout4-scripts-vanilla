;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN154_000254B7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Move to Arlen
Game.GetPlayer().MoveTo(DN154_QuickstartMarker)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
;When the player learns Marlene's name, give it to them as a password.
Game.GetPlayer().AddItem(DN154_AtomatoysHQArlenPassword)

;If the player has learned Marlene's name (15) and Arlen has been killed (253), shut down the quest.
if (GetStageDone(15) && GetStageDone(253))
     SetStage(255)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0033_Item_00
Function Fragment_Stage_0033_Item_00()
;BEGIN CODE
;Give the player the ID from Arlen's inventory.
Alias_Arlen.GetActorRef().RemoveItem(DN154AtomatoysID, 1, False, Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
;Give the player a map marker to Quincy.
QuincyRuinsMapMarkerRef.AddToMap()

;Give the player a map marker to the Atomatoys Factory.
AtomatoysFactoryMapMarkerRef.AddToMap()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
;Display 'Search the Atomatoys Factory for Toy Parts'
SetObjectiveDisplayed(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
;Complete 'Search the Atomatoys Factory for Toy Parts'
SetObjectiveCompleted(40)

;Display 'Return to Arlen Glass', if he's alive and the player accepted the quest.
if (GetStageDone(40) && !GetStageDone(254))
     SetObjectiveDisplayed(80)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
if (!GetStageDone(100))
     ;Player has finished the toy parts segment of the quest.
     SetStage(100)

     ;Remove the Toy Parts from the player's inventory.
     Game.GetPlayer().RemoveItem(Alias_ToyParts.GetReference(), 1)

     ;Complete 'Return to Arlen Glass'
     SetObjectiveCompleted(80)
     CompleteAllObjectives()
     CompleteQuest()

     ;Give XP Reward
     Game.RewardPlayerXP(XPRadiant.GetValueInt())

     ;Give Caps Reward
     if (GetStageDone(32))
         Game.GetPlayer().AddItem(Caps001, 300)
     ElseIf (GetStageDone(31))
         Game.GetPlayer().AddItem(Caps001, 225)
     Else
         Game.GetPlayer().AddItem(Caps001, 150)
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0095_Item_00
Function Fragment_Stage_0095_Item_00()
;BEGIN CODE
if (!GetStageDone(100))
     ;Player has finished the toy parts segment of the quest.
     SetStage(100)

     ;Hide 'Search the Atomatoys Factory for Toy Parts' and 'Return to Arlen Glass'
     SetObjectiveDisplayed(40, False)
     SetObjectiveDisplayed(80, False)

     ;Complete the quest
     CompleteQuest()

     ;Give Caps Reward
     if (GetStageDone(32))
         Game.GetPlayer().AddItem(Caps001, 300)
     ElseIf (GetStageDone(31))
         Game.GetPlayer().AddItem(Caps001, 225)
     Else
         Game.GetPlayer().AddItem(Caps001, 150)
     EndIf
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
;Give the Holotape to Arlen.
Game.GetPlayer().RemoveItem(Alias_HolotapeMarlene.GetReference(), 1, Alias_Arlen.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0238_Item_00
Function Fragment_Stage_0238_Item_00()
;BEGIN CODE
;Give the player their Caps & XP Reward
Game.GetPlayer().AddItem(Caps001, 348)
Game.RewardPlayerXP(XPRadiant.GetValueInt())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0239_Item_00
Function Fragment_Stage_0239_Item_00()
;BEGIN CODE
;Give the player the Buttercup Toy
Game.GetPlayer().AddItem(DN154_ButtercupToy)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0253_Item_00
Function Fragment_Stage_0253_Item_00()
;BEGIN CODE
;If the player hasn't completed the visible quest, fail it.
if (!GetStageDone(100))
     SetStage(254)
EndIf

;If the player has learned Marlene's name (15) and Arlen has been killed (253), shut down the quest.
if (GetStageDone(15) && GetStageDone(253))
     SetStage(255)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0254_Item_00
Function Fragment_Stage_0254_Item_00()
;BEGIN CODE
;Fail any open objectives.
FailAllObjectives()

;Fail the quest (stage flag).
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;Stop the quest.
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property AtomatoysFactoryMapMarkerRef Auto Const

ObjectReference Property AtomatoysCorporateHQMapMarkerRef Auto Const

ReferenceAlias Property Alias_Arlen Auto Const

ReferenceAlias Property Alias_Player Auto Const

ObjectReference Property DN155_ArlenAtFactoryInitial Auto Const

ObjectReference Property DN155_Stage0Marker Auto Const

ReferenceAlias Property Alias_ToyParts Auto Const

Scene Property DN155_Arlen_Initial Auto Const

Scene Property DN155_Arlen_Loopback Auto Const

Scene Property DN155_Arlen_Looping01 Auto Const

Scene Property DN155_Arlen_Looping02 Auto Const

Scene Property DN155_Arlen_Return Auto Const

ReferenceAlias Property Alias_Drifter Auto Const

ReferenceAlias Property Alias_QT_DestroyToyParts Auto Const

MiscObject Property DN155Mines Auto Const

MiscObject Property Wrench01 Auto Const

MiscObject Property Wrench02 Auto Const

MiscObject Property Wrench03 Auto Const

Weapon Property DN155ButtercupMines Auto Const

Weapon Property DN155WilsonMines Auto Const

MiscObject Property DN155ToyParts Auto Const

ObjectReference Property DN155_QuickstartMarker Auto Const

Quest Property DN155QuestMisc Auto Const

Key Property DN154_AtomatoysHQArlenPassword Auto Const

MiscObject Property DN154AtomatoysID Auto Const

MiscObject Property Caps001 Auto Const

ReferenceAlias Property Alias_HolotapeMarlene Auto Const

LeveledItem Property LL_Caps_Reward_Large_and_Change Auto Const
MiscObject Property DN154_ToyButtercup Auto Const

MiscObject Property DN154_ButtercupToy Auto Const

ObjectReference Property DN154_ButtercupInPiecesEnableMarker Auto Const

ObjectReference Property DN154_ButtercupRestoredEnableMarker Auto Const

ObjectReference Property DN154_ButtercupFinishedEnableMarker Auto Const

ObjectReference Property DN154_QuickstartMarker Auto Const

ObjectReference Property QuincyRuinsMapMarkerRef Auto Const

GlobalVariable Property XPRadiant Auto Const
