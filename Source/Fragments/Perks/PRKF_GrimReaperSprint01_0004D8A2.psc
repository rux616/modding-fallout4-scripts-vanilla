;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Perks:PRKF_GrimReaperSprint01_0004D8A2 Extends Perk Hidden Const

;BEGIN FRAGMENT Fragment_Entry_00
Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
Game.ShowPerkVaultBoyOnHUD(SwfName, SoundEffect)
Game.IncrementStat("Grim Reaper Sprints")
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Sound Property SoundEffect Auto Const

String Property SwfName Auto Const
