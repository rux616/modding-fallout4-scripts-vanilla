;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_Inst305Stage90Directorate_00165A7A Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_Begin
Function Fragment_Phase_02_Begin()
;BEGIN AUTOCAST TYPE Inst305QuestScript
Inst305QuestScript kmyQuest = GetOwningQuest() as Inst305QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.MeetingProgress=1
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_11_Begin
Function Fragment_Phase_11_Begin()
;BEGIN AUTOCAST TYPE Inst305QuestScript
Inst305QuestScript kmyQuest = GetOwningQuest() as Inst305QuestScript
;END AUTOCAST
;BEGIN CODE
kmyquest.MeetingProgress=2
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
