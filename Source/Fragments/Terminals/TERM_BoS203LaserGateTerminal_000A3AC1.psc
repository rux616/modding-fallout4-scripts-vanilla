;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_BoS203LaserGateTerminal_000A3AC1 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
Default2StateActivator myDoor = akTerminalRef.GetLinkedRef() as Default2StateActivator
Default2StateActivator myDoor02 = myDoor.getLinkedRef() as Default2StateActivator
myDoor.IsAnimating = True
myDoor02.IsAnimating = True
myDoor.SetOpenNoWait(True)
myDoor02.SetOpenNoWait(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
Default2StateActivator myDoor = akTerminalRef.GetLinkedRef() as Default2StateActivator
Default2StateActivator myDoor02 = myDoor.getLinkedRef() as Default2StateActivator
myDoor.IsAnimating = True
myDoor02.IsAnimating = True
myDoor.SetOpenNoWait(False)
myDoor02.SetOpenNoWait(False)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment
