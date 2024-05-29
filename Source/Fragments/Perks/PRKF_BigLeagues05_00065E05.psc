;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Perks:PRKF_BigLeagues05_00065E05 Extends Perk Hidden Const

;BEGIN FRAGMENT Fragment_Entry_02
Function Fragment_Entry_02(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
game.ShowPerkVaultBoyOnHUD(swfName)
Game.IncrementStat("Grand Slams")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

String Property SwfName Auto Const

Sound Property UIPerkHomerun Auto Const Mandatory
