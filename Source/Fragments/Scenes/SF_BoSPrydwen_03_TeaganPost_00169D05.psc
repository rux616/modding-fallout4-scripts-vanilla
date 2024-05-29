;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_BoSPrydwen_03_TeaganPost_00169D05 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_05_End
Function Fragment_Phase_05_End()
;BEGIN CODE
if BoSPostTeagan.GetValue() == 0
BoSPostTeagan.SetValue(1)
Game.GetPlayer().AddItem(Whiskey,1)
BoSEndgateTeagan.SetValue(0)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BoSPostTeagan Auto Const

Potion Property Whiskey Auto Const

GlobalVariable Property BoSEndgateTeagan Auto Const
