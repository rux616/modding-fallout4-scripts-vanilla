;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04RaidSelectQuest_005__0101B028 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN AUTOCAST TYPE dlc04:dlc04mq04questscript
dlc04:dlc04mq04questscript kmyQuest = GetOwningQuest() as dlc04:dlc04mq04questscript
;END AUTOCAST
;BEGIN CODE
;Reset var
kmyquest.bShankQuestionRaidTargetsAvailable = true

;Check to see if we should bypass the vassal section of this quest
if kmyquest.CheckRaidLocation(true, true, DLC04CoerceRaidExcludedSettlementKeywords) == false && kmyquest.CheckRaidLocation(true, true, DLC04SubdueRaidExcludedSettlementKeywords) == false
   kmyquest.bShankQuestionRaidTargetsAvailable = false
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList Property DLC04VassalRaidExcludedSettlementKeywords Auto Const Mandatory

FormList Property DLC04CoerceRaidExcludedSettlementKeywords Auto Const Mandatory

FormList Property DLC04SubdueRaidExcludedSettlementKeywords Auto Const Mandatory
