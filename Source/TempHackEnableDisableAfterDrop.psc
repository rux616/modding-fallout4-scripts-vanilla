Scriptname TempHackEnableDisableAfterDrop extends ObjectReference Hidden Const
{HACK Work around for persistant objects not having 3D when dropped}

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
    if akOldContainer == Game.GetPlayer()
    	disable()
    	enable()

    endif
EndEvent