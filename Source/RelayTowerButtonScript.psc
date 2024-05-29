Scriptname RelayTowerButtonScript extends ObjectReference Hidden Const

Keyword Property LinkCustom01 Auto Const

Event OnActivate(ObjectReference akActionRef)
    if (GetLinkedRef() as RelayTowerScript).GetState() == "DownPosition" || (GetLinkedRef() as RelayTowerScript).GetState() == "UpPosition"
    	playAnimationAndWait("Stage2","Reset")
    	utility.Wait(1)
    	(GetLinkedRef() as RelayTowerScript).MoveTower()
    	utility.Wait(6)
    		; Tower is going up, make signal stronger
    	if (GetLinkedRef() as RelayTowerScript).GetState() == "MovingUp"
    		GetLinkedRef(LinkCustom01).DisableNoWait()
    		debug.Trace("Disabling Ref: " + GetLinkedRef(LinkCustom01))
    	else
    			; Tower is going down, make signal weaker again
    		GetLinkedRef(LinkCustom01).EnableNoWait()
    		debug.Trace("Enabling Ref: " + GetLinkedRef(LinkCustom01))
    	endif
    endif
EndEvent