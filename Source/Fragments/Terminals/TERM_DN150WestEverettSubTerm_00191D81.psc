;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Terminals:TERM_DN150WestEverettSubTerm_00191D81 Extends Terminal Hidden Const

;BEGIN FRAGMENT Fragment_Terminal_01
Function Fragment_Terminal_01(ObjectReference akTerminalRef)
;BEGIN CODE
if !InfectiousDiseaseResearchUnitMapMarker.isMapMarkerVisible()
	InfectiousDiseaseResearchUnitMapMarker.AddToMap()
Endif

If !Vault75MapMarker.isMapMarkerVisible()
	Vault75MapMarker.AddToMap()
Endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_03
Function Fragment_Terminal_03(ObjectReference akTerminalRef)
;BEGIN CODE
if !BostonMedicalCenterMapMarker.isMapMarkerVisible()
	BostonMedicalCenterMapMarker.AddToMap()
endif
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Terminal_05
Function Fragment_Terminal_05(ObjectReference akTerminalRef)
;BEGIN CODE
If !IrishPrideIndustriesShipyardMapMarker.isMapMarkerVisible()
	IrishPrideIndustriesShipyardMapMarker.AddToMap()

Endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

ObjectReference Property BostonMedicalCenterMapMarker Auto Const

ObjectReference Property InfectiousDiseaseResearchUnitMapMarker Auto Const

ObjectReference Property IrishPrideIndustriesShipyardMapMarker Auto Const

ObjectReference Property Vault75MapMarker Auto Const
