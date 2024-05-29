;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_MinDefendCastleRadioAfter_00166AC6 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
; make sure to restart normal radio
MinutemenCentralQuest.UpdateRadioStationStatus()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Scene Property MinutemenRadioMainLoop Auto Const

minutemencentralscript Property MinutemenCentralQuest Auto Const
