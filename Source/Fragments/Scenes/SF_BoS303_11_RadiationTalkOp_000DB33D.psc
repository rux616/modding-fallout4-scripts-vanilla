;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_BoS303_11_RadiationTalkOp_000DB33D Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_Begin
Function Fragment_Phase_02_Begin()
;BEGIN CODE
if BoS303RadX.GetValue() == 0
Game.GetPlayer().AddItem(RadX,2)
BoS303RadX.SetValue(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Potion Property RadX Auto Const

GlobalVariable Property BoS303RadX Auto Const
