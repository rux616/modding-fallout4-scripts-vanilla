;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Packages:PF_terminalHackerTurretTarge_0018E7BE Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End(Actor akActor)
;BEGIN CODE
(GetOwningQuest() as DNMasterQuestScript).CancelTimer(1)
Formlist targetList = (GetOwningQuest() as DNMasterQuestScript).targetList
ObjectReference currentTerminal = (GetOwningQuest() as DNMasterQuestScript).currentTerminal
(GetOwningQuest() as DNMasterQuestScript).resetTurretTarget(targetList, currentTerminal)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
