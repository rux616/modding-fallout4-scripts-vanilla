Scriptname DLC04:DLC04MQ04OnUnloadRaiderDisable extends ReferenceAlias

Quest Property DLC04MQ04 Auto Const Mandatory
{Quest to check for completion}

Event OnUnload()
	;If the appropriate stages have been set on MQ04, disable this fella 
	if DLC04MQ04.GetStageDone(170) || DLC04MQ04.GetStageDone(180)
		ObjectReference myObj = GetRef()
		if !myObj.IsDisabled()
			myObj.Disable()
		endif
	endif
EndEvent