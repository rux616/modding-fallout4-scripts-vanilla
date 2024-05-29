;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN109_TerminalClintSubI_0109F9CC Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
if !AtomCatGarageMapMarkerRef.IsMapMarkerVisible()
	AtomCatGarageMapMarkerRef.AddToMap()
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
if !QuincyQuarriesMapMarkerRef.IsMapMarkerVisible()
	QuincyQuarriesMapMarkerRef.AddToMap()
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
if !AtomatoysFactoryMapMarkerRef.IsMapMarkerVisible()
	AtomatoysFactoryMapMarkerRef.AddToMap()
Endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property AtomatoysFactoryMapMarkerRef Auto Const

ObjectReference Property QuincyQuarriesMapMarkerRef Auto Const

ObjectReference Property AtomCatGarageMapMarkerRef Auto Const
