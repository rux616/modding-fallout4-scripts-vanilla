Scriptname DLC01:WorkshopResourceScannerScript extends ObjectReference

DLC01:WorkshopResourceTargetParentScript Property DLC01WorkshopResourceParent auto const mandatory

int iOpenPodTimerID = 1 const
float fOpenPodTimerTime = 1.0 const

; called by running resource target quest - clears 'active scan' state
function ReadyToScan()
	SetValue(DLC01WorkshopResourceParent.DLC01WorkshopResourceTargetActive, 0)
	OpenPod(false)
endFunction

Event OnWorkshopObjectDestroyed(ObjectReference akActionRef)
	; send "stop quest" event for this terminal
	DLC01WorkshopResourceParent.SendResourceTargetStopEvent(self, 2)
endEvent

; function to make sure pod is in correct state
function OpenPod(bool bOpen)
	bool bSuccess = false
	if bOpen
		; close pod
		bSuccess = PlayAnimation("OpenPod")
	else
		; close pod
		bSuccess = PlayAnimation("ClosePod")
	endif
	if bSuccess == false
		; animation failed - run timer
		StartTimer(fOpenPodTimerTime, iOpenPodTimerID)
	endif
endFunction

Event OnTimer(int aiTimerID)
    if aiTimerID == iOpenPodTimerID
    	; make sure pod is in correct state
    	if GetValue(DLC01WorkshopResourceParent.DLC01WorkshopResourceTargetActive) > 0
    		PlayAnimation("OpenPod")
    	else
    		PlayAnimation("ClosePod")
    	endif
    endif
EndEvent