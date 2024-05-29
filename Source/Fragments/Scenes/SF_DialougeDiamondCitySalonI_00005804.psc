;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_DialougeDiamondCitySalonI_00005804 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Begin
Function Fragment_Begin()
;BEGIN CODE
;shut down random conversations while scene plays
;debug.trace(self + "shut down random conversations while scene plays")
;pDisableDmndConv.SetValue(1)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_End
Function Fragment_End()
;BEGIN CODE
;enable random conversations when scene finishes
;debug.trace(self + " enable random conversations when scene finishes")
;pDisableDmndConv.SetValue(0)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property pDisableDmndConv Auto Const
