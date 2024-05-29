;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_BoSM01_BunkerTerminalDo_00133E5E Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
BoSM01BunkerDoorRef.isAnimating = True
BoSM01BunkerDoorRef.SetOpenNoWait(True)
BoSM01.SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property BoSM01 Auto Const

Default2StateActivator Property BoSM01BunkerDoorRef Auto Const
