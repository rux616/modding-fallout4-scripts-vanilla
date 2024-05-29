;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Terminals:TERM_DLC04BottlingPlantTermi_01048641 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
DLC04PowerOffActivator.Activate(DLC04PowerOffActivator)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
Default2StateActivator myDoor = akTerminalRef.GetLinkedRef() as Default2StateActivator
While (myDoor != None)
     myDoor.IsAnimating = True
     myDoor.SetOpenNoWait(True)
     ;Debug.Trace("Switch Door Terminal: Opening " + myDoor)
     myDoor = myDoor.GetLinkedRef() as Default2StateActivator
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
Default2StateActivator myDoor = akTerminalRef.GetLinkedRef() as Default2StateActivator
While (myDoor != None)
     myDoor.IsAnimating = True
     myDoor.SetOpenNoWait(False)
     ;Debug.Trace("Switch Door Terminal: Opening " + myDoor)
     myDoor = myDoor.GetLinkedRef() as Default2StateActivator
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC04PowerOffActivator Auto Const Mandatory
