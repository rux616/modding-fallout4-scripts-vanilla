;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC03:Fragments:Quests:QF_DLC03DialogueKasumi_0102BBDB Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
If DLC03MQ03.IsRunning()
  DLC03MQ03.SetStage(1000)
EndIf

Game.GetPlayer().AddItem(Caps001, 500)
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC03MQ03 Auto Const Mandatory

GlobalVariable Property DLC03KasumiPays Auto Const Mandatory

MiscObject Property Caps001 Auto Const Mandatory
