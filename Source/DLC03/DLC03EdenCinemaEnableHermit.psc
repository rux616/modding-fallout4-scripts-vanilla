Scriptname DLC03:DLC03EdenCinemaEnableHermit extends ObjectReference Hidden


Event OnLoad()
    if self.getCurrentLocation().isCleared()
    	self.EnableNoWait()
    endif
EndEvent