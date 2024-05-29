;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_InstMQ302ShaunTerminal_001848ED Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
DN136_Attack.SetStage(425)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
if MQ302Faction.GetValue() == 2
MQ302Min.SetObjectiveCompleted(450)
elseif MQ302Faction.GetValue() == 3
MQ302RR.SetObjectiveCompleted(450)
endif
MQ302.SetStage(450)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
MQ302.SetStage(460)
DN136_Attack.SetStage(400)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ302BoS Auto Const

Quest Property MQ302Min Auto Const

Quest Property MQ302RR Auto Const

GlobalVariable Property MQ302Faction Auto Const

Quest Property MQ302 Auto Const

GlobalVariable Property MQ302Evacuate Auto Const

Quest Property DN136_Attack Auto Const
