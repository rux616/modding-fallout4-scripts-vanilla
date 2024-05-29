;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03_V118_ClueTracker_0200FD47 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;Increase the amount of blood/paint the player has found
kMyQuest.IncreaseBloodFound()

;Tell the quest to queue the clue scene with this clue
kMyQuest.SetClueFoundAndStartScene(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0011_Item_00
Function Fragment_Stage_0011_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;Increase the amount of blood/paint the player has found
kMyQuest.IncreaseBloodFound()

;Tell the quest to queue the clue scene with this clue
kMyQuest.SetClueFoundAndStartScene(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;Tell the quest to queue the clue scene with this clue
kMyQuest.SetClueFoundAndStartScene(30)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0040_Item_00
Function Fragment_Stage_0040_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;Tell the quest to queue the clue scene with this clue
kMyQuest.SetClueFoundAndStartScene(40)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN AUTOCAST TYPE DLC03:DLC03_V118_ClueTrackerQuestScript
Quest __temp = self as Quest
DLC03:DLC03_V118_ClueTrackerQuestScript kmyQuest = __temp as DLC03:DLC03_V118_ClueTrackerQuestScript
;END AUTOCAST
;BEGIN CODE
;Tell the quest to queue the clue scene with this clue
kMyQuest.SetClueFoundAndStartScene(50)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
