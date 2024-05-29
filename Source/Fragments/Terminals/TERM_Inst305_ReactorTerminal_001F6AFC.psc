;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_Inst305_ReactorTerminal_001F6AFC Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
RadiationMarker.Enable()
ReactorDoor.SetOpen(False)
ReactorDoor.SetLockLevel(254)
ReactorRef.PlayAnimation("starton01")
(Inst305 as Inst305QuestScript).Inst305ReactorReady=2
Inst305.SetStage(80)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property RadiationMarker Auto Const

ObjectReference Property ReactorDoor Auto Const

ObjectReference Property ReactorRef Auto Const

Quest Property Inst305 Auto Const
