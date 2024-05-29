Scriptname DN158_BulkheadTerminalUnlockScript extends ObjectReference Const

Keyword Property LinkCustom01 Auto Const

Event OnLockStateChanged()
	DN158SubDoorLightController myLight = (GetLinkedRef(LinkCustom01) as DN158SubDoorLightController)
	if !IsLocked()
		if myLight
			myLight.EZLightState("yellow")
		endif
	else
		if myLight
			myLight.EZLightState("red")
		endif
	endif
EndEvent