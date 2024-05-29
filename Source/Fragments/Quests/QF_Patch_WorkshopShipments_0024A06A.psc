;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Patch_WorkshopShipments_0024A06A Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN CODE
; Add new shipments to the various stores in the Commonwealth
pLLI_Misc_AllComponents.AddForm(pShipment_Ceramic_large, 1, 1)
pLLI_Misc_AllComponents.AddForm(pShipment_Copper_large, 1, 1)
pLLI_Misc_AllComponents.AddForm(pShipment_Rubber_large, 1, 1)
pLLI_Misc_AllComponents.AddForm(pShipment_Steel_250, 1, 1)
pLLI_Misc_AllComponents.AddForm(pShipment_Wood_250, 1, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

LeveledItem Property pLLI_Misc_AllComponents Auto Const Mandatory

MiscObject Property pShipment_Rubber_large Auto Const Mandatory

MiscObject Property pShipment_Steel_250 Auto Const Mandatory

MiscObject Property pShipment_Wood_250 Auto Const Mandatory

MiscObject Property pShipment_Ceramic_large Auto Const Mandatory

MiscObject Property pShipment_Copper_large Auto Const Mandatory
