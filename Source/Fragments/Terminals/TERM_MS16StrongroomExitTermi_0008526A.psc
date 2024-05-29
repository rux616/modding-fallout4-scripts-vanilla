;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_MS16StrongroomExitTermi_0008526A Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
pMS16NHMSecurityGate.setOpen(True)
pMS16NHMSecurityDoor.unlock()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
pMS16NHMSecurityGate.setOpen(false)
pMS16NHMSecurityDoor.lock()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property pMS16NHMSecurityGate Auto Const

ObjectReference Property pMS16NHMSecurityDoor Auto Const
