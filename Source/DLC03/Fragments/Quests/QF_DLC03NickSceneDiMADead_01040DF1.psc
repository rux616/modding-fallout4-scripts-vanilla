;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03NickSceneDiMADead_01040DF1 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03NickSceneDiMADeadScript
Quest __temp = self as Quest
DLC03:DLC03NickSceneDiMADeadScript kmyQuest = __temp as DLC03:DLC03NickSceneDiMADeadScript
;END AUTOCAST
;BEGIN CODE
;register to shut everything down if Nick hates you
kmyquest.RegisterForRemoteEvent(COMNick, "OnStageSet")
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0010_Item_01
Function Fragment_Stage_0010_Item_01()
;BEGIN CODE
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
;Set in the script on DiMA's alias in this quest if the player kills him

;Has Nick met DiMA? If so set stage 75
if DLC03DialogueDiMA.GetStageDone(110) == True
  SetStage(75)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0075_Item_00
Function Fragment_Stage_0075_Item_00()
;BEGIN CODE
;Set in stage 50 if Nick has met DiMA
;Enables Nick's greeting for the scene
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Set in the final phase of the scene

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC03DialogueDiMA Auto Const Mandatory

Quest Property COMNick Auto Const Mandatory
