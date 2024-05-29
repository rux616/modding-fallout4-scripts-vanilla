;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_LegendaryChanceQuest_00165570 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0100_Item_00
Function Fragment_Stage_0100_Item_00()
;BEGIN CODE
if game.GetPlayer().GetLevel() > 50
     ChanceLegendary.SetValue(20)
elseif game.GetPlayer().GetLevel() > 40
     ChanceLegendary.SetValue(18)
elseif game.GetPlayer().GetLevel() > 30
     ChanceLegendary.SetValue(15)
elseif game.GetPlayer().GetLevel() > 20
     ChanceLegendary.SetValue(12)
elseif game.GetPlayer().GetLevel() > 5
     ChanceLegendary.SetValue(10)
endif

stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property ChanceLegendary Auto Const
