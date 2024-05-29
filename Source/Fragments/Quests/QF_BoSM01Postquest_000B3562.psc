;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSM01Postquest_000B3562 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Warp the player to Postquest Brandis.
Game.GetPlayer().MoveTo(Alias_BoSPaladinBrandisPostquest.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;This quest starts when:
; - Brandis has agreed to rejoin the Brotherhood (BoSM01 120), then subsequently unloads (130).
; - The player has turned the quest in to Danse or Kells (BoSM01 200).
; - The Prydwen has arrived. (BoSPrydwenArrived = 1)
; - The player is not currently in the Airport or on the Prydwen (via Change Location event)

;Enable Brandis (Postquest version)
Alias_BoSPaladinBrandisPostquest.GetActorRef().Enable()

;For debug, if Brandis' gun doesn't exist, create it.
if (!CustomItemQuest.GetStageDone(90))
     CustomItemQuest.SetStage(90)
EndIf

;If the player didn't take the gun from Brandis, move it to Postquest Brandis.
if (!BoSM01.GetStageDone(106))
     Alias_BoSPaladinBrandisPostquest.GetReference().AddItem(Alias_BrandisGun.GetReference())
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN CODE
;If this quest is running when the player is kicked out of the Brotherhood, it remains
;open so Brandis can still be used by BoSMarshal for the finale.
SetStage(15)
SetStage(19)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0016_Item_00
Function Fragment_Stage_0016_Item_00()
;BEGIN CODE
;Transfer the gun to the player.
Game.GetPlayer().AddItem(Alias_BrandisGun.GetReference())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;If Brandis is killed, stop the quest. This clears the aliases, preventing the Combat version
;of Brandis from being grabbed by BoSMarshal for the finale.

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_BoSPaladinBrandisPostquest Auto Const

ReferenceAlias Property Alias_BrandisGun Auto Const

Quest Property CustomItemQuest Auto Const Mandatory

Quest Property BoSM01 Auto Const Mandatory
