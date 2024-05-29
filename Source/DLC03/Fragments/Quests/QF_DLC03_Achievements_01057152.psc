;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03_Achievements_01057152 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0001_Item_00
Function Fragment_Stage_0001_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03AchievementsScript
Quest __temp = self as Quest
DLC03:DLC03AchievementsScript kmyQuest = __temp as DLC03:DLC03AchievementsScript
;END AUTOCAST
;BEGIN CODE
; Initialize the quest
kmyQuest.InitializeQuest()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0064_Item_00
Function Fragment_Stage_0064_Item_00()
;BEGIN CODE
; This is called from a script on DLC03_PerkMagIslandersAlamanac*
Game.AddAchievement(64)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0067_Item_00
Function Fragment_Stage_0067_Item_00()
;BEGIN CODE
; This is called from a script on DLC03_PerkMagIslandersAlamanac*
Game.AddAchievement(67)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0068_Item_00
Function Fragment_Stage_0068_Item_00()
;BEGIN CODE
; This is called from a script on DLC03_PerkMagIslandersAlamanac*
Game.AddAchievement(68)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0671_Item_00
Function Fragment_Stage_0671_Item_00()
;BEGIN CODE
; CALLED FROM: Stage 200 of DLC03FarHarborS01

; Increment the tracker
pDLC03AchievementWorkshopGlobal.Mod(1)

; Have 3 workshops been found?
if ( pDLC03AchievementWorkshopGlobal.GetValue() >= 3 )
  SetStage(67)   ; Get the achievement
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0672_Item_00
Function Fragment_Stage_0672_Item_00()
;BEGIN CODE
; CALLED FROM: Stage 220 of DLC03FarHarborFF01

; Increment the tracker
pDLC03AchievementWorkshopGlobal.Mod(1)

; Have 3 workshops been found?
if ( pDLC03AchievementWorkshopGlobal.GetValue() >= 3 )
  SetStage(67)   ; Get the achievement
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0673_Item_00
Function Fragment_Stage_0673_Item_00()
;BEGIN CODE
; CALLED FROM: Stage 425 of DLC03FarHarborS02

; Increment the tracker
pDLC03AchievementWorkshopGlobal.Mod(1)

; Have 3 workshops been found?
if ( pDLC03AchievementWorkshopGlobal.GetValue() >= 3 )
  SetStage(67)   ; Get the achievement
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0674_Item_00
Function Fragment_Stage_0674_Item_00()
;BEGIN CODE
; CALLED FROM: Stage 675 of DLC03MQ02
; CALLED FROM: Stage 70 of DLC03_COMOldLongfellow

; Increment the tracker
pDLC03AchievementWorkshopGlobal.Mod(1)

; Have 3 workshops been found?
if ( pDLC03AchievementWorkshopGlobal.GetValue() >= 3 )
  SetStage(67)   ; Get the achievement
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property pDLC03AchievementWorkshopGlobal Auto Const Mandatory
