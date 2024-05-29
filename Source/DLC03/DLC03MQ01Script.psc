Scriptname DLC03:DLC03MQ01Script extends Quest Conditional

;variable to track if Nick is with you when you visit the Nakano family
Int Property var_NickAtNakano Auto Conditional

;variable to track how much money the player asks for
;0 = 300, 1 = 350, 2 = 400, 3 = 500
Int Property var_NakanoReward Auto Conditional

ReferenceAlias Property KasumiHolotape Auto Const Mandatory
ReferenceAlias Property KasumiJournal Auto Const Mandatory

;variables for showing quest targets
Int Property ShowClue01 Auto Conditional
Int Property ShowClue02 Auto Conditional

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
	;when player gets close enough to either clue, enable condition to show QT on it
	If akObj2 == KasumiJournal.GetRef()
		ShowClue01=1
	ElseIf akObj2 == KasumiHolotape.GetRef()
		ShowClue02=1
	EndIf
EndEvent
