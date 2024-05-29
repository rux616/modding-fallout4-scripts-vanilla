Scriptname DLC02:DLC02SwitchScript extends ObjectReference Const
{turns switch off or on when object unloads}

bool property TurnON = false auto Const
{ TRUE = turn ON; FALSE = turn OFF }

Event OnUnload()
	; CLOSED = ON    
    if TurnON
    	SetOpen(false)
    else
    	SetOpen(true)
    endif
EndEvent