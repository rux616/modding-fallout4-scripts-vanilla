;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN066_AirlockTerminal01_000B75D6 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
COMMacContainDoor01Ref.SetOpen(True)
COMMacContainDoor02Ref.SetOpen(True)
DN066DoorStatus.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property COMMacContainDoor01Ref Auto Const

ObjectReference Property COMMacContainDoor02Ref Auto Const

GlobalVariable Property DN066DoorStatus Auto Const
