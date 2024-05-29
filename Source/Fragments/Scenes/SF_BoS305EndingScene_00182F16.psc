;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_BoS305EndingScene_00182F16 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_07_End
Function Fragment_Phase_07_End()
;BEGIN CODE
if BoSJetPackGiven.GetValue() == 0
Game.GetPlayer().AddItem(pa_comp_T60_Torso_Misc_Jetpack,1)
BoSJetPackGiven.SetValue(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property BoSJetPackGiven Auto Const

MiscObject Property pa_comp_T60_Torso_Misc_Jetpack Auto Const
