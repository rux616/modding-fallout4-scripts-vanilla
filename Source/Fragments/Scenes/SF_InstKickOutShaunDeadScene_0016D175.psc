;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_InstKickOutShaunDeadScene_0016D175 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN AUTOCAST TYPE InstKickOutQuestScript
InstKickOutQuestScript kmyQuest = GetOwningQuest() as InstKickOutQuestScript
;END AUTOCAST
;BEGIN CODE
;if InstKickOut.GetStage() == 10 || InstKickOut.GetStage() == 20
if InstKickOut.GetStage() == 10
InstKickOut.SetStage(100)
else
kmyquest.RelaySceneDone=True
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property InstKickOut Auto Const Mandatory
