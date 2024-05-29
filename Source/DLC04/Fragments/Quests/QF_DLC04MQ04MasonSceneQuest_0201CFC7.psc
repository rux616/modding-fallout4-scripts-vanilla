;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04MQ04MasonSceneQuest_0201CFC7 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
DLC04PackToolsConversationComplete.SetValue(1)
Game.GetPlayer().AddItem(DLC04PackScentGrenade, 1)

;If WipeOut quest is running, shut down objective to speak to Mason
if DLC04RaidWipeOut.IsRunning()
  DLC04RaidWipeOut.SetStage(22)
endif

;If Chase Off Quest is running, shut down objective to speak to Mason
if DLC04RaidSubdue.IsRunning()
  DLC04RaidSubdue.SetStage(22)
endif
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

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DLC04PackToolsConversationComplete Auto Const Mandatory

Weapon Property DLC04PackScentGrenade Auto Const Mandatory

Quest Property DLC04RaidWipeOut Auto Const Mandatory

Quest Property DLC04RaidChaseOff Auto Const Mandatory

Quest Property DLC04RaidSubdue Auto Const Mandatory
