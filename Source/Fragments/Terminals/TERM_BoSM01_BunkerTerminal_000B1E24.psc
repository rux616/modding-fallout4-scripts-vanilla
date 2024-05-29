;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_BoSM01_BunkerTerminal_000B1E24 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
BoSM01BunkerDoorRef.Activate(DoorActivator)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
BoSM01BunkerDoorRef.Activate(DoorActivator)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ReferenceAlias property Companion auto Const

ObjectReference Property BoSM01BunkerDoorRef Auto Const

ObjectReference Property DoorActivator Auto Const
