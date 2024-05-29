;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03HolotapesQuest_01008AB5 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0105_Item_00
Function Fragment_Stage_0105_Item_00()
;BEGIN CODE
; start MQ05
DLC03MQ05.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0115_Item_00
Function Fragment_Stage_0115_Item_00()
;BEGIN CODE
; nuclear launch codes
DLC03MQ06_NukeHandling.SetStage(5)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0125_Item_00
Function Fragment_Stage_0125_Item_00()
;BEGIN CODE
; wind farm codes
DLC03MQ06_WindFarmHandling.SetStage(2)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0145_Item_00
Function Fragment_Stage_0145_Item_00()
;BEGIN CODE
;pop misc objective to the armor
DLCMQ04RewardMisc.SetStage(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
DLC03MQ06_NukeHandling.SetStage(15)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
if DLC03_PlayerKnowsFogRumor.GetValue() == 0
  DLC03_PlayerKnowsFogRumor.SetValue(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
DLC03_V118_ClueTracker.SetStage(80)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC03MQ05 Auto Const Mandatory

Quest Property DLC03MQ06 Auto Const Mandatory

DLC03:MQ04Script Property DLC03MQ04_01 Auto Const Mandatory

DLC03:MQ04Script Property DLC03MQ04_02 Auto Const Mandatory

DLC03:MQ04Script Property DLC03MQ04_03 Auto Const Mandatory

DLC03:MQ04Script Property DLC03MQ04_04 Auto Const Mandatory

DLC03:MQ04Script Property DLC03MQ04_05 Auto Const Mandatory

Quest Property DLC03MQ06_NukeHandling Auto Const Mandatory

Quest Property DLC03MQ06_WindFarmHandling Auto Const Mandatory

GlobalVariable Property DLC03_PlayerKnowsFogRumor Auto Const Mandatory

Quest Property DLCMQ04RewardMisc Auto Const Mandatory

Quest Property DLC03_V118_ClueTracker Auto Const Mandatory
