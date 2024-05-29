ScriptName DLC02:DLC02TrapSpikesHit Extends DLC02:DLC02WorkshopTrapHit
;
;	This extends the TrapHit script and handles telling the correct script to disarm
;
;=========================================

Function DoDisarm()
	DLC02TrapSpikes TrapSelf = ((self as objectReference) as DLC02TrapSpikes)
	if TrapSelf
		TrapSelf.DisarmTrigger(NONE)
	endif
EndFunction