;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04RaidSelectQuest_001__0101B031 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN AUTOCAST TYPE dlc04:dlc04mq04questscript
dlc04:dlc04mq04questscript kmyQuest = GetOwningQuest() as dlc04:dlc04mq04questscript
;END AUTOCAST
;BEGIN CODE
;Reset var
kmyquest.bSettlementsStillAvailableToTarget = true

;Check to see if there are any settlements not converted to Raider settlements
kmyquest.bSettlementsStillAvailableToTarget = kmyquest.CheckRaidLocation(false, false, DLC04RaidExcludedSettlementKeywords)

;Pull Shank from anim flavor if necessary
Shank.GetActorRef().ChangeAnimFlavor()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_04_End
Function Fragment_Phase_04_End()
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
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_05_End
Function Fragment_Phase_05_End()
;BEGIN AUTOCAST TYPE dlc04:dlc04mq04questscript
dlc04:dlc04mq04questscript kmyQuest = GetOwningQuest() as dlc04:dlc04mq04questscript
;END AUTOCAST
;BEGIN CODE
kmyquest.bRaidTargetsAvailable = true
debug.trace(self + " iPlayerRaidChoice=" + kmyQuest.iPlayerRaidChoice)
if kmyquest.iPlayerRaidChoice == 3
  kmyquest.bRaidTargetsAvailable = kmyquest.CheckRaidLocation(true, true, DLC04CoerceRaidExcludedSettlementKeywords)
elseif kmyquest.iPlayerRaidChoice == 4
  kmyquest.bRaidTargetsAvailable = kmyquest.CheckRaidLocation(true, true, DLC04SubdueRaidExcludedSettlementKeywords)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_10_End
Function Fragment_Phase_10_End()
;BEGIN AUTOCAST TYPE dlc04:dlc04mq04questscript
dlc04:dlc04mq04questscript kmyQuest = GetOwningQuest() as dlc04:dlc04mq04questscript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " iPlayerRaidChoice=" + kmyQuest.iPlayerRaidChoice)
if kmyquest.iPlayerRaidChoice == 1
  kmyquest.SelectRaidLocation(true,false, DLC04ChaseOffRaidExcludedSettlementKeywords)
elseif kmyquest.iPlayerRaidChoice == 2
  kmyquest.SelectRaidLocation(false, false, DLC04ClaimRaidExcludedSettlementKeywords)
elseif kmyquest.iPlayerRaidChoice == 3
  kmyquest.SelectRaidLocation(true, true, DLC04CoerceRaidExcludedSettlementKeywords)
elseif kmyquest.iPlayerRaidChoice == 4
  kmyquest.SelectRaidLocation(true, true, DLC04SubdueRaidExcludedSettlementKeywords)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_11_Begin
Function Fragment_Phase_11_Begin()
;BEGIN AUTOCAST TYPE dlc04:dlc04mq04questscript
dlc04:dlc04mq04questscript kmyQuest = GetOwningQuest() as dlc04:dlc04mq04questscript
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

;BEGIN FRAGMENT Fragment_Phase_14_Begin
Function Fragment_Phase_14_Begin()
;BEGIN AUTOCAST TYPE dlc04:dlc04mq04questscript
dlc04:dlc04mq04questscript kmyQuest = GetOwningQuest() as dlc04:dlc04mq04questscript
;END AUTOCAST
;BEGIN CODE
;Start Shank's notebook anim
kmyquest.ShankNotebookAnim()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_21_Begin
Function Fragment_Phase_21_Begin()
;BEGIN CODE
Shank.GetActorRef().ChangeAnimFlavor()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property DLC04RaidChaseOffKeyword Auto Const Mandatory

Keyword Property DLC04RaidCoerceKeyword Auto Const Mandatory

Keyword Property DLC04RaidSubdueKeyword Auto Const Mandatory

Keyword Property DLC04RaidWipeOutKeyword Auto Const Mandatory

FormList Property DLC04RaidExcludedSettlementKeywords Auto Const Mandatory

FormList Property DLC04ClaimRaidExcludedSettlementKeywords Auto Const Mandatory

FormList Property DLC04SubdueRaidExcludedSettlementKeywords Auto Const Mandatory

FormList Property DLC04CoerceRaidExcludedSettlementKeywords Auto Const Mandatory

FormList Property DLC04ChaseOffRaidExcludedSettlementKeywords Auto Const Mandatory

Quest Property DLC04WorkshopParent Auto Const Mandatory

ReferenceAlias Property Shank Auto Const Mandatory
