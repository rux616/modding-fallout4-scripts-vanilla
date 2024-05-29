;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM__010087C2 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
;Set 'Override Safety Protocols' flag.
DN017_EngineCoreFacilitiesRoomTerminalRef.SetValue(TerminalVariable01, 1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
;Start test fire.
DN017.SetStage(90)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DN017 Auto Const

ActorValue Property TerminalVariable01 Auto Const

ObjectReference Property DN017_EngineCoreFacilitiesRoomTerminalRef Auto Const
