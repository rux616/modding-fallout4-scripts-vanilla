;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04MQ04_001_GageInitial_0100DBCC Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_09_End
Function Fragment_Phase_09_End()
;BEGIN AUTOCAST TYPE dlc04:dlc04mq04questscript
dlc04:dlc04mq04questscript kmyQuest = GetOwningQuest() as dlc04:dlc04mq04questscript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + "Checking to see if player has talking raid options.")
kmyquest.bChaseOffAvailableForInitialRaid = kmyquest.CheckRaidLocation(true, false, none, DLC04RaidFirstBatchIncludedSettlementKeywords)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_12_End
Function Fragment_Phase_12_End()
;BEGIN AUTOCAST TYPE dlc04:dlc04mq04questscript
dlc04:dlc04mq04questscript kmyQuest = GetOwningQuest() as dlc04:dlc04mq04questscript
;END AUTOCAST
;BEGIN CODE
;Reset raid choice vars
kmyquest.bFoundRaid = false
kmyquest.bSearchingForRaid = false
kmyquest.bRaidTargetsAvailable = true
kmyquest.iPlayerGangChoice = -1
kmyquest.iPlayerRaidChoice = -1

;Pull Shank from anim flavor if necessary
Shank.GetActorRef().ChangeAnimFlavor()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_13_End
Function Fragment_Phase_13_End()
;BEGIN AUTOCAST TYPE dlc04:dlc04mq04questscript
dlc04:dlc04mq04questscript kmyQuest = GetOwningQuest() as dlc04:dlc04mq04questscript
;END AUTOCAST
;BEGIN CODE
kmyquest.bRaidTargetsAvailable = true
debug.trace(self + " iPlayerRaidChoice=" + kmyQuest.iPlayerRaidChoice)
if kmyquest.iPlayerRaidChoice == 1
  kmyquest.bRaidTargetsAvailable = kmyquest.CheckRaidLocation(true,false, none, DLC04RaidFirstBatchIncludedSettlementKeywords)
elseif kmyquest.iPlayerRaidChoice == 2
  kmyquest.bRaidTargetsAvailable = kmyquest.CheckRaidLocation(false, false, none, DLC04RaidFirstBatchIncludedSettlementKeywords)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_23_Begin
Function Fragment_Phase_23_Begin()
;BEGIN CODE
;Throw "Workshops Page" tutorial
if !DLC04MQ04TutorialQuest.GetStageDone(60)
  DLC04MQ04TutorialQuest.SetStage(60)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_25_End
Function Fragment_Phase_25_End()
;BEGIN AUTOCAST TYPE dlc04:dlc04mq04questscript
dlc04:dlc04mq04questscript kmyQuest = GetOwningQuest() as dlc04:dlc04mq04questscript
;END AUTOCAST
;BEGIN CODE
if kmyquest.iPlayerRaidChoice == 1
  kmyquest.SelectRaidLocation(true, false, DLC04WipeOutRaidExcludedSettlementKeywords, DLC04RaidFirstBatchIncludedSettlementKeywords)
elseif kmyquest.iPlayerRaidChoice == 2
  kmyquest.SelectRaidLocation(false, false, DLC04WipeOutRaidExcludedSettlementKeywords, DLC04RaidFirstBatchIncludedSettlementKeywords) 
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_26_Begin
Function Fragment_Phase_26_Begin()
;BEGIN AUTOCAST TYPE dlc04:dlc04mq04questscript
dlc04:dlc04mq04questscript kmyQuest = GetOwningQuest() as dlc04:dlc04mq04questscript
;END AUTOCAST
;BEGIN CODE
if kmyquest.iPlayerRaidChoice == 1
  kmyquest.TryToStartRaid(DLC04RaidChaseOffKeyword, kmyquest.iPlayerGangChoice)
elseif kmyquest.iPlayerRaidChoice == 2
  kmyquest.TryToStartRaid(DLC04RaidWipeOutKeyword, kmyquest.iPlayerGangChoice)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_29_Begin
Function Fragment_Phase_29_Begin()
;BEGIN AUTOCAST TYPE dlc04:dlc04mq04questscript
dlc04:dlc04mq04questscript kmyQuest = GetOwningQuest() as dlc04:dlc04mq04questscript
;END AUTOCAST
;BEGIN CODE
kmyquest.ShankNotebookAnim()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_36_Begin
Function Fragment_Phase_36_Begin()
;BEGIN CODE
Shank.GetActorRef().ChangeAnimFlavor()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property DLC04RaidWipeOutKeyword Auto Const Mandatory

Keyword Property DLC04RaidChaseOffKeyword Auto Const Mandatory

FormList Property DLC04RaidFirstBatchIncludedSettlementKeywords Auto Const Mandatory

FormList Property DLC04RaidExcludedSettlementKeywords Auto Const Mandatory

FormList Property DLC04ChaseOffRaidExcludedSettlementKeywords Auto Const Mandatory

FormList Property DLC04WipeOutRaidExcludedSettlementKeywords Auto Const Mandatory

Quest Property DLC04WorkshopParent Auto Const Mandatory

Quest Property DLC04MQ04TutorialQuest Auto Const Mandatory

ReferenceAlias Property Shank Auto Const Mandatory
