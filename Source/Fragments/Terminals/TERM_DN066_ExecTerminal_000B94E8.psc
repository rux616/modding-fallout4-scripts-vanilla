;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN066_ExecTerminal_000B94E8 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_06
Function Fragment_Terminal_06(ObjectReference akTerminalRef)
;BEGIN CODE
if DN066AlertStatus.GetValue() == 0
DN066AlertStatus.SetValue(1)
COMMacCreadyQuest.SetStage(170)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DN066AlertStatus Auto Const

Quest Property COMMacCreadyQuest Auto Const
