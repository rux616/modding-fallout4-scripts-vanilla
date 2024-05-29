;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_MS17HQSurgeryTerminal_000F0C5D Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
JailCell2.Unlock()
JailCell2.SetOpen()
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
JailCell1.Unlock()
JailCell1.SetOpen()

; Unlock the cell doors
pMS17.SetStage(465)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
JailCell3.Unlock()
JailCell3.SetOpen()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property pMS17 Auto Const
Quest Property pDialogueCovenant Auto Const

ObjectReference Property JailCell2 Auto Const

ObjectReference Property JailCell3 Auto Const

ObjectReference Property JailCell1 Auto Const
