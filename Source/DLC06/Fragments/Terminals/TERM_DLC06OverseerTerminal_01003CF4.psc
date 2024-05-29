;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC06:Fragments:Terminals:TERM_DLC06OverseerTerminal_01003CF4 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
(pDLC06OverseerHandler as DLC06:DLC06OverseerHandlerScript).FillVariables(akTerminalREF)
(pDLC06OverseerHandler as DLC06:DLC06OverseerHandlerScript).CurrentJob(0)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
(pDLC06OverseerHandler as DLC06:DLC06OverseerHandlerScript).FillVariables(akTerminalREF)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
; Pass the terminal to the Companion Tracker
pDLC06CompanionTracker.SetTerminal(akTerminalREF)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pDLC06OverseerHandler Auto Const Mandatory

DLC06:DLC06CompanionTrackerScript Property pDLC06CompanionTracker Auto Const Mandatory
