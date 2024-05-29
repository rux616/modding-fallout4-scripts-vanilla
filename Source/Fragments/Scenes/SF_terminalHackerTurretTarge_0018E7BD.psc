;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_terminalHackerTurretTarge_0018E7BD Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
Formlist targetList = (GetOwningQuest() as DNMasterQuestScript).targetList
ObjectReference currentTerminal = (GetOwningQuest() as DNMasterQuestScript).currentTerminal
(GetOwningQuest() as DNMasterQuestScript).resetTurretTarget(targetList, currentTerminal)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
