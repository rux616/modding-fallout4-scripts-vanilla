;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF__0201E7D3 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
DLC04DisciplesToolsConversationComplete.SetValue(1)
Game.GetPlayer().AddItem(DLC04DisciplesFrenzyGrenade, 1)
Game.GetPlayer().AddItem(DLC04FrenzyGrenadeRecipe)

;Shut down objective to speak to Dixie
SetObjectiveCompleted(20)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1500_Item_00
Function Fragment_Stage_1500_Item_00()
;BEGIN CODE
FailAllObjectives()

;Shut it down
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1510_Item_00
Function Fragment_Stage_1510_Item_00()
;BEGIN CODE
FailAllObjectives()

;Shut it down
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DLC04PackToolsConversationComplete Auto Const Mandatory

Weapon Property DLC04PackScentGrenade Auto Const Mandatory

Quest Property DLC04RaidWipeOut Auto Const Mandatory

Quest Property DLC04RaidChaseOff Auto Const Mandatory

Quest Property DLC04RaidSubdue Auto Const Mandatory

Weapon Property DLC04DisciplesFrenzyGrenade Auto Const Mandatory

GlobalVariable Property DLC04DisciplesToolsConversationComplete Auto Const Mandatory

Book Property DLC04FrenzyGrenadeRecipe Auto Const Mandatory
