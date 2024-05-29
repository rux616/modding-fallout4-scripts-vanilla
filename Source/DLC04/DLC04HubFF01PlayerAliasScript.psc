Scriptname DLC04:DLC04HubFF01PlayerAliasScript extends ReferenceAlias Conditional

; Properties
GlobalVariable Property DLC04FF01Global Auto Const Mandatory
Quest Property DLC04RaiderKickout Auto Const Mandatory
Quest Property DLC04SettlementFF01 Auto Const Mandatory
Quest Property DLC04DialogueSettlement Auto Const Mandatory
Location Property DLC04NukaTownUSALocation Auto Const Mandatory

Event OnLocationChange(Location akOldLoc, Location akNewLoc)
	debug.trace(self + "+++ DLC04FF01 received OnLocationChange from player")
	if !DLC04NukaTownUSALocation.IsChild(akOldLoc) && akNewLoc == DLC04NukaTownUSALocation && DLC04DialogueSettlement.GetStageDone(140)
	debug.trace(self + "+++ DLC04FF01 qualfied to start")
	; Player enters Nuka-Town location, but did not just leave a child of that location
	   	int FFRandom = Utility.RandomInt(1, 10)
	   	if DLC04FF01Global.GetValue() == 1 && DLC04RaiderKickout.GetStageDone(255) == False && FFRandom <= 3
	   		DLC04SettlementFF01.Start()
	   		debug.trace(self + "+++ Random check passed, DLC04FF01 has been started")
	   	ElseIf DLC04FF01Global.GetValue() == 0
	   		DLC04FF01Global.SetValue(1)
	   		debug.trace(self + "+++ DLC04FF01 did not start, but global was set to 1 if it was 0")
	   	endif
	endIf
endEvent	
