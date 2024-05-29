;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04GZNukaGalaxy_Descent_0101EE3A Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN CODE
Debug.Trace("Descent Lights Enabled")
DLC04GZ_NukaGalaxyDescentEnableMarker.TurnOn(False)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

DLC04:DLC04_GZNukaGalaxyLightMarkerScript Property DLC04GZ_NukaGalaxyDescentEnableMarker Auto Const Mandatory
