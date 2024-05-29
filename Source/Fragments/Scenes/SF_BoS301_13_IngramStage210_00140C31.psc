;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Scenes:SF_BoS301_13_IngramStage210_00140C31 Extends Scene Hidden Const

;BEGIN FRAGMENT Fragment_Phase_02_End
Function Fragment_Phase_02_End()
;BEGIN CODE
if BoS301Reward.GetValue() == 0
Game.GetPlayer().AddItem(pa_comp_T60_Torso_Misc_HPRegen,1)
BoS301Reward.SetValue(1)
endif
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property pa_comp_T60_Torso_Misc_HPRegen Auto Const

GlobalVariable Property BoS301Reward Auto Const
