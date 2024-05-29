;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_MQ106_FortHagenExtTermi_000BF415 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
Default2StateActivator myDoor = akTerminalRef.GetLinkedRef() as Default2StateActivator
if(BoS201.getStageDone(myStage) == FALSE)
   PrydwenRef.Enable()
   While(PrydwenRef.is3dLoaded() == FALSE)
       utility.wait(0.10)
   EndWhile
   BoS201.SetStage(myStage)
endif
While (myDoor != None)
     myDoor.IsAnimating = True
     myDoor.SetOpenNoWait(True)
     ;Debug.Trace("Switch Door Terminal: Opening " + myDoor)
     myDoor = myDoor.GetLinkedRef() as Default2StateActivator
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
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

ObjectReference Property PrydwenRef Auto Const

Quest Property BoS201 Auto Const

Int Property MyStage Auto Const
