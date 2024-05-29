;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04MQ04_003_ShankVassal_0200CF91 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_04_Begin
Function Fragment_Phase_04_Begin()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ04QuestScript
DLC04:DLC04MQ04QuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04MQ04QuestScript
;END AUTOCAST
;BEGIN CODE
;Set appropriate stage
GetOwningQuest().SetStage(110)

;Reset raid choice vars
kmyquest.bFoundRaid = false
kmyquest.bSearchingForRaid = false
kmyquest.iPlayerGangChoice = -1
kmyquest.iPlayerRaidChoice = -1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_09_End
Function Fragment_Phase_09_End()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ04QuestScript
DLC04:DLC04MQ04QuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04MQ04QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.SelectRaidLocation()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_11_Begin
Function Fragment_Phase_11_Begin()
;BEGIN AUTOCAST TYPE DLC04:DLC04MQ04QuestScript
DLC04:DLC04MQ04QuestScript kmyQuest = GetOwningQuest() as DLC04:DLC04MQ04QuestScript
;END AUTOCAST
;BEGIN CODE
if kmyquest.iPlayerRaidChoice == 3
  kmyquest.TryToStartRaid(DLC04RaidCoerceKeyword, kmyquest.iPlayerGangChoice)
elseif kmyquest.iPlayerRaidChoice == 4
  kmyquest.TryToStartRaid(DLC04RaidSubdueKeyword, kmyquest.iPlayerGangChoice)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property DLC04RaidSubdueKeyword Auto Const Mandatory

Keyword Property DLC04RaidCoerceKeyword Auto Const Mandatory
