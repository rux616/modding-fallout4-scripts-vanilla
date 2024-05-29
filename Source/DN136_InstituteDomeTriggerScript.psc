ScriptName DN136_InstituteDomeTriggerScript extends ObjectReference
{script that simply activates the master script when player enters the trigger}

import debug

Group Required_Properties
	ObjectReference property myMasterRef auto const
EndGroup


;************************************

auto State Active
	Event OnTriggerEnter(ObjectReference akActionRef)
		if(akActionRef == game.GetPlayer())
			myMasterRef.activate(myMasterRef)
		endif
	EndEvent
EndState

;************************************

State Done
	;do nothing
	Event OnTriggerEnter(ObjectReference akActionRef)
	    ;do nothing
	EndEvent

	Event OnTriggerLeave(ObjectReference akActionRef)
	    ;do nothing
	EndEvent
EndState

;************************************