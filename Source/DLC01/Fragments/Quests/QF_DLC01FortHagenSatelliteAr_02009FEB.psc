;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Quests:QF_DLC01FortHagenSatelliteAr_02009FEB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
;Activate Sentry Bot Boss, Turn on Klaxons, and Shut doors to the room
PDLC01MQ04SentryBot.Activate(Game.GetPlayer())
PDLC01MQ04Klaxon01.Activate(Game.GetPlayer())
PDLC01MQ04Klaxon02.Activate(Game.GetPlayer())
PDLC01MQ04SentryBotDoor01.Activate(Game.GetPlayer())
PDLC01MQ04SentryBotDoor02.Activate(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0150_Item_00
Function Fragment_Stage_0150_Item_00()
;BEGIN CODE
;Open Doors to the Sentry Bot room
PDLC01MQ04SentryBotDoor01.Activate(Game.GetPlayer())
PDLC01MQ04SentryBotDoor02.Activate(Game.GetPlayer())
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property PDLC01MQ04SentryBotDoor01 Auto Const Mandatory

ObjectReference Property PDLC01MQ04SentryBotDoor02 Auto Const Mandatory

ObjectReference Property PDLC01MQ04SentryBot Auto Const Mandatory

ObjectReference Property PDLC01MQ04Klaxon01 Auto Const Mandatory

ObjectReference Property PDLC01MQ04Klaxon02 Auto Const Mandatory

