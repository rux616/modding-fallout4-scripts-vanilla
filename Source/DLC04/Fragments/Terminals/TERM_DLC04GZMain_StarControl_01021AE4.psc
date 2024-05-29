;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Terminals:TERM_DLC04GZMain_StarControl_01021AE4 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
Default2StateActivator displayCase = akTerminalRef.GetLinkedRef() as Default2StateActivator
if (displayCase != None)
     displayCase.IsAnimating = True
     displayCase.SetOpenNoWait(False)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
if (DLC04GZMiscObjective.IsRunning())
     DLC04GZMiscObjective.SetStage(255)
EndIf

Default2StateActivator displayCase = akTerminalRef.GetLinkedRef() as Default2StateActivator
if (displayCase != None)
     displayCase.IsAnimating = True
     displayCase.SetOpenNoWait(True)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkCustom01 Auto Const Mandatory

Keyword Property LinkTerminalSwitchDoor Auto Const Mandatory

Quest Property DLC04GZMiscObjective Auto Const Mandatory
