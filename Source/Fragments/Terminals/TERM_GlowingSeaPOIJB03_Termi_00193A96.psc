;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_GlowingSeaPOIJB03_Termi_00193A96 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
FeralGhoulEnableMarker.enable()
Default2StateActivator myDoor = akTerminalRef.GetLinkedRef(LinkCustom01) as Default2StateActivator
While (myDoor != None)
     myDoor.IsAnimating = True
     myDoor.SetOpenNoWait(True)
     myDoor = myDoor.GetLinkedRef(LinkCustom01) as Default2StateActivator
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
Default2StateActivator myDoor = akTerminalRef.GetLinkedRef(LinkCustom01) as Default2StateActivator
While (myDoor != None)
     myDoor.IsAnimating = True
     myDoor.SetOpenNoWait(False)
     myDoor = myDoor.GetLinkedRef(LinkCustom01) as Default2StateActivator
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkTerminalSwitchDoor Auto Const

ObjectReference Property FeralGhoulEnableMarker Auto Const

Keyword Property LinkCustom01 Auto Const
