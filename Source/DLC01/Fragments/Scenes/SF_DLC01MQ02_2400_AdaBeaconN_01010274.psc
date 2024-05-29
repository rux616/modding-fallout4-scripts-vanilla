;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC01:Fragments:Scenes:SF_DLC01MQ02_2400_AdaBeaconN_01010274 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN CODE
;Remove radar beacon from player inventory
Game.GetPlayer().RemoveItem(DLC01MQ01RadarBeacon, 1)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property DLC01MQ01RadarBeacon Auto Const Mandatory
