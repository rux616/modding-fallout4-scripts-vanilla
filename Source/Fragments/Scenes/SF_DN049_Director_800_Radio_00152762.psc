;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DN049_Director_800_Radio_00152762 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_06_End
Function Fragment_Phase_06_End()
;BEGIN CODE
;We've played the HostilePlayed line.
DN049_DirectorRadio_HostilePlayed.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_07_End
Function Fragment_Phase_07_End()
;BEGIN CODE
;Increment the radio count.
if (DN049_DirectorRadio_Count.GetValue() < 10)
     DN049_DirectorRadio_Count.Mod(1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_09_End
Function Fragment_Phase_09_End()
;BEGIN CODE
;Increment the radio count.
DN049_DirectorRadio_Count.Mod(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Phase_10_End
Function Fragment_Phase_10_End()
;BEGIN CODE
;Increment the radio count.
if (DN049_DirectorRadio_Count.GetValue() < 10)
     DN049_DirectorRadio_Count.Mod(1)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DN049_DirectorRadio_HostilePlayed Auto Const

GlobalVariable Property DN049_DirectorRadio_Count Auto Const
