;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_Achievements_LevelUpCheck_0021666D Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
; Store the player's level
int nLevel = Game.GetPlayer().GetLevel()

Debug.Trace("PC's level is " + nLevel)

; Check level range for achievements
if ( nLevel >= 5 )
  Game.AddAchievement(46)
endif

if ( nLevel >= 10 )
  Game.AddAchievement(47)
endif

if ( nLevel >= 25 )
  Game.AddAchievement(48)
endif

if ( nLevel >= 50 )
  Game.AddAchievement(49)
endif

Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
