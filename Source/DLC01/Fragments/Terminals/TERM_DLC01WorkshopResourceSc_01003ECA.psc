;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Terminals:TERM_DLC01WorkshopResourceSc_01003ECA Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
StopResourceTargetQuest(akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

function StopResourceTargetQuest(ObjectReference terminalRef = NONE)
	DLC01WorkshopResourceParent.SendResourceTargetStopEvent(terminalRef, 1)
	; give quest a chance to stop before returning
	int failsafeCount = 0
	while terminalRef.GetValue(DLC01WorkshopResourceParent.DLC01WorkshopResourceTargetActive) == 1 && failsafeCount < 5
		utility.wait(1.0)
		failsafeCount += 1
	endWhile
EndFunction

function SetResourceType(int iNewType, ObjectReference terminalRef = NONE)
	debug.trace(self + " resourceType=" + iNewType)
	ObjectReference resourceMarker = DLC01WorkshopResourceParent.GetResourceMarker(iNewType)
	if resourceMarker
		if DLC01WorkshopEventResourceTarget.SendStoryEventAndWait(akLoc = NONE, akRef1 = resourceMarker, akRef2 = terminalRef)
			terminalRef.SetValue(DLC01WorkshopResourceParent.DLC01WorkshopResourceTargetActive, 1)
		else
			terminalRef.SetValue(DLC01WorkshopResourceParent.DLC01WorkshopResourceTargetActive, 0)
			DLC01WorkshopResourceTargetFailureMessage.Show()
		endif
	endif
EndFunction

Keyword Property DLC01WorkshopEventResourceTarget Auto Const mandatory

Keyword Property DLC01WorkshopEventResourceTargetStop Auto Const mandatory

DLC01:WorkshopResourceTargetParentScript Property DLC01WorkshopResourceParent auto const mandatory

Message Property DLC01WorkshopResourceTargetFailureMessage auto const mandatory
