Scriptname MQ102V111QTScript extends ReferenceAlias

Bool Property pUseActivation = False Auto
Int Property QTNumber Auto

auto STATE waitingForPlayer
	Event OnActivate(ObjectReference akActionRef)
		If (akActionRef == Game.GetPlayer()) && (pUseActivation == True)
			gotoState("hesBeenTriggered")
			If (GetOwningQuest() as MQ03QuestScript).V111QT < QTNumber
				(GetOwningQuest() as MQ03QuestScript).V111QT = QTNumber
			EndIf
		EndIf
	EndEvent

	Event OnOpen(ObjectReference akActionRef)
		If (pUseActivation == False)
			gotoState("hesBeenTriggered")
			If (GetOwningQuest() as MQ03QuestScript).V111QT < QTNumber
				(GetOwningQuest() as MQ03QuestScript).V111QT = QTNumber
			EndIf
		EndIf
	EndEvent
EndState



STATE hasBeenTriggered
	; this is an empty state.
endSTATE