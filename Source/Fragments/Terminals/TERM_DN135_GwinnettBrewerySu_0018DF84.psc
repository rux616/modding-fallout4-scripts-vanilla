;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN135_GwinnettBrewerySu_0018DF84 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
if !ShamrockTaphouseMapMarker.IsMapMarkerVisible()
	ShamrockTaphouseMapMarker.AddToMap()
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
if !GoodneighborMapMarker.IsMapMarkerVisible()
	GoodneighborMapMarker.AddToMap()
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
if !DiamondCityMapMarker.IsMapMarkerVisible()
	DiamondCityMapMarker.AddToMap()
Endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property ShamrockTaphouseMapMarker Auto Const

ObjectReference Property GoodneighborMapMarker Auto Const

ObjectReference Property DiamondCityMapMarker Auto Const
