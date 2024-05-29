Scriptname DLC03:DLC03MQ03Script extends Quest Conditional

ReferenceAlias Property StorageRoomNote Auto Const Mandatory
ReferenceAlias Property KeyLocationNote Auto Const Mandatory
ReferenceAlias Property StorageRoomKey Auto Const Mandatory

InputEnableLayer Property DLC03MQ03EnableLayer Auto Hidden

;variables for showing quest targets
Int Property ShowClue01 Auto Conditional
Int Property ShowClue02 Auto Conditional
Int Property ShowClue03 Auto Conditional

Event OnDistanceLessThan(ObjectReference akObj1, ObjectReference akObj2, float afDistance)
	;when player gets close enough to either clue, enable condition to show QT on it
	If akObj2 == StorageRoomNote.GetRef()
		ShowClue01=1
	ElseIf akObj2 == KeyLocationNote.GetRef()
		ShowClue02=1
	ElseIf akObj2 == StorageRoomKey.GetRef()
		ShowClue03=1
	EndIf
EndEvent