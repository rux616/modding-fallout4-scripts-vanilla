Scriptname DLC04:DLC04KickOutQuestScript extends Quest

GlobalVariable Property DLC04PlayerKickedOut Auto Conditional Mandatory

DLC04:DLC04WorkshopParentScript Property DLC04WorkshopParent Auto Const Mandatory

Function DLC04KickGo()
	;Do whatever maintenance needs to be done here

	;Set Global Property
	DLC04PlayerKickedOut.SetValue(1)

	; clear player ownership of all raider settlements, clear vassal status
	DLC04WorkshopParent.ClearRaiderSettlementOwnership()
EndFunction

