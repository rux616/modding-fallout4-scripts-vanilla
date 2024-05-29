Scriptname CastleRadioTransmitterScript extends ObjectReference
{script for radio transmitter at the Castle
used for Min02}

bool Property bRepaired = false Auto

bool Property DebugAlwaysOn = false Auto
{ set to true to treat the radio station as always operational - ignoring power, damage, NPC assignment, etc. 
  used for quickstarting the radio station
}

Event OnInit()
	if bRepaired == false
	    ; starts destroyed
	    DamageObject(9999.0)
	    SetDestroyed(true)
	endif
EndEvent

function RepairMe(bool bDebugAlwaysOn = false)
	bRepaired = true
	ClearDestruction()
	SetDestroyed(false)
	; debug state to force station to consider itself always on
	DebugAlwaysOn = bDebugAlwaysOn
endfunction