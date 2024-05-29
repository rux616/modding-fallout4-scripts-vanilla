;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN036_Post_0010E695 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
SetObjectiveDisplayed(10)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0013_Item_00
Function Fragment_Stage_0013_Item_00()
;BEGIN AUTOCAST TYPE DN036_PostScript
Quest __temp = self as Quest
DN036_PostScript kmyQuest = __temp as DN036_PostScript
;END AUTOCAST
;BEGIN CODE
if GetStageDone(14)
	SetObjectiveFailed(10)
	kMyQuest.MiscObjectiveFailed()
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0014_Item_00
Function Fragment_Stage_0014_Item_00()
;BEGIN AUTOCAST TYPE DN036_PostScript
Quest __temp = self as Quest
DN036_PostScript kmyQuest = __temp as DN036_PostScript
;END AUTOCAST
;BEGIN CODE
if GetStageDone(13)
	SetObjectiveFailed(10)
	kMyQuest.MiscObjectiveFailed()

Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0015_Item_00
Function Fragment_Stage_0015_Item_00()
;BEGIN CODE
SetObjectiveCompleted(10)
if IsObjectiveDisplayed(20)
	SetObjectiveDisplayed(20, false)
endif
(DN036 as DN036QuestScript).InstituteEnding()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0023_Item_00
Function Fragment_Stage_0023_Item_00()
;BEGIN AUTOCAST TYPE DN036_PostScript
Quest __temp = self as Quest
DN036_PostScript kmyQuest = __temp as DN036_PostScript
;END AUTOCAST
;BEGIN CODE
SetObjectiveFailed(20)
kMyQuest.MiscObjectiveFailed()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0025_Item_00
Function Fragment_Stage_0025_Item_00()
;BEGIN CODE
SetObjectiveCompleted(20)
if IsObjectiveDisplayed(10)
	SetObjectiveDisplayed(10, false)
endif
(DN036 as DN036QuestScript).RailRoadEnding()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0030_Item_00
Function Fragment_Stage_0030_Item_00()
;BEGIN CODE
if IsObjectiveDisplayed(10)
	SetObjectiveFailed(10)
endif
if IsObjectiveDisplayed(20)
	SetObjectiveFailed(20)
endif
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias Property Alias_InstJustinAyo Auto Const

ReferenceAlias Property Alias_InstAlanaSecord Auto Const

ObjectReference Property DN036_CovenantEndingRef Auto Const

Quest Property DN036 Auto Const
