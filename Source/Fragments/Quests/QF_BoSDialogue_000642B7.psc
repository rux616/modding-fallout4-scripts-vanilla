;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSDialogue_000642B7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
BoSPlayerRank.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
BoSPlayerRank.SetValue(2)
BoSVendorKnight.SetValue(0)
BoSPaintJobKnight.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
BoSPlayerRank.SetValue(3)
BoSVendorPaladin.SetValue(0)
BoSPaintJobPaladin.SetValue(1)
CustomItemQuest.SetStage(70)
CustomItemQuest.SetStage(240)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
BoSPlayerRank.SetValue(4)
BoSVendorSentinel.SetValue(0)
BoSPaintJobSentinel.SetValue(1)
CustomItemQuest.SetStage(60)
CustomItemQuest.SetStage(250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
BoSPlayerRank.SetValue(-1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0355_Item_00
Function Fragment_Stage_0355_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BoSPlayerRank Auto Const

GlobalVariable Property BoSVendorKnight Auto Const

GlobalVariable Property BoSVendorPaladin Auto Const

GlobalVariable Property BoSVendorSentinel Auto Const

Quest Property CustomItemQuest Auto Const Mandatory

GlobalVariable Property BoSPaintJobKnight Auto Const

GlobalVariable Property BoSPaintJobPaladin Auto Const

GlobalVariable Property BoSPaintJobSentinel Auto Const
