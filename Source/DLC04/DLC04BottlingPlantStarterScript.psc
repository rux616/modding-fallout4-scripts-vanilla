Scriptname DLC04:DLC04BottlingPlantStarterScript extends ObjectReference Const


Quest Property DLC04_BottlingPlantPA Auto Const Mandatory

Event OnCellAttach()
    if !DLC04_BottlingPlantPA.IsRunning()
    	DLC04_BottlingPlantPA.Start()
    endif
EndEvent

Event OnCellDetach()
    if DLC04_BottlingPlantPA.IsRunning()
    	DLC04_BottlingPlantPA.Stop()
    endif
EndEvent