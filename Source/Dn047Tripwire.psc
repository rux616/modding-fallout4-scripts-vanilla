Scriptname DN047Tripwire extends ObjectReference 

Group AnimNames CollapsedOnRef
	String Property TriggerAnim = "Trip" auto
	;String Property TriggerEvent = "TransitionComplete" auto
	;String Property ResetAnim = "Stage1" auto
	;String Property ResetEvent = "TransitionComplete" auto
	;String Property DisarmAnim = "stage1" auto
	;String Property DisarmEvent = "TransitionComplete" auto
EndGroup

;==================================================
;		Events Block
;==================================================

Event OnReset()
    self.setdestroyed(false)
    reset()
EndEvent

;==================================================
;		Events Block
;==================================================

Auto state Active
	Event OnTriggerEnter(ObjectReference akActionRef)
		debug.Trace(self + ": Entered by >> " + akActionRef)
		playAnimation(TriggerAnim)
		self.Activate(self, true)
		gotostate("Inactive")
	EndEvent

	Event onActivate(objectReference akActivator)
		debug.Trace(self + ": Activated by >> " + akActivator)
		playAnimation(TriggerAnim)
		gotostate("Inactive")
	EndEvent
EndState

state Inactive
	Event OnBeginState(string asOldState)
	    self.setdestroyed(true)
	EndEvent
EndState

