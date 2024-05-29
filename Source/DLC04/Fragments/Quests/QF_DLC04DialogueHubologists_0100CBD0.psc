;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04DialogueHubologists_0100CBD0 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
DLC04MS02_AHS1_Rads.Cast(game.GetPlayer(), game.GetPlayer())
game.GetPlayer().PlayIdle(IdleExtractionChair)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0021_Item_00
Function Fragment_Stage_0021_Item_00()
;BEGIN CODE
DLC04MS02_AHS2_Rads.Cast(game.GetPlayer(), game.GetPlayer())
game.GetPlayer().PlayIdle(IdleExtractionChair)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0022_Item_00
Function Fragment_Stage_0022_Item_00()
;BEGIN CODE
DLC04MS02_AHS3_Rads.Cast(game.GetPlayer(), game.GetPlayer())
game.GetPlayer().PlayIdle(IdleExtractionChair)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0023_Item_00
Function Fragment_Stage_0023_Item_00()
;BEGIN CODE
DLC04MS02_AHS4_Rads.Cast(game.GetPlayer(), game.GetPlayer())
game.GetPlayer().PlayIdle(IdleExtractionChair)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0024_Item_00
Function Fragment_Stage_0024_Item_00()
;BEGIN CODE
DLC04MS02_AHS5_Rads.Cast(game.GetPlayer(), game.GetPlayer())
game.GetPlayer().PlayIdle(IdleExtractionChair)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
DLC04MS02_AHS6_Rads.Cast(game.GetPlayer(), game.GetPlayer())
game.GetPlayer().PlayIdle(IdleExtractionChair)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0026_Item_00
Function Fragment_Stage_0026_Item_00()
;BEGIN CODE
DLC04MS02_AHS7_Rads.Cast(game.GetPlayer(), game.GetPlayer())
game.GetPlayer().PlayIdle(IdleExtractionChair)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0027_Item_00
Function Fragment_Stage_0027_Item_00()
;BEGIN CODE
DLC04MS02_AHS8_Rads.Cast(game.GetPlayer(), game.GetPlayer())
game.GetPlayer().PlayIdle(IdleExtractionChair)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
game.getplayer().removeitem(caps001,50)
SetObjectiveDisplayed(30, true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0031_Item_00
Function Fragment_Stage_0031_Item_00()
;BEGIN CODE
game.getplayer().removeitem(caps001,100)
SetObjectiveDisplayed(30, true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0032_Item_00
Function Fragment_Stage_0032_Item_00()
;BEGIN CODE
game.getplayer().removeitem(caps001,250)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0033_Item_00
Function Fragment_Stage_0033_Item_00()
;BEGIN CODE
game.getplayer().removeitem(caps001,500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0034_Item_00
Function Fragment_Stage_0034_Item_00()
;BEGIN CODE
game.getplayer().removeitem(caps001,1000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
game.getplayer().removeitem(caps001,2500)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0036_Item_00
Function Fragment_Stage_0036_Item_00()
;BEGIN CODE
game.getplayer().removeitem(caps001,5000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0037_Item_00
Function Fragment_Stage_0037_Item_00()
;BEGIN CODE
game.getplayer().removeitem(caps001,10000)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(30, true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0041_Item_00
Function Fragment_Stage_0041_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(30, true, true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30,true)
DLC04_AHS_Rank.SetValue(1.0)
DLC04MS02_AHS1_Bonus.Cast(game.GetPlayer())
game.GetPlayer().AddItem(DLC04_Clothing_HubologistRobes, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0051_Item_00
Function Fragment_Stage_0051_Item_00()
;BEGIN CODE
SetObjectiveCompleted(30,true)
DLC04_AHS_Rank.SetValue(2.0)
DLC04MS02_AHS2_Bonus.Cast(game.GetPlayer(), game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0052_Item_00
Function Fragment_Stage_0052_Item_00()
;BEGIN CODE
DLC04_AHS_Rank.SetValue(3.0)
DLC04MS02_AHS3_Bonus.Cast(game.GetPlayer(), game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0053_Item_00
Function Fragment_Stage_0053_Item_00()
;BEGIN CODE
DLC04_AHS_Rank.SetValue(4.0)
DLC04MS02_AHS4_Bonus.Cast(game.GetPlayer(), game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0054_Item_00
Function Fragment_Stage_0054_Item_00()
;BEGIN CODE
DLC04_AHS_Rank.SetValue(5.0)
DLC04MS02_AHS5_Bonus.Cast(game.GetPlayer(), game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0055_Item_00
Function Fragment_Stage_0055_Item_00()
;BEGIN CODE
DLC04_AHS_Rank.SetValue(6.0)
DLC04MS02_AHS6_Bonus.Cast(game.GetPlayer(), game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0056_Item_00
Function Fragment_Stage_0056_Item_00()
;BEGIN CODE
DLC04_AHS_Rank.SetValue(7.0)
DLC04MS02_AHS7_Bonus.Cast(game.GetPlayer(), game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0057_Item_00
Function Fragment_Stage_0057_Item_00()
;BEGIN CODE
DLC04_AHS_Rank.SetValue(8.0)
DLC04MS02_AHS8_Bonus.Cast(game.GetPlayer(), game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
SetObjectiveFailed(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
DLC04HubologistFaction.SetEnemy(PlayerFaction)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property Caps001 Auto Const Mandatory

GlobalVariable Property DLC04_AHS_Rank Auto Const Mandatory

SPELL Property DLC04MS02_AHS1_Bonus Auto Const Mandatory
SPELL Property DLC04MS02_AHS2_Bonus Auto Const Mandatory
SPELL Property DLC04MS02_AHS3_Bonus Auto Const Mandatory
SPELL Property DLC04MS02_AHS4_Bonus Auto Const Mandatory
SPELL Property DLC04MS02_AHS5_Bonus Auto Const Mandatory
SPELL Property DLC04MS02_AHS6_Bonus Auto Const Mandatory
SPELL Property DLC04MS02_AHS7_Bonus Auto Const Mandatory
SPELL Property DLC04MS02_AHS8_Bonus Auto Const Mandatory

SPELL Property DLC04MS02_AHS1_Rads Auto Const Mandatory
SPELL Property DLC04MS02_AHS2_Rads Auto Const Mandatory
SPELL Property DLC04MS02_AHS3_Rads Auto Const Mandatory
SPELL Property DLC04MS02_AHS4_Rads Auto Const Mandatory
SPELL Property DLC04MS02_AHS5_Rads Auto Const Mandatory
SPELL Property DLC04MS02_AHS6_Rads Auto Const Mandatory
SPELL Property DLC04MS02_AHS7_Rads Auto Const Mandatory
SPELL Property DLC04MS02_AHS8_Rads Auto Const Mandatory

Idle Property IdleExtractionChair Auto Const Mandatory

Armor Property DLC04_Clothing_HubologistRobes Auto Const Mandatory

Faction Property DLC04HubologistFaction Auto Const Mandatory

Faction Property PlayerFaction Auto Const Mandatory
