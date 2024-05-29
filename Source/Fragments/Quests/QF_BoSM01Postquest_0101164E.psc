;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSM01Postquest_0101164E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Warp the player to Brandis.
Game.GetPlayer().MoveTo(Alias_BoSPaladinBrandisPostquest.GetActorRef())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;This quest starts when both:
; - BoSM01 Brandis has been convinced to rejoin the Brotherhood, then subsequently unloads.
; - The Prydwen has arrived.

;Enable Brandis (Postquest version)
Alias_BoSPaladinBrandisPostquest.GetActorRef().Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
;Transfer the gun to the player.
Game.GetPlayer().AddItem(Alias_BrandisGun.GetReference())

;BoSM01 Postquest is now complete.
SetStage(255)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0255_Item_00
Function Fragment_Stage_0255_Item_00()
;BEGIN CODE
;Set after the Postquest scenes have ended.
;Does NOT stop the quest, which runs indefinately since it has Brandis' dialogue.
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_BoSPaladinBrandisPostquest Auto Const

ReferenceAlias Property Alias_BrandisGun Auto Const
