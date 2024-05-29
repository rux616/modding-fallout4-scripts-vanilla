;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_MassStateH_PowerTermina_000B0D2B Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
debug.trace("Terminal fragment start")
ObjectReference powerTerminal = akTerminalRef

ObjectReference EmergLight = powerTerminal.GetLinkedRef() 
EmergLight.PlayAnimation("Red")
EmergLight .GetLinkedRef().Activate(Game.GetPlayer())
EnableMarker.Enable()

debug.trace("Terminal fragment finish.")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property EnableMarker Auto Const

Keyword Property LinkCustom01 Auto Const
