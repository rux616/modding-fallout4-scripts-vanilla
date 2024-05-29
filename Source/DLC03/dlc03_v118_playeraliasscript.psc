ScriptName DLC03:DLC03_V118_PlayerAliasScript Extends ReferenceAlias

MiscObject Property PrewarMoney Auto Const Mandatory
DLC03:V118_IntroScript Property DLC03_V118_Intro Auto Const Mandatory


Function StartTrackingMoney()
	AddInventoryEventFilter(PrewarMoney)
EndFunction

Function StopTrackingMoney()
	RemoveInventoryEventFilter(PrewarMoney)
EndFunction

Event OnItemAdded(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akSourceContainer)
	if akBaseItem == PrewarMoney
		DLC03_V118_Intro.CheckMoney()
	endif
EndEvent

Event OnItemRemoved(Form akBaseItem, int aiItemCount, ObjectReference akItemReference, ObjectReference akDestContainer)
	if akBaseItem == PrewarMoney
		DLC03_V118_Intro.CheckMoney()
	endif
EndEvent