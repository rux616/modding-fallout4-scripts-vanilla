;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_Inst303DirectoratePreScen_00043639 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_12_Begin
Function Fragment_Phase_12_Begin()
;BEGIN AUTOCAST TYPE Inst303QuestScript
Inst303QuestScript kmyQuest = GetOwningQuest() as Inst303QuestScript
;END AUTOCAST
;BEGIN CODE
if kmyquest.premeetingloop>=3
kmyquest.premeetingloop=1
else
kmyquest.premeetingloop+=1
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
