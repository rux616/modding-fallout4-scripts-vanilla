;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MVIFatherStage10PreSceneL_01036D92 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_05_End
Function Fragment_Phase_05_End()
;BEGIN AUTOCAST TYPE MinVsInstQuestScript
MinVsInstQuestScript kmyQuest = GetOwningQuest() as MinVsInstQuestScript
;END AUTOCAST
;BEGIN CODE
if kmyquest.Stage10LoopVar < 4
kmyquest.Stage10LoopVar += 1
else
kmyquest.Stage10LoopVar=1
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
