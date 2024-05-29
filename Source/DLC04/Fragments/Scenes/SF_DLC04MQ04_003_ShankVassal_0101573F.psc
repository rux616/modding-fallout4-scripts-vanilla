;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04MQ04_003_ShankVassal_0101573F Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN AUTOCAST TYPE dlc04:dlc04mq04questscript
dlc04:dlc04mq04questscript kmyQuest = GetOwningQuest() as dlc04:dlc04mq04questscript
;END AUTOCAST
;BEGIN CODE
;Set up vars
kmyquest.bAllowVassalScene = true
Quest myQuest = GetOwningQuest()

;If stage 100 has been set yet, do that now
if !myQuest.GetStageDone(100)
  myQuest.SetStage(100)
endif

;Check to see if we should bypass the vassal section of this quest
if kmyquest.CheckRaidLocation(true, true, DLC04CoerceRaidExcludedSettlementKeywords) == false && kmyquest.CheckRaidLocation(true, true, DLC04SubdueRaidExcludedSettlementKeywords) == false
   kmyquest.bAllowVassalScene = false
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_10_Begin
Function Fragment_Phase_10_Begin()
;BEGIN CODE
;Set appropriate stage
GetOwningQuest().SetStage(110)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_10_End
Function Fragment_Phase_10_End()
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
kmyquest.bPlayerHasSingleVassalAvailable = false

;Pull Shank from anim flavor if necessary
Shank.GetActorRef().ChangeAnimFlavor()

;Check to see how many vassals the player has available to target
;if kmyquest.CheckForSingleAvailableVassalLocation()
;  kmyquest.bPlayerHasSingleVassalAvailable = true
;endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_11_End
Function Fragment_Phase_11_End()
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

;BEGIN FRAGMENT Fragment_Phase_18_End
Function Fragment_Phase_18_End()
;BEGIN AUTOCAST TYPE dlc04:dlc04mq04questscript
dlc04:dlc04mq04questscript kmyQuest = GetOwningQuest() as dlc04:dlc04mq04questscript
;END AUTOCAST
;BEGIN CODE
if kmyquest.iPlayerRaidChoice == 3
  kmyquest.SelectRaidLocation(true, true, DLC04CoerceRaidExcludedSettlementKeywords)
elseif kmyquest.iPlayerRaidChoice == 4
  kmyquest.SelectRaidLocation(true, true, DLC04SubdueRaidExcludedSettlementKeywords)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_19_Begin
Function Fragment_Phase_19_Begin()
;BEGIN AUTOCAST TYPE dlc04:dlc04mq04questscript
dlc04:dlc04mq04questscript kmyQuest = GetOwningQuest() as dlc04:dlc04mq04questscript
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

;BEGIN FRAGMENT Fragment_Phase_22_Begin
Function Fragment_Phase_22_Begin()
;BEGIN AUTOCAST TYPE dlc04:dlc04mq04questscript
dlc04:dlc04mq04questscript kmyQuest = GetOwningQuest() as dlc04:dlc04mq04questscript
;END AUTOCAST
;BEGIN CODE
;Start Shank's notebook anim
kmyquest.ShankNotebookAnim()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_29_Begin
Function Fragment_Phase_29_Begin()
;BEGIN CODE
Shank.GetActorRef().ChangeAnimFlavor()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property DLC04RaidSubdueKeyword Auto Const Mandatory

Keyword Property DLC04RaidCoerceKeyword Auto Const Mandatory

FormList Property DLC04RaidExcludedSettlementKeywords Auto Const Mandatory

FormList Property DLC04CoerceRaidExcludedSettlementKeywords Auto Const Mandatory

FormList Property DLC04SubdueRaidExcludedSettlementKeywords Auto Const Mandatory

Quest Property DLC04WorkshopParent Auto Const Mandatory

FormList Property DLC04MQ04VassalCoerceRaidExcludedSettlementKeywords Auto Const Mandatory

FormList Property DLC04MQ04VassalSubdueRaidExcludedSettlementKeywords Auto Const Mandatory

ReferenceAlias Property Shank Auto Const Mandatory
