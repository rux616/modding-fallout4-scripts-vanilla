;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN066WallTerminalLabDoo_00100D50 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
Default2StateActivator myDoor01 = DN066LabDoor01 as Default2StateActivator
Default2StateActivator myDoor02 = DN066LabDoor02 as Default2StateActivator
Default2StateActivator myDoor03 = DN066LabDoor03 as Default2StateActivator
Default2StateActivator myDoor04 = DN066LabDoor04 as Default2StateActivator

myDoor01.SetOpenNoWait(True)
myDoor02.SetOpenNoWait(True)
myDoor03.SetOpenNoWait(True)
myDoor04.SetOpenNoWait(True)

DN066WinShutter01.PlayAnimation("Play01")
DN066WinShutter02.PlayAnimation("Play01")
DN066WinShutter03.PlayAnimation("Play01")
DN066WinShutter04.PlayAnimation("Play01")
DN066WinShutter05.PlayAnimation("Play01")
DN066WinShutter06.PlayAnimation("Play01")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DN066LabDoor01 Auto Const

ObjectReference Property DN066LabDoor02 Auto Const

ObjectReference Property DN066LabDoor03 Auto Const

ObjectReference Property DN066WinShutter01 Auto Const

ObjectReference Property DN066WinShutter02 Auto Const

ObjectReference Property DN066WinShutter03 Auto Const

ObjectReference Property DN066WinShutter04 Auto Const

ObjectReference Property DN066WinShutter05 Auto Const

ObjectReference Property DN066WinShutter06 Auto Const
ObjectReference Property DN066LabDoor04 Auto Const
