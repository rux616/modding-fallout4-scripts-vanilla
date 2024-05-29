ScriptName DLC02:DLC02TrapPoweredSpringHit Extends DLC02:DLC02WorkshopTrapHit
;
;	This extends the TrapHit script and handles telling the correct script to disarm
;
;=========================================

Function DoDisarm()
	DLC02TrapPoweredSpring TrapSelf = ((self as objectReference) as DLC02TrapPoweredSpring)
	if TrapSelf
		TrapSelf.DisarmTrap()
	endif
EndFunction