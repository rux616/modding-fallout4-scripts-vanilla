;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Terminals:TERM_DLC01WorkshopResourceSc_01004463 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
SetResourceType(28, akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
SetResourceType(31, akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
SetResourceType(33, akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
SetResourceType(37, akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
SetResourceType(36, akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_06
Function Fragment_Terminal_06(ObjectReference akTerminalRef)
;BEGIN CODE
SetResourceType(38, akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
StopResourceTargetQuest(akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_08
Function Fragment_Terminal_08(ObjectReference akTerminalRef)
;BEGIN CODE
SetResourceType(29, akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_09
Function Fragment_Terminal_09(ObjectReference akTerminalRef)
;BEGIN CODE
SetResourceType(30, akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_10
Function Fragment_Terminal_10(ObjectReference akTerminalRef)
;BEGIN CODE
SetResourceType(39, akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_11
Function Fragment_Terminal_11(ObjectReference akTerminalRef)
;BEGIN CODE
SetResourceType(34, akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_13
Function Fragment_Terminal_13(ObjectReference akTerminalRef)
;BEGIN CODE
SetResourceType(35, akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_16
Function Fragment_Terminal_16(ObjectReference akTerminalRef)
;BEGIN CODE
SetResourceType(32, akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment


function StopResourceTargetQuest(ObjectReference terminalRef = NONE)
	DLC01WorkshopResourceParent.SendResourceTargetStopEvent(terminalRef, 1)
	; give quest a chance to stop before returning
	int failsafeCount = 0
	while terminalRef.GetValue(DLC01WorkshopResourceParent.DLC01WorkshopResourceTargetActive) == 1 && failsafeCount < 5
		debug.trace(self + " waiting for quest to stop...")
		utility.waitmenumode(1.0)
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
