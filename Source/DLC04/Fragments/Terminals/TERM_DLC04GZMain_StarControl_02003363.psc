;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Terminals:TERM_DLC04GZMain_StarControl_02003363 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
Default2StateActivator myDoor = akTerminalRef.GetLinkedRef(LinkTerminalSwitchDoor) as Default2StateActivator
While (myDoor != None)
     myDoor.IsAnimating = True
     myDoor.SetOpenNoWait(False)
     ;Debug.Trace("Switch Door Terminal: Opening " + myDoor)
     myDoor = myDoor.GetLinkedRef(LinkTerminalSwitchDoor).GetLinkedRef(LinkTerminalSwitchDoor) as Default2StateActivator
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
if (DLC04GZMiscObjective.IsRunning())
     DLC04GZMiscObjective.SetStage(255)
EndIf

Default2StateActivator myDoor = akTerminalRef.GetLinkedRef(LinkTerminalSwitchDoor) as Default2StateActivator
While (myDoor != None)
     myDoor.IsAnimating = True
     myDoor.SetOpenNoWait(True)
     ;Debug.Trace("Switch Door Terminal: Opening " + myDoor)
     myDoor = myDoor.GetLinkedRef(LinkTerminalSwitchDoor).GetLinkedRef(LinkTerminalSwitchDoor) as Default2StateActivator
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkCustom01 Auto Const Mandatory

Keyword Property LinkTerminalSwitchDoor Auto Const Mandatory

Quest Property DLC04GZMiscObjective Auto Const Mandatory
