;BEGIN FRAGMENT CODE - Do not edit anything between this and the end comment
Scriptname Fragments:Perks:PRKF_PlayerPerk_00056DD7 Extends Perk Hidden Const

;BEGIN FRAGMENT Fragment_Entry_00
Function Fragment_Entry_00(ObjectReference akTargetRef, Actor akActor)
;BEGIN CODE
;Start scene so player tells Ashes to go home.
debug.trace(self + "Script is running on player perk for Ashes")
If V81_01.GetStageDone(3) == 1
    V81_01.SetStage(200)
EndIf
;END CODE
EndFunction
;END FRAGMENT

;END FRAGMENT CODE - Do not edit anything between this and the begin comment

Quest Property V81_01 Auto Const
