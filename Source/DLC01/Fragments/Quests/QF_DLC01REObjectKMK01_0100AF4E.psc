;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC01REObjectKMK01_0100AF4E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
; shutdown sentry bot - try putting into furniture
Actor sentryBot = Alias_SentryBot.GetActorRef()
sentryBot.MoveTo(Alias_SentryBotFurniture.GetRef())
sentryBot.SetUnconscious(true)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
Actor sentryBot = Alias_SentryBot.GetActorRef()
sentryBot.RemoveFromFaction(RaiderFaction)
sentryBot.SetUnconscious(false)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0300_Item_00
Function Fragment_Stage_0300_Item_00()
;BEGIN CODE
Alias_Raider01.TryToEvaluatePackage()
Alias_Raider02.TryToEvaluatePackage()
Alias_Raider03.TryToEvaluatePackage()
Alias_Raider04.TryToEvaluatePackage()
Alias_Raider05.TryToEvaluatePackage()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STOPPING")
;OK TO REARM TRIGGER - only actors in this RE
(Alias_Trigger.GetRef() as RETriggerScript).ReArmTrigger()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_TRIGGER Auto Const


ReferenceAlias Property Alias_Container Auto Const

LeveledItem Property REObject01Reward Auto Const

Faction Property RaiderFaction Auto Const Mandatory

ReferenceAlias Property Alias_SentryBot Auto Const Mandatory

Scene Property DLC01REObjectKMK01ScavengeScene Auto Const Mandatory

ReferenceAlias Property Alias_SentryBotFurniture Auto Const Mandatory

ReferenceAlias Property Alias_Raider01 Auto Const Mandatory

ReferenceAlias Property Alias_Raider02 Auto Const Mandatory

ReferenceAlias Property Alias_Raider03 Auto Const Mandatory

ReferenceAlias Property Alias_Raider04 Auto Const Mandatory

ReferenceAlias Property Alias_Raider05 Auto Const Mandatory
