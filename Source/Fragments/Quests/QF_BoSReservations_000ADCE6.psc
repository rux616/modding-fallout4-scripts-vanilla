;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Quests:QF_BoSReservations_000ADCE6 Extends Quest Hidden Const

;BEGIN FRAGMENT Fragment_Stage_0010_Item_00
Function Fragment_Stage_0010_Item_00()
;BEGIN CODE
;Create fixed-level custom items that are safe to spawn on game start.
CustomItemQuest.SetStage(100) ;Maxson's Gatling Laser, Final Judgment
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property CustomItemQuest Auto Const Mandatory
