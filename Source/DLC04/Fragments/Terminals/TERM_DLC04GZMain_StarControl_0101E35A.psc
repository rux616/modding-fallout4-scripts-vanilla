;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Terminals:TERM_DLC04GZMain_StarControl_0101E35A Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
(akTerminalRef as DLC04:DLC04_GZStarControlTerminalScript).BootSequence1Ready = False
(akTerminalRef as DLC04:DLC04_GZStarControlTerminalScript).BootSequence1Completed = True
DLC04GZMainQuest.SetStage(80)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_12
Function Fragment_Terminal_12(ObjectReference akTerminalRef)
;BEGIN CODE
(akTerminalRef as DLC04:DLC04_GZStarControlTerminalScript).BootSequence1Ready = False
(akTerminalRef as DLC04:DLC04_GZStarControlTerminalScript).BootSequence1Completed = True
(akTerminalRef as DLC04:DLC04_GZStarControlTerminalScript).BootSequence2Ready = False
(akTerminalRef as DLC04:DLC04_GZStarControlTerminalScript).BootSequence2Completed = True
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC04GZMainQuest Auto Const Mandatory

Quest Property DLC04GZMiscObjective Auto Const Mandatory
