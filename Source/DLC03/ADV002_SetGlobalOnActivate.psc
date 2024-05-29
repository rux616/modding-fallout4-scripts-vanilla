Scriptname DLC03:ADV002_SetGlobalOnActivate extends ObjectReference Const

GlobalVariable Property ADV002_GhoulMoveGlobal Auto Const mandatory

Float Property ChangeGlobalTo Auto Const mandatory

Event OnActivate(ObjectReference akActionRef)
    
	debug.trace("ADV002_GhoulMoveGlobal = " + ADV002_GhoulMoveGlobal.getvalue() )
	ADV002_GhoulMoveGlobal.SetValue(ChangeGlobalTo)
	debug.trace("ADV002_GhoulMoveGlobal now = " + ADV002_GhoulMoveGlobal.getvalue())

EndEvent
