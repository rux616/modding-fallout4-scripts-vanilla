Scriptname containerOpenIfEmpty extends ObjectReference Const

Event OnLoad()
	debug.trace("Container: onLoad caught for "+self)
	if getBaseObject() is Container
    	if getItemCount() == 0
	    	self.playGamebryoanimation("Open")
    		debug.trace("Container: setOpen! "+self)
    	endif
    endif
EndEvent

Event OnClose(ObjectReference akActionRef)
	debug.trace("Container: onClose caught for "+self)
	if getBaseObject() is Container
	    if getItemCount() == 0
	    	self.playGamebryoanimation("Open")
	    	debug.trace("Container: setOpen! "+self)
	    else
	    	self.playGamebryoanimation("Close")
	    	debug.trace("Container: setOpen FALSE! "+self)
	    endif
    endif
EndEvent