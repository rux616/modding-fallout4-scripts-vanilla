;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSM01MiscObjectives_01005161 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0060_Item_00
Function Fragment_Stage_0060_Item_00()
;BEGIN CODE
;When within Radio Range:
;Display 'Locate the Distress Signal' for Varham.
SetObjectiveDisplayed(60)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_0065_Item_00
Function Fragment_Stage_0065_Item_00()
;BEGIN CODE
;When within sight of the body:
;Complete 'Locate the Distress Signal' for Varham.
SetObjectiveCompleted(60)

;Display 'Search the body for clues' for Varham.
SetObjectiveCompleted(65)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
