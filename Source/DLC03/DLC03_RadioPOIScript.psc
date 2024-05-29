Scriptname DLC03:DLC03_RadioPOIScript extends ObjectReference Const
{This script disables the object onCellAttach if the RadioDCTravisConfident is true}

GlobalVariable Property RadioDCTravisConfident Auto const mandatory

Event OnCellAttach()
	if RadioDCTravisConfident.GetValue() == 1
		disableNoWait()
	endif
EndEvent