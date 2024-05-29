;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_PlayerSleepQuest_001C53CB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE PlayerSleepScript
Quest __temp = self as Quest
PlayerSleepScript kmyQuest = __temp as PlayerSleepScript
;END AUTOCAST
;BEGIN CODE
kmyquest.RegisterForPlayerSleep()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
