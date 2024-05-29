Scriptname DmndHolidayHandlerScript extends ObjectReference Const

ObjectReference Property DmndChristmasEnableMarker Auto Const
ObjectReference Property DmndHalloweenEnableMarker Auto Const

GlobalVariable Property GameMonth Auto Const
GlobalVariable Property GameDay Auto Const

Event OnLoad()
	;enable Halloween markers on the 31st
	If GameMonth.GetValueInt() == 10
		If GameDay.GetValueInt() == 31
			DmndHalloweenEnableMarker.Enable()
		EndIf
	EndIf
	;disable Halloween markers any other time
	If GameMonth.GetValueInt() != 10
		If GameDay.GetValueInt() != 31
			DmndHalloweenEnableMarker.Disable()
		EndIf
	EndIf

	;enable christmas markers on tyhe 25th
	If GameMonth.GetValueInt() == 12
		If GameDay.GetValueInt() == 25
			DmndChristmasEnableMarker.Enable()
		EndIf
	EndIf

	If GameMonth.GetValueInt() != 12
		If GameDay.GetValueInt() != 25
			DmndChristmasEnableMarker.Disable()
		EndIf
	EndIf	
EndEvent
