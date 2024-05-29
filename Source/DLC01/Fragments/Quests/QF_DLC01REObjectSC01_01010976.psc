;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC01REObjectSC01_01010976 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE REScript
Quest __temp = self as Quest
REScript kmyQuest = __temp as REScript
;END AUTOCAST
;BEGIN CODE
debug.trace(self + " STARTING")
kmyQuest.Startup()
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
; DO NOT REARM TRIGGER - we don't reuse Object encounter locations
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
