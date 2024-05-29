;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname DLC04:Fragments:Quests:QF__02009D72 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0000_Item_00
Function Fragment_Stage_0000_Item_00()
;BEGIN CODE
DLC04GZMainQuest.Start()
Debug.Trace("Started Main")
DLC04GZNukaGalaxy.Start()
Debug.Trace("Started Galaxy")
DLC04GZVaultTec.Start()
Debug.Trace("Started Vault-Tec")
DLC04GZBattlezone.Start()
Debug.Trace("Started Battlezone")
Stop()
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property DLC04GZMainQuest Auto Const Mandatory

Quest Property DLC04GZNukaGalaxy Auto Const Mandatory

Quest Property DLC04GZVaultTec Auto Const Mandatory

Quest Property DLC04GZBattlezone Auto Const Mandatory
