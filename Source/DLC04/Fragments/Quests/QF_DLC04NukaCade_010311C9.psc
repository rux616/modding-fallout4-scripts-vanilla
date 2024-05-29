;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04NukaCade_010311C9 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0050_Item_00
Function Fragment_Stage_0050_Item_00()
;BEGIN CODE
If GetStageDone(20) == 1
Game.GetPlayer().AddItem(DLC04_Nukacade_Token01,1)
ElseIf GetStageDone(30) == 1
Game.GetPlayer().AddItem(DLC04_Nukacade_Token01,2)
ElseIf GetStageDone(40) == 1
Game.GetPlayer().AddItem(DLC04_Nukacade_Token01,3)
EndIf
SetStage(100)
;END CODE
EndFunction
;END FRAGMENT

;BEGIN FRAGMENT Fragment_Stage_1000_Item_00
Function Fragment_Stage_1000_Item_00()
;BEGIN CODE
;Add Nukacade Ticket Achievement
game.AddAchievement(80)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

MiscObject Property DLC04_Nukacade_Token01 Auto Const Mandatory
