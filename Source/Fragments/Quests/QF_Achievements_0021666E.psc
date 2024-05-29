;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Achievements_0021666E Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN AUTOCAST TYPE AchievementsScript
Quest __temp = self as Quest
AchievementsScript kmyQuest = __temp as AchievementsScript
;END AUTOCAST
;BEGIN CODE
; Initialize the quest
kmyQuest.InitializeQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0260_Item_00
Function Fragment_Stage_0260_Item_00()
;BEGIN CODE
Game.AddAchievement(26)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0320_Item_00
Function Fragment_Stage_0320_Item_00()
;BEGIN AUTOCAST TYPE AchievementsScript
Quest __temp = self as Quest
AchievementsScript kmyQuest = __temp as AchievementsScript
;END AUTOCAST
;BEGIN CODE
; Increment the number of companions
kmyQuest.nNumberOfCompanions += 1

if ( kmyQuest.nNumberOfCompanions >= 5 )
  Game.AddAchievement(32)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0330_Item_00
Function Fragment_Stage_0330_Item_00()
;BEGIN CODE
Game.AddAchievement(33)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0350_Item_00
Function Fragment_Stage_0350_Item_00()
;BEGIN CODE
Game.AddAchievement(35)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0360_Item_00
Function Fragment_Stage_0360_Item_00()
;BEGIN AUTOCAST TYPE AchievementsScript
Quest __temp = self as Quest
AchievementsScript kmyQuest = __temp as AchievementsScript
;END AUTOCAST
;BEGIN CODE
; Increment Giants killed
kmyQuest.nGiantsKilled += 1

if  ( kmyQuest.nGiantsKilled == 5 )
  Game.AddAchievement(36)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
