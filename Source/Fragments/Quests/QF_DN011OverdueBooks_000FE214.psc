;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_DN011OverdueBooks_000FE214 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
Game.RewardPlayerXP(XPMiscQuestFinal.GetValueInt())
Game.GetPlayer().AddItem(DN011CompressedDataHolotape)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

GlobalVariable Property XPMiscQuestFinal Auto Const

MiscObject Property DN011CompressedDataHolotape Auto Const
