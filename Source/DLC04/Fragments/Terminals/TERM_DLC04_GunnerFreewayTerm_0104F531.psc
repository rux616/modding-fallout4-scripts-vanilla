;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Terminals:TERM_DLC04_GunnerFreewayTerm_0104F531 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
if !DLC04BottlingPlantMapMarkerRef.IsMapMarkerVisible()
	DLC04BottlingPlantMapMarkerRef.AddToMap()
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_02
Function Fragment_Terminal_02(ObjectReference akTerminalRef)
;BEGIN CODE
if !DLC04KiddieKingdomMapMarkerRef.IsMapMarkerVisible()
	DLC04KiddieKingdomMapMarkerRef.AddToMap()
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
if !DLC04BradbertonMapMarkerRef.IsMapMarkerVisible()
	DLC04BradbertonMapMarkerRef.AddToMap()
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_04
Function Fragment_Terminal_04(ObjectReference akTerminalRef)
;BEGIN CODE
if !DLC04NukaTownUSAMapMarkerRef.IsMapMarkerVisible()
	DLC04NukaTownUSAMapMarkerRef.AddToMap()
Endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property DLC04BottlingPlantMapMarkerRef Auto Const Mandatory

ObjectReference Property DLC04KiddieKingdomMapMarkerRef Auto Const Mandatory

ObjectReference Property DLC04BradbertonMapMarkerRef Auto Const Mandatory

ObjectReference Property DLC04NukaTownUSAMapMarkerRef Auto Const Mandatory
