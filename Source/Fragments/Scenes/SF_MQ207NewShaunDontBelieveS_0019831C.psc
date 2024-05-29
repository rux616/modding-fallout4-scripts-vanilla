;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MQ207NewShaunDontBelieveS_0019831C Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN AUTOCAST TYPE MQ206QuestScript
MQ206QuestScript kmyQuest = GetOwningQuest() as MQ206QuestScript
;END AUTOCAST
;BEGIN CODE
if kmyquest.ShaunDontBelieveStarted == 0
kmyquest.ShaunDontBelieveStarted = 1
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
