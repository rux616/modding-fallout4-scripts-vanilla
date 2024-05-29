;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_MQ206HolotapeTerminalEn_00136332 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
; Player has read the message
pRR201.SetStage(150)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
MQ207.SetStage(5)
if BoS202.GetStageDone(255) == 1 && MQ206TeleporterFaction.GetValue() != 1
BoSMQPortAlreadyDone.SetValue(1)
BoS203.SetStage(10)
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_07
Function Fragment_Terminal_07(ObjectReference akTerminalRef)
;BEGIN CODE
; Player has read the message
pRR201.SetStage(200)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property MQ207 Auto Const

ObjectReference Property MQ207TeleportDoorRef001 Auto Const

Quest Property pRR201 Auto Const

Quest Property BoS204 Auto Const

Quest Property BoS202 Auto Const

Quest Property BoS203 Auto Const

GlobalVariable Property MQ206TeleporterFaction Auto Const

GlobalVariable Property BoSMQPortAlreadyDone Auto Const
