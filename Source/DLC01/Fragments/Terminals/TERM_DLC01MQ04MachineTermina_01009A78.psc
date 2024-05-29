;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Terminals:TERM_DLC01MQ04MachineTermina_01009A78 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
DLC01MQ04HackDone.SetValue(1)
if DLC01MQ04.IsObjectiveDisplayed(200) == 1
DLC01MQ04.SetObjectiveCompleted(200,1)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DLC01MQ04HackDone Auto Const Mandatory

Quest Property DLC01MQ04 Auto Const Mandatory
