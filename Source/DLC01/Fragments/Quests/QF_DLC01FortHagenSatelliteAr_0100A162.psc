;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC01FortHagenSatelliteAr_0100A162 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
;Enable Quest Sentry Bot Boss
PDLC01MQ04SentryEnableMarker.Enable()

;Enable Entrance Terminal to allow player access to the dungeon
PDLC01FortHagenSatelliteArrayEntranceEnableMarker.Enable()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Activate Sentry Bot Boss
PDLC01MQ04SentryBot.Activate(PDLC01MQ04SentryBot)
;Turn on Klaxons
PDLC01MQ04Klaxon01.Activate(PDLC01MQ04Klaxon01)
PDLC01MQ04Klaxon02.Activate(PDLC01MQ04Klaxon02)
;Close Doors to boss room
Default2StateActivator SentryBotDoor01 = PDLC01MQ04SentryBotDoor01 as Default2StateActivator
Default2StateActivator SentryBotDoor02 = PDLC01MQ04SentryBotDoor02 as Default2StateActivator
if(getStageDone(155) == 0)
    ;player has not killed sentry bot, so close both doors
    SentryBotDoor01.SetOpenNoWait(FALSE)
    SentryBotDoor02.SetOpenNoWait(FALSE)
else
    ;player has killed sentry bot, so open first door
    SentryBotDoor02.SetOpenNoWait(FALSE)
    SentryBotDoor01.SetOpenNoWait(TRUE)
endif
;PDLC01MQ04SentryBotDoor01.Activate(PDLC01MQ04SentryBotDoor01)
;PDLC01MQ04SentryBotDoor02.Activate(PDLC01MQ04SentryBotDoor02)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0155_Item_00
Function Fragment_Stage_0155_Item_00()
;BEGIN CODE
;Open Doors to boss room
if(getStageDone(100) == 1)
    ;player has taken brain, so open door leading out
    Default2StateActivator SentryBotDoor01 = PDLC01MQ04SentryBotDoor01 as Default2StateActivator
    SentryBotDoor01.SetOpenNoWait(TRUE)
else
    ;do nothing
endif
;PDLC01MQ04SentryBotDoor01.Activate(PDLC01MQ04SentryBotDoor01)
;PDLC01MQ04SentryBotDoor02.Activate(PDLC01MQ04SentryBotDoor02)

PDLC01FortHagenSatelliteArraySentryBotKilledScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0160_Item_00
Function Fragment_Stage_0160_Item_00()
;BEGIN CODE
PDLC01FortHagenSatelliteArrayGrenadeTrapScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0165_Item_00
Function Fragment_Stage_0165_Item_00()
;BEGIN CODE
PDLC01FortHagenSatelliteArrayGrenadeTrapExplodedScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0170_Item_00
Function Fragment_Stage_0170_Item_00()
;BEGIN CODE
PDLC01FortHagenSatelliteArrayRaiderShackScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0175_Item_00
Function Fragment_Stage_0175_Item_00()
;BEGIN CODE
PDLC01FortHagenSatelliteArrayAssaultronTrapScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0180_Item_00
Function Fragment_Stage_0180_Item_00()
;BEGIN CODE
PDLC01FortHagenSatelliteArrayStorageRoomScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0190_Item_00
Function Fragment_Stage_0190_Item_00()
;BEGIN CODE
PDLC01FortHagenSatelliteArrayRaiderBossScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0200_Item_00
Function Fragment_Stage_0200_Item_00()
;BEGIN CODE
PDLC01FortHagenSatelliteArrayRaiderBossKilledScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0210_Item_00
Function Fragment_Stage_0210_Item_00()
;BEGIN CODE
PDLC01FortHagenSatelliteArrayPlayerExitsDungeonScene.Start()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0220_Item_00
Function Fragment_Stage_0220_Item_00()
;BEGIN CODE
;PDLC01FortHagenSatelliteArrayJezebelAmbientSceneExterior.Start()
;game.getplayer().MakeRadioReceiver(25.0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;PDLC01FortHagenSatelliteArrayJezebelAmbientSceneExterior.Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property PDLC01MQ04SentryEnableMarker Auto Const Mandatory

ObjectReference Property PDLC01MQ04SentryBot Auto Const Mandatory

ObjectReference Property PDLC01MQ04Klaxon01 Auto Const Mandatory

ObjectReference Property PDLC01MQ04Klaxon02 Auto Const Mandatory

ObjectReference Property PDLC01MQ04SentryBotDoor01 Auto Const Mandatory

ObjectReference Property PDLC01MQ04SentryBotDoor02 Auto Const Mandatory

Scene Property PDLC01FortHagenSatelliteArraySentryBotKilledScene Auto Const Mandatory

Scene Property PDLC01FortHagenSatelliteArrayGrenadeTrapScene Auto Const Mandatory

Scene Property PDLC01FortHagenSatelliteArrayGrenadeTrapExplodedScene Auto Const Mandatory

Scene Property PDLC01FortHagenSatelliteArrayRaiderShackScene Auto Const Mandatory

Scene Property PDLC01FortHagenSatelliteArrayAssaultronTrapScene Auto Const Mandatory

Scene Property PDLC01FortHagenSatelliteArrayStorageRoomScene Auto Const Mandatory

Scene Property PDLC01FortHagenSatelliteArrayRaiderBossScene Auto Const Mandatory

Scene Property PDLC01FortHagenSatelliteArrayRaiderBossKilledScene Auto Const Mandatory

Scene Property PDLC01FortHagenSatelliteArrayPlayerExitsDungeonScene Auto Const Mandatory

Scene Property PDLC01FortHagenSatelliteArrayJezebelAmbientSceneExterior Auto Const Mandatory

ReferenceAlias Property Alias_DLC01MQ04SentryBotBoss Auto Const Mandatory



ObjectReference Property PDLC01FortHagenSatelliteArrayEntranceEnableMarker Auto Const Mandatory
