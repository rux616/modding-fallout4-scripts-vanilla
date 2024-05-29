;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Min00_001A001C Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
;don't display objectives if we're already inside
If MQ102.GetStageDone(70) == 0
  SetObjectiveDisplayed(60, 1)
EndIf
;don't display objectives if we already have the Laser Musket or are already inside the museum
If MQ102.GetStageDone(62) == 0 && MQ102.GetStageDone(70) == 0
  SetObjectiveDisplayed(70, 1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveCompleted(60)
SetObjectiveSkipped(70)
SetObjectiveDisplayed(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0027_Item_00
Function Fragment_Stage_0027_Item_00()
;BEGIN CODE
SetObjectiveCompleted(60, 1)
SetObjectiveDisplayed(80, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(80, abDisplayed = False)
SetObjectiveDisplayed(85, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0035_Item_00
Function Fragment_Stage_0035_Item_00()
;BEGIN CODE
SetObjectiveCompleted(85, 1)
SetObjectiveDisplayed(80, abForce = True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN CODE
SetObjectiveCompleted(80)
SetObjectiveDisplayed(86)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0045_Item_00
Function Fragment_Stage_0045_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
SetObjectiveCompleted(80, 1)
SetObjectiveCompleted(86, 1)

;check if the player already has the fusion core
If Game.GetPlayer().GetItemCount(AmmoFusionCore) < 1
  SetObjectiveDisplayed(87, 1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0047_Item_00
Function Fragment_Stage_0047_Item_00()
;BEGIN CODE
SetObjectiveCompleted(80, 1)
SetObjectiveCompleted(85, 1)
SetObjectiveCompleted(86, 1)

;check if the player has a minigun already
If Game.GetPlayer().GetItemCount(Minigun) <= 0
  SetObjectiveDisplayed(115, 1)
Else
  SetObjectiveDisplayed(120, 1)
EndIf

;check if the player has a battery
If Game.GetPlayer().GetValue(PowerArmorBattery) < 0
  SetObjectiveDisplayed(90, 1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
SetObjectiveCompleted(87, 1)
SetObjectiveDisplayed(90, 1)  

;check if you already have the Core
If Game.GetPlayer().GetItemCount(AmmoFusionCore) >= 1
  SetObjectiveCompleted(90, 1)
  SetObjectiveDisplayed(105, abForce = True)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
SetObjectiveCompleted(80, 1)
SetObjectiveCompleted(87, 1)
SetObjectiveCompleted(90, 1)
SetObjectiveCompleted(105, 1)
SetObjectiveCompleted(110, 1)
;don't display minigun objective if you have it already 
If MQ102.GetStageDone(115) == 0
  SetObjectiveDisplayed(115, 1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
;grabbed the minigun
SetObjectiveCompleted(115)
SetObjectiveDisplayed(120)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN CODE
;advance quest if Deathclaw is dead
If MQ102.GetStageDone(123) == 1
  MQ102.SetStage(130)
Else
  ;if quest is not being advanced, reflash objective
  SetObjectiveDisplayed(120, abforce = 1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
;advance quest if Raiders are dead
If MQ102.GetStageDone(122) == 1
  MQ102.SetStage(130)
Else
  ;if quest is not being advanced, reflash objective
  SetObjectiveDisplayed(120, abforce = 1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN CODE
SetObjectiveCompleted(120, 1)
SetObjectiveDisplayed(140, 1)

;Companions Commentary
FollowersScript.FlagCompanionChatEvent(COMQC_Min00KilledDeathclawAV)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0090_Item_00
Function Fragment_Stage_0090_Item_00()
;BEGIN CODE
;complete any old objectives that might be lingering
SetObjectiveCompleted(90, 1)
SetObjectiveCompleted(105, 1)
SetObjectiveCompleted(110, 1)
SetObjectiveCompleted(115, 1)

SetObjectiveCompleted(140)
SetObjectiveDisplayed(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;complete any old objectives that might be lingering
SetObjectiveCompleted(90, 1)
SetObjectiveCompleted(105, 1)
SetObjectiveCompleted(110, 1)
SetObjectiveCompleted(115, 1)

SetObjectiveCompleted(140)
SetObjectiveDisplayed(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
CompleteAllObjectives()
Game.AddAchievement(2)
;Game.RewardPlayerXP(XPActOneFinal.GetValue() as int)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ102 Auto Const

Ammo Property AmmoFusionCore Auto Const

GlobalVariable Property XPActOneFinal Auto Const

Weapon Property Minigun Auto Const

ActorValue Property PowerArmorBattery Auto Const

ActorValue Property COMQC_Min00KilledDeathclawAV Auto Const
