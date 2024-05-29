;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC02:Fragments:Quests:QF_DLC02WorkshopAttackStarte_01000822 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; Add concrete shipments to the various stores in the Commonwealth
pLLI_Misc_AllComponents.AddForm(pDLC02shipment_Concrete_100, 1, 1)
pLLI_Misc_AllComponents.AddForm(pDLC02shipment_Concrete_200, 1, 1)

;Add Help Files
HelpManualPC.AddForm(DLC02WorkshopTutorialMessageArena)
HelpManualXBox.AddForm(DLC02WorkshopTutorialMessageArena)

HelpManualPC.AddForm(DLC02WorkshopTutorialMessageCages)
HelpManualXBox.AddForm(DLC02WorkshopTutorialMessageCages)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
DLC02WorkshopTutorialMessageCages.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
DLC02WorkshopTutorialMessageArena.Show()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE DLC02:DLC02WorkshopAttackStarterScript
Quest __temp = self as Quest
DLC02:DLC02WorkshopAttackStarterScript kmyQuest = __temp as DLC02:DLC02WorkshopAttackStarterScript
;END AUTOCAST
;BEGIN CODE
Game.AddAchievement(kmyQuest.CagesAchievementID)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property pDLC02shipment_Concrete_100 Auto Const Mandatory
MiscObject Property pDLC02shipment_Concrete_200 Auto Const Mandatory

LeveledItem Property pLLI_Misc_AllComponents Auto Const Mandatory

Message Property DLC02WorkshopTutorialMessageCages Auto Const Mandatory

Message Property DLC02WorkshopTutorialMessageArena Auto Const Mandatory

FormList Property HelpManualPC Auto Const Mandatory

FormList Property HelpManualXBox Auto Const Mandatory
