;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Scenes:SF_DLC04GZNukaGalaxy_PrePowe_010383EF Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
DLC04GZ_NukaGalaxyAirlockDoor.SetOpen(False)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_Begin
Function Fragment_Phase_01_Begin()
;BEGIN CODE
DLC04GZ_NukaGalaxyAirlockDoor.SetOpen(True)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_01_End
Function Fragment_Phase_01_End()
;BEGIN CODE
DLC04GZ_NukaGalaxyAirlockDoor.SetOpen(False)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Default2StateActivator Property DLC04GZ_NukaGalaxyAirlockDoor Auto Const Mandatory
