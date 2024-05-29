;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_MQ00_000C9B0B Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE mq00script
Quest __temp = self as Quest
mq00script kmyQuest = __temp as mq00script
;END AUTOCAST
;BEGIN CODE
kmyquest.MQFactionKickoutPlayer(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE mq00script
Quest __temp = self as Quest
mq00script kmyQuest = __temp as mq00script
;END AUTOCAST
;BEGIN CODE
kmyquest.MQFactionKickoutPlayer(3)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN AUTOCAST TYPE mq00script
Quest __temp = self as Quest
mq00script kmyQuest = __temp as mq00script
;END AUTOCAST
;BEGIN CODE
kmyquest.MQFactionKickoutPlayer(4)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE mq00script
Quest __temp = self as Quest
mq00script kmyQuest = __temp as mq00script
;END AUTOCAST
;BEGIN CODE
kmyquest.EndGameBinks()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN AUTOCAST TYPE mq00script
Quest __temp = self as Quest
mq00script kmyQuest = __temp as mq00script
;END AUTOCAST
;BEGIN CODE
MQ302Faction.SetValue(4.0)
Utility.Wait(0.1)
kmyquest.EndGameBinks()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property MQ302Faction Auto Const
