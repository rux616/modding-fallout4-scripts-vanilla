ScriptName DLC02:DLC02TrapSpringHit Extends DLC02:DLC02WorkshopTrapHit
;
;	This extends the TrapHit script and handles telling the correct script to disarm
;
;=========================================

Function DoDisarm()
	DLC02TrapSpring TrapSelf = ((self as objectReference) as DLC02TrapSpring)
	if TrapSelf
		TrapSelf.DisarmTrigger(NONE)
	endif
EndFunction