;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM__01002887 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
DN102.SetStage(80)
ObjectReference obj = DN102_DeconHallwayEnableMarker
While (obj != None)
     obj.DisableNoWait(True)
     obj = obj.GetLinkedRef()
EndWhile
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DN102 Auto Const

ObjectReference Property DN102_DeconHallwayEnableMarker Auto Const
