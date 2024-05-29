Scriptname DLC04:DLC04RadMisterControllerScript extends ObjectReference

;Kept as reference only
;Trigger volume is conditionalized so we don't have to check the global in script
;GlobalVariable Property DLC04_KK_RadMistersAreOn Auto Const Mandatory

Float Property RadiationTime = 15.0 Auto Const
float property ActivationDelay = 5.0 Auto Const
Keyword Property LinkCustom01 Auto Const Mandatory
GlobalVariable Property DLC04_KK_RadMistersAreOn Auto Const Mandatory

Group AnimVars collapsedOnRef
	string Property MistPlayAnim = "PlayAnimationLoop" Auto Const
	string Property MistStopAnim = "Reset" Auto Const
EndGroup

Group NoTouch CollapsedOnRef
	DLC04:DLC04KiddieKingdomMainQuestScript Property DLC04_KiddieKingdomMain Auto Const Mandatory
EndGroup

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			States
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Auto State Waiting
	Event OnTriggerEnter(ObjectReference akTriggerRef)
		GoToState("Busy")
	    DoMist(akTriggerRef)
	EndEvent
EndState

State Busy
EndState

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;			Events & Functions
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

Event OnTimer(int aiTimerID)
    if GetTriggerObjectCount() > 0 && DLC04_KK_RadMistersAreOn.GetValue() >= 1
    	DoMist(none)
    else
    	ObjectReference mistObject = GetLinkedRef()
    	While mistObject
			mistObject.PlayAnimation(MistStopAnim)
			mistObject = mistObject.GetLinkedRef()
		EndWhile
    	ObjectReference myRadRef = GetLinkedRef(LinkCustom01)
    	myRadRef.DisableNoWait()
    Endif
EndEvent


Function DoMist(ObjectReference akTriggerRef)
	ObjectReference myRadRef = GetLinkedRef(LinkCustom01)

	if myRadRef.isEnabled()
		CancelTimer()
	else
		ObjectReference mistObject = GetLinkedRef()
		While mistObject
			mistObject.PlayAnimation(MistPlayAnim)
			mistObject = mistObject.GetLinkedRef()
		EndWhile
		myRadRef.Enable()
	endif
	StartTimer(RadiationTime)
	if akTriggerRef == game.GetPlayer()
		DLC04_KiddieKingdomMain.RadMisterTrigger()
	endif
	utility.wait(ActivationDelay)
	GoToState("Waiting")
EndFunction

;Backup check for having the mist turned off
;	This is needed as the player could
Event OnCellAttach()
	if DLC04_KK_RadMistersAreOn.GetValue() == 0
		ObjectReference mistObject = GetLinkedRef()
    	While mistObject
			mistObject.PlayAnimation(MistStopAnim)
			mistObject = mistObject.GetLinkedRef()
		EndWhile
    	ObjectReference myRadRef = GetLinkedRef(LinkCustom01)
    	myRadRef.DisableNoWait()
	endif
EndEvent

;Script call to turn the mist off, called by quest
Function TurnOffMistFinal()
	ObjectReference mistObject = GetLinkedRef()
	While mistObject
		mistObject.PlayAnimation(MistStopAnim)
		mistObject = mistObject.GetLinkedRef()
	EndWhile
	ObjectReference myRadRef = GetLinkedRef(LinkCustom01)
	myRadRef.DisableNoWait()
EndFunction