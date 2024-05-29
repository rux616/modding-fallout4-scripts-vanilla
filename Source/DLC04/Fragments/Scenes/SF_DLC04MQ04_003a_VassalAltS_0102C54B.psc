;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04MQ04_003a_VassalAltS_0102C54B Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN AUTOCAST TYPE dlc04:dlc04mq04questscript
dlc04:dlc04mq04questscript kmyQuest = GetOwningQuest() as dlc04:dlc04mq04questscript
;END AUTOCAST
;BEGIN CODE
;Stop Minutemen quests running
(DLC04WorkshopParent as DLC04:DLC04WorkshopParentScript).StopInactiveMinutemenQuests()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN AUTOCAST TYPE dlc04:dlc04mq04questscript
dlc04:dlc04mq04questscript kmyQuest = GetOwningQuest() as dlc04:dlc04mq04questscript
;END AUTOCAST
;BEGIN CODE
;Reset var
kmyquest.bAllowVassalScene = true

;Check to see if we should bypass the vassal section of this quest
if kmyquest.CheckRaidLocation(true, true, DLC04CoerceRaidExcludedSettlementKeywords) == false && kmyquest.CheckRaidLocation(true, true, DLC04SubdueRaidExcludedSettlementKeywords) == false
   kmyquest.bAllowVassalScene = false
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

FormList Property DLC04VassalRaidExcludedSettlementKeywords Auto Const Mandatory

FormList Property DLC04CoerceRaidExcludedSettlementKeywords Auto Const Mandatory

FormList Property DLC04SubdueRaidExcludedSettlementKeywords Auto Const Mandatory

Quest Property DLC04WorkshopParent Auto Const Mandatory
