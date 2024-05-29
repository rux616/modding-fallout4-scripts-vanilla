;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN066_TerminalLabDoorsS_000CF5DD Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
Default2StateActivator myAlarm = DN066_LockKlaxon as Default2StateActivator

Default2StateActivator myDoor = akTerminalRef.GetLinkedRef(LinkCustom01) as Default2StateActivator
While (myDoor != None)
     myDoor.IsAnimating = True
     myDoor.SetOpenNoWait(True)
     ;Debug.Trace("Switch Door Terminal: Opening " + myDoor)
     myDoor = myDoor.GetLinkedRef(LinkTerminalSwitchDoor) as Default2StateActivator
EndWhile

DN066WinShutter01.PlayAnimation("Play01")
DN066WinShutter02.PlayAnimation("Play01")
DN066WinShutter03.PlayAnimation("Play01")
DN066WinShutter04.PlayAnimation("Play01")
DN066WinShutter05.PlayAnimation("Play01")
DN066WinShutter06.PlayAnimation("Play01")

myAlarm.Activate(myAlarm)
Utility.Wait(20)
myAlarm.Activate(myAlarm)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkTerminalSwitchDoor Auto Const

ObjectReference Property DN066LabDoor01 Auto Const

ObjectReference Property DN066LabDoor02 Auto Const

ObjectReference Property DN066LabDoor03 Auto Const

ObjectReference Property DN066LabDoor04 Auto Const

ObjectReference Property DN066WinShutter01 Auto Const

ObjectReference Property DN066WinShutter02 Auto Const

ObjectReference Property DN066WinShutter03 Auto Const

ObjectReference Property DN066WinShutter04 Auto Const

ObjectReference Property DN066WinShutter05 Auto Const

ObjectReference Property DN066WinShutter06 Auto Const

ObjectReference Property DN066_LockKlaxon Auto Const

Keyword Property LinkCustom01 Auto Const
