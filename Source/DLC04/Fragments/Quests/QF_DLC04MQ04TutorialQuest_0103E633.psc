;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04MQ04TutorialQuest_0103E633 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ04TutorialQuest
Quest __temp = self as Quest
DLC04:DLC04MQ04TutorialQuest kmyQuest = __temp as DLC04:DLC04MQ04TutorialQuest
;END AUTOCAST
;BEGIN CODE
kmyquest.RegisterForMapTutorialEvent()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0020_Item_00
Function Fragment_Stage_0020_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ04TutorialQuest
Quest __temp = self as Quest
DLC04:DLC04MQ04TutorialQuest kmyQuest = __temp as DLC04:DLC04MQ04TutorialQuest
;END AUTOCAST
;BEGIN CODE
kmyquest.ShowTutorialClearRaiderSettlement()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
HelpManualPC.AddForm(DLC04HelpRaidJobs)
HelpManualXBox.AddForm(DLC04HelpRaidJobs)

HelpManualPC.AddForm(DLC04HelpIntimidation)
HelpManualXBox.AddForm(DLC04HelpIntimidation)

HelpManualPC.AddForm(DLC04HelpOutposts)
HelpManualXBox.AddForm(DLC04HelpOutposts)

HelpManualPC.AddForm(DLC04HelpOutpostCare)
HelpManualXBox.AddForm(DLC04HelpOutpostCare)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ04TutorialQuest
Quest __temp = self as Quest
DLC04:DLC04MQ04TutorialQuest kmyQuest = __temp as DLC04:DLC04MQ04TutorialQuest
;END AUTOCAST
;BEGIN CODE
kmyquest.RegisterForWorkshopMenuEvent()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ04TutorialQuest
Quest __temp = self as Quest
DLC04:DLC04MQ04TutorialQuest kmyQuest = __temp as DLC04:DLC04MQ04TutorialQuest
;END AUTOCAST
;BEGIN CODE
kmyquest.ShowTutorialActiveQuests()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ04TutorialQuest
Quest __temp = self as Quest
DLC04:DLC04MQ04TutorialQuest kmyQuest = __temp as DLC04:DLC04MQ04TutorialQuest
;END AUTOCAST
;BEGIN CODE
kmyquest.ShowTutorialVisitWorkshopsPage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0070_Item_00
Function Fragment_Stage_0070_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ04TutorialQuest
Quest __temp = self as Quest
DLC04:DLC04MQ04TutorialQuest kmyQuest = __temp as DLC04:DLC04MQ04TutorialQuest
;END AUTOCAST
;BEGIN CODE
kmyquest.ShowTutorialReclaimSettlements()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0080_Item_00
Function Fragment_Stage_0080_Item_00()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ04TutorialQuest
Quest __temp = self as Quest
DLC04:DLC04MQ04TutorialQuest kmyQuest = __temp as DLC04:DLC04MQ04TutorialQuest
;END AUTOCAST
;BEGIN CODE
kmyquest.ShowTutorialZKeyThrowing()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList Property HelpManualPC Auto Const Mandatory

FormList Property HelpManualXBox Auto Const Mandatory

Message Property DLC04HelpIntimidation Auto Const Mandatory

Message Property DLC04HelpOutpostCare Auto Const Mandatory

Message Property DLC04HelpOutposts Auto Const Mandatory

Message Property DLC04HelpRaidJobs Auto Const Mandatory
