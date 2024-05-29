;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Terminals:TERM_DLC03_V118_ExteriorTerm_01053EDF Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
if !NationalParkHQMapMarker.IsMapMarkerVisible()
	NationalParkHQMapMarker.AddToMap()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
if !DLC03AcadiaMapMarker.IsMapMarkerVisible()
	DLC03AcadiaMapMarker.AddToMap()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
if !DLC03AlderseaDaySpaMapMarker.IsMapMarkerVisible()
	DLC03AlderseaDaySpaMapMarker.AddToMap()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
if !DLC03VimPopHQMapMarker.IsMapMarkerVisible()
	DLC03VimPopHQMapMarker.AddToMap()
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property NationalParkHQMapMarker Auto Const Mandatory

ObjectReference Property DLC03AlderseaDaySpaMapMarker Auto Const Mandatory

ObjectReference Property DLC03AcadiaMapMarker Auto Const Mandatory

ObjectReference Property DLC03VimPopHQMapMarker Auto Const Mandatory
