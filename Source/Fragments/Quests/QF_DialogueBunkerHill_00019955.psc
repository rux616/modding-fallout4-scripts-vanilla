;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DialogueBunkerHill_00019955 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE DialogueBunkerHillScript
Quest __temp = self as Quest
DialogueBunkerHillScript kmyQuest = __temp as DialogueBunkerHillScript
;END AUTOCAST
;BEGIN CODE
; Initialize the Bunker Hill caravan quests
kMyQuest.InitializeQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0005_Item_00
Function Fragment_Stage_0005_Item_00()
;BEGIN CODE
; Have you done Battle for Bunker Hill?
if ( !pInst302.GetStageDone(200) )
  p001KesslerIntroScene.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;shutdown the entrance quest
pDialogueBunkerHillEntrance.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
; Make the Workshop owned by the player
(Alias_Workshop.GetRef() as WorkshopScript).SetOwnedByPlayer(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
; set workshop to player ownership
BunkerHillWorkshop.SetOwnedByPlayer(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
;Remove Caps
Game.GetPlayer().RemoveItem(pCaps001, 10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0500_Item_00
Function Fragment_Stage_0500_Item_00()
;BEGIN CODE
; Ambient scene between the Savoldia starts
p002SavoldiRailroadScene_01_Intro.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0505_Item_00
Function Fragment_Stage_0505_Item_00()
;BEGIN CODE
; If you get close to the Savoldis they rope you into the conversation
if ( !GetStageDone(510) )
  p002SavoldiRailroadScene_02_Core.Start()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0510_Item_00
Function Fragment_Stage_0510_Item_00()
;BEGIN CODE
; End the quest that holds their packages
pDialogueBunkerHill_SavoldiTalk.Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0600_Item_00
Function Fragment_Stage_0600_Item_00()
;BEGIN CODE
; Make it so if you murder all of Bunker Hill you can own the workshop
(pBunkerHillWorkshop as Workshopscript).EnableAutomaticPlayerOwnership = 1
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

WorkshopScript Property BunkerHillWorkshop Auto Const

Quest Property pDialogueBunkerHillEntrance Auto Const

ReferenceAlias Property Alias_Workshop Auto Const

Scene Property p002SavoldiRailroadScene_01_Intro Auto Const

Scene Property p002SavoldiRailroadScene_02_Core Auto Const

MiscObject Property pCaps001 Auto Const

Quest Property pDialogueBunkerHill_SavoldiTalk Auto Const

Quest Property pInst302 Auto Const Mandatory

Scene Property p001KesslerIntroScene Auto Const Mandatory

ObjectReference Property pBunkerHillWorkshop Auto Const Mandatory
