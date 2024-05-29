;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC06:Fragments:Scenes:SF_DLC06VaultWorkshopRadioBe_01004ACA Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_04_End
Function Fragment_Phase_04_End()
;BEGIN CODE
; pick next track
int track = DLC06WorkshopRadioBeaconMusic.GetValueInt() + 1
if track > 3
  track = 0
endif
DLC06WorkshopRadioBeaconMusic.SetValue(track)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property DLC06WorkshopRadioBeaconMusic Auto Const Mandatory
