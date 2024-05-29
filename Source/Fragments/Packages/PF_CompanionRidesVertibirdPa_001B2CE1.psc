;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Packages:PF_CompanionRidesVertibirdPa_001B2CE1 Extends Package Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin(Actor akActor)
;BEGIN CODE
ObjectReference vbird = akActor.GetLinkedRef(LinkVehicle)
debug.trace( akActor +  " snapping into bird " + vbird )
; SnapIntoInteraction only works in the loaded area
if( akActor.Is3DLoaded() )
	akActor.SnapIntoInteraction(Vbird)
else
	akActor.Disable()
	akActor.MoveTo(vbird)
	akActor.Enable()
endIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Keyword Property LinkVehicle Auto Const
