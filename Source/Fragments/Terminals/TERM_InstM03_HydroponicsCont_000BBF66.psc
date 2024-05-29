;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_InstM03_HydroponicsCont_000BBF66 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
InstM03.SetStage(40)
;ObjectReference myDoor = akTerminalRef.getLinkedRef()
;myDoor.activate(akTerminalRef)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
;CURRENTLY UNUSED
;Blocked by a GetQuestRunning = 0 condition
;Keeping it here in case we want it later
InstM03.SetStage(45)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property InstM03 Auto Const
