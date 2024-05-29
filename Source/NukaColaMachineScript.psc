Scriptname NukaColaMachineScript extends ObjectReference Const
{Simple script for Nuka Cola Machine}

EVENT OnActivate(ObjectReference akActionRef)
	if GetOpenState() == 3
    	playanimation("open")
    elseif GetOpenState() == 1
    	playanimation("close")
    endif
EndEvent