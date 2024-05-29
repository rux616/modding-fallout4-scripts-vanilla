;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF_DLC04GZLocationLoaded_0104A087 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
DLC04GZMainQuest.Start()
DLC04GZNukaGalaxy.Start()
DLC04GZVaultTec.Start()
DLC04GZBattlezone.Start()
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC04GZMainQuest Auto Const Mandatory

Quest Property DLC04GZNukaGalaxy Auto Const Mandatory

Quest Property DLC04GZVaultTec Auto Const Mandatory

Quest Property DLC04GZBattlezone Auto Const Mandatory
