;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04SafariAdventurePOST_01047DCE Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
PDLC04SafariCitoFaction.SetEnemy(PPlayerFaction, True, True)
alias_CitoAlias.getActorRef().StartCombat(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
if PDLC04SafariGazelleCloningOn.GetValue() == 1
     PDLC04SafariAdventureGazelleEnableMarker.Enable()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property PDLC04SafariAdventureGazelleEnableMarker Auto Const Mandatory

GlobalVariable Property PDLC04SafariGazelleCloningOn Auto Const Mandatory

ReferenceAlias Property Alias_CitoAlias Auto Const Mandatory

Faction Property PDLC04SafariCitoFaction Auto Const Mandatory

RefCollectionAlias Property Alias_Gorillas Auto Const Mandatory

Faction Property pPlayerFaction Auto Const Mandatory
