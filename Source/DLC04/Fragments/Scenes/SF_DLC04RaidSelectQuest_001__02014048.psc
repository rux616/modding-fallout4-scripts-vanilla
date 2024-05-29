;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04RaidSelectQuest_001__02014048 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_Begin
Function Fragment_Phase_02_Begin()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ04QuestScript
DLC04:DLC04MQ04QuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04MQ04QuestScript
;END AUTOCAST
;BEGIN CODE
;Reset raid choice vars
kmyquest.bFoundRaid = false
kmyquest.bSearchingForRaid = false
kmyquest.iPlayerGangChoice = -1
kmyquest.iPlayerRaidChoice = -1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_05_End
Function Fragment_Phase_05_End()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ04QuestScript
DLC04:DLC04MQ04QuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04MQ04QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.SelectRaidLocation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_07_Begin
Function Fragment_Phase_07_Begin()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ04QuestScript
DLC04:DLC04MQ04QuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04MQ04QuestScript
;END AUTOCAST
;BEGIN CODE
if kmyquest.iPlayerRaidChoice == 1
  kmyquest.TryToStartRaid(DLC04RaidChaseOffKeyword, kmyquest.iPlayerGangChoice)
elseif kmyquest.iPlayerRaidChoice == 2
  kmyquest.TryToStartRaid(DLC04RaidWipeOutKeyword, kmyquest.iPlayerGangChoice)
elseif kmyquest.iPlayerRaidChoice == 3
  kmyquest.TryToStartRaid(DLC04RaidCoerceKeyword, kmyquest.iPlayerGangChoice)
elseif kmyquest.iPlayerRaidChoice == 4
  kmyquest.TryToStartRaid(DLC04RaidSubdueKeyword, kmyquest.iPlayerGangChoice)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property DLC04RaidChaseOffKeyword Auto Const Mandatory

Keyword Property DLC04RaidCoerceKeyword Auto Const Mandatory

Keyword Property DLC04RaidSubdueKeyword Auto Const Mandatory

Keyword Property DLC04RaidWipeOutKeyword Auto Const Mandatory
