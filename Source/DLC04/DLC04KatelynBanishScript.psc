Scriptname DLC04:DLC04KatelynBanishScript extends ReferenceAlias
{Disables Katelyn and then re-enables her randomly if the player did not banish her}

GlobalVariable Property DLC04KatelynBanished Auto Const Mandatory
ObjectReference Property DLC04CaravanMerchantEnableMarker Auto Const Mandatory
Location Property DLC04NukaTownUSALocation Auto Const Mandatory
Quest Property DLC04DialogueSettlement Auto Const Mandatory

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	debug.trace(self + "+++ KatelynBanished script received OnLocationChange from player")
	int KatelynRandom = Utility.RandomInt(1, 10)
	if akOldLoc == DLC04NukaTownUSALocation && !DLC04NukaTownUSALocation.IsChild(akNewLoc)
	; Player leaves Nuka-Town location, but did not just enter one of its child locs
	   	if DLC04CaravanMerchantEnableMarker.IsDisabled() == False && DLC04DialogueSettlement.GetStageDone(90)
	   		debug.trace(self + "+++ Katelyn was disabled +++")
	   		DLC04CaravanMerchantEnableMarker.Disable()
	   		; If Katelyn and her brahmin are enabled, disable them
	   	elseif DLC04CaravanMerchantEnableMarker.IsDisabled() == True && DLC04KatelynBanished.GetValue() == 0 && KatelynRandom <= 3
	   		DLC04CaravanMerchantEnableMarker.Enable(0)
	   		; If Katelyn and her brahmin are disabled and she was not banished, 30% chance to enable
	   	endif
	endif
endEvent

