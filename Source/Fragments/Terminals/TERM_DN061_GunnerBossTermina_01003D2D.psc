;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN061_GunnerBossTermina_01003D2D Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
if !LongneckLukowskisMapMarker.IsMapMarkerVisible()
	LongneckLukowskisMapMarker.AddToMap()
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
if !DunwichBorersMapMarker.IsMapMarkerVisible()
	DunwichBorersMapMarker.AddToMap()
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
if !RevereBeachStationMapMarker.IsMapMarkerVisible()
	RevereBeachStationMapMarker.AddToMap()
Endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DunwichBorersMapMarker Auto Const

ObjectReference Property LongneckLukowskisMapMarker Auto Const

ObjectReference Property RevereBeachStationMapMarker Auto Const
