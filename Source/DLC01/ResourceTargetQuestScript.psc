Scriptname DLC01:ResourceTargetQuestScript extends Quest

DLC01:WorkshopResourceTargetParentScript Property DLC01WorkshopResourceTargetParent Auto Const Mandatory

ReferenceAlias Property Alias_WorkshopObject Auto Const Mandatory

ReferenceAlias Property Alias_EyeBot Auto Const Mandatory

int property StopScanStage = 50 auto Const
{ stage to set when terminal requests stopping active scan }

int property CompleteStage = 100 auto Const
{ stage set when objectives are complete }

int iShutDownTimerID = 1 Const
float fShutDownTimerTime = 2.0 Const

Event OnQuestInit()
	debug.trace(self + " OnQuestInit")
	RegisterForCustomEvent(DLC01WorkshopResourceTargetParent, "DLC01ResourceTargetStopEvent")
	; assign eyebot as owner of scanner (so it can use furniture markers)
	WorkshopObjectScript scanner = Alias_WorkshopObject.GetRef() as WorkshopObjectScript
	if scanner
		debug.trace(self + "  setting furniture marker ownership to " + Alias_EyeBot.GetActorRef())
		scanner.SetFurnitureMarkerOwnership(Alias_EyeBot.GetActorRef())
		; enable eyebot - should init into furniture
		Alias_EyeBot.TryToEnable()
;		utility.wait(1.0)
		; open pod
		(Alias_WorkshopObject.GetRef() as DLC01:WorkshopResourceScannerScript).OpenPod(true)
	endif
endEvent

Event DLC01:WorkshopResourceTargetParentScript.DLC01ResourceTargetStopEvent(DLC01:WorkshopResourceTargetParentScript akSender, Var[] akArgs)
	ObjectReference stopRef = akArgs[0] as ObjectReference
	int eventType = akArgs[1] as int
	Debug.Trace(self + " DLC01ResourceTargetStopEvent event received from " + stopRef)
	if stopRef && stopRef == Alias_WorkshopObject.GetRef()
		if eventType == 1
			; stop active scan
			SetStage(StopScanStage)
			stopRef.SetValue(DLC01WorkshopResourceTargetParent.DLC01WorkshopResourceTargetActive, 2)
		else
			; stop quest completely
			Stop()
		endif
	endif
EndEvent

function EyebotReturns()
	debug.trace(self + " EyebotReturns")
	; close pod
	(Alias_WorkshopObject.GetRef() as DLC01:WorkshopResourceScannerScript).OpenPod(false)

	; if quest complete, OR, scan was stopped, run timer to shut it down
	if GetStageDone(StopScanStage) || GetStageDone(CompleteStage)
		debug.trace(self + " EyebotReturns: shutting down in " + fShutDownTimerTime + " seconds")
		StartTimer(fShutDownTimerTime, iShutDownTimerID)
	endif		
endFunction

Event OnTimer(int aiTimerID)
	debug.trace(self + " OnTimer " + aiTimerID)
    if aiTimerID == iShutDownTimerID
    	debug.trace(self + " shutting down...")
    	Stop()
    endif
EndEvent