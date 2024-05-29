ScriptName DLC02:DLC02TrapSawbladesHit Extends DLC02:DLC02WorkshopTrapHit
;
;	This extends the TrapHit script and handles telling the correct script to disarm
;
;=========================================

Function DoDisarm()
	DLC02TrapSawblades TrapSelf = ((self as objectReference) as DLC02TrapSawblades)
	if TrapSelf
		TrapSelf.DisarmTrap()
	endif
EndFunction