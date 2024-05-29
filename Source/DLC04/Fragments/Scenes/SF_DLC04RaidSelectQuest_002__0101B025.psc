;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04RaidSelectQuest_002__0101B025 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN AUTOCAST TYPE dlc04:dlc04mq04questscript
dlc04:dlc04mq04questscript kmyQuest = GetOwningQuest() as dlc04:dlc04mq04questscript
;END AUTOCAST
;BEGIN CODE
kmyquest.bRaidTargetsAvailable = true
debug.trace(self + " iPlayerRaidChoice=" + kmyQuest.iPlayerRaidChoice)
if kmyquest.iPlayerRaidChoice == 1
  kmyquest.bRaidTargetsAvailable = kmyquest.CheckRaidLocation(true,false, DLC04ChaseOffRaidExcludedSettlementKeywords)
elseif kmyquest.iPlayerRaidChoice == 2
  kmyquest.bRaidTargetsAvailable = kmyquest.CheckRaidLocation(false, false, DLC04RaidExcludedSettlementKeywords)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList Property DLC04RaidExcludedSettlementKeywords Auto Const Mandatory

FormList Property DLC04ChaseOffRaidExcludedSettlementKeywords Auto Const Mandatory
